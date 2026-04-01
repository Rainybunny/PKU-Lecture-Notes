from __future__ import annotations

import os
from time import time

import numpy as np
import torch
import torch.nn.functional as F
from PIL import Image
from torch.utils.data import Dataset, DataLoader
import torchvision.datasets as datasets
import torchvision.transforms as transforms


class TinyImageNetValDataset(Dataset):
    def __init__(self, root: str, class_to_idx: dict[str, int], transform=None):
        self.root = root
        self.transform = transform
        self.samples: list[tuple[str, int]] = []

        anno_path = os.path.join(root, "val", "val_annotations.txt")
        img_dir = os.path.join(root, "val", "images")
        if not os.path.exists(anno_path):
            raise FileNotFoundError(
                f"Tiny ImageNet val annotations not found: {anno_path}. "
                "Expected the standard tiny-imagenet-200 folder layout."
            )

        with open(anno_path, "r", encoding="utf-8") as f:
            for line in f:
                parts = line.strip().split("\t")
                if len(parts) < 2:
                    continue
                fname, wnid = parts[0], parts[1]
                if wnid not in class_to_idx:
                    continue
                path = os.path.join(img_dir, fname)
                self.samples.append((path, class_to_idx[wnid]))

        if not self.samples:
            raise RuntimeError("No validation samples found. Check dataset path/layout.")

    def __len__(self):
        return len(self.samples)

    def __getitem__(self, idx: int):
        path, label = self.samples[idx]
        img = Image.open(path).convert("RGB")
        if self.transform is not None:
            img = self.transform(img)
        return img, label


class TinyImageNet_CNN_Torch(torch.nn.Module):
    """Torch-only replica of Task3/tiny_imagenet.py.

    Architecture:
    - 4 blocks: (Conv+BN+ReLU)x2 -> MaxPool2d(2)
    - classifier: Linear(4*4*512 -> 1024) -> ReLU -> Linear(1024 -> 200)

    Notes:
    - mytensor uses NHWC; before the first Linear we permute to NHWC so the
      flattened feature ordering matches mytensor's contiguous layout.
    - Weight init matches Task3/nnmodel.py.
    """

    def __init__(self, num_classes: int = 200):
        super().__init__()

        # block1: 3 -> 64
        self.conv1_1 = torch.nn.Conv2d(3, 64, kernel_size=3, padding=1, bias=True)
        self.bn1_1 = torch.nn.BatchNorm2d(64, eps=1e-5, momentum=0.1)
        self.conv1_2 = torch.nn.Conv2d(64, 64, kernel_size=3, padding=1, bias=True)
        self.bn1_2 = torch.nn.BatchNorm2d(64, eps=1e-5, momentum=0.1)

        # block2: 64 -> 128
        self.conv2_1 = torch.nn.Conv2d(64, 128, kernel_size=3, padding=1, bias=True)
        self.bn2_1 = torch.nn.BatchNorm2d(128, eps=1e-5, momentum=0.1)
        self.conv2_2 = torch.nn.Conv2d(128, 128, kernel_size=3, padding=1, bias=True)
        self.bn2_2 = torch.nn.BatchNorm2d(128, eps=1e-5, momentum=0.1)

        # block3: 128 -> 256
        self.conv3_1 = torch.nn.Conv2d(128, 256, kernel_size=3, padding=1, bias=True)
        self.bn3_1 = torch.nn.BatchNorm2d(256, eps=1e-5, momentum=0.1)
        self.conv3_2 = torch.nn.Conv2d(256, 256, kernel_size=3, padding=1, bias=True)
        self.bn3_2 = torch.nn.BatchNorm2d(256, eps=1e-5, momentum=0.1)

        # block4: 256 -> 512
        self.conv4_1 = torch.nn.Conv2d(256, 512, kernel_size=3, padding=1, bias=True)
        self.bn4_1 = torch.nn.BatchNorm2d(512, eps=1e-5, momentum=0.1)
        self.conv4_2 = torch.nn.Conv2d(512, 512, kernel_size=3, padding=1, bias=True)
        self.bn4_2 = torch.nn.BatchNorm2d(512, eps=1e-5, momentum=0.1)

        self.pool = torch.nn.MaxPool2d(kernel_size=2, stride=2, ceil_mode=False)

        self.fc1 = torch.nn.Linear(4 * 4 * 512, 1024, bias=True)
        self.fc2 = torch.nn.Linear(1024, num_classes, bias=True)

        self._init_like_mytensor()

    def _init_like_mytensor(self) -> None:
        convs = [
            self.conv1_1,
            self.conv1_2,
            self.conv2_1,
            self.conv2_2,
            self.conv3_1,
            self.conv3_2,
            self.conv4_1,
            self.conv4_2,
        ]
        for conv in convs:
            cin = int(conv.in_channels)
            k = int(conv.kernel_size[0])
            bound = float((2.0 / (cin * k * k)) ** 0.5)
            torch.nn.init.uniform_(conv.weight, -bound, bound)
            torch.nn.init.zeros_(conv.bias)

        lins = [self.fc1, self.fc2]
        for lin in lins:
            in_dim = int(lin.in_features)
            bound = float((2.0 / in_dim) ** 0.5)
            torch.nn.init.uniform_(lin.weight, -bound, bound)
            torch.nn.init.zeros_(lin.bias)

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        # block1
        x = F.relu(self.bn1_1(self.conv1_1(x)))
        x = F.relu(self.bn1_2(self.conv1_2(x)))
        x = self.pool(x)
        # x = F.dropout(x, 0.05)

        # block2
        x = F.relu(self.bn2_1(self.conv2_1(x)))
        x = F.relu(self.bn2_2(self.conv2_2(x)))
        x = self.pool(x)
        # x = F.dropout(x, 0.05)

        # block3
        x = F.relu(self.bn3_1(self.conv3_1(x)))
        x = F.relu(self.bn3_2(self.conv3_2(x)))
        x = self.pool(x)
        # x = F.dropout(x, 0.05)

        # block4
        x = F.relu(self.bn4_1(self.conv4_1(x)))
        x = F.relu(self.bn4_2(self.conv4_2(x)))
        x = self.pool(x)
        # x = F.dropout(x, 0.05)

        # classifier (match mytensor NHWC flatten order)
        x = x.permute(0, 2, 3, 1).contiguous()
        x = x.view(x.shape[0], -1)
        x = F.relu(self.fc1(x))
        # x = F.dropout(x, 0.1)
        x = self.fc2(x)
        return x


def make_tiny_imagenet_loaders(data_root: str, batch: int, num_workers: int = 2):
    # Tiny ImageNet images are already 64x64 RGB.
    mean = (0.485, 0.456, 0.406)
    std = (0.229, 0.224, 0.225)

    train_tf = transforms.Compose(
        [
            transforms.RandomCrop(64, padding=8, padding_mode="reflect"),
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

    train_dir = os.path.join(data_root, "train")
    if not os.path.exists(train_dir):
        raise FileNotFoundError(
            f"Tiny ImageNet train folder not found: {train_dir}. "
            "Set data_root to the extracted tiny-imagenet-200 directory."
        )

    train_ds = datasets.ImageFolder(train_dir, transform=train_tf)
    val_ds = TinyImageNetValDataset(data_root, train_ds.class_to_idx, transform=test_tf)

    train_loader = DataLoader(
        train_ds,
        batch_size=batch,
        shuffle=True,
        num_workers=num_workers,
        pin_memory=False,
        drop_last=False,
    )
    val_loader = DataLoader(
        val_ds,
        batch_size=batch,
        shuffle=False,
        num_workers=num_workers,
        pin_memory=False,
        drop_last=False,
    )
    return train_loader, val_loader


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
        incorrect = int((pred != y).sum().item())

        n = int(y.shape[0])
        total_loss += float(loss_sum.item())
        total_incorrect += incorrect
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
    verbose: bool = True,
    device: torch.device,
):
    # Seed torch-side RNG used by DataLoader workers / transforms.
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
        total_train_incorrect = 0
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
            total_train_incorrect += incorrect
            total_n += n
            if verbose:
                print(
                    f"\r{total_n / len(train_loader.dataset) * 100:.2f}% {batch_loss:.5f} {batch_err:.5f}",
                    end="",
                )

        elapsed = time() - start_time
        test_loss, test_err = grade(model, test_loader, device=device, verbose=False)

        if verbose:
            print("\r", end="")
        print(
            "|  {:>4} |    {:.5f} |   {:.5f} |   {:.5f} |  {:.5f} | {:>6.2f} |".format(
                epoch,
                total_train_loss / total_n,
                total_train_incorrect / total_n,
                test_loss,
                test_err,
                elapsed,
            )
        )


if __name__ == "__main__":
    torch.manual_seed(712)

    data_root = "../data/tiny-imagenet-200"
    num_workers = 2
    batch = 64
    epochs = 50

    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    train_dl, val_dl = make_tiny_imagenet_loaders(data_root, batch=batch, num_workers=num_workers)
    model = TinyImageNet_CNN_Torch(num_classes=200).to(device)

    train(
        model,
        train_dl,
        val_dl,
        epochs=epochs,
        lr=1e-3,
        betas=(0.9, 0.999),
        eps=1e-8,
        weight_decay=1e-4,
        seed=712,
        verbose=False,
        device=device,
    )
