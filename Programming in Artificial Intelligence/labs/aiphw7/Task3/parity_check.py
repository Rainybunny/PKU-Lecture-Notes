"""
Docstring for parity_check
This module contains functions to test and verify the numerical parity between
mytensor and PyTorch implementations of various operations.
All done by Copilot.
"""

from __future__ import annotations

import math
import numpy as np


def _configure_torch_for_parity(torch) -> None:
    # TF32 (tensor-float-32) can materially change conv/matmul numerics on Ampere+ GPUs.
    # Disable it to make torch a strict FP32 reference.
    try:
        torch.backends.cuda.matmul.allow_tf32 = False
        torch.backends.cudnn.allow_tf32 = False
    except Exception:
        pass
    try:
        torch.set_float32_matmul_precision("highest")
    except Exception:
        pass


def max_abs_diff(a: np.ndarray, b: np.ndarray) -> float:
    a = np.asarray(a, dtype=np.float32)
    b = np.asarray(b, dtype=np.float32)
    return float(np.max(np.abs(a - b)))


def test_softmax_ce_backward() -> None:
    import torch
    from build import mytensor as mt

    _configure_torch_for_parity(torch)

    rng = np.random.default_rng(0)
    n, c = 64, 10
    logits_np = rng.normal(size=(n, c)).astype(np.float32)
    labels_np = rng.integers(0, c, size=(n,), dtype=np.int64).astype(np.float32)  # mytensor labels are float

    # mytensor (loss is SUM over batch)
    x = mt.Tensor(logits_np, True)
    y = mt.Tensor(labels_np, False)
    pred = mt.Tensor([n, c], False)
    loss = mt.softmax_celoss(x, y, pred)
    # Current training protocol: backprop SUM loss (scale=1)
    loss.backward(1.0)
    gx = np.array(x.grad_to_list(), dtype=np.float32).reshape(n, c)
    loss_sum_myt = float(loss.data_to_list()[0])

    # torch
    xt = torch.tensor(logits_np, dtype=torch.float32, requires_grad=True)
    yt = torch.tensor(labels_np.astype(np.int64), dtype=torch.long)
    lt_sum = torch.nn.functional.cross_entropy(xt, yt, reduction="sum")
    lt_sum.backward()
    gt = xt.grad.detach().cpu().numpy()

    loss_sum_torch = float(lt_sum.detach().cpu().item())

    print("[softmax_ce_backward] max_abs_diff:", max_abs_diff(gx, gt))
    print("[softmax_ce_forward]  abs_diff(sum_loss):", abs(loss_sum_myt - loss_sum_torch))


def test_adam_step() -> None:
    import torch
    from build import mytensor as mt

    _configure_torch_for_parity(torch)

    rng = np.random.default_rng(1)
    n, in_dim, out_dim = 32, 16, 7
    x_np = rng.normal(size=(n, in_dim)).astype(np.float32)
    w0 = rng.normal(size=(out_dim, in_dim)).astype(np.float32)
    b0 = rng.normal(size=(out_dim,)).astype(np.float32)
    labels_np = rng.integers(0, out_dim, size=(n,), dtype=np.int64).astype(np.float32)

    lr = 1e-3
    betas = (0.9, 0.999)
    eps = 1e-8
    wd = 1e-4
    scale = 1.0

    # mytensor: logits = linear(x, W, b) then softmax+CE
    x = mt.Tensor(x_np, True)  # must be True to record graph for params
    W = mt.Tensor(w0, True)
    b = mt.Tensor(b0, True)
    y = mt.Tensor(labels_np, False)
    pred = mt.Tensor([n, out_dim], False)

    logits = mt.linear(x, W, b)
    loss = mt.softmax_celoss(logits, y, pred)
    loss.backward(scale)

    mW = mt.zeros_like(W, False)
    vW = mt.zeros_like(W, False)
    mb = mt.zeros_like(b, False)
    vb = mt.zeros_like(b, False)
    t = 1
    mt.adam_step(W, mW, vW, lr, betas[0], betas[1], eps, wd, t)
    mt.adam_step(b, mb, vb, lr, betas[0], betas[1], eps, wd, t)

    W_after = np.array(W.data_to_list(), dtype=np.float32).reshape(out_dim, in_dim)
    b_after = np.array(b.data_to_list(), dtype=np.float32)

    # torch reference (same math, classic Adam with L2 weight decay)
    xt = torch.tensor(x_np, dtype=torch.float32)
    Wt = torch.tensor(w0, dtype=torch.float32, requires_grad=True)
    bt = torch.tensor(b0, dtype=torch.float32, requires_grad=True)
    yt = torch.tensor(labels_np.astype(np.int64), dtype=torch.long)

    opt = torch.optim.Adam([Wt, bt], lr=lr, betas=betas, eps=eps, weight_decay=wd)
    opt.zero_grad(set_to_none=True)
    logits_t = torch.nn.functional.linear(xt, Wt, bt)
    loss_t = torch.nn.functional.cross_entropy(logits_t, yt, reduction="sum")
    loss_t.backward()
    opt.step()

    Wt_after = Wt.detach().cpu().numpy()
    bt_after = bt.detach().cpu().numpy()

    print("[adam_step] W max_abs_diff:", max_abs_diff(W_after, Wt_after))
    print("[adam_step] b max_abs_diff:", max_abs_diff(b_after, bt_after))


def test_adam_multistep() -> None:
    import torch
    from build import mytensor as mt

    _configure_torch_for_parity(torch)

    rng = np.random.default_rng(7)
    size = 1024
    steps = 50

    lr = 1e-3
    betas = (0.9, 0.999)
    eps = 1e-8
    wd = 1e-4

    # Initialize parameter
    p0 = rng.normal(size=(size,)).astype(np.float32)

    # Generate a deterministic gradient sequence
    grads = (0.1 * rng.normal(size=(steps, size))).astype(np.float32)

    # mytensor
    # Inject exact gradients by making a tiny graph: y = linear(x, W, b) with out_dim=1.
    # With upstream=1, dW == x.
    W = mt.Tensor(p0.reshape(1, size).copy(), True)
    b = mt.Tensor(np.zeros((1,), dtype=np.float32), True)
    mW = mt.zeros_like(W, False)
    vW = mt.zeros_like(W, False)
    mb = mt.zeros_like(b, False)
    vb = mt.zeros_like(b, False)

    for t in range(1, steps + 1):
        x = mt.Tensor(grads[t - 1].reshape(1, size), True)
        W.zero_grad()
        b.zero_grad()
        y = mt.linear(x, W, b)  # shape (1,1)
        y.backward(1.0)
        mt.adam_step(W, mW, vW, lr, betas[0], betas[1], eps, wd, t)
        mt.adam_step(b, mb, vb, lr, betas[0], betas[1], eps, wd, t)
        if t % 10 == 0:
            mt._sync()

    p_after_myt = np.array(W.data_to_list(), dtype=np.float32).reshape(size)

    # torch reference
    # Run torch reference on CPU to avoid CUDA context interactions.
    device = torch.device("cpu")
    pt = torch.tensor(p0.reshape(1, size), dtype=torch.float32, device=device, requires_grad=True)
    bt = torch.zeros((1,), dtype=torch.float32, device=device, requires_grad=True)
    opt = torch.optim.Adam([pt, bt], lr=lr, betas=betas, eps=eps, weight_decay=wd)
    opt.zero_grad(set_to_none=True)
    for t in range(steps):
        opt.zero_grad(set_to_none=True)
        # Match the mytensor injection: y = (pt * x).sum() + bt.sum() where dpt = x
        pt.grad = torch.tensor(grads[t].reshape(1, size), device=device)
        bt.grad = torch.ones_like(bt)
        opt.step()

    p_after_torch = pt.detach().cpu().numpy().reshape(size)
    print("[adam_multistep] p max_abs_diff:", max_abs_diff(p_after_myt, p_after_torch))


def test_ops_conv_pool_linear() -> None:
    import torch
    from build import mytensor as mt

    _configure_torch_for_parity(torch)

    rng = np.random.default_rng(2)
    n, h, w, cin = 8, 5, 5, 3
    cout, k = 4, 3
    pool = 2
    num_classes = 6
    scale = 1.0

    x_np = rng.normal(size=(n, h, w, cin)).astype(np.float32)
    y_np = rng.integers(0, num_classes, size=(n,), dtype=np.int64).astype(np.float32)

    wc_np = rng.normal(size=(cout, cin, k, k)).astype(np.float32)
    bc_np = rng.normal(size=(cout,)).astype(np.float32)

    oh = (h + pool - 1) // pool
    ow = (w + pool - 1) // pool
    lin_in = oh * ow * cout
    wl_np = rng.normal(size=(num_classes, lin_in)).astype(np.float32)
    bl_np = rng.normal(size=(num_classes,)).astype(np.float32)

    # mytensor forward/backward
    x = mt.Tensor(x_np, True)
    y = mt.Tensor(y_np, False)
    wc = mt.Tensor(wc_np, True)
    bc = mt.Tensor(bc_np, True)
    wl = mt.Tensor(wl_np, True)
    bl = mt.Tensor(bl_np, True)

    z = mt.conv2d(x, wc, bc)
    z = mt.relu(z)
    z = mt.maxpool(z, pool)
    logits = mt.linear(z, wl, bl)
    pred = mt.Tensor([n, num_classes], False)
    loss = mt.softmax_celoss(logits, y, pred)
    loss.backward(scale)

    loss_sum_myt = float(loss.data_to_list()[0])
    loss_myt = loss_sum_myt / n
    logits_myt = np.array(logits.data_to_list(), dtype=np.float32).reshape(n, num_classes)
    pred_myt = np.array(pred.data_to_list(), dtype=np.float32).reshape(n, num_classes)
    gwc = np.array(wc.grad_to_list(), dtype=np.float32).reshape(cout, cin, k, k)
    gbc = np.array(bc.grad_to_list(), dtype=np.float32)
    gwl = np.array(wl.grad_to_list(), dtype=np.float32).reshape(num_classes, lin_in)
    gbl = np.array(bl.grad_to_list(), dtype=np.float32)

    # torch reference
    xt = torch.tensor(x_np, dtype=torch.float32).permute(0, 3, 1, 2).contiguous()
    Wct = torch.tensor(wc_np, dtype=torch.float32, requires_grad=True)
    bct = torch.tensor(bc_np, dtype=torch.float32, requires_grad=True)
    Wlt = torch.tensor(wl_np, dtype=torch.float32, requires_grad=True)
    blt = torch.tensor(bl_np, dtype=torch.float32, requires_grad=True)
    yt = torch.tensor(y_np.astype(np.int64), dtype=torch.long)

    zt = torch.nn.functional.conv2d(xt, Wct, bct, stride=1, padding=1)
    zt = torch.nn.functional.relu(zt)
    zt = torch.nn.functional.max_pool2d(zt, kernel_size=pool, stride=pool, ceil_mode=True)
    # Match mytensor's implicit NHWC flatten order before linear
    zt = zt.permute(0, 2, 3, 1).contiguous().view(n, -1)
    logits_t = torch.nn.functional.linear(zt, Wlt, blt)
    loss_t = torch.nn.functional.cross_entropy(logits_t, yt, reduction="sum")
    loss_t.backward()

    loss_sum_torch = float(loss_t.detach().cpu().item())
    loss_torch = loss_sum_torch / n
    logits_t_np = logits_t.detach().cpu().numpy()
    pred_t_np = torch.softmax(logits_t, dim=1).detach().cpu().numpy()

    lbl = y_np.astype(np.int64)
    # Stable CPU CE: sum(logsumexp(logits) - logits[label])
    def ce_from_logits(logits: np.ndarray) -> float:
        m = np.max(logits, axis=1, keepdims=True)
        lse = np.log(np.sum(np.exp(logits - m), axis=1)) + m[:, 0]
        return float(np.sum(lse - logits[np.arange(logits.shape[0]), lbl]))

    ce_myt_cpu = ce_from_logits(logits_myt)
    ce_t_cpu = ce_from_logits(logits_t_np)

    # Additional torch internal check
    nll_sum = torch.nn.functional.nll_loss(
        torch.nn.functional.log_softmax(logits_t, dim=1), yt, reduction="sum"
    ).detach().cpu().item()

    print("[ops] loss abs_diff(mean):", abs(loss_myt - loss_torch))
    print("[ops] loss abs_diff(sum): ", abs(loss_sum_myt - loss_sum_torch))
    print("[ops] loss selfcheck myt abs:", abs(loss_sum_myt - ce_myt_cpu))
    print("[ops] loss selfcheck tch abs:", abs(loss_sum_torch - ce_t_cpu))
    print("[ops] loss torch nll abs_diff:", abs(loss_sum_torch - float(nll_sum)))
    print("[ops] logits max_abs_diff:", max_abs_diff(logits_myt, logits_t_np))
    print("[ops] softmx max_abs_diff:", max_abs_diff(pred_myt, pred_t_np))
    print("[ops] conv_w max_abs_diff:", max_abs_diff(gwc, Wct.grad.detach().cpu().numpy()))
    print("[ops] conv_b max_abs_diff:", max_abs_diff(gbc, bct.grad.detach().cpu().numpy()))
    print("[ops] lin_w  max_abs_diff:", max_abs_diff(gwl, Wlt.grad.detach().cpu().numpy()))
    print("[ops] lin_b  max_abs_diff:", max_abs_diff(gbl, blt.grad.detach().cpu().numpy()))


def test_linear_softmax_large() -> None:
    import torch
    from build import mytensor as mt

    _configure_torch_for_parity(torch)

    rng = np.random.default_rng(123)
    n, in_dim, out_dim = 8, 256, 10
    x_np = rng.normal(size=(n, in_dim)).astype(np.float32)
    w_np = rng.normal(size=(out_dim, in_dim)).astype(np.float32)
    b_np = rng.normal(size=(out_dim,)).astype(np.float32)
    labels_np = rng.integers(0, out_dim, size=(n,), dtype=np.int64).astype(np.float32)

    # mytensor
    x = mt.Tensor(x_np, True)
    W = mt.Tensor(w_np, True)
    b = mt.Tensor(b_np, True)
    y = mt.Tensor(labels_np, False)
    pred = mt.Tensor([n, out_dim], False)
    logits = mt.linear(x, W, b)
    loss = mt.softmax_celoss(logits, y, pred)
    loss.backward(1.0)
    gW = np.array(W.grad_to_list(), dtype=np.float32).reshape(out_dim, in_dim)
    gb = np.array(b.grad_to_list(), dtype=np.float32)
    gx = np.array(x.grad_to_list(), dtype=np.float32).reshape(n, in_dim)
    loss_sum_myt = float(loss.data_to_list()[0])

    # torch
    xt = torch.tensor(x_np, dtype=torch.float32, requires_grad=True)
    Wt = torch.tensor(w_np, dtype=torch.float32, requires_grad=True)
    bt = torch.tensor(b_np, dtype=torch.float32, requires_grad=True)
    yt = torch.tensor(labels_np.astype(np.int64), dtype=torch.long)
    logits_t = torch.nn.functional.linear(xt, Wt, bt)
    loss_t = torch.nn.functional.cross_entropy(logits_t, yt, reduction="sum")
    loss_t.backward()
    loss_sum_torch = float(loss_t.detach().cpu().item())

    print("[lin+ce_large] loss abs_diff(sum):", abs(loss_sum_myt - loss_sum_torch))
    print("[lin+ce_large] W   max_abs_diff:", max_abs_diff(gW, Wt.grad.detach().cpu().numpy()))
    print("[lin+ce_large] b   max_abs_diff:", max_abs_diff(gb, bt.grad.detach().cpu().numpy()))
    print("[lin+ce_large] x   max_abs_diff:", max_abs_diff(gx, xt.grad.detach().cpu().numpy()))


def test_conv2d_large_backward() -> None:
    import torch
    from build import mytensor as mt

    _configure_torch_for_parity(torch)

    rng = np.random.default_rng(2026)
    n, h, w, cin = 8, 16, 16, 128
    cout, k = 128, 3

    # Use moderate magnitudes to avoid extreme activation blow-up masking issues.
    x_np = (0.1 * rng.normal(size=(n, h, w, cin))).astype(np.float32)
    w_np = (0.1 * rng.normal(size=(cout, cin, k, k))).astype(np.float32)
    b_np = (0.1 * rng.normal(size=(cout,))).astype(np.float32)

    # mytensor
    x = mt.Tensor(x_np, True)
    W = mt.Tensor(w_np, True)
    b = mt.Tensor(b_np, True)
    y = mt.conv2d(x, W, b)
    # mytensor backward(scale) sets dL/dy = scale for ALL elements, i.e. L = scale * sum(y)
    y.backward(1.0)

    y_m = np.array(y.data_to_list(), dtype=np.float32).reshape(n, h, w, cout)
    gx_m = np.array(x.grad_to_list(), dtype=np.float32).reshape(n, h, w, cin)
    gW_m = np.array(W.grad_to_list(), dtype=np.float32).reshape(cout, cin, k, k)
    gb_m = np.array(b.grad_to_list(), dtype=np.float32)

    # torch
    x_leaf = torch.tensor(x_np, dtype=torch.float32, requires_grad=True)
    xt = x_leaf.permute(0, 3, 1, 2).contiguous()
    Wt = torch.tensor(w_np, dtype=torch.float32, requires_grad=True)
    bt = torch.tensor(b_np, dtype=torch.float32, requires_grad=True)
    yt = torch.nn.functional.conv2d(xt, Wt, bt, stride=1, padding=1)
    loss_t = yt.sum()
    loss_t.backward()

    y_t = yt.detach().cpu().permute(0, 2, 3, 1).contiguous().numpy()
    gx_t = x_leaf.grad.detach().cpu().numpy()
    gW_t = Wt.grad.detach().cpu().numpy()
    gb_t = bt.grad.detach().cpu().numpy()

    print("[conv2d_large] y  max_abs_diff:", max_abs_diff(y_m, y_t))
    print("[conv2d_large] gx max_abs_diff:", max_abs_diff(gx_m, gx_t))
    print("[conv2d_large] gW max_abs_diff:", max_abs_diff(gW_m, gW_t))
    print("[conv2d_large] gb max_abs_diff:", max_abs_diff(gb_m, gb_t))


def test_batchnorm1d_parity() -> None:
    import torch
    from build import mytensor as mt

    _configure_torch_for_parity(torch)

    rng = np.random.default_rng(0)
    n, c = 256, 64
    x_np = rng.normal(size=(n, c)).astype(np.float32)
    labels_np = rng.integers(0, c, size=(n,), dtype=np.int64).astype(np.float32)

    eps = 1e-5
    momentum = 0.1

    # mytensor: bn -> logits -> softmax+CE(sum)
    x = mt.Tensor(x_np, True)
    gamma = mt.Tensor(rng.normal(size=(c,)).astype(np.float32), True)
    beta = mt.Tensor(rng.normal(size=(c,)).astype(np.float32), True)
    mean = mt.Tensor([c], False)
    var = mt.Tensor([c], False)
    run_mean = mt.Tensor([c], False)
    run_var = mt.Tensor([c], False)
    run_mean.zero_data()
    run_var.ones_data()
    logits = mt.batchnorm(x, gamma, beta, mean, var, run_mean, run_var, eps, momentum)
    pred = mt.Tensor([n, c], False)
    labels = mt.Tensor(labels_np, False)
    loss = mt.softmax_celoss(logits, labels, pred)
    loss.backward(1.0)

    y_m = np.array(logits.data_to_list(), dtype=np.float32).reshape(n, c)
    gx_m = np.array(x.grad_to_list(), dtype=np.float32).reshape(n, c)
    gg_m = np.array(gamma.grad_to_list(), dtype=np.float32).reshape(c)
    gb_m = np.array(beta.grad_to_list(), dtype=np.float32).reshape(c)
    rm_m = np.array(run_mean.data_to_list(), dtype=np.float32).reshape(c)
    rv_m = np.array(run_var.data_to_list(), dtype=np.float32).reshape(c)

    # torch
    bn = torch.nn.BatchNorm1d(c, eps=eps, momentum=momentum, affine=True, track_running_stats=True)
    with torch.no_grad():
        bn.weight.copy_(torch.tensor(gamma.data_to_list(), dtype=torch.float32))
        bn.bias.copy_(torch.tensor(beta.data_to_list(), dtype=torch.float32))
        bn.running_mean.zero_()
        bn.running_var.fill_(1.0)
    xt = torch.tensor(x_np, dtype=torch.float32, requires_grad=True)
    lt_labels = torch.tensor(labels_np.astype(np.int64), dtype=torch.long)
    bn.train()
    yt = bn(xt)
    lt = torch.nn.functional.cross_entropy(yt, lt_labels, reduction="sum")
    lt.backward()

    y_t = yt.detach().cpu().numpy()
    gx_t = xt.grad.detach().cpu().numpy()
    gg_t = bn.weight.grad.detach().cpu().numpy()
    gb_t = bn.bias.grad.detach().cpu().numpy()
    rm_t = bn.running_mean.detach().cpu().numpy()
    rv_t = bn.running_var.detach().cpu().numpy()

    print("[bn1d] y  max_abs_diff:", max_abs_diff(y_m, y_t))
    print("[bn1d] gx max_abs_diff:", max_abs_diff(gx_m, gx_t))
    print("[bn1d] gg max_abs_diff:", max_abs_diff(gg_m, gg_t))
    print("[bn1d] gb max_abs_diff:", max_abs_diff(gb_m, gb_t))
    print("[bn1d] run_mean max_abs_diff:", max_abs_diff(rm_m, rm_t))
    print("[bn1d] run_var  max_abs_diff:", max_abs_diff(rv_m, rv_t))


def test_cifar_like_step_adam() -> None:
    import torch
    from build import mytensor as mt

    _configure_torch_for_parity(torch)

    rng = np.random.default_rng(3)
    n = 8
    h = w = 32
    cin = 3
    c1 = 64
    c2 = 128
    k = 3
    pool = 2
    num_classes = 10

    lr = 1e-3
    betas = (0.9, 0.999)
    eps = 1e-8
    wd = 1e-4
    # Match current training protocol: backprop SUM loss
    scale = 1.0

    # Inputs
    x_np = rng.normal(size=(n, h, w, cin)).astype(np.float32)
    y_np = rng.integers(0, num_classes, size=(n,), dtype=np.int64).astype(np.float32)

    # Deterministic weights/biases
    w11_np = rng.normal(size=(c1, cin, k, k)).astype(np.float32)
    b11_np = rng.normal(size=(c1,)).astype(np.float32)
    w12_np = rng.normal(size=(c1, c1, k, k)).astype(np.float32)
    b12_np = rng.normal(size=(c1,)).astype(np.float32)

    w21_np = rng.normal(size=(c2, c1, k, k)).astype(np.float32)
    b21_np = rng.normal(size=(c2,)).astype(np.float32)
    w22_np = rng.normal(size=(c2, c2, k, k)).astype(np.float32)
    b22_np = rng.normal(size=(c2,)).astype(np.float32)

    lin_in = 8 * 8 * c2
    w1_np = rng.normal(size=(256, lin_in)).astype(np.float32)
    b1_np = rng.normal(size=(256,)).astype(np.float32)
    w2_np = rng.normal(size=(num_classes, 256)).astype(np.float32)
    b2_np = rng.normal(size=(num_classes,)).astype(np.float32)

    # mytensor forward/backward
    x = mt.Tensor(x_np, True)
    y = mt.Tensor(y_np, False)

    w11 = mt.Tensor(w11_np, True)
    b11 = mt.Tensor(b11_np, True)
    w12 = mt.Tensor(w12_np, True)
    b12 = mt.Tensor(b12_np, True)
    w21 = mt.Tensor(w21_np, True)
    b21 = mt.Tensor(b21_np, True)
    w22 = mt.Tensor(w22_np, True)
    b22 = mt.Tensor(b22_np, True)
    w1 = mt.Tensor(w1_np, True)
    b1 = mt.Tensor(b1_np, True)
    w2 = mt.Tensor(w2_np, True)
    b2 = mt.Tensor(b2_np, True)

    conv1 = mt.conv2d(x, w11, b11)
    z1 = mt.relu(conv1)
    conv2 = mt.conv2d(z1, w12, b12)
    z2 = mt.relu(conv2)
    p1 = mt.maxpool(z2, pool)
    conv3 = mt.conv2d(p1, w21, b21)
    z3 = mt.relu(conv3)
    conv4 = mt.conv2d(z3, w22, b22)
    z4 = mt.relu(conv4)
    p2 = mt.maxpool(z4, pool)
    h1 = mt.relu(mt.linear(p2, w1, b1))
    logits = mt.linear(h1, w2, b2)
    pred = mt.Tensor([n, num_classes], False)
    loss = mt.softmax_celoss(logits, y, pred)
    loss.backward(scale)

    params = [w11, b11, w12, b12, w21, b21, w22, b22, w1, b1, w2, b2]
    my_grads = [np.array(p.grad_to_list(), dtype=np.float32) for p in params]
    m = [mt.zeros_like(p, False) for p in params]
    v = [mt.zeros_like(p, False) for p in params]
    t = 1
    for p, mp, vp in zip(params, m, v):
        mt.adam_step(p, mp, vp, lr, betas[0], betas[1], eps, wd, t)

    my_after = [np.array(p.data_to_list(), dtype=np.float32) for p in params]

    # torch reference
    xt = torch.tensor(x_np, dtype=torch.float32).permute(0, 3, 1, 2).contiguous()
    yt = torch.tensor(y_np.astype(np.int64), dtype=torch.long)

    W11 = torch.tensor(w11_np, dtype=torch.float32, requires_grad=True)
    B11 = torch.tensor(b11_np, dtype=torch.float32, requires_grad=True)
    W12 = torch.tensor(w12_np, dtype=torch.float32, requires_grad=True)
    B12 = torch.tensor(b12_np, dtype=torch.float32, requires_grad=True)
    W21 = torch.tensor(w21_np, dtype=torch.float32, requires_grad=True)
    B21 = torch.tensor(b21_np, dtype=torch.float32, requires_grad=True)
    W22 = torch.tensor(w22_np, dtype=torch.float32, requires_grad=True)
    B22 = torch.tensor(b22_np, dtype=torch.float32, requires_grad=True)
    W1 = torch.tensor(w1_np, dtype=torch.float32, requires_grad=True)
    B1 = torch.tensor(b1_np, dtype=torch.float32, requires_grad=True)
    W2 = torch.tensor(w2_np, dtype=torch.float32, requires_grad=True)
    B2 = torch.tensor(b2_np, dtype=torch.float32, requires_grad=True)

    opt = torch.optim.Adam(
        [W11, B11, W12, B12, W21, B21, W22, B22, W1, B1, W2, B2],
        lr=lr,
        betas=betas,
        eps=eps,
        weight_decay=wd,
    )
    opt.zero_grad(set_to_none=True)

    conv1t = torch.nn.functional.conv2d(xt, W11, B11, padding=1)
    z1t = torch.nn.functional.relu(conv1t)
    conv2t = torch.nn.functional.conv2d(z1t, W12, B12, padding=1)
    z2t = torch.nn.functional.relu(conv2t)
    p1t = torch.nn.functional.max_pool2d(z2t, kernel_size=pool, stride=pool, ceil_mode=True)
    conv3t = torch.nn.functional.conv2d(p1t, W21, B21, padding=1)
    z3t = torch.nn.functional.relu(conv3t)
    conv4t = torch.nn.functional.conv2d(z3t, W22, B22, padding=1)
    z4t = torch.nn.functional.relu(conv4t)
    p2t = torch.nn.functional.max_pool2d(z4t, kernel_size=pool, stride=pool, ceil_mode=True)
    h1t = p2t.permute(0, 2, 3, 1).contiguous().view(n, -1)
    h1t = torch.nn.functional.relu(torch.nn.functional.linear(h1t, W1, B1))
    logits_t = torch.nn.functional.linear(h1t, W2, B2)
    loss_t = torch.nn.functional.cross_entropy(logits_t, yt, reduction="sum")
    loss_t.backward()

    # Forward activation diffs (NHWC for mytensor, NCHW for torch; convert torch to NHWC).
    def nhwc(t: torch.Tensor) -> np.ndarray:
        return t.detach().cpu().permute(0, 2, 3, 1).contiguous().numpy()

    def conv2d_unfold_nhwc(x_nhwc: np.ndarray, w_oihw: np.ndarray, b_o: np.ndarray) -> np.ndarray:
        # Reference conv via unfold+GEMM in torch (algorithm close to im2col+cublas).
        # Returns NHWC float32.
        x = torch.tensor(x_nhwc, device=xt.device, dtype=torch.float32).permute(0, 3, 1, 2).contiguous()
        w = torch.tensor(w_oihw, device=xt.device, dtype=torch.float32)
        b = torch.tensor(b_o, device=xt.device, dtype=torch.float32)
        N, Cin, H, W = x.shape
        Cout, _, K, _ = w.shape
        cols = torch.nn.functional.unfold(x, kernel_size=K, padding=K // 2, stride=1)  # (N, Cin*K*K, H*W)
        w2 = w.view(Cout, -1)  # (Cout, Cin*K*K)
        out = torch.matmul(w2, cols) + b.view(1, -1, 1)
        out = out.view(N, Cout, H, W)
        return nhwc(out)

    conv1_np = np.array(conv1.data_to_list(), dtype=np.float32).reshape(n, h, w, c1)
    z1_np = np.array(z1.data_to_list(), dtype=np.float32).reshape(n, h, w, c1)
    conv2_np = np.array(conv2.data_to_list(), dtype=np.float32).reshape(n, h, w, c1)
    z2_np = np.array(z2.data_to_list(), dtype=np.float32).reshape(n, h, w, c1)
    p1_np = np.array(p1.data_to_list(), dtype=np.float32).reshape(n, h // 2, w // 2, c1)
    conv3_np = np.array(conv3.data_to_list(), dtype=np.float32).reshape(n, h // 2, w // 2, c2)
    z3_np = np.array(z3.data_to_list(), dtype=np.float32).reshape(n, h // 2, w // 2, c2)
    conv4_np = np.array(conv4.data_to_list(), dtype=np.float32).reshape(n, h // 2, w // 2, c2)
    z4_np = np.array(z4.data_to_list(), dtype=np.float32).reshape(n, h // 2, w // 2, c2)
    p2_np = np.array(p2.data_to_list(), dtype=np.float32).reshape(n, 8, 8, c2)
    h1_np = np.array(h1.data_to_list(), dtype=np.float32).reshape(n, 256)
    logits_np = np.array(logits.data_to_list(), dtype=np.float32).reshape(n, num_classes)

    conv1t_np = nhwc(conv1t)
    z1t_np = nhwc(z1t)
    conv2t_np = nhwc(conv2t)
    z2t_np = nhwc(z2t)
    p1t_np = nhwc(p1t)
    conv3t_np = nhwc(conv3t)
    z3t_np = nhwc(z3t)
    conv4t_np = nhwc(conv4t)
    z4t_np = nhwc(z4t)
    p2t_np = nhwc(p2t)
    h1t_np = h1t.detach().cpu().numpy()
    logits_t_np = logits_t.detach().cpu().numpy()

    print("[cifar_fwd] c1  max_abs_diff:", max_abs_diff(conv1_np, conv1t_np))
    print("[cifar_fwd] z1  max_abs_diff:", max_abs_diff(z1_np, z1t_np))
    print("[cifar_fwd] c2  max_abs_diff:", max_abs_diff(conv2_np, conv2t_np))
    print("[cifar_fwd] z2  max_abs_diff:", max_abs_diff(z2_np, z2t_np))
    print("[cifar_fwd] p1  max_abs_diff:", max_abs_diff(p1_np, p1t_np))
    print("[cifar_fwd] c3  max_abs_diff:", max_abs_diff(conv3_np, conv3t_np))
    print("[cifar_fwd] z3  max_abs_diff:", max_abs_diff(z3_np, z3t_np))
    print("[cifar_fwd] c4  max_abs_diff:", max_abs_diff(conv4_np, conv4t_np))
    print("[cifar_fwd] z4  max_abs_diff:", max_abs_diff(z4_np, z4t_np))
    print("[cifar_fwd] p2  max_abs_diff:", max_abs_diff(p2_np, p2t_np))
    print("[cifar_fwd] h1  max_abs_diff:", max_abs_diff(h1_np, h1t_np))
    print("[cifar_fwd] log max_abs_diff:", max_abs_diff(logits_np, logits_t_np))

    # Isolation: run torch convs on mytensor-produced activations.
    with torch.no_grad():
        z1_from_myt = torch.tensor(z1_np, device=xt.device).permute(0, 3, 1, 2).contiguous()
        p1_from_myt = torch.tensor(p1_np, device=xt.device).permute(0, 3, 1, 2).contiguous()
        z3_from_myt = torch.tensor(z3_np, device=xt.device).permute(0, 3, 1, 2).contiguous()

        conv2_on_myt = torch.nn.functional.conv2d(z1_from_myt, W12, B12, padding=1)
        conv3_on_myt = torch.nn.functional.conv2d(p1_from_myt, W21, B21, padding=1)
        conv4_on_myt = torch.nn.functional.conv2d(z3_from_myt, W22, B22, padding=1)

    conv2_on_myt_np = nhwc(conv2_on_myt)
    conv3_on_myt_np = nhwc(conv3_on_myt)
    conv4_on_myt_np = nhwc(conv4_on_myt)
    print("[cifar_iso] c2 myt vs torch(myt_in) max_abs_diff:", max_abs_diff(conv2_np, conv2_on_myt_np))
    print("[cifar_iso] c3 myt vs torch(myt_in) max_abs_diff:", max_abs_diff(conv3_np, conv3_on_myt_np))
    print("[cifar_iso] c4 myt vs torch(myt_in) max_abs_diff:", max_abs_diff(conv4_np, conv4_on_myt_np))

    # Stronger isolation: compare mytensor conv to torch unfold+GEMM conv on the SAME inputs.
    # If this is small, your Conv2D is likely correct and the big drift is mostly cuDNN vs GEMM numerics.
    conv2_unfold_np = conv2d_unfold_nhwc(z1_np, w12_np, b12_np)
    conv3_unfold_np = conv2d_unfold_nhwc(p1_np, w21_np, b21_np)
    conv4_unfold_np = conv2d_unfold_nhwc(z3_np, w22_np, b22_np)
    print("[cifar_unfold] c2 myt vs unfold max_abs_diff:", max_abs_diff(conv2_np, conv2_unfold_np))
    print("[cifar_unfold] c3 myt vs unfold max_abs_diff:", max_abs_diff(conv3_np, conv3_unfold_np))
    print("[cifar_unfold] c4 myt vs unfold max_abs_diff:", max_abs_diff(conv4_np, conv4_unfold_np))

    # Also show how far torch cuDNN is from its own unfold reference on the same inputs.
    print("[cifar_unfold] c2 cudnn vs unfold max_abs_diff:", max_abs_diff(conv2t_np, conv2_unfold_np))
    print("[cifar_unfold] c3 cudnn vs unfold max_abs_diff:", max_abs_diff(conv3t_np, conv3_unfold_np))
    print("[cifar_unfold] c4 cudnn vs unfold max_abs_diff:", max_abs_diff(conv4t_np, conv4_unfold_np))

    torch_grads = [
        W11.grad.detach().cpu().numpy().ravel(),
        B11.grad.detach().cpu().numpy().ravel(),
        W12.grad.detach().cpu().numpy().ravel(),
        B12.grad.detach().cpu().numpy().ravel(),
        W21.grad.detach().cpu().numpy().ravel(),
        B21.grad.detach().cpu().numpy().ravel(),
        W22.grad.detach().cpu().numpy().ravel(),
        B22.grad.detach().cpu().numpy().ravel(),
        W1.grad.detach().cpu().numpy().ravel(),
        B1.grad.detach().cpu().numpy().ravel(),
        W2.grad.detach().cpu().numpy().ravel(),
        B2.grad.detach().cpu().numpy().ravel(),
    ]

    grad_diffs = [
        max_abs_diff(gm, gt) for gm, gt in zip(my_grads, torch_grads)
    ]
    opt.step()

    torch_after = [
        W11.detach().cpu().numpy().ravel(),
        B11.detach().cpu().numpy().ravel(),
        W12.detach().cpu().numpy().ravel(),
        B12.detach().cpu().numpy().ravel(),
        W21.detach().cpu().numpy().ravel(),
        B21.detach().cpu().numpy().ravel(),
        W22.detach().cpu().numpy().ravel(),
        B22.detach().cpu().numpy().ravel(),
        W1.detach().cpu().numpy().ravel(),
        B1.detach().cpu().numpy().ravel(),
        W2.detach().cpu().numpy().ravel(),
        B2.detach().cpu().numpy().ravel(),
    ]

    names = [
        "w11",
        "b11",
        "w12",
        "b12",
        "w21",
        "b21",
        "w22",
        "b22",
        "w1",
        "b1",
        "w2",
        "b2",
    ]
    diffs = [max_abs_diff(a, b) for a, b in zip(my_after, torch_after)]
    print("[cifar_step] max_abs_diff params:", max(diffs))
    worst = int(np.argmax(np.array(diffs)))
    print("[cifar_step] worst param:", names[worst], diffs[worst])

    print("[cifar_step] max_abs_diff grads:", float(max(grad_diffs)))
    worstg = int(np.argmax(np.array(grad_diffs)))
    print("[cifar_step] worst grad:", names[worstg], float(grad_diffs[worstg]))

    # Helpful diagnostic: how many sign flips in W1 gradients?
    gw1_m = my_grads[names.index("w1")]
    gw1_t = torch_grads[names.index("w1")]
    same_sign = np.sign(gw1_m) == np.sign(gw1_t)
    flips = int(np.size(same_sign) - int(np.sum(same_sign)))
    near0 = int(np.sum((np.abs(gw1_m) < 1e-7) | (np.abs(gw1_t) < 1e-7)))
    print("[cifar_step] w1 grad sign flips:", flips, "/", int(gw1_m.size), "near0:", near0)


if __name__ == "__main__":
    np.set_printoptions(precision=6, suppress=True)
    test_softmax_ce_backward()
    test_adam_step()
    test_adam_multistep()
    test_ops_conv_pool_linear()
    test_linear_softmax_large()
    test_conv2d_large_backward()
    test_batchnorm1d_parity()
    test_cifar_like_step_adam()
