#pragma once

#include <cuda_runtime.h>
#include <cublas_v2.h>
#include <curand.h>
#include <chrono>
#include <algorithm>

struct cublasHandleWrapper {
    cublasHandle_t handle;
    cublasHandleWrapper() { cublasCreate(&handle); }
    ~cublasHandleWrapper() { cublasDestroy(handle); }
    operator cublasHandle_t() const { return handle; }
};

struct curandGeneratorWrapper {
    curandGenerator_t generator;
    curandGeneratorWrapper() {
        curandCreateGenerator(&generator, CURAND_RNG_PSEUDO_DEFAULT);
        curandSetPseudoRandomGeneratorSeed(generator,
            (unsigned long long)std::chrono::steady_clock::now().time_since_epoch().count()
        );
    }
    ~curandGeneratorWrapper() { curandDestroyGenerator(generator); }
    operator curandGenerator_t() const { return generator; }
};

extern cublasHandleWrapper _handle;
extern curandGeneratorWrapper _curandGen;

namespace GpuFunc {

void addEq(float* a, const float* b, int N);

void setOnes(float* a, int N);

void relu_fw(float* dst, const float* src, int N);

void relu_bw(float* dst, const float* src, const float* grad_out, int N);

void sigmoid_fw(float* dst, const float* src, int N);

void sigmoid_bw(float* dst, const float* src, const float* grad_out, int N);

/**
 * @brief broadcast vector [src_0]^C[src_1]^C ... to dst[0..N-1]
 * to make its intended ROW VECTORs be dst
 */
void broadcast(float* dst, const float* src, int N, int M, int C = 1);

void maxpool_fw(float* dst, float* msk, const float* src,
                int N, int C, int H, int W, int K);

void maxpool_bw(float* dst, const float* msk, const float* src,
                int N, int C, int H, int W, int K);

/**
 * @brief Convert image to column matrix
 * @param src shape=(...N, C, H, W)
 * @param dst shape=(...N, H*W, C*K*K), K is kernel size, zero-padding
 */
void img2col(float* dst, const float* src, int N, int C, int H, int W, int K);

/**
 * @brief Convert column matrix back to image (for grad calculation)
 * @param src shape=(...N, H*W, C*K*K), K is kernel size, zero-padding
 * @param dst shape=(...N, C, H, W)
 */
void col2img(float* dst, const float* src, int N, int C, int H, int W, int K);

void rowMax(float* dst, const float* src, int N, int C);

void mapShiftExp(float* dst, const float* src, const float* rowmx, int N, int C);

void mapDiv(float* dst, const float* src, const float* rowsum, int N, int C);

void mapNegLog(float* dst, const float* src, int N);

void mapFilterSubeq(float* dst, const float* src, const float* label, int N, int C);

/**
 * @brief Gather elements from src according to idx
 */
void filter(float* dst, const float* src, const float* idx, int N, int C);

/* Below are functions supported by CUBLAS */

/**
 * @brief Compute y = alpha * op(A) * x + beta * y
 * @param A op(A) treated as a matrix of shape (M, N), ROW MAJOR
 * @param x treated as a vector of shape (N)
 * @param y treated as a vector of shape (M)
 */
void gemv(const float* A, const float* x, float* y,
          int M, int N, cublasOperation_t transA = CUBLAS_OP_N,
          float alpha = 1.0f, float beta = 1.0f);

/**
 * @brief Compute C = alpha * op(A) * op(B) + beta * C
 * @param A op(A) treated as a matrix of shape (M, K), ROW MAJOR
 * @param B op(B) treated as a matrix of shape (K, N), ROW MAJOR
 * @param C treated as a matrix of shape (M, N), ROW MAJOR
 */
void gemm(const float* A, const float* B, float* C, int M, int N, int K,
          cublasOperation_t transA = CUBLAS_OP_N, cublasOperation_t transB = CUBLAS_OP_N,
          float alpha = 1.0f, float beta = 1.0f);

/**
 * @brief Compute dst[i] = sum_j src[j * N + i] + dst[i]
 * @param dst shape=(N)
 * @param src shape=(...,N), size=M=K*N
 */
void colSum(float* dst, const float* src, int N, int M);

/**
 * @brief Compute dst[i] = alpha sum_j src[i * M + j] + beta * dst[i]
 * @param dst shape=(N)
 * @param src shape=(N,...), size=M=N*K
 */
void rowSum(float* dst, const float* src, int N, int M, float alpha = 1.0f, float beta = 1.0f);

void sample(float* dst, int N);

} // namespace GpuFunc
