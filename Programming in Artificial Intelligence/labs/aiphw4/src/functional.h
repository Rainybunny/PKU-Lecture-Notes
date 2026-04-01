#pragma once

#include "tensor.h"

void forward_relu(const Tensor& X, Tensor& Y);

void backward_relu(const Tensor& X, const Tensor& Y, const Tensor& dY, Tensor& dX);

void forward_sigmoid(const Tensor& X, Tensor& Y);

void backward_sigmoid(const Tensor& X, const Tensor& Y, const Tensor& dY, Tensor& dX);

void forward_fc(const Tensor& X, Tensor& Y, const Tensor& W, const Tensor& b);

void backward_fc(const Tensor& X, const Tensor& Y, const Tensor& W, const Tensor& b,
                 const Tensor& dY, Tensor& dX, Tensor& dW, Tensor& db);

/**
 * @brief (zero-padding) & (square kernel with odd width) 2D convolution layer
 * @param X shape=(..., C_in, H, W)
 * @param Ker shape=(C_out, C_in, K, K)
 * @param b shape=(C_out)
 * @return shape=(..., C_out, H, W)
 */
void forward_conv2d(const Tensor& X, Tensor& Y, const Tensor& Ker, const Tensor& b);

void backward_conv2d(const Tensor& X, const Tensor& Y, const Tensor& Ker, const Tensor& b,
                     const Tensor& dY, Tensor& dX, Tensor& dK, Tensor& db);

void forward_maxpool(const Tensor& X, Tensor& Y, Tensor& M, int K);

void backward_maxpool(const Tensor& X, const Tensor& Y, const Tensor& M,
                      const Tensor& dY, Tensor& dX, int K);

void forward_softmax(const Tensor& X, Tensor& Y);

void forward_celoss(const Tensor& P, const Tensor& L, Tensor& loss);

void backward_softmax_celoss(const Tensor& P, const Tensor& L, Tensor& dP);
