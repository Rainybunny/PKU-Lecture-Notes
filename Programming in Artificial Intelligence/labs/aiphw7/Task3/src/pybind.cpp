#include "pybind11/pybind11.h"
#include "pybind11/stl.h"
#include "cudabase.cuh"
#include "tensor.h"
#include "functional.h"
#include "operator.h"
#include <vector>
#include <memory>

namespace py = pybind11;

PYBIND11_MODULE(mytensor, m) {
    py::class_<Tensor>(m, "Tensor")
        .def("use_grad", &Tensor::useGradient)
        .def("shape", &Tensor::getShape)
        .def("size", &Tensor::getSize)
        .def(py::init<>())
        .def(py::init<std::vector<size_t>, bool>())
        .def(py::init<const pybind11::array_t<float>&, bool>())
        .def("uniform", &Tensor::uniform)
        .def("zero_grad", &Tensor::zeroGrad)
        .def("zero_data", &Tensor::zeroData)
        .def("ones_data", &Tensor::onesData)
        .def("from_list", &Tensor::fromVector)
        .def("data_to_list", &Tensor::dataVec)
        .def("grad_to_list", &Tensor::gradVec)
        .def("backward", &Tensor::backward);

    m.def("_sync", &GpuFunc::sync, "Device synchronize");
    m.def("manual_seed", &GpuFunc::manualSeed, "Set RNG seed for mytensor random ops");
    m.def("relu", &relu, "Applies the ReLU activation function");
    m.def("sigmoid", &sigmoid, "Applies the Sigmoid activation function");
    m.def("linear", &linear, "Applies a linear transformation to the incoming data");
    m.def("conv2d", &conv2d, "Applies a 2D convolution over an input signal");
    m.def("maxpool", &maxpool, "Applies a max pooling operation");
    m.def("batchnorm", &batchnorm, "Applies batch normalization in training mode");
    m.def("softmax_celoss", &softmaxCELoss, "Computes the softmax cross-entropy loss");
    m.def("dropout", &dropout, "Applies dropout to a tensor, signature (tensor, probability)");
    m.def("zeros_like", &zerosLike, "Creates a tensor of zeros with the same shape as the input tensor");
    m.def("adam_step", &adamStep, "Performs an Adam optimization step");
    m.def("row_argmax", &rowArgmax, "Computes the indices of the maximum values along each row of the tensor");
    m.def("differ", &differ, "Computes the element-wise difference between two tensors");
    // m.def("batchnorm", &batchnorm, "Applies batch normalization");
    m.def("sum_all", &sumAll, "Sum up all element in vector");
    m.def("_cuda_check", &GpuFunc::cudaCheck, "Check for CUDA errors");
}
