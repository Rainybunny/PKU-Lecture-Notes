import numpy as np
import scipy.ndimage as scimg
from autograd.BaseNode import *
from autograd.BaseGraph import Graph

import mnist
import pickle
from autograd.utils import PermIterator
from util import setseed

def buildGraph(Y: np.ndarray) -> Graph:
    graph = [
        ImgNorm(),
        Conv2d(1, 10, 5, 0), MaxPool2d(), ImgBatchNorm(10), relu(),
        Conv2d(10, 20, 5, 0), MaxPool2d(), ImgBatchNorm(20), relu(),
        Flatten(),
        Linear(320, 128), Dropout(0.2), relu(),
        Linear(128, 128), Dropout(0.2), relu(),
        Linear(128, 64), Dropout(0.2), relu(),
        Linear(64, 10), relu(),
        LogSoftmax(), NLLLoss(Y),
    ]
    return Graph(graph)

wd2 = 0.5
wd1 = 0.1
batchsize = 256
lr = 0.35 / batchsize
epoch = 30

save_path = "model/cnn.npy"

def enhance(X: np.ndarray, Y: np.ndarray, num: int):
    """
    X: (batch, H, W)
    Y: (batch,)
    """
    def perturbate(img, angle, shiftX, shiftY):
        return scimg.shift(scimg.rotate(img, angle=angle, reshape=False), (shiftX, shiftY))

    eX = np.concatenate([X for _ in range(num + 1)], axis=0)
    eY = np.concatenate([Y for _ in range(num + 1)], axis=0)

    for i in range(X.shape[0], eX.shape[0]):
        ang = np.random.uniform(-30, 30)
        sfx = np.random.choice(range(-5, 5 + 1))
        sfy = np.random.choice(range(-5, 5 + 1))
        eX[i] = perturbate(eX[i], ang, sfx, sfy)
    return eX, eY

# import time # only for time inspection

# _start = time.time()
# _record = _start

def training():

    def _tick():
        # global _record
        # _current = time.time()
        # print(f"| {_current - _record:.2f} sec")
        # _record = _current
        print("")

    print("preparing data ", end='')

    setseed(0)
    imgshape = (28, 28)
    trncnt = mnist.trn_X.shape[0]
    X, Y = enhance(mnist.trn_X.reshape(trncnt, *imgshape), mnist.trn_Y, 4)
    X = X.reshape(X.shape[0], -1)

    graph = buildGraph(Y)
    best_train_acc = 0

    _tick()

    print("begin training")

    for i in range(1, epoch+1):
        hatys = []
        ys = []
        losss = []
        graph.train()

        dataloader = PermIterator(X.shape[0], batchsize)
        for perm in dataloader:
            tX = X[perm]
            tY = Y[perm]
            graph[-1].y = tY
            graph.flush()
            pred, loss = graph.forward(tX)[-2:]
            hatys.append(np.argmax(pred, axis=1))
            ys.append(tY)
            graph.backward()
            graph.optimstep(lr, wd1, wd2)
            losss.append(loss)

        loss = np.average(losss)
        acc = np.average(np.concatenate(hatys)==np.concatenate(ys))
        print(f"epoch {i} loss {loss:.3e} acc {acc:.4f} ", end='')
        if acc > best_train_acc:
            best_train_acc = acc
            with open(save_path, "wb") as f:
                pickle.dump(graph, f)
        _tick()

    with open(save_path, "rb") as f:
        graph = pickle.load(f)

    # print(f"finished training in {time.time() - _start} seconds")

    graph.eval()
    graph.flush()

    valX = mnist.val_X
    pred = graph.forward(valX, removelossnode=1)[-1]
    haty = np.argmax(pred, axis=1)
    print("valid acc", np.average(haty==mnist.val_Y))

if __name__ == "__main__":
    training()
    print(f"with hyperparams {lr} {wd2} {wd1}")