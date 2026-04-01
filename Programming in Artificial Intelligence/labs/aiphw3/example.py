import torch
import torch.nn as nn
import numpy as np
import sys

def read_vec():
    """Reads a vector from stdin, similar to the C++ version."""
    n = int(sys.stdin.readline())
    line = sys.stdin.readline()
    return torch.from_numpy(np.array(line.split(), dtype=np.float32))

def show_vec(tensor):
    """Prints a tensor in the specified format."""
    if tensor.is_cuda:
        tensor = tensor.cpu()
    if tensor.dtype != torch.float32:
        tensor = tensor.float()
    # Flatten the tensor and print elements
    vec = tensor.detach().numpy().flatten()
    print(" ".join(f"{v:.6f}" for v in vec))

def main():
    # Read the 7 key constants
    constants = sys.stdin.readline().split()
    N, Cin, Cout, H, W, K, FCout = map(int, constants)

    FCin = Cout * (H // 2) * (W // 2)

    # Read input tensors and reshape them
    X0_flat = read_vec()
    X0 = X0_flat.reshape(N, Cin, H, W)
    X0.requires_grad_(True)
    X0.retain_grad()

    Kc_flat = read_vec()
    Kc = Kc_flat.reshape(Cout, Cin, K, K)
    Kc.requires_grad_(True)
    Kc.retain_grad()

    Bc_flat = read_vec()
    Bc = Bc_flat.reshape(Cout)
    Bc.requires_grad_(True)
    Bc.retain_grad()

    Wl_flat = read_vec()
    Wl = Wl_flat.reshape(FCout, FCin)
    Wl.requires_grad_(True)
    Wl.retain_grad()

    Bl_flat = read_vec()
    Bl = Bl_flat.reshape(FCout)
    Bl.requires_grad_(True)
    Bl.retain_grad()

    # Read labels
    labels = torch.from_numpy(np.array(sys.stdin.readline().split(), dtype=np.int64))

    # --- Forward Pass ---

    # 1. Convolution Layer
    # Note: F.conv2d requires padding to keep spatial dimensions. K=3 -> padding=1
    # print(X0, Kc, Bc)
    X1 = nn.functional.conv2d(X0, Kc, bias=Bc, stride=1, padding=K//2)
    X1.retain_grad()

    # 2. Max Pooling Layer
    # The `return_indices=True` is important for the backward pass.
    X2_unflattened, M = nn.functional.max_pool2d(X1, kernel_size=2, stride=2, return_indices=True)
    X2_unflattened.retain_grad()
    X2 = X2_unflattened.reshape(N, -1)
    X2.retain_grad()

    # 3. Fully Connected Layer
    X3 = nn.functional.linear(X2, Wl, bias=Bl)
    X3.retain_grad()

    # 4. Softmax (will be combined with loss)
    X4 = nn.functional.softmax(X3, dim=1)
    X4.retain_grad()

    # 5. Cross-Entropy Loss
    loss_fn = nn.CrossEntropyLoss()
    loss = loss_fn(X3, labels) # PyTorch's CrossEntropyLoss combines LogSoftmax and NLLLoss.
    loss.retain_grad()

    # --- Backward Pass ---
    # This will compute gradients for all tensors with requires_grad=True
    loss.backward()

    # --- Extract Gradients ---
    dX3 = X3.grad
    # The gradient for X2 is on the unflattened tensor X2_unflattened
    dX2 = X2_unflattened.grad.reshape(N, -1)
    dX1 = X1.grad

    # --- Print Results ---
    print("X1:")
    show_vec(X1)
    print("X2:")
    show_vec(X2)
    print("X3:")
    show_vec(X3)
    print("X4:")
    show_vec(X4)
    # print(f"X5 (loss): {loss.item():.6f}")

    print("dX3:")
    show_vec(dX3)
    print("dX2:")
    show_vec(dX2)
    print("dX1:")
    show_vec(dX1)

if __name__ == "__main__":
    main()
