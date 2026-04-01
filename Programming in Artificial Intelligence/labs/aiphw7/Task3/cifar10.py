import numpy as np
from build import mytensor as mt
import nnmodel as nn
import torch
from torch.utils.data import DataLoader
import torchvision
import torchvision.transforms as transforms

class Cifar10_CNN:
    def __init__(self):
        self.conv1_1 = nn.Conv2D(3, 64, 3)
        self.bn1_1 = nn.BatchNorm(64)
        self.conv1_2 = nn.Conv2D(64, 64, 3)
        self.bn1_2 = nn.BatchNorm(64)

        self.conv2_1 = nn.Conv2D(64, 128, 3)
        self.bn2_1 = nn.BatchNorm(128)
        self.conv2_2 = nn.Conv2D(128, 128, 3)
        self.bn2_2 = nn.BatchNorm(128)

        self.conv3_1 = nn.Conv2D(128, 256, 3)
        self.bn3_1 = nn.BatchNorm(256)
        self.conv3_2 = nn.Conv2D(256, 256, 3)
        self.bn3_2 = nn.BatchNorm(256)

        # Classifier: keep small to avoid overfitting
        self.fc1 = nn.Linear(4 * 4 * 256, 10)
        # self.fc2 = nn.Linear(64, 10)

        # collect params for optimizer
        self.ops = [
            self.conv1_1, self.bn1_1, self.conv1_2, self.bn1_2,
            self.conv2_1, self.bn2_1, self.conv2_2, self.bn2_2,
            self.conv3_1, self.bn3_1, self.conv3_2, self.bn3_2,
            self.fc1 #, self.fc2
        ]
        self.prediction = None # store prediction result

    def forward(self, x, y):
        # block1
        x = mt.relu(self.bn1_1(self.conv1_1(x)))
        x = mt.relu(self.bn1_2(self.conv1_2(x)))
        x = mt.maxpool(x, 2)
        x = mt.dropout(x, 0.1)

        # block2
        x = mt.relu(self.bn2_1(self.conv2_1(x)))
        x = mt.relu(self.bn2_2(self.conv2_2(x)))
        x = mt.maxpool(x, 2)
        x = mt.dropout(x, 0.1)

        # block3
        x = mt.relu(self.bn3_1(self.conv3_1(x)))
        x = mt.relu(self.bn3_2(self.conv3_2(x)))
        x = mt.maxpool(x, 2)
        x = mt.dropout(x, 0.2)

        # classifier (main regularization here)
        # x = mt.relu(self.fc1(x))
        x = self.fc1(x)
        self.prediction = mt.Tensor(x.shape(), False)
        x = mt.softmax_celoss(x, y, self.prediction)
        return x

    def error(self, y):
        incorrect = mt.sum_all(mt.differ(mt.row_argmax(self.prediction), y))
        return incorrect / y.shape()[0]

    @property
    def parameters(self):
        return [param for op in self.ops for param in op.parameters]

if __name__ == '__main__':
    # Reproducibility: seed mytensor RNG used by parameter initialization.
    mt.manual_seed(712)
    torch.manual_seed(712)
    model = Cifar10_CNN()

    # Use torchvision transforms; nnmodel will convert NCHW->NHWC for mytensor.
    mean = (0.4914, 0.4822, 0.4465) # comes from CIFAR-10 dataset
    std = (0.2470, 0.2435, 0.2616)
    train_tf = transforms.Compose([
        transforms.RandomCrop(32, padding=4, padding_mode='reflect'),
        transforms.RandomHorizontalFlip(),
        transforms.ToTensor(),
        transforms.Normalize(mean, std),
    ])
    test_tf = transforms.Compose([
        transforms.ToTensor(),
        transforms.Normalize(mean, std),
    ])

    train_ds = torchvision.datasets.CIFAR10(root='../data', train=True, download=True, transform=train_tf)
    test_ds = torchvision.datasets.CIFAR10(root='../data', train=False, download=True, transform=test_tf)

    train_dl = DataLoader(train_ds, batch_size=64, shuffle=True, num_workers=2, drop_last=False)
    test_dl = DataLoader(test_ds, batch_size=64, shuffle=False, num_workers=2, drop_last=False)

    nn.train(
        model,
        train_dl,
        test_dl,
        epochs=30,
        lr=1e-3,
        betas=(0.9, 0.999),
        eps=1e-8,
        weight_decay=1e-4,
        seed=712,
        verbose=False
    )
