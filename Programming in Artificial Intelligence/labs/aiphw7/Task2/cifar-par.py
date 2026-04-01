import argparse
import json
import os
import time
from datetime import datetime

import torch
import torchvision
import torchvision.transforms as transforms
import torch.nn as nn
import torch.nn.functional as F
from torch.utils.tensorboard import SummaryWriter


def build_argparser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(description="CIFAR10 LeNet (DataParallel)")
    p.add_argument("--batch-size", type=int, default=128)
    p.add_argument("--epochs", type=int, default=10)
    p.add_argument("--num-workers", type=int, default=2)
    p.add_argument("--lr", type=float, default=0.025)
    p.add_argument("--momentum", type=float, default=0.9)
    p.add_argument("--weight-decay", type=float, default=1e-3)
    p.add_argument("--seed", type=int, default=42)
    p.add_argument("--data-root", type=str, default="../data")
    p.add_argument("--logdir", type=str, default="./runs/par")
    p.add_argument("--report", type=str, default="./reports/par.json")
    p.add_argument("--save", type=str, default="./cifar_lenet_par.pth")
    p.add_argument("--limit-batches", type=int, default=0, help="If >0, only run this many train batches per epoch (for quick smoke tests)")
    return p


def set_seed(seed: int) -> None:
    torch.manual_seed(seed)
    if torch.cuda.is_available():
        torch.cuda.manual_seed_all(seed)


def ensure_parent_dir(path: str) -> None:
    parent = os.path.dirname(os.path.abspath(path))
    if parent:
        os.makedirs(parent, exist_ok=True)


def cuda_sync_if_needed(device: torch.device) -> None:
    if device.type == "cuda":
        torch.cuda.synchronize(device)

class LeNet(torch.nn.Module):
    def __init__(self):
        super(LeNet, self).__init__()
        self.conv1 = nn.Conv2d(3, 6, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(6, 16, 5)
        self.fc1 = nn.Linear(16 * 5 * 5, 120)
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 10)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = torch.flatten(x, 1)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x

def train_model(
    *,
    model: torch.nn.Module,
    trainloader: torch.utils.data.DataLoader,
    criterion: torch.nn.Module,
    optimizer: torch.optim.Optimizer,
    device: torch.device,
    epochs: int,
    writer: SummaryWriter,
    limit_batches: int,
) -> list[dict]:
    metrics: list[dict] = []
    global_step = 0

    model.train()
    for epoch in range(epochs):
        current_loss = 0.0
        current_correct = 0
        total = 0

        cuda_sync_if_needed(device)
        epoch_start = time.perf_counter()

        for i, (x, yhat) in enumerate(trainloader):
            if limit_batches and i >= limit_batches:
                break

            x, yhat = x.to(device, non_blocking=True), yhat.to(device, non_blocking=True)
            optimizer.zero_grad(set_to_none=True)
            y = model(x)
            loss = criterion(y, yhat)
            loss.backward()
            optimizer.step()

            _, predicted = torch.max(y.data, dim=1)
            batch_size = yhat.size(0)
            total += batch_size
            current_correct += (predicted == yhat).sum().item()

            writer.add_scalar("Loss/Train", float(loss.item()), global_step)
            current_loss += float(loss.item())
            global_step += 1

        cuda_sync_if_needed(device)
        epoch_time = time.perf_counter() - epoch_start

        steps = max(1, (i + 1) if not (limit_batches and i >= limit_batches) else limit_batches)
        avg_loss = current_loss / steps
        accuracy = 100.0 * current_correct / max(1, total)
        imgs_per_sec = total / max(1e-9, epoch_time)

        writer.add_scalar("Acc/Train", accuracy, epoch)
        writer.add_scalar("Time/EpochSec", epoch_time, epoch)
        writer.add_scalar("Throughput/ImagesPerSec", imgs_per_sec, epoch)

        print(
            f"epoch {epoch}"
            f" | loss {avg_loss:.6f}"
            f" | acc {accuracy:.3f}%"
            f" | time {epoch_time:.3f}s"
            f" | imgs/s {imgs_per_sec:.1f}"
        )

        metrics.append(
            {
                "epoch": epoch,
                "loss": avg_loss,
                "acc": accuracy,
                "time_sec": epoch_time,
                "images": total,
                "images_per_sec": imgs_per_sec,
            }
        )

    return metrics


def test_model(
    *,
    model: torch.nn.Module,
    testloader: torch.utils.data.DataLoader,
    device: torch.device,
) -> dict:
    model.eval()
    all_total = 0
    all_correct = 0
    per_class: dict[str, float] = {}

    with torch.no_grad():
        for cls in range(10):
            total = 0
            correct = 0
            for x, labels in testloader:
                x, labels = x.to(device, non_blocking=True), labels.to(device, non_blocking=True)
                mask = labels == cls
                if mask.sum().item() == 0:
                    continue
                y = model(x[mask])
                _, predicted = torch.max(y.data, dim=1)
                total += int(mask.sum().item())
                correct += int((predicted == labels[mask]).sum().item())
            acc = 100.0 * correct / max(1, total)
            per_class[str(cls)] = acc
            print(f"Class {cls} | Accuracy: {acc:.3f}%")
            all_total += total
            all_correct += correct

    overall = 100.0 * all_correct / max(1, all_total)
    print(f"Overall Accuracy: {overall:.3f}%")
    return {"overall_acc": overall, "per_class_acc": per_class}


def main() -> None:
    args = build_argparser().parse_args()
    set_seed(args.seed)

    device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")
    gpu_count = int(torch.cuda.device_count()) if torch.cuda.is_available() else 0
    print(f"Device: {device} | GPUs: {gpu_count}")

    transform = transforms.Compose(
        [
            transforms.ToTensor(),
            transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5)),
        ]
    )
    trainset = torchvision.datasets.CIFAR10(
        root=args.data_root, train=True, download=True, transform=transform
    )
    testset = torchvision.datasets.CIFAR10(
        root=args.data_root, train=False, download=True, transform=transform
    )

    pin_memory = device.type == "cuda"
    trainloader = torch.utils.data.DataLoader(
        trainset,
        batch_size=args.batch_size,
        shuffle=True,
        num_workers=args.num_workers,
        pin_memory=pin_memory,
    )
    testloader = torch.utils.data.DataLoader(
        testset,
        batch_size=args.batch_size,
        shuffle=False,
        num_workers=args.num_workers,
        pin_memory=pin_memory,
    )

    run_name = datetime.now().strftime("%Y%m%d_%H%M%S")
    writer = SummaryWriter(log_dir=os.path.join(args.logdir, run_name))

    base_model = LeNet().to(device)
    # Force DataParallel on CUDA even if there's only 1 GPU (demonstration).
    if device.type == "cuda" and gpu_count >= 1:
        device_ids = list(range(gpu_count)) if gpu_count > 1 else [0]
        model = torch.nn.DataParallel(base_model, device_ids=device_ids)
        parallel_mode = "DataParallel"
    else:
        model = base_model
        parallel_mode = "SingleDevice"

    print(f"Parallel mode: {parallel_mode}")

    criterion = nn.CrossEntropyLoss()
    optimizer = torch.optim.SGD(
        model.parameters(),
        lr=args.lr,
        momentum=args.momentum,
        weight_decay=args.weight_decay,
    )

    cuda_sync_if_needed(device)
    train_start = time.perf_counter()
    train_metrics = train_model(
        model=model,
        trainloader=trainloader,
        criterion=criterion,
        optimizer=optimizer,
        device=device,
        epochs=args.epochs,
        writer=writer,
        limit_batches=args.limit_batches,
    )
    cuda_sync_if_needed(device)
    train_time = time.perf_counter() - train_start

    print("Finished Training")
    ensure_parent_dir(args.save)
    if isinstance(model, torch.nn.DataParallel):
        torch.save(model.module.state_dict(), args.save)
    else:
        torch.save(model.state_dict(), args.save)
    writer.flush()

    test_metrics = test_model(model=model, testloader=testloader, device=device)

    report = {
        "script": os.path.basename(__file__),
        "timestamp": datetime.now().isoformat(timespec="seconds"),
        "torch": torch.__version__,
        "cuda_available": torch.cuda.is_available(),
        "device": str(device),
        "gpu_count": gpu_count,
        "parallel_mode": parallel_mode,
        "batch_size": args.batch_size,
        "epochs": args.epochs,
        "num_workers": args.num_workers,
        "optimizer": {
            "name": "SGD",
            "lr": args.lr,
            "momentum": args.momentum,
            "weight_decay": args.weight_decay,
        },
        "train": {
            "total_time_sec": train_time,
            "epochs": train_metrics,
        },
        "test": test_metrics,
    }

    ensure_parent_dir(args.report)
    with open(args.report, "w", encoding="utf-8") as f:
        json.dump(report, f, indent=2)
    print(f"Wrote report: {args.report}")
    writer.close()


if __name__ == "__main__":
    main()