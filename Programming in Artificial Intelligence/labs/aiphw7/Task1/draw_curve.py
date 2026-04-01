import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from scipy import signal

# 创建图形和坐标轴
plt.figure(figsize=(12, 8))

# 定义颜色和线型
colors = ['b', 'g', 'r', 'c', 'm', 'y', 'k', 'orange']
line_styles = ['-', '--', '-.', ':', '-']
markers = ['o', 's', '^', 'D', 'v']

# 定义平滑函数（使用Savitzky-Golay滤波器）
def smooth_data(y, window_length=30, polyorder=2):
    """使用Savitzky-Golay滤波器平滑数据"""
    if len(y) < window_length:
        return y
    return signal.savgol_filter(y, window_length, polyorder)

# 读取并处理每个CSV文件
file_names = ['result/loss5.csv', 'result/loss6.csv',
              'result/loss7.csv', 'result/loss8.csv',
              'result/loss9.csv', 'result/loss95.csv',
              'result/loss97.csv', 'result/loss99.csv']
labels = ['momentum=0.5', 'momentum=0.6', 'momentum=0.7', 'momentum=0.8', 'momentum=0.9',
          'momentum=0.95', 'momentum=0.97', 'momentum=0.99']  # 可根据实际情况修改

for i, file in enumerate(file_names):
    try:
        # 读取CSV文件
        df = pd.read_csv(file)
        
        # 确保数据按步骤排序
        df = df.sort_values('Step')
        
        # 提取步骤和损失值
        steps = df['Step'].values
        values = df['Value'].values
        
        # 平滑处理数据
        smoothed_values = smooth_data(values, window_length=min(100, len(values)//3))
        
        # 绘制曲线
        plt.plot(steps, smoothed_values, 
                 color=colors[i % len(colors)],
                 linestyle=line_styles[i % len(line_styles)],
                 linewidth=2,
                #  marker=markers[i % len(markers)],
                #  markevery=max(1, len(steps)//20),  # 每隔一定距离添加标记点
                #  markersize=6,
                 label=labels[i])
        
        # 可选：添加原始数据的半透明背景线以显示数据波动
        plt.plot(steps, values, color=colors[i % len(colors)], alpha=0.2, linewidth=0.5)
        
    except Exception as e:
        print(f"处理文件 {file} 时出错: {e}")

# 设置图表标题和坐标轴标签
plt.title('loss curves with different momentums', fontsize=16, pad=20)
plt.xlabel('epoch', fontsize=12)
plt.ylabel('loss', fontsize=12)

# 设置坐标轴范围
plt.xlim(left=0)
# 自动调整Y轴范围以显示所有数据

# 添加网格
plt.grid(True, linestyle='--', alpha=0.7)

# 添加图例
plt.legend(loc='best', fontsize=10, frameon=True, shadow=True)

# 优化布局
plt.tight_layout()

# 保存图像（高分辨率）
plt.savefig('comparison_loss_curves.png', dpi=300, bbox_inches='tight')

# 显示图像
# plt.show()