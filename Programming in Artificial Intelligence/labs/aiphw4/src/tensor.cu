#include "tensor.h"
#include "cudabase.cuh"

#include <map>
#include <queue>
#include <memory>
#include <vector>
#include <cassert>
#include <optional>
#include <stdexcept>
#include <pybind11/numpy.h>

/* Tensor class */


Tensor::Tensor(): data(nullptr), size(0), offset(0), device(device_t::GPU) {}

Tensor::Tensor(const shape_t& shape, const device_t& device = device_t::GPU)
    : shape(shape), device(device), offset(0) {
    assert(shape.size());
    size = 1;
    for (const auto& dim : shape) size *= dim;
    stride.resize(shape.size());
    stride.back() = 1;
    for (int i = (int)shape.size() - 2; ~i; --i) {
        stride[i] = stride[i + 1] * shape[i + 1];
    }

    if (device == device_t::CPU) {
        throw std::runtime_error("CPU tensor not implemented");
    } else {
        float* dptr = nullptr;
        cudaMalloc(&dptr, size * sizeof(float));
        // cudaMemset(dptr, 0, size * sizeof(float)); // should be safe even without memset
        data = std::shared_ptr<float[]>(dptr, cudaFree);
    }
}

Tensor::~Tensor() {
    data.reset();
}

Tensor::Tensor(const Tensor& other) : data(other.data),
    shape(other.shape), stride(other.stride), size(other.size), offset(other.offset),
    device(other.device) {}

Tensor::Tensor(const pybind11::array_t<float>& array, const device_t& device = device_t::GPU)
    : device(device), offset(0) {
    shape_t array_shape((size_t)array.ndim());
    for (ssize_t i = 0; i < array.ndim(); ++i) array_shape[i] = (size_t)array.shape(i);
    shape = array_shape, size = 1;
    for (const auto& dim : shape) size *= dim;
    stride.resize(shape.size());
    stride.back() = 1;
    for (int i = (int)shape.size() - 2; ~i; --i) {
        stride[i] = stride[i + 1] * shape[i + 1];
    }
    if (device == device_t::CPU) {
        throw std::runtime_error("CPU tensor not implemented");
    } else {
        float* dptr = nullptr;
        cudaMalloc(&dptr, size * sizeof(float));
        data = std::shared_ptr<float[]>(dptr, cudaFree);
        cudaMemcpy(data.get(), array.data(), size * sizeof(float), cudaMemcpyHostToDevice);
    }
}

shape_t Tensor::getShape() const { return shape; }

shape_t Tensor::getStride() const { return stride; }

size_t Tensor::getSize() const { return size; }

size_t Tensor::getOffset() const { return offset; }

device_t Tensor::getDevice() const { return device; }

Tensor Tensor::fromVector(const std::vector<float>& vec) {
    if (vec.size() != size) {
        throw std::runtime_error("Vector size does not match tensor size");
    }
    // if (device == device_t::CPU) { // impossible in current implementation
    //     std::copy(vec.data(), vec.data() + size, data.get());
    // } else {
        cudaMemcpy(data.get(), vec.data(), size * sizeof(float), cudaMemcpyHostToDevice);
    // }
    return *this;
}

std::vector<float> Tensor::dataVec() const {
    std::vector<float> vec(size);
    // if (device == device_t::CPU) {
    //     std::copy(data.get(), data.get() + size, vec.begin());
    // } else {
        cudaMemcpy(vec.data(), data.get(), size * sizeof(float), cudaMemcpyDeviceToHost);
    // }
    return vec;
}

Tensor Tensor::cpu() const {
    throw std::runtime_error("CPU tensor not implemented");
    // if (device == device_t::CPU) return *this;
    // Tensor result(shape, device_t::CPU);
    // cudaMemcpy(result.data.get(), data.get(), size * sizeof(float), cudaMemcpyDeviceToHost);
    // return result;
}

Tensor Tensor::gpu() const {
    if (device == device_t::GPU) return *this;
    Tensor result(shape, device_t::GPU); // impossible, but for consistency
    cudaMemcpy(result.data.get(), data.get(), size * sizeof(float), cudaMemcpyHostToDevice);
    return result;
}