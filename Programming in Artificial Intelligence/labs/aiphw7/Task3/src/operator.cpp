#include "tensor.h"
#include "operator.h"
#include "functional.h"
#include <memory>
#include <cuda_runtime.h>

const std::vector<Tensor>& ReLU::parents() const {
    return in;
}

Tensor ReLU::forward(const Tensor& input) {
    if (input.useGrad) {
        in = { input };
    }
    Tensor output(input.shape, input.useGrad, shared_from_this());
    forward_relu(input, output);
    return output;
}

void ReLU::backward(const Tensor& out) {
    backward_relu(in[0], out);
}

Tensor relu(const Tensor& input) {
    return std::make_shared<ReLU>()->forward(input);
}

const std::vector<Tensor>& Sigmoid::parents() const {
    return in;
}

Tensor Sigmoid::forward(const Tensor& input) {
    if (input.useGrad) {
        in = { input };
    }
    Tensor output(input.shape, input.useGrad, shared_from_this());
    forward_sigmoid(input, output);
    return output;
}

void Sigmoid::backward(const Tensor& out) {
    backward_sigmoid(in[0], out);
}

Tensor sigmoid(const Tensor& input) {
    return std::make_shared<Sigmoid>()->forward(input);
}

const std::vector<Tensor>& Linear::parents() const {
    return in;
}

Tensor Linear::forward(const Tensor& input, const Tensor& weights, const Tensor& bias) {
    if (input.useGrad) {
        in = { input, weights, bias };
    }
    shape_t output_shape = { input.shape[0], weights.shape[0] };
    Tensor output(output_shape, input.useGrad, shared_from_this());
    forward_fc(input, output, weights, bias);
    return output;
}

void Linear::backward(const Tensor& out) {
    backward_fc(in[0], out, in[1], in[2]);
}

Tensor linear(const Tensor& input, const Tensor& weights, const Tensor& bias) {
    return std::make_shared<Linear>()->forward(input, weights, bias);
}

const std::vector<Tensor>& Conv2D::parents() const {
    return in;
}

Tensor Conv2D::forward(const Tensor& input, const Tensor& kernel, const Tensor& bias) {
    if (input.useGrad) {
        in = { input, kernel, bias };
    }
    shape_t output_shape = input.shape; // (..., H, W, C_in)
    output_shape.back() = kernel.shape[0];
    Tensor output(output_shape, input.useGrad, shared_from_this());
    forward_conv2d(input, output, kernel, bias);
    return output;
}

void Conv2D::backward(const Tensor& out) {
    backward_conv2d(in[0], out, in[1], in[2]);
}

Tensor conv2d(const Tensor& input, const Tensor& kernel, const Tensor& bias) {
    return std::make_shared<Conv2D>()->forward(input, kernel, bias);
}

const std::vector<Tensor>& MaxPool::parents() const {
    return in;
}

Tensor MaxPool::forward(const Tensor& input, size_t pool_size) {
    if (input.useGrad) {
        in = { input };
        mask = Tensor(input.shape, false);
    } else {
        mask = Tensor(); // empty tensor
    }
    this->pool_size = pool_size;
    shape_t output_shape = input.shape;
    auto it = --output_shape.end(); // [-1] is channel
    --it, *it = (*it + pool_size - 1) / pool_size; // [-2]
    --it, *it = (*it + pool_size - 1) / pool_size; // [-3]
    Tensor output(output_shape, input.useGrad, shared_from_this());
    forward_maxpool(input, output, mask, pool_size);
    return output;
}

void MaxPool::backward(const Tensor& out) {
    backward_maxpool(in[0], out, mask, pool_size);
}

Tensor maxpool(const Tensor& input, size_t pool_size) {
    return std::make_shared<MaxPool>()->forward(input, pool_size);
}

const std::vector<Tensor>& BatchNorm::parents() const {
    return in;
}

Tensor BatchNorm::forward(const Tensor& input, const Tensor& gamma, const Tensor& beta,
                          Tensor& mean, Tensor& var, Tensor& run_mean, Tensor& run_var,
                          float eps, float momentum) {
    if (input.useGrad) {
        in = { input, gamma, beta, mean, var };
    }
    this->eps = eps;
    xhat = Tensor(input.shape, false); // no grad for this; needed in inference too
    Tensor output(input.shape, input.useGrad, shared_from_this());
    forward_batchnorm(input, output, xhat, mean, var, run_mean, run_var,
                      gamma, beta, eps, momentum);
    return output;
}

void BatchNorm::backward(const Tensor& out) {
    backward_batchnorm(in[0], out, xhat, in[3], in[4], in[1], in[2], eps);
}

Tensor batchnorm(const Tensor& input, const Tensor& gamma, const Tensor& beta,
                 Tensor& mean, Tensor& var, Tensor& run_mean, Tensor& run_var,
                 float eps, float momentum) {
    return std::make_shared<BatchNorm>()->forward(input, gamma, beta, mean, var,
                                                  run_mean, run_var, eps, momentum);
}

const std::vector<Tensor>& Dropout::parents() const {
    return in;
}

Tensor Dropout::forward(const Tensor& input, float p) {
    if (p < 0.0f || p >= 1.0f) {
        throw std::runtime_error("dropout probability p must be in [0, 1)");
    }
    if (!input.useGrad || p == 0.0f) {
        return input;
    }

    // if (input.useGrad) {
    in = { input };
    prob = p;
    mask = Tensor(input.shape, false); // no grad for mask
    // } else {
    //     mask = Tensor(); // empty tensor
    // }

    Tensor output(input.shape, input.useGrad, shared_from_this());
    forward_dropout(input, output, mask, p);
    return output;
}

void Dropout::backward(const Tensor& out) {
    backward_dropout(in[0], out, mask, prob);
}

Tensor dropout(const Tensor& input, float p) {
    return std::make_shared<Dropout>()->forward(input, p);
}

const std::vector<Tensor>& SoftmaxCELoss::parents() const {
    return in;
}

/**
 * Output tensor 'pred' is used to store the softmax probabilities.
 */
Tensor SoftmaxCELoss::forward(const Tensor& input, const Tensor& labels, Tensor& pred) {
    if (input.useGrad) {
        in = { input, labels };
    }
    pred_cache = pred;
    Tensor loss(shape_t{ 1 }, input.useGrad, shared_from_this());
    forward_softmax_celoss(input, labels, pred, loss);
    return loss;
}

/**
 * No need output tensor, directly write to in[0].grad
 */
void SoftmaxCELoss::backward(const Tensor& out) {
    float scale = 1.0f;
    if (out.grad) {
        cudaMemcpy(&scale, out.grad.get(), sizeof(float), cudaMemcpyDeviceToHost);
    }
    backward_softmax_celoss(in[0], in[1], pred_cache, scale);
}

Tensor softmaxCELoss(const Tensor& predictions, const Tensor& labels, Tensor& pred) {
    return std::make_shared<SoftmaxCELoss>()->forward(predictions, labels, pred);
}
