import numpy as np

# 超参数
# TODO: You can change the hyperparameters here
# (0.111, 0.5) 我怀疑这是不那么合理但足够凑巧的参数组合...
lr = 0.111  # 学习率
wd = 0.5  # l2正则化项系数

def predict(X, weight, bias):
    """
    使用输入的weight和bias，预测样本X是否为数字0。
    @param X: (n, d) 每行是一个输入样本。n: 样本数量, d: 样本的维度
    @param weight: (d,)
    @param bias: (1,)
    @return: (n,) 线性模型的输出，即wx+b
    """
    # MYCODE
    return X @ weight + bias

def sigmoid(x):
    return 1 / (np.exp(-x) + 1)

def signSplit(ary):
    msk = ary >= 0
    return msk, ary[msk], ary[~msk]

def safeSigmoid(ary):
    msk, pos, neg = signSplit(ary)
    res = np.empty_like(ary)
    res[msk] = 1 / (1 + np.exp(-pos))
    tmp = np.exp(neg)
    res[~msk] = tmp / (tmp + 1)
    return res

def safeLogExp(ary):
    msk, pos, neg = signSplit(ary)
    res = np.empty_like(ary)
    res[msk] = pos + np.log(1 + np.exp(-pos))
    res[~msk] = np.log(1 + np.exp(neg))
    return res

def step(X, weight, bias, Y):
    """
    单步训练, 进行一次forward、backward和参数更新
    @param X: (n, d) 每行是一个训练样本。 n: 样本数量， d: 样本的维度
    @param weight: (d,)
    @param bias: (1,)
    @param Y: (n,) 样本的label, 1表示为数字0, -1表示不为数字0
    @return:
        haty: (n,) 模型的输出, 为正表示数字为0, 为负表示数字不为0
        loss: (1,) 由交叉熵损失函数计算得到
        weight: (d,) 更新后的weight参数
        bias: (1,) 更新后的bias参数
    """
    # MYCODE
    n = X.shape[0]
    haty = predict(X, weight, bias)

    dify = Y * haty
    loss = safeLogExp(-dify).sum() / n
    pvec = (1 - safeSigmoid(dify)) * Y
    partw = -(pvec @ X) / n + 2 * wd * weight
    partb = -pvec.sum() / n
    weight -= lr * partw
    bias -= lr * partb

    return haty, loss, weight, bias
