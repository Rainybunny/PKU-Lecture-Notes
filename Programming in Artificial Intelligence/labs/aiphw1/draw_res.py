import matplotlib.pyplot as plt
import numpy as np

x = list(range(10))
y = [66.700, 68.300, 51.800, 55.700, 60.700, 33.500, 71.600, 71.700, 86.900, 67.200]
y0 = 63.410

plt.figure(figsize=(10, 6))
plt.ylim(0, 100)
plt.plot(x, y, marker='o', linestyle='-', color='b', label='Class-wise Accuracy')
plt.xticks(x)
plt.axhline(y=y0, color='r', linestyle='--', label='Overall Accuracy')

# mark accurate data for each class and overall accuracy
for i in range(len(x)):
    plt.text(x[i], y[i] + 1, f'{y[i]:.2f}%', ha='center', va='bottom', fontsize=9)
plt.text(9, y0 + 1, f'{y0:.2f}%', ha='right', va='bottom', fontsize=9, color='r')

plt.xlabel('Class')
plt.ylabel('Accuracy (%)')
plt.title('Class-wise and Overall Accuracy')
plt.legend()
plt.grid()
plt.savefig('class_overall_accuracy.png')