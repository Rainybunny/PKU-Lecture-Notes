from time import time
import numpy as np
import torch
from build import mytensor as mt

class AdamOptimizer:
    def __init__(self, parameters, lr=0.001, betas=(0.9, 0.999), eps=1e-8, weight_decay=0.0):
        self.parameters = parameters
        self.lr = lr
        self.beta1 = betas[0]
        self.beta2 = betas[1]
        self.eps = eps
        self.weight_decay = weight_decay
        self.m = [mt.zeros_like(p, False) for p in parameters]
        self.v = [mt.zeros_like(p, False) for p in parameters]
        self.t = 0

    def zero_grad(self):
        for param in self.parameters:
            if param.use_grad():
                param.zero_grad()

    def step(self):
        self.t += 1
        for i, param in enumerate(self.parameters):
            if param.use_grad():
                mt.adam_step(param, self.m[i], self.v[i],
                             self.lr, self.beta1, self.beta2, self.eps, self.weight_decay, self.t)

    def set_epoch(self, epoch):
        if epoch % 4 == 0 and epoch > 0:
            self.lr *= 0.4 # decay learning rate every 5 epochs

class Conv2D:
    def __init__(self, Cin, Cout, K):
        self.weight = mt.Tensor([Cout, Cin, K, K], True)
        self.weight.uniform((2.0 / (Cin * K * K))**0.5)
        self.bias = mt.Tensor([Cout], True)
        self.bias.zero_data()

    def __call__(self, x):
        return mt.conv2d(x, self.weight, self.bias)

    @property
    def parameters(self):
        return [self.weight, self.bias]

class BatchNorm:
    def __init__(self, channels, eps=1e-5, momentum=0.1):
        self.gamma = mt.Tensor([channels], True)
        self.gamma.ones_data()
        self.beta = mt.Tensor([channels], True)
        self.beta.zero_data()
        self.eps = eps
        self.momentum = momentum
        self.run_mean = mt.Tensor([channels], False)
        self.run_mean.zero_data()
        self.run_var = mt.Tensor([channels], False)
        self.run_var.ones_data()

        self.mean = mt.Tensor([channels], False)
        self.var = mt.Tensor([channels], False)

    def __call__(self, x):
        return mt.batchnorm(x, self.gamma, self.beta,
                            self.mean, self.var, self.run_mean, self.run_var,
                            self.eps, self.momentum)

    @property
    def parameters(self):
        return [self.gamma, self.beta]

class Linear:
    def __init__(self, in_dim, out_dim):
        self.weight = mt.Tensor([out_dim, in_dim], True)
        self.weight.uniform((2.0 / in_dim)**0.5)
        self.bias = mt.Tensor([out_dim], True)
        self.bias.zero_data()

    def __call__(self, x):
        return mt.linear(x, self.weight, self.bias)

    @property
    def parameters(self):
        return [self.weight, self.bias]

def _batch_to_nhwc_float32(x) -> np.ndarray:
    """Convert a DataLoader batch of images to NHWC float32 numpy.

    Supports:
    - torch.Tensor in NCHW
    - numpy arrays already in NHWC (or NCHW if provided)
    """
    if isinstance(x, torch.Tensor):
        # expect NCHW from torchvision transforms
        if x.ndim != 4:
            raise ValueError(f"Expected 4D image batch tensor, got shape {tuple(x.shape)}")
        x = x.permute(0, 2, 3, 1).contiguous()
        return x.cpu().numpy().astype(np.float32, copy=False)

    x = np.asarray(x)
    if x.ndim != 4:
        raise ValueError(f"Expected 4D image batch array, got shape {x.shape}")

    # Heuristic: if channel dim is 1/3 and last dim isn't, assume NCHW.
    if x.shape[1] in (1, 3) and x.shape[-1] not in (1, 3):
        x = np.transpose(x, (0, 2, 3, 1))
    return x.astype(np.float32, copy=False)


def _labels_to_float32(y) -> np.ndarray:
    if isinstance(y, torch.Tensor):
        y = y.cpu().numpy()
    return np.asarray(y, dtype=np.float32)


def grade(model, loader, verbose=False):
    if verbose:
        print("== Start grading on test set ==")
    total_loss = 0.0
    total_err = 0.0
    total_n = 0
    for x_t, y_t in loader:
        x_np = _batch_to_nhwc_float32(x_t)
        y_np = _labels_to_float32(y_t)
        X = mt.Tensor(x_np, False)
        y = mt.Tensor(y_np, False)

        loss = model.forward(X, y)
        err = model.error(y)

        n = int(y_np.shape[0])
        total_loss += loss.data_to_list()[0]
        total_err += err * n
        total_n += n
        if verbose:
            print(f"\r{total_n / len(loader.dataset) * 100:.2f}%", end="")

    if verbose:
        print("\rResult:\n    Average loss: {:.5f}\n    Error rate: {:.5f}".format(
            total_loss / total_n, total_err / total_n))
    return total_loss / total_n, total_err / total_n

def train(model, train_loader, test_loader,
          epochs, lr, betas, eps, weight_decay,
          seed=0, verbose=True):
    # Seed torch-side RNG used by DataLoader workers / transforms.
    torch.manual_seed(int(seed))
    np.random.seed(int(seed))

    print("Hyperparameters:")
    print(f"epochs={epochs}, lr={lr}, betas={betas}, "
          f"eps={eps}, weight_decay={weight_decay}, seed={seed}")
    optim = AdamOptimizer(model.parameters, lr, betas, eps, weight_decay)
    print("| Epoch | Train Loss | Train Err | Test Loss | Test Err | Time/s |")

    for epoch in range(epochs):
        start_time = time()
        optim.set_epoch(epoch)

        total_train_loss = 0.0
        total_train_err = 0.0
        total_n = 0

        for x_t, y_t in train_loader:
            x_np = _batch_to_nhwc_float32(x_t)
            y_np = _labels_to_float32(y_t)

            # should require grad to enable training mode (BN + dropout)
            X_batch = mt.Tensor(x_np, True)
            y_batch = mt.Tensor(y_np, False)

            optim.zero_grad()
            loss = model.forward(X_batch, y_batch)
            loss.backward(1.0)
            optim.step()

            n = int(y_np.shape[0])
            batch_loss = loss.data_to_list()[0] / n
            batch_err = model.error(y_batch)
            total_train_loss += batch_loss * n
            total_train_err += batch_err * n
            total_n += n
            if verbose:
                print(f"\r{total_n / len(train_loader.dataset) * 100:.2f}% {batch_loss:.5f} {batch_err:.5f}", end="")

        elapsed = time() - start_time
        test_loss, test_err = grade(model, test_loader, verbose=False)

        if verbose:
            print("\r", end="")
        print("|  {:>4} |    {:.5f} |   {:.5f} |   {:.5f} |  {:.5f} | {:>6.2f} |"\
              .format(epoch, total_train_loss / total_n, total_train_err / total_n,
                      test_loss, test_err, elapsed))