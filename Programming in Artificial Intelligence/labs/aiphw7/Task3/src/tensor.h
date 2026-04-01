#pragma once

#include <memory>
#include <vector>
#include <cassert>
#include <string>
#include <stdexcept>
#include <pybind11/numpy.h>

enum class device_t { CPU, GPU };
typedef std::vector<size_t> shape_t;

/* Base Function class */

struct Tensor; // forward declaration
struct Function; // full definition provided after Tensor to resolve circular dependency

/* Tensor class */

/**
 * For simplicity, we only implement float32 tensor on GPU device
 */

struct Tensor {
    std::shared_ptr<float[]> data, grad;
    shape_t shape;
    size_t size;
    bool useGrad;
    std::shared_ptr<Function> creator;

    Tensor();
    Tensor(shape_t shape, bool useGrad);
    Tensor(shape_t shape, bool useGrad, std::shared_ptr<Function> creator);
    ~Tensor();
    Tensor(const pybind11::array_t<float>& array, bool useGrad);

    bool useGradient() const;
    shape_t getShape() const;
    size_t getSize() const;
    size_t signature() const;
    Tensor fromVector(const std::vector<float>& vec);
    void uniform(float bound);
    void setGrad(float scale);
    void zeroData();
    void onesData();
    void zeroGrad();
    void backward(float scale);
    std::vector<float> dataVec() const;
    std::vector<float> gradVec() const;
};

struct Function {
    const std::string name;
    Function(const std::string& name): name(name) {}
    virtual Tensor forward(const Tensor&) {
        throw std::runtime_error("forward(input) not implemented");
    }
    virtual Tensor forward(const Tensor&, const Tensor&) {
        throw std::runtime_error("forward(input,tensor) not implemented");
    }
    virtual Tensor forward(const Tensor&, const Tensor&, const Tensor&) {
        throw std::runtime_error("forward(input,tensor1,tensor2) not implemented");
    }
    virtual Tensor forward(const Tensor&, const Tensor&, const Tensor&,
                           Tensor&, Tensor&, Tensor&, Tensor&, float, float) {
        throw std::runtime_error("forward(input,tensor1..6,float,float) not implemented");
    }
    virtual Tensor forward(const Tensor&, const Tensor&, Tensor&) {
        throw std::runtime_error("forward(input,tensor,intermediate_tensor) not implemented");
    }
    virtual Tensor forward(const Tensor&, size_t) {
        throw std::runtime_error("forward(input,size) not implemented");
    }
    virtual void backward(const Tensor&) {
        throw std::runtime_error("Not implemented");
    }
    virtual const std::vector<Tensor>& parents() const {
        throw std::runtime_error("Not implemented");
    }
    virtual ~Function() = default;
};