"""
本文件我们给出一个基本完善的Tensor类
你可以将hw5的对应代码复制到这里
"""

import numpy as np
from typing import List, Optional, Tuple, Union
from device import cpu, Device
from basic_operator import Op, Value


class Tensor(Value):
    def __init__(
        self,
        array,
        *,
        device: Optional[Device] = None,
        dtype=None,
        requires_grad=True,
        **kwargs
    ):
        if isinstance(array, Tensor):
            if device is None:
                device = array.device
            if dtype is None:
                dtype = array.dtype
            if device == array.device and dtype == array.dtype:
                cached_data = array.realize_cached_data()
            else:
                cached_data = Tensor._array_from_numpy(
                    array.numpy(), device=device, dtype=dtype
                )
        else:
            device = device if device else cpu()
            cached_data = Tensor._array_from_numpy(array, device=device, dtype=dtype)

        self._init(
            None,
            [],
            cached_data=cached_data,
            requires_grad=requires_grad,
        )

    @staticmethod
    def _array_from_numpy(numpy_array, device, dtype):
        return np.array(numpy_array, dtype=dtype)

    @staticmethod
    def make_from_op(op: Op, inputs: List["Value"]):
        tensor = Tensor.__new__(Tensor)
        tensor._init(op, inputs)
        if not tensor.requires_grad:
            return tensor.detach()
        tensor.realize_cached_data()
        return tensor

    @staticmethod
    def make_const(data, requires_grad=False):
        tensor = Tensor.__new__(Tensor)
        tensor._init(
            None,
            [],
            cached_data=data
            if not isinstance(data, Tensor)
            else data.realize_cached_data(),
            requires_grad=requires_grad,
        )
        return tensor

    @property
    def data(self):
        return self.detach()

    @data.setter
    def data(self, value):
        assert isinstance(value, Tensor)
        assert value.dtype == self.dtype, "%s %s" % (
            value.dtype,
            self.dtype,
        )
        self.cached_data = value.realize_cached_data()

    def detach(self):
        return Tensor.make_const(self.realize_cached_data())

    @property
    def shape(self):
        return self.realize_cached_data().shape

    @property
    def dtype(self):
        return self.realize_cached_data().dtype

    @property
    def device(self):
        return cpu()


    def backward(self, out_grad=None):
        raise NotImplementedError()
        

    def __repr__(self):
        return "Tensor(" + str(self.realize_cached_data()) + ")"

    def __str__(self):
        return self.realize_cached_data().__str__()

    def numpy(self):
        data = self.realize_cached_data()

        return data


    def __add__(self, other):
        if isinstance(other, Tensor):
            return EWiseAdd()(self, other)
        else:
            return AddScalar(other)(self)

    def __mul__(self, other):
        if isinstance(other, Tensor):
            return EWiseMul()(self, other)
        else:
            return MulScalar(other)(self)

    def __pow__(self, other):
        if isinstance(other, Tensor):
            return EWisePow()(self, other)
        else:
            return PowerScalar(other)(self)

    def __sub__(self, other):
        if isinstance(other, Tensor):
            return EWiseAdd()(self, Negate()(other))
        else:
            return AddScalar(-other)(self)

    def __truediv__(self, other):
        if isinstance(other, Tensor):
            return EWiseDiv()(self, other)
        else:
            return DivScalar(other)(self)

    def __matmul__(self, other):
        return MatMul()(self, other)

    def matmul(self, other):
        return MatMul()(self, other)

    def sum(self, axes=None):
        return Summation(axes)(self)

    def broadcast_to(self, shape):
        return BroadcastTo(shape)(self)

    def reshape(self, shape):
        return Reshape(shape)(self)

    def __neg__(self):
        return Negate()(self)

    def transpose(self, axes=None):
        return Transpose(axes)(self)

    __radd__ = __add__
    __rmul__ = __mul__
    __rsub__ = __sub__
    __rmatmul__ = __matmul__

class TensorOp(Op):
    def __call__(self, *args):
        tensor_cls = type(args[0])
        return tensor_cls.make_from_op(self, args)


class EWiseAdd(TensorOp):
    def compute(self, a: np.ndarray, b: np.ndarray):
        return a + b

    def gradient(self, out_grad: Tensor, node: Tensor):
        return out_grad, out_grad


def add(a, b):
    return EWiseAdd()(a, b)


class AddScalar(TensorOp):
    def __init__(self, scalar):
        self.scalar = scalar

    def compute(self, a: np.ndarray):
        return a + self.scalar

    def gradient(self, out_grad: Tensor, node: Tensor):
        return out_grad


def add_scalar(a, scalar):
    return AddScalar(scalar)(a)


class EWiseMul(TensorOp):
    def compute(self, a: np.ndarray, b: np.ndarray):
        return a * b

    def gradient(self, out_grad: Tensor, node: Tensor):
        lhs, rhs = node.inputs
        return out_grad * rhs, out_grad * lhs


def multiply(a, b):
    return EWiseMul()(a, b)


class MulScalar(TensorOp):
    def __init__(self, scalar):
        self.scalar = scalar

    def compute(self, a: np.ndarray):
        return a * self.scalar

    def gradient(self, out_grad: Tensor, node: Tensor):
        return (out_grad * self.scalar,)


def mul_scalar(a, scalar):
    return MulScalar(scalar)(a)


class PowerScalar(TensorOp):
    """逐点乘方，用标量做指数"""

    def __init__(self, scalar: int):
        self.scalar = scalar

    def compute(self, a: np.ndarray) -> np.ndarray:
        ## 请于此填写你的代码
        return a ** self.scalar
        

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        return out_grad * self.scalar * (node.inputs[0] ** (self.scalar - 1))
        


def power_scalar(a, scalar):
    return PowerScalar(scalar)(a)


class EWisePow(TensorOp):
    """逐点乘方"""

    def compute(self, a: np.ndarray, b: np.ndarray) -> np.ndarray:
        return a**b

    def gradient(self, out_grad, node):
        if not isinstance(node.inputs[0], Tensor) or not isinstance(
            node.inputs[1], Tensor
        ):
            raise ValueError("Both inputs must be tensors.")

        a, b = node.inputs[0], node.inputs[1]
        grad_a = out_grad * b * (a ** (b - 1))
        grad_b = out_grad * (a**b) * log(a)
        return grad_a, grad_b

def power(a, b):
    return EWisePow()(a, b)


class EWiseDiv(TensorOp):
    """逐点相除"""

    def compute(self, a, b):
        ## 请于此填写你的代码
        return a / b
        

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        a, b = node.inputs[0], node.inputs[1]
        grad_a = out_grad / b
        grad_b = -out_grad * a / (b ** 2)
        return grad_a, grad_b
        


def divide(a, b):
    return EWiseDiv()(a, b)


class DivScalar(TensorOp):
    def __init__(self, scalar):
        self.scalar = scalar

    def compute(self, a):
        ## 请于此填写你的代码
        return a / self.scalar

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        return out_grad / self.scalar
        


def divide_scalar(a, scalar):
    return DivScalar(scalar)(a)


class Transpose(TensorOp):
    def __init__(self, axes: Optional[tuple] = None):
        self.axes = axes

    def compute(self, a):
        ## 请于此填写你的代码
        axes = self.axes if self.axes is not None else (a.ndim - 2, a.ndim - 1)
        perm = list(range(len(a.shape)))
        perm[axes[0]], perm[axes[1]] = perm[axes[1]], perm[axes[0]]
        return np.transpose(a, perm)
        

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        return out_grad.transpose(self.axes)


def transpose(a, axes=None):
    return Transpose(axes)(a)


class Reshape(TensorOp):
    def __init__(self, shape):
        self.shape = shape

    def compute(self, a):
        ## 请于此填写你的代码
        return a.reshape(self.shape)
        

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        return out_grad.reshape(node.inputs[0].shape)
        


def reshape(a, shape):
    return Reshape(shape)(a)


class BroadcastTo(TensorOp):
    def __init__(self, shape):
        self.shape = shape

    def compute(self, a):
        ## 请于此填写你的代码
        return np.broadcast_to(a, self.shape)
        

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        in_shape = node.inputs[0].shape
        out_shape = out_grad.shape
        axes = []
        for i in range(len(out_shape)):
            if i >= len(in_shape) or in_shape[i] == 1:
                axes.append(i)
        return out_grad.sum(axes=tuple(axes)).reshape(in_shape)


def broadcast_to(a, shape):
    return BroadcastTo(shape)(a)


class Summation(TensorOp):
    def __init__(self, axes: Optional[tuple] = None):
        self.axes = axes

    def compute(self, a):
        ## 请于此填写你的代码
        return np.sum(a, axis=self.axes)


    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        in_shape = node.inputs[0].shape
        if self.axes is None:
            reshape_shape = tuple(1 for _ in in_shape)
        else:
            axes = self.axes if isinstance(self.axes, tuple) else (self.axes,)
            reshape_shape = list(in_shape)
            for axis in axes:
                reshape_shape[axis] = 1
            reshape_shape = tuple(reshape_shape)
        return out_grad.reshape(reshape_shape).broadcast_to(in_shape)
        


def summation(a, axes=None):
    return Summation(axes)(a)


class MatMul(TensorOp):
    def compute(self, a, b):
        ## 请于此填写你的代码
        return a @ b

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        a, b = node.inputs
        grad_a = out_grad @ b.transpose()
        grad_b = a.transpose() @ out_grad
        return grad_a, grad_b


def matmul(a, b):
    return MatMul()(a, b)


class Negate(TensorOp):
    def compute(self, a):
        ## 请于此填写你的代码
        return -a
        

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        return -out_grad
        


def negate(a):
    return Negate()(a)


class Log(TensorOp):
    def compute(self, a):
        ## 请于此填写你的代码
        return np.log(a)
        

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        a = node.inputs[0]
        return out_grad / a
        


def log(a):
    return Log()(a)


class Exp(TensorOp):
    def compute(self, a):
        ## 请于此填写你的代码
        return np.exp(a)
        

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        a = node.inputs[0]
        return out_grad * exp(a)
        


def exp(a):
    return Exp()(a)


class ReLU(TensorOp):
    def compute(self, a):
        ## 请于此填写你的代码
        return np.maximum(0, a)
        

    def gradient(self, out_grad, node):
        ## 请于此填写你的代码
        a = node.inputs[0]
        mask_np = np.where(a.numpy() > 0, 1.0, 0.0)
        mask = Tensor.make_const(mask_np, requires_grad=False)
        return out_grad * mask


def relu(a):
    return ReLU()(a)
