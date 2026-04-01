#include "pybind11/pybind11.h"
#include "pybind11/stl.h"
#include "tensor.h"
#include "functional.h"

namespace py = pybind11;

PYBIND11_MODULE(mytensor, m) {
    py::enum_<device_t>(m, "device_t")
        .value("CPU", device_t::CPU)
        .value("GPU", device_t::GPU);

    py::class_<Tensor>(m, "Tensor")
        .def("shape", &Tensor::getShape)
        .def("stride", &Tensor::getStride)
        .def("size", &Tensor::getSize)
        .def("offset", &Tensor::getOffset)
        .def("device", &Tensor::getDevice)
        .def(py::init<>())
        .def(py::init<const std::vector<size_t>&, const device_t&>())
        .def(py::init<const Tensor&>())
        .def(py::init<const pybind11::array_t<float>&, const device_t&>())
        .def("from_list", &Tensor::fromVector)
        .def("to_list", &Tensor::dataVec)
        .def("cpu", &Tensor::cpu)
        .def("gpu", &Tensor::gpu);

    m.def("forward_relu", &forward_relu,
        "Apply ReLU forward (in-place into Y)");
    m.def("backward_relu", &backward_relu,
        "Compute ReLU backward: dX <- backward_relu(X, Y, dY)");

    m.def("forward_sigmoid", &forward_sigmoid,
        "Apply Sigmoid forward");
    m.def("backward_sigmoid", &backward_sigmoid,
        "Compute Sigmoid backward");

    m.def("forward_fc", &forward_fc,
        "Fully-connected forward");
    m.def("backward_fc", &backward_fc,
        "Fully-connected backward (dX, dW, db)");

    m.def("forward_conv2d", &forward_conv2d,
        "2D convolution forward");
    m.def("backward_conv2d", &backward_conv2d,
        "2D convolution backward (dX, dK, db)");

    m.def("forward_maxpool", &forward_maxpool,
        "MaxPool forward (returns Y and mask M)");
    m.def("backward_maxpool", &backward_maxpool,
        "MaxPool backward");

    m.def("forward_softmax", &forward_softmax,
        "Softmax forward");

    m.def("forward_celoss", &forward_celoss,
        "Cross-entropy loss forward (takes P, L, writes loss tensor)");
    m.def("backward_softmax_celoss", &backward_softmax_celoss,
        "Backprop for softmax + cross-entropy (writes dP)");
}
