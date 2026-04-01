from typing import List
import numpy as np
from utils import Particle

### 可以在这里写下一些你需要的变量和函数 ###
COLLISION_DISTANCE = 1
WALL_WIDTH = 0.5
MAX_ERROR = 50000

### 可以在这里写下一些你需要的变量和函数 ###

wall_dict = set()

def randf(a, b):
    return np.random.sample() * (b - a) + a

def randn(mu, sgm=1.):
    return mu + np.random.randn() * sgm

def normL2(v):
    return np.sqrt(np.dot(v, v))

def normLoo(v):
    return float(np.max(np.abs(v)))

def wall_check(walls, x, y):
    rx, ry = int(np.floor(x)), int(np.floor(y))
    for s in range(rx, rx + 2):
        for t in range(ry, ry + 2):
            if np.abs(s - x) <= WALL_WIDTH and np.abs(t - y) <= WALL_WIDTH and (s, t) in wall_dict:
                return False
    return True

def reject_sample(walls, generator):
    """
    Generate position (x, y) with the generator, till it's not in wall.
    """
    x, y = 0, 0
    while True:
        x, y = generator()
        if wall_check(walls, x, y): return x, y

def generate_uniform_particles(walls, N):
    """
    输入：
    walls: 维度为(xxx, 2)的np.array, 地图的墙壁信息，具体设定请看README关于地图的部分
    N: int, 采样点数量
    输出：
    particles: List[Particle], 返回在空地上均匀采样出的N个采样点的列表，每个点的权重都是1/N
    """

    X, Y = np.max(walls, axis=0)
    for i in range(walls.shape[0]):
        x, y = walls[i]
        wall_dict.add((x, y))

    all_particles: List[Particle] = []
    for _ in range(N):
        ### 你的代码 ###
        x, y = reject_sample(walls, lambda: (randf(0, X), randf(0, Y)))
        # x, y = randf(0, X), randf(0, Y)
        all_particles.append(Particle(x, y, randf(0, 2 * np.pi), 1 / N))
        ### 你的代码 ###
    return all_particles

def calculate_particle_weight(estimated, gt):
    """
    输入：
    estimated: np.array, 该采样点的距离传感器数据
    gt: np.array, Pacman实际位置的距离传感器数据
    输出：
    weight, float, 该采样点的权重
    """
    ### 你的代码 ###
    K = 0.47
    weight = np.exp(-K * normL2(estimated - gt))
    ### 你的代码 ###
    return weight


step_count = 0

def resample_particles(walls, particles: List[Particle]):
    """
    输入：
    walls: 维度为(xxx, 2)的np.array, 地图的墙壁信息，具体设定请看README关于地图的部分
    particles: List[Particle], 上一次采样得到的粒子，注意是按权重从大到小排列的
    输出：
    particles: List[Particle], 返回重采样后的N个采样点的列表
    """

    N = len(particles)
    resampled_particles: List[Particle] = []
    valid_particles = particles
    M = len(valid_particles)

    ### 你的代码 ###
    wsum = list(map(lambda p: p.weight, valid_particles))
    for i in range(1, M): wsum[i] += wsum[i - 1]

    wpos = []
    for i in range(N): wpos.append(randf(0, wsum[-1]))
    wpos.sort()

    def smooth_param(l, r, k):
        return (1 - k) * l + k * r
    global step_count
    P_SIGMA = smooth_param(0.12, 0.05, step_count / 38)
    A_SIGMA = smooth_param(0.13, 0.4, step_count / 38)
    step_count += 1

    idx = 0
    for w in wpos:
        while wsum[idx] < w: idx += 1
        cx, cy = particles[idx].position
        # x, y = reject_sample(walls, lambda: (randn(cx, 0.1), randn(cy, 0.1)))
        x, y = randn(cx, P_SIGMA), randn(cy, P_SIGMA)
        alp = particles[idx].theta
        resampled_particles.append(Particle(x, y, randn(alp, A_SIGMA), 1 / N))
    ### 你的代码 ###

    return resampled_particles

def apply_state_transition(p: Particle, traveled_distance, dtheta):
    """
    输入：
    p: 采样的粒子
    traveled_distance, dtheta: ground truth的Pacman这一步相对于上一步运动方向改变了dtheta，并移动了traveled_distance的距离
    particle: 按照相同方式进行移动后的粒子
    """
    ### 你的代码 ###
    p.theta += dtheta
    p.position += np.array([np.cos(p.theta), np.sin(p.theta)]) * traveled_distance
    ### 你的代码 ###
    return p

def get_estimate_result(particles: List[Particle]):
    """
    输入：
    particles: List[Particle], 全部采样粒子
    输出：
    final_result: Particle, 最终的猜测结果
    """
    ### 你的代码 ###
    final_result = max(particles, key=lambda p: p.weight)
    ### 你的代码 ###
    return final_result