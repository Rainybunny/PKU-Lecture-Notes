#pragma once

#include <memory>
#include <vector>
#include <cassert>
#include <pybind11/numpy.h>

enum class device_t { CPU, GPU };
typedef std::vector<size_t> shape_t;

/* Tensor class */

struct Tensor {
    std::shared_ptr<float[]> data;
    shape_t shape, stride;
    size_t size, offset;
    device_t device;

    Tensor();
    Tensor(const shape_t& shape, const device_t& device);
    ~Tensor();
    Tensor(const Tensor& other);
    Tensor(const pybind11::array_t<float>& array, const device_t& device);

    shape_t getShape() const;
    shape_t getStride() const;
    size_t getSize() const;
    size_t getOffset() const;
    device_t getDevice() const;
    Tensor fromVector(const std::vector<float>& vec);
    std::vector<float> dataVec() const;
    Tensor cpu() const;
    Tensor gpu() const;
};