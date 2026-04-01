from numpy.random import rand
import mnist
from answerTree import *
import numpy as np

# 超参数
# TODO: You can change the hyperparameters here
num_tree = 20    # 树的数量
ratio_data = 0.5  # 采样的数据比例
ratio_feat = 0.8 # 采样的特征比例
hyperparams = {
    "depth":6, 
    "purity_bound":0.712,
    "gainfunc": negginiDA
} # 每颗树的超参数

def buildtrees(X, Y):
    """
    构建随机森林
    @param X: n*d, 每行是一个输入样本。 n: 样本数量， d: 样本的维度
    @param Y: n, 样本的label
    @return: List of DecisionTrees, 随机森林
    """
    # MYCODE

    n, d = X.shape
    trees: list[Node] = []
    for i in range(num_tree):
        # print(f"training tree #{i}")
        idxD = np.random.choice(n, int(np.ceil(n * ratio_data)), False)
        idxF = np.random.choice(d, int(np.ceil(d * ratio_feat)), False)
        trees.append(buildTree(X[idxD], Y[idxD], list(idxF), **hyperparams))
    return trees

def infertrees(trees, X):
    """
    随机森林预测
    @param trees: 随机森林
    @param X: n*d, 每行是一个输入样本。 n: 样本数量， d: 样本的维度
    @return: n, 预测的label
    """
    pred = [inferTree(tree, X)  for tree in trees]
    pred = list(filter(lambda x: not np.isnan(x), pred))
    upred, ucnt = np.unique(pred, return_counts=True)
    return upred[np.argmax(ucnt)]
