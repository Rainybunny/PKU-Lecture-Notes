import mnist
from copy import deepcopy
from typing import List
from autograd.BaseGraph import Graph
from autograd.utils import buildgraph
from autograd.BaseNode import *

# 超参数
# TODO: You can change the hyperparameters here
lr = 1e-4   # 学习率
wd1 = 0.01  # L1正则化
wd2 = 0.5  # L2正则化
batchsize = 128
featsize = 784 # vector width for a sample
target = 10

def buildGraph(Y):
    """
    建图
    @param Y: n 样本的label
    @return: Graph类的实例, 建好的图
    """
    def LinearReLUs(dims):
        res = []
        for i in range(len(dims) - 1):
            res.append(Linear(dims[i], dims[i + 1]))
            res.append(relu())
        return res

    graph = [
        *LinearReLUs([featsize, featsize, featsize, featsize // 2,
                      featsize // 4, featsize // 4, featsize // 4, featsize // 4,
                      featsize // 8, featsize // 8, featsize // 8, featsize // 8,
                      featsize // 16, featsize // 16, featsize // 16, featsize // 16]),
        Linear(featsize // 16, target),
        LogSoftmax(dim=1),
        NLLLoss(Y)
    ]
    return Graph(graph)
