from __future__ import annotations

from time import time

import numpy as np
import torch
import torch.nn.functional as F
from torch.utils.data import DataLoader
import torchvision
import torchvision.transforms as transforms


class Cifar10_CNN_Torch(torch.nn.Module):
    """Torch-only replica of Task3/cifar10.py.

    Matches:
    - 3 conv blocks: (Conv+BN+ReLU)x2 -> MaxPool2d(2) -> Dropout
    - classifier: Linear(4*4*256 -> 10) (no hidden layer)
    - initialization scheme from Task3/nnmodel.py
    - NHWC flatten order before the final Linear (to mirror mytensor layout)
    """

    def __init__(self):
        super().__init__()

        # block1
        self.conv1_1 = torch.nn.Conv2d(3, 64, kernel_size=3, padding=1, bias=True)
        self.bn1_1 = torch.nn.BatchNorm2d(64, eps=1e-5, momentum=0.1)
        self.conv1_2 = torch.nn.Conv2d(64, 64, kernel_size=3, padding=1, bias=True)
        self.bn1_2 = torch.nn.BatchNorm2d(64, eps=1e-5, momentum=0.1)

        # block2
        self.conv2_1 = torch.nn.Conv2d(64, 128, kernel_size=3, padding=1, bias=True)
        self.bn2_1 = torch.nn.BatchNorm2d(128, eps=1e-5, momentum=0.1)
        self.conv2_2 = torch.nn.Conv2d(128, 128, kernel_size=3, padding=1, bias=True)
        self.bn2_2 = torch.nn.BatchNorm2d(128, eps=1e-5, momentum=0.1)

        # block3
        self.conv3_1 = torch.nn.Conv2d(128, 256, kernel_size=3, padding=1, bias=True)
        self.bn3_1 = torch.nn.BatchNorm2d(256, eps=1e-5, momentum=0.1)
        self.conv3_2 = torch.nn.Conv2d(256, 256, kernel_size=3, padding=1, bias=True)
        self.bn3_2 = torch.nn.BatchNorm2d(256, eps=1e-5, momentum=0.1)

        self.pool = torch.nn.MaxPool2d(kernel_size=2, stride=2, ceil_mode=False)

        # classifier
        self.fc1 = torch.nn.Linear(4 * 4 * 256, 10, bias=True)

        self._init_like_mytensor()

    def _init_like_mytensor(self) -> None:
        # Match Task3/nnmodel.py initialization:
        # Conv2D: uniform(bound=sqrt(2/(Cin*K*K))) and bias=0
        # Linear: uniform(bound=sqrt(2/in_dim)) and bias=0
        convs = [
            self.conv1_1,
            self.conv1_2,
            self.conv2_1,
            self.conv2_2,
            self.conv3_1,
            self.conv3_2,
        ]
        for conv in convs:
            cin = int(conv.in_channels)
            k = int(conv.kernel_size[0])
            bound = float((2.0 / (cin * k * k)) ** 0.5)
            torch.nn.init.uniform_(conv.weight, -bound, bound)
            torch.nn.init.zeros_(conv.bias)

        lin = self.fc1
        in_dim = int(lin.in_features)
        bound = float((2.0 / in_dim) ** 0.5)
        torch.nn.init.uniform_(lin.weight, -bound, bound)
        torch.nn.init.zeros_(lin.bias)

        # BatchNorm defaults already match: gamma=1, beta=0.

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        # block1
        x = F.relu(self.bn1_1(self.conv1_1(x)))
        x = F.relu(self.bn1_2(self.conv1_2(x)))
        x = self.pool(x)
        x = F.dropout(x, p=0.1, training=self.training)

        # block2
        x = F.relu(self.bn2_1(self.conv2_1(x)))
        x = F.relu(self.bn2_2(self.conv2_2(x)))
        x = self.pool(x)
        x = F.dropout(x, p=0.1, training=self.training)

        # block3
        x = F.relu(self.bn3_1(self.conv3_1(x)))
        x = F.relu(self.bn3_2(self.conv3_2(x)))
        x = self.pool(x)
        x = F.dropout(x, p=0.2, training=self.training)

        # Match mytensor's implicit NHWC flatten order before Linear.
        x = x.permute(0, 2, 3, 1).contiguous()
        x = x.view(x.shape[0], -1)
        x = self.fc1(x)
        return x


@torch.no_grad()
def grade(model: torch.nn.Module, loader: DataLoader, device: torch.device, verbose: bool = False):
    if verbose:
        print("== Start grading on test set ==")

    model.eval()
    total_loss = 0.0
    total_incorrect = 0
    total_n = 0

    for x_t, y_t in loader:
        x = x_t.to(device=device, dtype=torch.float32)
        y = y_t.to(device=device, dtype=torch.long)
        logits = model(x)
        loss_sum = F.cross_entropy(logits, y, reduction="sum")
        pred = logits.argmax(dim=1)
        incorrect = (pred != y).sum().item()

        n = int(y.shape[0])
        total_loss += float(loss_sum.item())
        total_incorrect += int(incorrect)
        total_n += n
        if verbose:
            print(f"\r{total_n / len(loader.dataset) * 100:.2f}%", end="")

    avg_loss = total_loss / total_n
    err_rate = total_incorrect / total_n
    if verbose:
        print("\rResult:\n    Average loss: {:.5f}\n    Error rate: {:.5f}".format(avg_loss, err_rate))
    return avg_loss, err_rate


def train(
    model: torch.nn.Module,
    train_loader: DataLoader,
    test_loader: DataLoader,
    *,
    epochs: int,
    lr: float,
    betas: tuple[float, float],
    eps: float,
    weight_decay: float,
    seed: int = 0,
    device: torch.device,
):
    # Match Task3/nnmodel.py seeding behavior.
    torch.manual_seed(int(seed))
    np.random.seed(int(seed))

    print("Hyperparameters:")
    print(f"epochs={epochs}, lr={lr}, betas={betas}, " f"eps={eps}, weight_decay={weight_decay}, seed={seed}")
    optim = torch.optim.Adam(model.parameters(), lr=lr, betas=betas, eps=eps, weight_decay=weight_decay)
    print("| Epoch | Train Loss | Train Err | Test Loss | Test Err | Time/s |")

    for epoch in range(epochs):
        start_time = time()
        if epoch % 4 == 0 and epoch > 0:
            for group in optim.param_groups:
                group["lr"] *= 0.4

        total_train_loss = 0.0
        total_incorrect = 0
        total_n = 0

        model.train()
        for x_t, y_t in train_loader:
            x = x_t.to(device=device, dtype=torch.float32)
            y = y_t.to(device=device, dtype=torch.long)

            optim.zero_grad(set_to_none=True)
            logits = model(x)
            loss_sum = F.cross_entropy(logits, y, reduction="sum")
            loss_sum.backward()
            optim.step()

            n = int(y.shape[0])
            pred = logits.argmax(dim=1)
            incorrect = int((pred != y).sum().item())

            batch_loss = float(loss_sum.item()) / n
            batch_err = incorrect / n
            total_train_loss += batch_loss * n
            total_incorrect += incorrect
            total_n += n
            # print(
            #     f"\r{total_n / len(train_loader.dataset) * 100:.2f}% {batch_loss:.5f} {batch_err:.5f}",
            #     end="",
            # )

        elapsed = time() - start_time
        test_loss, test_err = grade(model, test_loader, device=device, verbose=False)

        print(
            "|  {:>4} |    {:.5f} |   {:.5f} |   {:.5f} |  {:.5f} | {:>6.2f} |".format(
                epoch,
                total_train_loss / total_n,
                total_incorrect / total_n,
                test_loss,
                test_err,
                elapsed,
            )
        )


if __name__ == "__main__":
    # Match Task3/cifar10.py seeds.
    torch.manual_seed(712)

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    # Match Task3/cifar10.py transforms and DataLoader policy.
    mean = (0.4914, 0.4822, 0.4465)
    std = (0.2470, 0.2435, 0.2616)
    train_tf = transforms.Compose(
        [
            transforms.RandomCrop(32, padding=4, padding_mode="reflect"),
            transforms.RandomHorizontalFlip(),
            transforms.ToTensor(),
            transforms.Normalize(mean, std),
        ]
    )
    test_tf = transforms.Compose(
        [
            transforms.ToTensor(),
            transforms.Normalize(mean, std),
        ]
    )

    train_ds = torchvision.datasets.CIFAR10(root="../data", train=True, download=True, transform=train_tf)
    test_ds = torchvision.datasets.CIFAR10(root="../data", train=False, download=True, transform=test_tf)

    train_dl = DataLoader(train_ds, batch_size=64, shuffle=True, num_workers=2, drop_last=False)
    test_dl = DataLoader(test_ds, batch_size=64, shuffle=False, num_workers=2, drop_last=False)

    model = Cifar10_CNN_Torch().to(device)
    train(
        model,
        train_dl,
        test_dl,
        epochs=30,
        lr=1e-3,
        betas=(0.9, 0.999),
        eps=1e-8,
        weight_decay=1e-4,
        seed=712,
        device=device,
    )
