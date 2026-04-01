#pragma once

#include "tensor.h"

void forward_relu(const Tensor& X, Tensor& Y);

void backward_relu(Tensor& X, const Tensor& Y);

void forward_sigmoid(const Tensor& X, Tensor& Y);

void backward_sigmoid(Tensor& X, const Tensor& Y);

void forward_fc(const Tensor& X, Tensor& Y, const Tensor& W, const Tensor& b);

void backward_fc(Tensor& X, const Tensor& Y, Tensor& W, Tensor& b);

/**
 * @brief (zero-padding) & (square kernel with odd width) 2D convolution layer
 * @param X shape=(..., H, W, C_in)
 * @param Ker shape=(C_out, C_in, K, K)
 * @param b shape=(C_out)
 * @return shape=(..., H, W, C_out)
 */
void forward_conv2d(const Tensor& X, Tensor& Y, const Tensor& Ker, const Tensor& b);

void backward_conv2d(Tensor& X, const Tensor& Y, Tensor& Ker, Tensor& b);

void forward_maxpool(const Tensor& X, Tensor& Y, Tensor& M, int K);

void backward_maxpool(Tensor& X, const Tensor& Y, const Tensor& M, int K);

void forward_batchnorm(const Tensor& X, Tensor& Y, Tensor& Xhat,
                       Tensor& mean, Tensor& var, Tensor& run_mean, Tensor& run_var,
                       const Tensor& gamma, const Tensor& beta, float eps, float momentum);

void backward_batchnorm(Tensor& X, const Tensor& Y, const Tensor& Xhat,
                        const Tensor& mean, const Tensor& var,
                        Tensor& gamma, Tensor& beta, float eps);

/* Dropout */
void forward_dropout(const Tensor& X, Tensor& Y, Tensor& mask, float p);

void backward_dropout(Tensor& X, const Tensor& Y, const Tensor& mask, float p);

void forward_softmax(const Tensor& X, Tensor& Y);

void forward_celoss(const Tensor& P, const Tensor& L, Tensor& loss);

void forward_softmax_celoss(const Tensor& X, const Tensor& L, Tensor& pred, Tensor& loss);

void backward_softmax_celoss(Tensor& P, const Tensor& L);

// Backward for softmax+CE using cached softmax probabilities pred.
// Writes gradient into X.grad (X is logits). `scale` is the upstream scalar (loss.grad[0]).
void backward_softmax_celoss(Tensor& X, const Tensor& L, const Tensor& pred, float scale);

Tensor zerosLike(const Tensor& src, bool useGrad);

void adamStep(Tensor& W, Tensor& m, Tensor& v,
              float lr, float beta1, float beta2, float eps, float weight_decay, int t);

Tensor rowArgmax(const Tensor& input);

Tensor differ(const Tensor& A, const Tensor& B);

float sumAll(const Tensor& input);
