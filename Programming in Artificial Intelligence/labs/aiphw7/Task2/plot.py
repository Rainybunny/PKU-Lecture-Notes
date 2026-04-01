import argparse
import json
import os
from dataclasses import dataclass

import matplotlib.pyplot as plt


@dataclass(frozen=True)
class RunSeries:
	label: str
	epochs: list[int]
	loss: list[float]
	train_acc: list[float]
	epoch_time_sec: list[float]
	imgs_per_sec: list[float]
	total_time_sec: float
	test_acc: float


def build_argparser() -> argparse.ArgumentParser:
	p = argparse.ArgumentParser(description="Plot seq vs DataParallel CIFAR10 LeNet summary")
	p.add_argument("--seq", type=str, default="./reports/seq_e10.json", help="Path to sequential JSON report")
	p.add_argument("--par", type=str, default="./reports/par_e10.json", help="Path to DataParallel JSON report")
	p.add_argument("--out", type=str, default="./reports/compare_e10.png", help="Output figure path")
	p.add_argument("--dpi", type=int, default=150)
	p.add_argument("--title", type=str, default="CIFAR-10 LeNet: Sequential vs DataParallel")
	p.add_argument("--show", action="store_true", help="Show the plot window instead of only saving")
	return p


def _ensure_parent_dir(path: str) -> None:
	parent = os.path.dirname(os.path.abspath(path))
	if parent:
		os.makedirs(parent, exist_ok=True)


def _load_report(path: str) -> dict:
	with open(path, "r", encoding="utf-8") as f:
		return json.load(f)


def _to_series(report: dict, *, label: str) -> RunSeries:
	epoch_rows = list(report.get("train", {}).get("epochs", []))
	epoch_rows.sort(key=lambda r: int(r.get("epoch", 0)))

	epochs = [int(r.get("epoch")) for r in epoch_rows]
	loss = [float(r.get("loss")) for r in epoch_rows]
	train_acc = [float(r.get("acc")) for r in epoch_rows]
	epoch_time_sec = [float(r.get("time_sec")) for r in epoch_rows]
	imgs_per_sec = [float(r.get("images_per_sec")) for r in epoch_rows]

	total_time_sec = float(report.get("train", {}).get("total_time_sec", sum(epoch_time_sec)))
	test_acc = float(report.get("test", {}).get("overall_acc", float("nan")))

	return RunSeries(
		label=label,
		epochs=epochs,
		loss=loss,
		train_acc=train_acc,
		epoch_time_sec=epoch_time_sec,
		imgs_per_sec=imgs_per_sec,
		total_time_sec=total_time_sec,
		test_acc=test_acc,
	)


def _fmt_sec(sec: float) -> str:
	if sec != sec:  # NaN
		return "n/a"
	if sec < 60:
		return f"{sec:.1f}s"
	return f"{sec/60.0:.2f}m"


def main() -> None:
	args = build_argparser().parse_args()

	seq_report = _load_report(args.seq)
	par_report = _load_report(args.par)

	seq = _to_series(seq_report, label="Sequential")
	par = _to_series(par_report, label="DataParallel")

	fig, axes = plt.subplots(2, 2, figsize=(11, 7), dpi=args.dpi)
	(ax_loss, ax_acc), (ax_thr, ax_time) = axes

	ax_loss.plot(seq.epochs, seq.loss, marker="o", linewidth=1.8, label=seq.label)
	ax_loss.plot(par.epochs, par.loss, marker="o", linewidth=1.8, label=par.label)
	ax_loss.set_title("Train Loss")
	ax_loss.set_xlabel("Epoch")
	ax_loss.set_ylabel("Loss")
	ax_loss.grid(True, alpha=0.3)
	ax_loss.legend()

	ax_acc.plot(seq.epochs, seq.train_acc, marker="o", linewidth=1.8, label=seq.label)
	ax_acc.plot(par.epochs, par.train_acc, marker="o", linewidth=1.8, label=par.label)
	ax_acc.set_title("Train Accuracy")
	ax_acc.set_xlabel("Epoch")
	ax_acc.set_ylabel("Accuracy (%)")
	ax_acc.grid(True, alpha=0.3)
	ax_acc.legend()

	ax_thr.plot(seq.epochs, seq.imgs_per_sec, marker="o", linewidth=1.8, label=seq.label)
	ax_thr.plot(par.epochs, par.imgs_per_sec, marker="o", linewidth=1.8, label=par.label)
	ax_thr.set_title("Throughput")
	ax_thr.set_xlabel("Epoch")
	ax_thr.set_ylabel("Images/sec")
	ax_thr.grid(True, alpha=0.3)
	ax_thr.legend()

	ax_time.plot(seq.epochs, seq.epoch_time_sec, marker="o", linewidth=1.8, label=seq.label)
	ax_time.plot(par.epochs, par.epoch_time_sec, marker="o", linewidth=1.8, label=par.label)
	ax_time.set_title("Epoch Time")
	ax_time.set_xlabel("Epoch")
	ax_time.set_ylabel("Seconds")
	ax_time.grid(True, alpha=0.3)
	ax_time.legend()

	speedup = (seq.total_time_sec / par.total_time_sec) if par.total_time_sec > 0 else float("nan")
	subtitle = (
		f"{seq.label}: total {_fmt_sec(seq.total_time_sec)}, test {seq.test_acc:.2f}% | "
		f"{par.label}: total {_fmt_sec(par.total_time_sec)}, test {par.test_acc:.2f}% | "
		f"speedup {speedup:.3f}x"
	)
	fig.suptitle(f"{args.title}\n{subtitle}", fontsize=12)

	fig.tight_layout(rect=(0, 0, 1, 0.92))

	_ensure_parent_dir(args.out)
	fig.savefig(args.out)
	print(f"Saved figure: {args.out}")

	print(
		f"Seq total_time_sec={seq.total_time_sec:.3f}, test_acc={seq.test_acc:.3f} | "
		f"Par total_time_sec={par.total_time_sec:.3f}, test_acc={par.test_acc:.3f} | "
		f"speedup={speedup:.3f}"
	)

	if args.show:
		plt.show()


if __name__ == "__main__":
	main()
