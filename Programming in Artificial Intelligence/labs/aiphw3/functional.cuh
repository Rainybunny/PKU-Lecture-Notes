#ifndef FUNCTIONAL_CUH
#define FUNCTIONAL_CUH

#include "cudabase.cuh"
// #include "tensor.cuh"
#include <cuda_runtime.h>
#include <cublas_v2.h>

void forward_fc(const float* X, float* Y, const float* W,
                const float* b, int N, int C_in, int C_out) {
    GpuFunc::broadcast(Y, b, N * C_out, C_out);
    GpuFunc::gemm(X, W, Y, N, C_out, C_in, CUBLAS_OP_N, CUBLAS_OP_T);
}

void backward_fc(const float* X, const float* Y, const float* W,
                 const float* b, int N, int C_in, int C_out, const float* dY,
                 float* dX, float* dW, float* db) {
    GpuFunc::gemm(dY, W, dX, N, C_in, C_out, CUBLAS_OP_N, CUBLAS_OP_N, 1.0f, 0.0f);
    GpuFunc::gemm(dY, X, dW, C_out, C_in, N, CUBLAS_OP_T, CUBLAS_OP_N, 1.0f, 0.0f);
    cudaMemset(db, 0, sizeof(float) * C_out);
    GpuFunc::colSum(db, dY, C_out, N * C_out);
}

/**
 * @brief (zero-padding) & (square kernel with odd width) 2D convolution layer
 * @param X shape=(..., C_in, H, W)
 * @param Ker shape=(C_out, C_in, K, K)
 * @param b shape=(C_out)
 * @return shape=(..., C_out, H, W)
 */
void forward_conv2d(const float* X, float* Y, const float* Ker,
                    const float* b, int N, int C_in, int H, int W, int C_out, int K) {
    float *Xhat = nullptr;
    const int CKK = C_in * K * K;
    const int OUT_SIZE = N * C_out * H * W;
    cudaMalloc(&Xhat, sizeof(float) * (H * W) * CKK);

    GpuFunc::broadcast(Y, b, OUT_SIZE, C_out, H * W);

    for (int n = 0; n < N; ++n) { // batch-wise
        const float* Xn = X + n * C_in * H * W;
        float* Yn = Y + n * C_out * H * W;
        GpuFunc::img2col(Xhat, Xn, 1, C_in, H, W, K);
        // Xhat shape=(H*W, C_in*K*K)
        GpuFunc::gemm(Ker, Xhat, Yn, C_out, H * W, CKK, CUBLAS_OP_N, CUBLAS_OP_T);
    }
    cudaFree(Xhat);
}

void backward_conv2d(const float* X, const float* Y, const float* Ker,
                     const float* b, int N, int C_in, int H, int W, int C_out, int K,
                     const float* dY, float* dX, float* dK, float* db) {
    float *Xhat = nullptr, *dXhat = nullptr;
    const int CKK = C_in * K * K;
    cudaMalloc(&Xhat, sizeof(float) * (H * W) * CKK);
    cudaMalloc(&dXhat, sizeof(float) * (H * W) * CKK);
    cudaMemset(dK, 0, sizeof(float) * C_out * C_in * K * K);
    cudaMemset(db, 0, sizeof(float) * C_out);
    for (int n = 0; n < N; ++n) { // batch-wise
        const float *Xn = X + n * C_in * H * W; //, *Yn = Y + n * C_out * H * W;
        const float *dYn = dY + n * C_out * H * W;
        float *dXn = dX + n * C_in * H * W; 
        GpuFunc::img2col(Xhat, Xn, 1, C_in, H, W, K);
        GpuFunc::gemm(dYn, Xhat, dK, C_out, CKK, H * W);
        GpuFunc::gemm(dYn, Ker, dXhat, H * W, CKK, C_out, CUBLAS_OP_T, CUBLAS_OP_N, 1.0f, 0.0f);
        GpuFunc::col2img(dXn, dXhat, 1, C_in, H, W, K);
        GpuFunc::rowSum(db, dYn, C_out, C_out * H * W);
    }
    cudaFree(dXhat);
    cudaFree(Xhat);
}

void forward_maxpool(const float* X, float* Y, float* M, int N, int C, int H, int W, int K) {
    GpuFunc::maxpool_fw(Y, M, X, N, C, H, W, K);
}


void backward_maxpool(const float* X, const float* Y, const float* M,
                      int N, int C, int H, int W, int K,
                      const float* dY, float* dX) {
    GpuFunc::maxpool_bw(dX, M, dY, N, C, H, W, K);
}

void forward_softmax(const float* X, float* Y, int N, int C) {
    float *rowmx = nullptr;
    cudaMalloc(&rowmx, sizeof(float) * N);
    GpuFunc::rowMax(rowmx, X, N, C);
    GpuFunc::mapShiftExp(Y, X, rowmx, N, C);
    GpuFunc::rowSum(rowmx, Y, N, N * C, 1.0f, 0.0f);
    GpuFunc::mapDiv(Y, Y, rowmx, N, C);
    cudaFree(rowmx);
}

void forward_celoss(const float* P, const int* L, int N, int C, float* loss) {
    float* H = nullptr;
    cudaMalloc(&H, sizeof(float) * N);
    GpuFunc::filter(H, P, L, N, C);
    GpuFunc::mapNegLog(H, H, N);
    GpuFunc::rowSum(loss, H, 1, N, 1.0f, 0.0f);
    cudaFree(H);
}

void backward_softmax_celoss(const float* P, const int* L, int N, int C, float* dP) {
    cudaMemcpy(dP, P, sizeof(float) * N * C, cudaMemcpyDeviceToDevice);
    GpuFunc::mapFilterSubeq(dP, P, L, N, C);
    float div = 1.0f / N;
    cublasSscal(_handle, N * C, &div, dP, 1);
}

#endif // FUNCTIONAL_CUH
