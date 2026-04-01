#pragma once

#include "tensor.h"
#include "functional.h"

struct ReLU : public Function, public std::enable_shared_from_this<ReLU> {
    std::vector<Tensor> in;
    ReLU(): Function("ReLU") {}
    Tensor forward(const Tensor& input) override;
    void backward(const Tensor& out) override;
    const std::vector<Tensor>& parents() const override;
};
Tensor relu(const Tensor& input);

struct Sigmoid : public Function, public std::enable_shared_from_this<Sigmoid> {
    std::vector<Tensor> in;
    Sigmoid(): Function("Sigmoid") {}
    Tensor forward(const Tensor& input) override;
    void backward(const Tensor& out) override;
    const std::vector<Tensor>& parents() const override;
};
Tensor sigmoid(const Tensor& input);

struct Linear : public Function, public std::enable_shared_from_this<Linear> {
    std::vector<Tensor> in;
    Linear(): Function("Linear") {}
    Tensor forward(const Tensor& input, const Tensor& weights, const Tensor& bias) override;
    void backward(const Tensor& out) override;
    const std::vector<Tensor>& parents() const override;
};
Tensor linear(const Tensor& input, const Tensor& weights, const Tensor& bias);

struct Conv2D : public Function, public std::enable_shared_from_this<Conv2D> {
    std::vector<Tensor> in;
    Conv2D(): Function("Conv2D") {}
    Tensor forward(const Tensor& input, const Tensor& kernel, const Tensor& bias) override;
    void backward(const Tensor& out) override;
    const std::vector<Tensor>& parents() const override;
};
Tensor conv2d(const Tensor& input, const Tensor& kernel, const Tensor& bias);

struct MaxPool : public Function, public std::enable_shared_from_this<MaxPool> {
    std::vector<Tensor> in;
    Tensor mask; // to store mask of max indices
    size_t pool_size;
    MaxPool(): Function("MaxPool") {}
    Tensor forward(const Tensor& input, size_t pool_size);
    void backward(const Tensor& out) override;
    const std::vector<Tensor>& parents() const override;
};
Tensor maxpool(const Tensor& input, size_t pool_size);

struct BatchNorm : public Function, public std::enable_shared_from_this<BatchNorm> {
    std::vector<Tensor> in;
    Tensor xhat;
    float eps;
    BatchNorm(): Function("BatchNorm") {}
    Tensor forward(const Tensor& input, const Tensor& gamma, const Tensor& beta,
                   Tensor& mean, Tensor& var, Tensor& run_mean, Tensor& run_var,
                   float eps, float momentum);
    void backward(const Tensor& out) override;
    const std::vector<Tensor>& parents() const override;
};
Tensor batchnorm(const Tensor& input, const Tensor& gamma, const Tensor& beta,
                 Tensor& mean, Tensor& var, Tensor& run_mean, Tensor& run_var,
                 float eps, float momentum);

struct Dropout : public Function, public std::enable_shared_from_this<Dropout> {
    std::vector<Tensor> in;
    Tensor mask; // store sampled mask for backward
    float prob;
    Dropout(): Function("Dropout"), prob(0.0f) {}
    Tensor forward(const Tensor& input, float p);
    void backward(const Tensor& out) override;
    const std::vector<Tensor>& parents() const override;
};
Tensor dropout(const Tensor& input, float p);

struct SoftmaxCELoss : public Function, public std::enable_shared_from_this<SoftmaxCELoss> {
    std::vector<Tensor> in;
    Tensor pred_cache;
    SoftmaxCELoss(): Function("SoftmaxCELoss") {}
    Tensor forward(const Tensor& input, const Tensor& labels, Tensor& pred) override;
    void backward(const Tensor& out) override;
    const std::vector<Tensor>& parents() const override;
};
Tensor softmaxCELoss(const Tensor& input, const Tensor& labels, Tensor& pred);
