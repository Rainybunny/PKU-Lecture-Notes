import os
import numpy as np
import torch
from PIL import Image
from torch.utils.data import Dataset, DataLoader
import torchvision.transforms as transforms
import torchvision.datasets as datasets

from build import mytensor as mt
import nnmodel as nn


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


class TinyImageNet_CNN:
    """A simple VGG-like CNN for Tiny ImageNet (64x64 RGB, 200 classes).

    Shapes assume NHWC inputs.
    After 4 maxpools with K=2: 64 -> 32 -> 16 -> 8 -> 4, so flatten dim is 4*4*C.
    """

    def __init__(self, num_classes: int = 200):
        # (N, 224, 224, 3)
        # block1: 3 -> 64
        self.conv1_1 = nn.Conv2D(3, 64, 3)
        self.bn1_1 = nn.BatchNorm(64)
        self.conv1_2 = nn.Conv2D(64, 64, 3)
        self.bn1_2 = nn.BatchNorm(64)

        # block2: 64 -> 128
        self.conv2_1 = nn.Conv2D(64, 128, 3)
        self.bn2_1 = nn.BatchNorm(128)
        self.conv2_2 = nn.Conv2D(128, 128, 3)
        self.bn2_2 = nn.BatchNorm(128)

        # block3: 128 -> 256
        self.conv3_1 = nn.Conv2D(128, 256, 3)
        self.bn3_1 = nn.BatchNorm(256)
        self.conv3_2 = nn.Conv2D(256, 256, 3)
        self.bn3_2 = nn.BatchNorm(256)

        # block4: 256 -> 512
        self.conv4_1 = nn.Conv2D(256, 512, 3)
        self.bn4_1 = nn.BatchNorm(512)
        self.conv4_2 = nn.Conv2D(512, 512, 3)
        self.bn4_2 = nn.BatchNorm(512)

        # Classifier
        self.fc1 = nn.Linear(4 * 4 * 512, 1024)
        self.fc2 = nn.Linear(1024, num_classes)

        self.ops = [
            self.conv1_1, self.bn1_1, self.conv1_2, self.bn1_2,
            self.conv2_1, self.bn2_1, self.conv2_2, self.bn2_2,
            self.conv3_1, self.bn3_1, self.conv3_2, self.bn3_2,
            self.conv4_1, self.bn4_1, self.conv4_2, self.bn4_2,
            self.fc1, self.fc2,
        ]
        self.prediction = None

    def forward(self, x, y):
        # block1
        x = mt.relu(self.bn1_1(self.conv1_1(x)))
        x = mt.relu(self.bn1_2(self.conv1_2(x)))
        x = mt.maxpool(x, 2)
        # x = mt.dropout(x, 0.10)

        # block2
        x = mt.relu(self.bn2_1(self.conv2_1(x)))
        x = mt.relu(self.bn2_2(self.conv2_2(x)))
        x = mt.maxpool(x, 2)
        # x = mt.dropout(x, 0.15)

        # block3
        x = mt.relu(self.bn3_1(self.conv3_1(x)))
        x = mt.relu(self.bn3_2(self.conv3_2(x)))
        x = mt.maxpool(x, 2)
        # x = mt.dropout(x, 0.20)

        # block4
        x = mt.relu(self.bn4_1(self.conv4_1(x)))
        x = mt.relu(self.bn4_2(self.conv4_2(x)))
        x = mt.maxpool(x, 2)
        # x = mt.dropout(x, 0.25)

        # classifier
        x = mt.relu(self.fc1(x))
        # x = mt.dropout(x, 0.50)
        x = self.fc2(x)

        self.prediction = mt.Tensor(x.shape(), False)
        return mt.softmax_celoss(x, y, self.prediction)

    def error(self, y):
        incorrect = mt.sum_all(mt.differ(mt.row_argmax(self.prediction), y))
        return incorrect / y.shape()[0]

    @property
    def parameters(self):
        return [param for op in self.ops for param in op.parameters]

def make_tiny_imagenet_loaders(data_root: str, batch: int, num_workers: int = 2):
    # Tiny ImageNet images are already 64x64 RGB.
    mean = (0.485, 0.456, 0.406)
    std = (0.229, 0.224, 0.225)

    train_tf = transforms.Compose([
        transforms.RandomCrop(64, padding=8, padding_mode="reflect"),
        transforms.RandomHorizontalFlip(),
        transforms.ToTensor(),
        transforms.Normalize(mean, std),
    ])
    test_tf = transforms.Compose([
        transforms.ToTensor(),
        transforms.Normalize(mean, std),
    ])

    train_dir = os.path.join(data_root, "train")
    if not os.path.exists(train_dir):
        raise FileNotFoundError(
            f"Tiny ImageNet train folder not found: {train_dir}. "
            "Set data_root to the extracted tiny-imagenet-200 directory."
        )

    train_ds = datasets.ImageFolder(train_dir, transform=train_tf)
    val_ds = TinyImageNetValDataset(data_root, train_ds.class_to_idx, transform=test_tf)

    # show shape for single image
    print("Example image shape (HWC):", np.asarray(train_ds[0][0]).shape)

    train_loader = DataLoader(
        train_ds, batch_size=batch, shuffle=True,
        num_workers=num_workers, pin_memory=False, drop_last=False,
    )
    val_loader = DataLoader(
        val_ds, batch_size=batch, shuffle=False,
        num_workers=num_workers, pin_memory=False, drop_last=False,
    )
    return train_loader, val_loader


if __name__ == '__main__':
    mt.manual_seed(712)
    torch.manual_seed(712)

    data_root = "../data/tiny-imagenet-200"
    num_workers = 2
    batch = 64
    epochs = 50

    train_dl, val_dl = make_tiny_imagenet_loaders(data_root, batch=batch, num_workers=num_workers)
    model = TinyImageNet_CNN(num_classes=200)

    nn.train(
        model,
        train_dl,
        val_dl,
        epochs=epochs,
        lr=1e-3,
        betas=(0.9, 0.999),
        eps=1e-8,
        weight_decay=1e-4,
        seed=712,
        verbose=False
    )
