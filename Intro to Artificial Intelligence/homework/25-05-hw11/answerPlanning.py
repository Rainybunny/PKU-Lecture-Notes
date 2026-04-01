import numpy as np
from typing import List
from utils import TreeNode
from simuScene import PlanningMap

### 定义一些你需要的变量和函数 ###
STEP_DISTANCE = 0.8
TARGET_THREHOLD = 0.25

### 定义一些你需要的变量和函数 ###


class RRT:
    def __init__(self, walls) -> None:
        """
        输入包括地图信息，你需要按顺序吃掉的一列事物位置 
        注意：只有按顺序吃掉上一个食物之后才能吃下一个食物，在吃掉上一个食物之前Pacman经过之后的食物也不会被吃掉
        """
        self.map = PlanningMap(walls)
        self.walls = walls
        # 其他需要的变量
        ### 你的代码 ###      
        self.X, self.Y = np.max(walls, axis=0)
        ### 你的代码 ###
        
        # 如有必要，此行可删除
        self.path = None

    def valid_ray(self, pa, pb):
        inter, _ = self.map.checkline(pa.tolist(), pb.tolist())
        return not inter

    def find_path(self, current_position, next_food):
        """
        在程序初始化时，以及每当 pacman 吃到一个食物时，主程序会调用此函数
        current_position: pacman 当前的仿真位置
        next_food: 下一个食物的位置
        
        本函数的默认实现是调用 build_tree，并记录生成的 path 信息。你可以在此函数增加其他需要的功能
        """
        
        ### 你的代码 ###      

        ### 你的代码 ###
        # 如有必要，此行可删除
        self.path = self.build_tree(current_position, next_food)
        self.idx = 1 # ignore the start point
        self.cnt = 0
        
        
    def get_target(self, current_position, current_velocity):
        """
        主程序将在每个仿真步内调用此函数，并用返回的位置计算 PD 控制力来驱动 pacman 移动
        current_position: pacman 当前的仿真位置
        current_velocity: pacman 当前的仿真速度
        一种可能的实现策略是，仅作为参考：
        （1）记录该函数的调用次数
        （2）假设当前 path 中每个节点需要作为目标 n 次
        （3）记录目前已经执行到当前 path 的第几个节点，以及它的执行次数，如果超过 n，则将目标改为下一节点
        
        你也可以考虑根据当前位置与 path 中节点位置的距离来决定如何选择 target
        
        同时需要注意，仿真中的 pacman 并不能准确到达 path 中的节点。你可能需要考虑在什么情况下重新规划 path
        """
        ### 你的代码 ###
        N = 10
        if self.idx + 1 < len(self.path) and self.valid_ray(current_position,
                                                            self.path[self.idx + 1]):
            self.cnt = 0
            self.idx += 1
        self.cnt += 1
        if self.cnt > N:
            # print(f"replanning!")
            self.find_path(current_position, self.path[-1])
        return self.path[self.idx]
        ### 你的代码 ###

    def simplize(self, path):
        res = [path[0]]
        i, n = 0, len(path)
        while (i + 1 < n):
            for j in range(n - 1, i, -1):
                if self.valid_ray(path[i], path[j]):
                    res.append(path[j])
                    i = j
                    break
        return res

    ### 以下是RRT中一些可能用到的函数框架，全部可以修改，当然你也可以自己实现 ###
    def build_tree(self, start, goal):
        """
        实现你的快速探索搜索树，输入为当前目标食物的编号，规划从 start 位置食物到 goal 位置的路径
        返回一个包含坐标的列表，为这条路径上的pd targets
        你可以调用find_nearest_point和connect_a_to_b两个函数
        另外self.map的checkoccupy和checkline也可能会需要，可以参考simuScene.py中的PlanningMap类查看它们的用法
        """
        # print(f"planning {start} to {goal}")
        path = []
        graphS: list[TreeNode] = [TreeNode(-1, start[0], start[1])]
        graphT: list[TreeNode] = [TreeNode(-1, goal[0], goal[1])]
        finish = False
        ### 你的代码 ###
        P_GOAL = 0.4
        while not finish:
            if np.random.choice([0, 1]):
                P, Q = graphS, graphT
            else:
                P, Q = graphT, graphS

            target = Q[0].pos
            if np.random.sample() < P_GOAL: sample = target
            else:
                sample = np.array([np.random.sample() * self.X,
                                   np.random.sample() * self.Y])
            idx, _ = self.find_nearest_point(sample, P)
            valid, newpos = self.connect_a_to_b(P[idx].pos, sample)
            if not valid: continue

            P.append(TreeNode(idx, newpos[0], newpos[1]))

            idx, _ = self.find_nearest_point(sample, Q)
            valid, newoth = self.connect_a_to_b(Q[idx].pos, newpos)
            if not valid: continue
            Q.append(TreeNode(idx, newoth[0], newoth[1]))
            if self.valid_ray(newpos, newoth):
            # if self.valid_ray(newpos, target):
            #     finish = True
                break

        id = len(graphS) - 1
        while id != -1:
            path.append(graphS[id].pos)
            id = graphS[id].parent_idx
        path.reverse()
        id = len(graphT) - 1
        while id != -1:
            path.append(graphT[id].pos)
            id = graphT[id].parent_idx
        
        ### 你的代码 ###
        path = self.simplize(path)
        # print(f"path = {path}")
        return path

    @staticmethod
    def find_nearest_point(point, graph):
        """
        找到图中离目标位置最近的节点，返回该节点的编号和到目标位置距离、
        输入：
        point：维度为(2,)的np.array, 目标位置
        graph: List[TreeNode]节点列表
        输出：
        nearest_idx, nearest_distance 离目标位置距离最近节点的编号和距离
        """
        nearest_idx = -1
        nearest_distance = 10000000.
        ### 你的代码 ###
        for i, node in enumerate(graph):
            d = np.linalg.norm(node.pos - point)
            if d < nearest_distance:
                nearest_idx, nearest_distance = i, d
        ### 你的代码 ###
        return nearest_idx, nearest_distance
    
    def connect_a_to_b(self, point_a, point_b):
        """
        以A点为起点，沿着A到B的方向前进STEP_DISTANCE的距离，并用self.map.checkline函数检查这段路程是否可以通过
        输入：
        point_a, point_b: 维度为(2,)的np.array，A点和B点位置，注意是从A向B方向前进
        输出：
        is_empty: bool，True表示从A出发前进STEP_DISTANCE这段距离上没有障碍物
        newpoint: 从A点出发向B点方向前进STEP_DISTANCE距离后的新位置，如果is_empty为真，之后的代码需要把这个新位置添加到图中
        """
        is_empty = False
        newpoint = np.zeros(2)
        ### 你的代码 ###
        vec = point_b - point_a
        vec = vec / np.linalg.norm(vec) * STEP_DISTANCE
        newpoint = point_a + vec
        is_empty = self.valid_ray(point_a, newpoint)
        ### 你的代码 ###
        return is_empty, newpoint
