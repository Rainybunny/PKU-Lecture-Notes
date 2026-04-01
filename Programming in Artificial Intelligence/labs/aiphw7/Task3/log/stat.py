"""
Read a log file, and output:
    - the best train loss and error, and their epoch;
    - the best test loss and error, and their epoch;
    - the average time per epoch.
Usage:
    python stat.py <log_file>
"""

import sys
import re
import numpy as np
if __name__ == '__main__':
    log_file = sys.argv[1]
    with open(log_file, 'r') as f:
        lines = f.readlines()

    epoch_nums = []
    train_losses = []
    train_errors = []
    test_losses = []
    test_errors = []
    times = []

    pattern = re.compile(
        r'\|\s+(\d+)\s+\|\s+([\d.]+)\s+\|\s+([\d.]+)\s+\|\s+([\d.]+)\s+\|\s+([\d.]+)\s+\|\s+([\d.]+)\s+\|'
    )
    for line in lines:
        match = pattern.search(line)
        if match:
            epoch_nums.append(int(match.group(1)))
            train_losses.append(float(match.group(2)))
            train_errors.append(float(match.group(3)))
            test_losses.append(float(match.group(4)))
            test_errors.append(float(match.group(5)))
            times.append(float(match.group(6)))
    epoch_nums = np.array(epoch_nums)
    train_losses = np.array(train_losses)
    train_errors = np.array(train_errors)
    test_losses = np.array(test_losses)
    test_errors = np.array(test_errors)
    times = np.array(times)
    best_train_loss_idx = np.argmin(train_losses)
    best_test_loss_idx = np.argmin(test_losses)
    best_train_error_idx = np.argmin(train_errors)
    best_test_error_idx = np.argmin(test_errors)
    avg_time = np.mean(times)
    print(f'Best Train Loss: {train_losses[best_train_loss_idx]:.5f} at Epoch {epoch_nums[best_train_loss_idx]}')
    print(f'Best Train Error: {train_errors[best_train_error_idx]:.5f} at Epoch {epoch_nums[best_train_error_idx]}')
    print(f'Best Test Loss: {test_losses[best_test_loss_idx]:.5f} at Epoch {epoch_nums[best_test_loss_idx]}')
    print(f'Best Test Error: {test_errors[best_test_error_idx]:.5f} at Epoch {epoch_nums[best_test_error_idx]}')
    print(f'Average Time per Epoch: {avg_time:.2f} seconds')
