from typing import List
import math
import numpy as np
import numpy as np
from .Init import * 

def shape(X):
    if isinstance(X, np.ndarray):
        ret = "ndarray"
        if np.any(np.isposinf(X)):
            ret += "_posinf"
        if np.any(np.isneginf(X)):
            ret += "_neginf"
        if np.any(np.isnan(X)):
            ret += "_nan"
        return f" {X.shape} "
    if isinstance(X, int):
        return "int"
    if isinstance(X, float):
        ret = "float"
        if np.any(np.isposinf(X)):
            ret += "_posinf"
        if np.any(np.isneginf(X)):
            ret += "_neginf"
        if np.any(np.isnan(X)):
            ret += "_nan"
        return ret
    else:
        raise NotImplementedError(f"unsupported type {type(X)}")

class Node(object):
    def __init__(self, name, *params):
        self.grad = [] # 节点的梯度，self.grad[i]对应self.params[i]在反向传播时的梯度
        self.cache = [] # 节点保存的临时数据
        self.name = name # 节点的名字
        self.params = list(params) # 用于Linear节点中存储weight和bias参数使用

    def num_params(self):
        return len(self.params)

    def cal(self, X):
        '''
        计算函数值。请在其子类中完成具体实现。
        '''
        pass

    def backcal(self, grad):
        '''
        计算梯度。请在其子类中完成具体实现。
        '''
        pass

    def flush(self):
        '''
        初始化或刷新节点内部数据，包括梯度和缓存
        '''
        self.grad = []
        self.cache = []

    def forward(self, X, debug=False):
        '''
        正向传播。输入X，输出正向传播的计算结果。
        '''
        if debug:
            print(self.name, shape(X))
        ret = self.cal(X)
        if debug:
            print(shape(ret))
        return ret

    def backward(self, grad, debug=False):
        '''
        反向传播。输入grad（该grad为反向传播到该节点的梯度），输出反向传播到下一层的梯度。
        '''
        if debug:
            print(self.name, shape(grad))
        ret = self.backcal(grad)
        if debug:
            print(shape(ret))
        return ret
    
    def eval(self):
        pass

    def train(self):
        pass


class relu(Node):
    # input X: (*)，即可能是任意维度
    # output relu(X): (*)
    def __init__(self):
        super().__init__("relu")

    def cal(self, X):
        self.cache.append(X)
        return np.clip(X, 0, None)

    def backcal(self, grad):
        return np.multiply(grad, self.cache[-1] > 0) 


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

class sigmoid(Node):
    # input X: (*)，即可能是任意维度
    # output sigmoid(X): (*)
    def __init__(self):
        super().__init__("sigmoid")

    def cal(self, X):
        # MYCODE
        self.cache.append(X)
        return safeSigmoid(X)

    def backcal(self, grad):
        # MYCODE
        tmp = safeSigmoid(self.cache[-1])
        return grad * tmp * (1 - tmp)


class tanh(Node):
    # input X: (*)，即可能是任意维度
    # output tanh(X): (*)
    def __init__(self):
        super().__init__("tanh")

    def cal(self, X):
        ret = np.tanh(X)
        self.cache.append(ret)
        return ret


    def backcal(self, grad):
        return np.multiply(grad, np.multiply(1+self.cache[-1], 1-self.cache[-1]))


class Linear(Node):
    # input X: (*,d1)
    # param weight: (d1, d2)
    # param bias: (d2)
    # output Linear(X): (*, d2)
    def __init__(self, indim, outdim):
        """
        初始化
        @param indim: 输入维度
        @param outdim: 输出维度
        """
        weight = kaiming_uniform(indim, outdim)
        bias = zeros(outdim)
        super().__init__("linear", weight, bias)

    def cal(self, X):
        # MYCODE
        self.cache.append(X)
        # print(shape(self.params[0]), shape(X))
        return X @ self.params[0] + self.params[1]

    def backcal(self, grad):
        '''
        需要保存weight和bias的梯度，可以参考Node类和BatchNorm类
        '''
        # MYCODE
        X = self.cache[-1]
        self.grad.append(X.T @ grad)
        self.grad.append(grad.sum(axis=0))
        return grad @ self.params[0].T


class StdScaler(Node):
    '''
    input shape (*)
    output (*)
    '''
    EPS = 1e-3
    def __init__(self, mean, std):
        super().__init__("StdScaler")
        self.mean = mean
        self.std = std

    def cal(self, X):
        X = X.copy()
        X -= self.mean
        X /= (self.std + self.EPS)
        return X

    def backcal(self, grad):
        return grad/ (self.std + self.EPS)
    


class BatchNorm(Node):
    '''
    input shape (*)
    output (*)
    '''
    EPS = 1e-8
    def __init__(self, indim, momentum: float = 0.9):
        super().__init__("batchnorm", ones((indim)), zeros(indim))
        self.momentum = momentum
        self.mean = None
        self.std = None
        self.updatemean = True
        self.indim = indim

    def cal(self, X):
        if self.updatemean:
            tmean, tstd = np.mean(X, axis=0, keepdims=True), np.std(X, axis=0, keepdims=True)
            if self.mean is None or self.std is None:
                self.mean = tmean
                self.std = tstd
            else:
                self.mean *= self.momentum
                self.mean += (1-self.momentum) * tmean
                self.std *= self.momentum
                self.std += (1-self.momentum) * tstd
        X = X.copy()
        X -= self.mean
        X /= (self.std + self.EPS)
        self.cache.append(X.copy())
        X *= self.params[0]
        X += self.params[1]
        return X

    def backcal(self, grad):
        X = self.cache[-1]
        self.grad.append(np.multiply(X, grad).reshape(-1, self.indim).sum(axis=0))
        self.grad.append(grad.reshape(-1, self.indim).sum(axis=0))
        return (grad*self.params[0])/ (self.std + self.EPS)
    
    def eval(self):
        self.updatemean = False

    def train(self):
        self.updatemean = True

class ImgBatchNorm(Node):
    EPS = 1e-8

    def __init__(self, inc, momentum = 0.9):
        super().__init__("imgbatchnorm", ones(inc), zeros(inc))
        self.momentum = momentum
        self.mean = None
        self.std = None
        self.updatemean = True
        self.inc = inc

    def cal(self, X: np.ndarray):
        """
        input: (batch, channel, H, W)
        output: (batch, channel, H, W)
        """
        if self.updatemean:
            # compute statistic data for each channels
            mu = np.mean(X, axis=(0, 2, 3))
            sigma = np.std(X, axis=(0, 2, 3))
            if self.mean is None:
                self.mean = mu
                self.std = sigma
            else:
                self.mean = self.momentum * self.mean + (1 - self.momentum) * mu
                self.std = self.momentum * self.std + (1 - self.momentum) * sigma

        # f = (x - mean) / (sigma + eps) * alpha + beta
        res = (X - self.mean.reshape(1, -1, 1, 1)) / (self.std.reshape(1, -1, 1, 1) + self.EPS)
        self.cache.append(res)
        return res * self.params[0].reshape(1, -1, 1, 1) + self.params[1].reshape(1, -1, 1, 1)

    def backcal(self, grad: np.ndarray):
        Xn: np.ndarray = self.cache[-1]
        self.grad.append((Xn * grad).sum(axis=(0, 2, 3)))
        self.grad.append(grad.sum(axis=(0, 2, 3)))
        return (grad * self.params[0].reshape(1, -1, 1, 1)) / (
            (self.std + self.EPS).reshape(1, -1, 1, 1)
        )

    def train(self):
        self.updatemean = True

    def eval(self):
        self.updatemean = False

class Dropout(Node):
    '''
    input shape (*)
    output (*)
    '''
    def __init__(self, p: float = 0.1):
        super().__init__("dropout")
        assert 0<=p<=1, "p 是dropout 概率，必须在[0, 1]中"
        self.p = p
        self.dropout = True

    def cal(self, X):
        if self.dropout:
            X = X.copy()
            mask = np.random.rand(*X.shape) < self.p
            np.putmask(X, mask, 0)
            X = X * (1/(1-self.p))
            self.cache.append(mask)
        return X
    
    def backcal(self, grad):
        if self.dropout:
            grad = grad.copy()
            np.putmask(grad, self.cache[-1], 0)
            grad = grad * (1/(1-self.p))
        return grad
    
    def eval(self):
        self.dropout=False

    def train(self):
        self.dropout=True


class Softmax(Node):
    # input X: (*)
    # output softmax(X): (*), softmax at 'dim'
    def __init__(self, dim=-1):
        super().__init__("softmax")
        self.dim = dim

    def cal(self, X):
        X = X - np.max(X, axis=self.dim, keepdims=True)
        expX = np.exp(X)
        ret = expX / expX.sum(axis=self.dim, keepdims=True)
        self.cache.append(ret)
        return ret

    def backcal(self, grad):
        softmaxX = self.cache[-1]
        grad_p = np.multiply(grad, softmaxX)
        return grad_p - np.multiply(grad_p.sum(axis=self.dim, keepdims=True), softmaxX)


def safeLogSoftmax(ary, axis=-1):
    tmp = ary - np.max(ary, axis=axis, keepdims=True)
    return tmp - np.log(np.exp(tmp).sum(axis=axis, keepdims=True))

class LogSoftmax(Node):
    # input X: (*)
    # output logsoftmax(X): (*), logsoftmax at 'dim'
    def __init__(self, dim=-1):
        super().__init__("logsoftmax")
        self.dim = dim

    def cal(self, X):
        self.cache.append(X)
        return safeLogSoftmax(X, axis=self.dim)

    def backcal(self, grad):
        X = self.cache[-1]
        mx = X.max(axis=self.dim, keepdims=True)
        deno = np.exp(X - mx).sum(axis=self.dim, keepdims=True)
        # ans[i] = g[i] - e^{x[i]-mx}/deno * gsum
        return grad - np.exp(X - mx) / deno * grad.sum(axis=self.dim, keepdims=True)



class NLLLoss(Node):
    '''
    negative log-likelihood 损失函数
    '''
    # shape X: (*, d), y: (*)
    # shape value: number 
    # 输入：X: (*) 个预测，每个预测是个d维向量，代表d个类别上分别的log概率。  y：(*) 个整数类别标签
    # 输出：NLL损失
    def __init__(self, y):
        """
        初始化
        @param y: n 样本的label
        """
        super().__init__("NLLLoss")
        self.y = y

    def cal(self, X):
        y = self.y
        self.cache.append(X)
        return - np.sum(
            np.take_along_axis(X, np.expand_dims(y, axis=-1), axis=-1))

    def backcal(self, grad):
        X, y = self.cache[-1], self.y
        ret = np.zeros_like(X)
        np.put_along_axis(ret, np.expand_dims(y, axis=-1), -1, axis=-1)
        return grad * ret



class CrossEntropyLoss(Node):
    '''
    多分类交叉熵损失函数，不同于课上讲的二分类。它与NLLLoss的区别仅在于后者输入log概率，前者输入概率。
    '''
    # shape X: (*, d), y: (*)
    # shape value: number 
    # 输入：X: (*) 个预测，每个预测是个d维向量，代表d个类别上分别的概率。  y：(*) 个整数类别标签
    # 输出：交叉熵损失

    def __init__(self, y):
        """
        初始化
        @param y: n 样本的label
        """
        super().__init__("CELoss")
        self.y = y

    def cal(self, X):
        # MYCOD
        y = self.y
        self.cache.append(X)
        return -np.sum(np.log(np.take_along_axis(X, np.expand_dims(y, axis=-1), axis=-1)))

    def backcal(self, grad):
        # MYCODE
        X, y = self.cache[-1], self.y
        ret = np.zeros_like(X)
        hot = np.take_along_axis(X, np.expand_dims(y, axis=-1), axis=-1)
        np.put_along_axis(ret, np.expand_dims(y, axis=-1), -1 / hot, axis=-1)
        return grad * ret

class Conv2d(Node):
    def __init__(self, inc: int, outc: int, kers: int, pads: int = -1):
        self.inc = inc
        self.outc = outc
        self.kers = kers
        if pads == -1: pads = (kers - 1) // 2
        self.pads = pads

        norm = np.sqrt(1 / (inc * kers * kers))
        kern = np.random.randn(outc, inc, kers, kers) * norm
        bias = np.zeros(outc)
        super().__init__("conv2d", kern, bias)

    def cal(self, X: np.ndarray):
        """
        input: (batch, inc, H, W)
        output: (batch, outc, H+2*pads-kers+1, W+2*pads-kers+1)
        """
        batch, inc, inH, inW = X.shape
        assert inc == self.inc, "Input channels do not match the initialized value."
        outH = inH + 2 * self.pads - self.kers + 1
        outW = inW + 2 * self.pads - self.kers + 1

        Xp = np.pad(X, [(0, 0), (0, 0), (self.pads, self.pads), (self.pads, self.pads)])
        self.cache.append(Xp)

        res = np.empty((batch, self.outc, outH, outW))

        for i in range(outH):
            for j in range(outW):
                windows = Xp[:, :, i : i + self.kers, j : j + self.kers]
                res[:, :, i, j] = np.tensordot(
                    windows, self.params[0], axes=([1, 2, 3], [1, 2, 3])
                )

        res += self.params[1][None, :, None, None]
        return res

    def backcal(self, grad: np.ndarray):
        Xp = self.cache[-1]
        _, _, outH, outW = grad.shape

        gkern = np.zeros_like(self.params[0])

        for i in range(outH):
            for j in range(outW):
                windows = Xp[:, :, i : i + self.kers, j : j + self.kers]
                gkern += np.tensordot(
                    grad[:, :, i, j], windows, axes=([0], [0])
                )

        self.grad.append(gkern)
        self.grad.append(grad.sum(axis=(0, 2, 3)))

        gbak = np.zeros_like(Xp)
        for i in range(outH):
            for j in range(outW):
                gbak[:, :, i : i + self.kers, j : j + self.kers] += np.tensordot(
                    grad[:, :, i, j], self.params[0], axes=([1], [0])
                )
        if self.pads > 0:
            gbak = gbak[:, :, self.pads : -self.pads, self.pads : -self.pads]

        return gbak

class MaxPool2d(Node):
    def __init__(self):
        super().__init__("maxpool2d")
    
    def cal(self, X: np.ndarray):
        """
        input: (batch, channel, 2H, 2W)
        output: (batch, channel, H, W)
        """
        batch, channel, inH, inW = X.shape
        assert inH % 2 == 0 and inW % 2 == 0, f"(*, {inH}, {inW}) tensors not supported."

        self.cache.append(X)
        outH, outW = inH // 2, inW // 2
        return X.reshape(batch, channel, outH, 2, outW, 2).max(axis=(3, 5))

    def backcal(self, grad: np.ndarray):
        batch, channel, outH, outW = grad.shape
        X = self.cache[-1]
        Xr = X.reshape(batch, channel, outH, 2, outW, 2)
        max_mask = (Xr == Xr.max(axis=(3, 5), keepdims=True))
        grad_expanded = grad[:, :, :, None, :, None]
        res = (max_mask * grad_expanded).reshape(batch, channel, outH * 2, outW * 2)
        return res

class Flatten(Node):
    def __init__(self):
        super().__init__("flatten")

    def cal(self, X: np.ndarray):
        self.cache.append(X)
        return X.reshape(X.shape[0], -1)
    
    def backcal(self, grad: np.ndarray):
        return grad.reshape(self.cache[-1].shape)

class ImgNorm(Node):
    def __init__(self):
        super().__init__("imgnorm")

    def cal(self, X: np.ndarray):
        return X.reshape(X.shape[0], 1, 28, 28) / 256
    
    def backcal(self, grad: np.ndarray):
        return grad.reshape(grad.shape[0], -1) / 256

class ImgReshape(Node):
    def __init__(self):
        super().__init__("imgreshape")

    def cal(self, X: np.ndarray):
        return X.reshape(-1, 1, 28, 28)

    def backcal(self, grad: np.ndarray):
        return grad.reshape(-1, 28 * 28)

class ImgStdNorm(Node):
    EPS = 1e-8

    def __init__(self):
        super().__init__("imgstdnorm")

    def cal(self, X: np.ndarray):
        return (
            (X - X.mean(axis=1, keepdims=True)) / (X.std(axis=1, keepdims=True) + self.EPS)
        ).reshape(-1, 1, 28, 28)

    def backcal(self, grad: np.ndarray):
        """
        This node is designed ONLY for image initialization.
        So don't bother to calculate grad here.
        """
        return None