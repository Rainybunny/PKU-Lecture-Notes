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

namespace {

static cudaStream_t kAllocStream = 0; // default stream

inline void dev_malloc(float** p, size_t bytes) {
    cudaMallocAsync(reinterpret_cast<void**>(p), bytes, kAllocStream);
}
inline void dev_free(float* p) {
    if (p) cudaFreeAsync(p, kAllocStream);
}
inline void dev_memset(float* p, int value, size_t bytes) {
    cudaMemsetAsync(p, value, bytes, kAllocStream);
}
inline void dev_memcpy_h2d(float* dst, const float* src, size_t bytes) {
    cudaMemcpyAsync(dst, src, bytes, cudaMemcpyHostToDevice, kAllocStream);
}

} // namespace

/* Tensor class */

Tensor::Tensor(): data(nullptr), grad(nullptr), shape(),
                  size(0), useGrad(false), creator() {}

Tensor::Tensor(shape_t shape, bool useGrad)
    : Tensor(shape, useGrad, nullptr) {}

Tensor::Tensor(shape_t shape, bool useGrad, std::shared_ptr<Function> creator)
    : shape(shape), useGrad(useGrad), creator(creator) {
    assert(shape.size());
    size = 1;
    for (auto dim : shape) size *= dim;

    float* dptr = nullptr;
    dev_malloc(&dptr, size * sizeof(float));
    dev_memset(dptr, 0, size * sizeof(float));
    data = std::shared_ptr<float[]>(dptr, [](float* p) { dev_free(p); });

    if (!useGrad) grad = nullptr;
    else {
        float* gptr = nullptr;
        dev_malloc(&gptr, size * sizeof(float));
        dev_memset(gptr, 0, size * sizeof(float));
        grad = std::shared_ptr<float[]>(gptr, [](float* p) { dev_free(p); });
    }
}

Tensor::~Tensor() {
    data.reset(), grad.reset(), creator.reset();
}

Tensor::Tensor(const pybind11::array_t<float>& array, bool useGrad)
    : shape(), size(0), useGrad(useGrad), creator(nullptr) {
    shape_t array_shape((size_t)array.ndim());
    for (ssize_t i = 0; i < array.ndim(); ++i) array_shape[i] = (size_t)array.shape(i);
    shape = array_shape; size = 1;
    for (const auto& dim : shape) size *= dim;

    float* dptr = nullptr;
    dev_malloc(&dptr, size * sizeof(float));
    data = std::shared_ptr<float[]>(dptr, [](float* p) { dev_free(p); });
    dev_memcpy_h2d(data.get(), array.data(), size * sizeof(float));

    if (!this->useGrad) grad = nullptr;
    else {
        float* gptr = nullptr;
        dev_malloc(&gptr, size * sizeof(float));
        dev_memset(gptr, 0, size * sizeof(float));
        grad = std::shared_ptr<float[]>(gptr, [](float* p) { dev_free(p); });
    }
}

bool Tensor::useGradient() const { return useGrad; }

shape_t Tensor::getShape() const { return shape; }

size_t Tensor::getSize() const { return size; }

Tensor Tensor::fromVector(const std::vector<float>& vec) {
    if (vec.size() != size) {
        throw std::runtime_error("Vector size does not match tensor size");
    }
    dev_memcpy_h2d(data.get(), vec.data(), size * sizeof(float));
    if (useGrad) {
        dev_memset(grad.get(), 0, size * sizeof(float));
    }
    return *this;
}

std::vector<float> Tensor::dataVec() const {
    std::vector<float> vec(size);
    cudaMemcpy(vec.data(), data.get(), size * sizeof(float), cudaMemcpyDeviceToHost);
    // fprintf(stderr, "Copy! size: %zu, first val: %f\n", size, vec[0]);
    return vec;
}

std::vector<float> Tensor::gradVec() const {
    assert(useGrad);
    std::vector<float> vec(size);
    cudaMemcpy(vec.data(), grad.get(), size * sizeof(float), cudaMemcpyDeviceToHost);
    return vec;
}

/**
 * @brief Generate a signature for the tensor based on its data pointer
 * This function is used to uniquely identify the tensor instance in auto-differentiation.
 * Since we don't implement slice/permute operations, all possible views on X is just X itself,
 * so it's sufficient to use the data pointer as the signature.
 */
size_t Tensor::signature() const {
    return (size_t)data.get();
}

void Tensor::uniform(float bound) {
    GpuFunc::uniformSample(data.get(), size, bound);
}

void Tensor::zeroData() {
    cudaMemset(data.get(), 0, sizeof(float) * size);
}

void Tensor::onesData() {
    GpuFunc::setVals(data.get(), size, 1.0f);
}

/**
 * @brief Set the gradient of the tensor to zero
 * It's optimizer's responsibility to call this function before a new backward pass.
 */
void Tensor::zeroGrad() {
    assert(useGrad);
    cudaMemset(grad.get(), 0, sizeof(float) * size);
}

void Tensor::setGrad(float scale) {
    assert(useGrad);
    GpuFunc::setVals(grad.get(), size, scale);
}

void Tensor::backward(float scale) {
    assert(useGrad);
    // oneGrad();
    setGrad(scale);

    size_t node = 1;
    std::map<size_t, int> indeg;
    std::vector<Tensor> topo;

    topo.emplace_back(*this); // use topo simply as a stack in this loop
    while (topo.size()) {
        auto out = topo.back(); topo.pop_back();
        for (const auto &in : out.creator->parents()) {
            if (!in.useGrad || !in.creator) continue;
            size_t sig = in.signature();
            if (!indeg[sig]++) topo.push_back(in), ++node;
        }
    }

    size_t head = 0;
    topo.reserve(node), topo.emplace_back(*this);
    while (head < topo.size()) {
        const auto &out = topo[head++];
        for (const auto &in : out.creator->parents()) {
            if (!in.useGrad || !in.creator) continue;
            size_t sig = in.signature();
            if (!--indeg[sig]) topo.push_back(in);
        }
    }
    
    for (const auto &tensor : topo) {
        tensor.creator->backward(tensor);
        // here we can destroy the creator (and thus the intermediate tensors)
        cudaError_t err = cudaGetLastError();
        if (err != cudaSuccess) {
            fprintf(stderr, "PANIC: CUDA error in backward. %s\n", cudaGetErrorString(err));
            fprintf(stderr, "creator: %s\n", tensor.creator->name.c_str());
            fprintf(stderr, "tensor shape:");
            for (const auto& dim : tensor.shape) {
                fprintf(stderr, " %zu", dim);
            }
            fprintf(stderr, "\n");
            throw std::runtime_error("CUDA error in backward");
        }
    }
}
