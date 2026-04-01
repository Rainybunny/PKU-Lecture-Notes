#ifndef TENSOR_CUH
#define TENSOR_CUH

#include "cudabase.cuh"

#include <map>
#include <queue>
#include <memory>
#include <vector>
#include <cassert>
#include <optional>
#include <stdexcept>

enum class device_t { CPU, GPU };
typedef std::vector<size_t> shape_t;

/* Function base class */

DataType struct Function;
DataType struct Tensor;

template<typename data_t>
struct Function {
    const std::string name;
    Function(const std::string& name): name(name) {}
    virtual Tensor<data_t> forward(const Tensor<data_t>& input) {
        throw std::runtime_error("Not implemented");
    }
    virtual void backward(const Tensor<data_t>& grad_output) const {
        throw std::runtime_error("Not implemented");
    }
    virtual const std::vector<Tensor<data_t>>& parents() const {
        throw std::runtime_error("Not implemented");
    }
    virtual ~Function() = default;
};

DataType
struct Copy : public Function<data_t> {
    std::vector<Tensor<data_t>> in;
    Copy() : Function<data_t>("Copy", 1) {}

    Tensor<data_t> forward(const Tensor<data_t>& input) override {
        in[0] = input;
        Tensor<data_t> output(input.shape, input.device, input.useGrad, *this);
        if (input.device == device_t::CPU) {
            std::copy(input.data.get(), input.data.get() + input.size, output.data.get());
        } else {
            cudaMemcpy(output.data.get(), input.data.get(), input.size * sizeof(data_t),
                       cudaMemcpyDeviceToDevice);
        }
        return output;
    }

    void backward(const Tensor<data_t>& out) const override {
        auto out_grad = out.grad.get();
        auto in_grad = in[0].grad.get();
        if (in[0].device == device_t::CPU) {
            for (size_t i = 0; i < out.size; ++i) {
                in_grad[i] += out_grad[i];
            }
        } else {
            GpuFunc::addEq KERNEL_SET(out.size) (in_grad, out_grad, out.size);
        }
    }
};

/* Tensor class */

template<typename data_t>
struct Tensor {
    using dtype = data_t;
    std::shared_ptr<dtype[]> data, grad;
    shape_t shape, stride;
    size_t size, offset;
    device_t device; // remove const
    bool useGrad;    // remove const
    std::shared_ptr<Function<dtype>> creator; // remove const
    // Maybe Function

    Tensor(): data(nullptr), grad(nullptr), size(0), offset(0),
              device(device_t::CPU), useGrad(false), creator(nullptr) {}
    Tensor(const std::vector<size_t>& shape, const device_t& device = device_t::CPU,
           const bool& useGrad = false, std::shared_ptr<Function<dtype>> creator = nullptr)
        : shape(shape), device(device), grad(nullptr), offset(0),
          useGrad(useGrad), creator(useGrad ? creator : nullptr) {
        assert(shape.size());
        size = 1;
        for (const auto& dim : shape) size *= dim;
        stride.resize(shape.size());
        stride.back() = 1;
        for (int i = (int)shape.size() - 2; ~i; --i) {
            stride[i] = stride[i + 1] * shape[i + 1];
        }

        if (device == device_t::CPU) {
            data = std::shared_ptr<dtype[]>(new dtype[size], [](dtype* p) { delete[] p; });
            if (useGrad) {
                grad = std::shared_ptr<dtype[]>(new dtype[size], [](dtype* p) { delete[] p; });
            }
        } else {
            dtype* dptr = nullptr;
            auto err = cudaMalloc(&dptr, size * sizeof(dtype));
            if (err != cudaSuccess) throw std::runtime_error("CUDA malloc failed");
            data = std::shared_ptr<dtype[]>(dptr, cudaFree);
            if (useGrad) {
                dtype* gptr = nullptr;
                err = cudaMalloc(&gptr, size * sizeof(dtype));
                if (err != cudaSuccess) throw std::runtime_error("CUDA malloc failed");
                grad = std::shared_ptr<dtype[]>(gptr, cudaFree);
            }
        }
    }
    ~Tensor() {
        data.reset();
        grad.reset();
        creator.reset();
    }
    Tensor(const Tensor<dtype>& other) : data(other.data), grad(other.grad),
        shape(other.shape), stride(other.stride), size(other.size), offset(other.offset),
        device(other.device), useGrad(other.useGrad), creator(other.creator) {}
    Tensor<dtype>& operator = (const Tensor<dtype>& other) = default;

    size_t featureAddress() const {
        return (size_t)data.get();
    }

    Tensor<dtype> fromVector(const std::vector<dtype>& vec) {
        if (vec.size() != size) {
            throw std::runtime_error("Vector size does not match tensor size");
        }
        if (device == device_t::CPU) {
            std::copy(vec.begin(), vec.end(), data.get());
        } else {
            cudaMemcpy(data.get(), vec.data(), size * sizeof(dtype), cudaMemcpyHostToDevice);
        }
        return *this;
    }

    std::vector<dtype> dataVec() const {
        std::vector<dtype> vec(size);
        if (device == device_t::CPU) {
            std::copy(data.get(), data.get() + size, vec.begin());
        } else {
            cudaMemcpy(vec.data(), data.get(), size * sizeof(dtype), cudaMemcpyDeviceToHost);
        }
        return vec;
    }

    std::vector<dtype> gradVec() const {
        if (!useGrad) throw std::runtime_error("Gradient not enabled for this tensor");
        std::vector<dtype> vec(size);
        if (device == device_t::CPU) {
            std::copy(grad.get(), grad.get() + size, vec.begin());
        } else {
            cudaMemcpy(vec.data(), grad.get(), size * sizeof(dtype), cudaMemcpyDeviceToHost);
        }
        return vec;
    }

    Tensor<data_t> copy() const {
        return Copy<data_t>().forward(*this);
    }

    Tensor<data_t> cpu() const {
        if (device == device_t::CPU) return *this;
        Tensor result(shape, device_t::CPU, useGrad, creator);
        cudaMemcpy(result.data.get(), data.get(), size * sizeof(dtype), cudaMemcpyDeviceToHost);
        if (useGrad) {
            cudaMemcpy(result.grad.get(), grad.get(), size * sizeof(dtype),
                       cudaMemcpyDeviceToHost);
        }
        return result;
    }

    Tensor<data_t> gpu() const {
        if (device == device_t::GPU) return *this;
        Tensor result(shape, device_t::GPU, useGrad, creator);
        cudaMemcpy(result.data.get(), data.get(), size * sizeof(dtype), cudaMemcpyHostToDevice);
        if (useGrad) {
            cudaMemcpy(result.grad.get(), grad.get(), size * sizeof(dtype),
                       cudaMemcpyHostToDevice);
        }
        return result;
    }

    void backward(bool destroy = true) {
        if (!useGrad) return ;
        if (device == device_t::CPU) {
            std::fill(grad.get(), grad.get() + size, 1);
        } else {
            GpuFunc::setOnes KERNEL_SET(size) (grad.get(), size);
        }
        if (!creator) return ;

        size_t node = 1;
        std::map<size_t, int> indeg;
        std::vector<Tensor<dtype>> topo;

        topo.emplace_back(*this);
        while (topo.size()) {
            auto out = topo.back(); topo.pop_back();
            for (const auto& in : out.creator->parents()) {
                if (!in.useGrad || !in.creator) continue;
                if (!indeg[in.featureAddress()]++) topo.emplace_back(in), ++node;
            }
        }

        size_t head = 0;
        topo.reserve(node), topo.emplace_back(*this);
        while (head < topo.size()) {
            for (const auto& in : topo[head].creator->parents()) {
                if (!in.useGrad || !in.creator) continue;
                if (!--indeg[in.featureAddress()]) topo.emplace_back(in);
            }
            ++head;
        }

        /* do backpropagate */
        for (const auto& ts : topo) {
            ts.creator->backward(ts);
        }

        /* free memory for creators and temporary tensors */
        if (destroy) {
            for (auto& ts : topo) {
                ts.creator.reset();
            }
        }
    }
};

#endif // TENSOR_CUH