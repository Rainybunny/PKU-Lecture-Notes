#include "cudabase.cuh"
#include "functional.h"
#include <cuda_runtime.h>
#include <cublas_v2.h>

void _forward_relu(const float* X, float* Y, int N) {
    GpuFunc::relu_fw(Y, X, N);
}

void forward_relu(const Tensor& X, Tensor& Y) {
#ifdef SHAPE_CHECK
    assert(X.size == Y.size);
#endif
    _forward_relu(X.data.get(), Y.data.get(), X.size);
}

void _backward_relu(const float* X, const float* Y, int N, const float* dY, float* dX) {
    GpuFunc::relu_bw(dX, X, dY, N);
}

void backward_relu(const Tensor& X, const Tensor& Y, const Tensor& dY, Tensor& dX) {
#ifdef SHAPE_CHECK
    assert(X.size == Y.size && Y.size == dY.size && dY.size == dX.size);
#endif
    _backward_relu(X.data.get(), Y.data.get(), X.size, dY.data.get(), dX.data.get());
}

void _forward_sigmoid(const float* X, float* Y, int N) {
    GpuFunc::sigmoid_fw(Y, X, N);
}

void forward_sigmoid(const Tensor& X, Tensor& Y) {
#ifdef SHAPE_CHECK
    assert(X.size == Y.size);
#endif
    _forward_sigmoid(X.data.get(), Y.data.get(), X.size);
}

void _backward_sigmoid(const float* X, const float* Y, int N, const float* dY, float* dX) {
    GpuFunc::sigmoid_bw(dX, X, dY, N);
}

void backward_sigmoid(const Tensor& X, const Tensor& Y, const Tensor& dY, Tensor& dX) {
#ifdef SHAPE_CHECK
    assert(X.size == Y.size && Y.size == dY.size && dY.size == dX.size);
#endif
    _backward_sigmoid(X.data.get(), Y.data.get(), X.size, dY.data.get(), dX.data.get());
}

void _forward_fc(const float* X, float* Y, const float* W,
                 const float* b, int N, int C_in, int C_out) {
    GpuFunc::broadcast(Y, b, N * C_out, C_out);
    GpuFunc::gemm(X, W, Y, N, C_out, C_in, CUBLAS_OP_N, CUBLAS_OP_T);
}

void forward_fc(const Tensor& X, Tensor& Y, const Tensor& W, const Tensor& b) {
#ifdef SHAPE_CHECK
    assert(W.shape.size() == 2 && b.shape.size() == 1);
    assert(X.shape.back() == W.shape[1] && Y.shape.back() == W.shape[0]);
    assert(b.shape[0] == W.shape[0]);
    assert(X.size / X.shape.back() == Y.size / Y.shape.back());
#endif
    _forward_fc(X.data.get(), Y.data.get(), W.data.get(), b.data.get(),
                X.size / X.shape.back(), W.shape[1], W.shape[0]);
}

void _backward_fc(const float* X, const float* Y, const float* W,
                  const float* b, int N, int C_in, int C_out, const float* dY,
                  float* dX, float* dW, float* db) {
    GpuFunc::gemm(dY, W, dX, N, C_in, C_out, CUBLAS_OP_N, CUBLAS_OP_N, 1.0f, 0.0f);
    GpuFunc::gemm(dY, X, dW, C_out, C_in, N, CUBLAS_OP_T, CUBLAS_OP_N, 1.0f, 0.0f);
    cudaMemset(db, 0, sizeof(float) * C_out);
    GpuFunc::colSum(db, dY, C_out, N * C_out);
}

void backward_fc(const Tensor& X, const Tensor& Y, const Tensor& W,
                 const Tensor& b, const Tensor& dY, Tensor& dX,
                 Tensor& dW, Tensor& db) {
#ifdef SHAPE_CHECK
    assert(W.shape.size() == 2 && b.shape.size() == 1);
    assert(X.shape.back() == W.shape[1] && Y.shape.back() == W.shape[0]);
    assert(b.shape[0] == W.shape[0]);
    assert(X.size / X.shape.back() == Y.size / Y.shape.back());
    assert(dY.size == Y.size && dX.size == X.size);
    assert(dW.size == W.size && db.size == b.size);
#endif
    _backward_fc(X.data.get(), Y.data.get(), W.data.get(), b.data.get(),
                 X.size / X.shape.back(), W.shape[1], W.shape[0],
                 dY.data.get(), dX.data.get(), dW.data.get(), db.data.get());
}

/**
 * @brief (zero-padding) & (square kernel with odd width) 2D convolution layer
 * @param X shape=(..., C_in, H, W)
 * @param Ker shape=(C_out, C_in, K, K)
 * @param b shape=(C_out)
 * @return shape=(..., C_out, H, W)
 */
void _forward_conv2d(const float* X, float* Y, const float* Ker,
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

void forward_conv2d(const Tensor& X, Tensor& Y, const Tensor& Ker, const Tensor& b) {
#ifdef SHAPE_CHECK
    assert(X.shape.size() >= 3 && Ker.shape.size() == 4 && b.shape.size() == 1);
#endif
    int W = X.shape.back();
    int H = X.shape[X.shape.size() - 2];
    int C_in = X.shape[X.shape.size() - 3];
    int N = X.size / (C_in * H * W);
    int C_out = Ker.shape[0];
    int K = Ker.shape[2];
#ifdef SHAPE_CHECK
    assert(Ker.shape[1] == C_in && Ker.shape[2] == K && Ker.shape[3] == K);
    assert(b.shape[0] == C_out);
    assert(Y.size == N * C_out * H * W);
#endif
    _forward_conv2d(X.data.get(), Y.data.get(), Ker.data.get(), b.data.get(),
                    N, C_in, H, W, C_out, K);
}

void _backward_conv2d(const float* X, const float* Y, const float* Ker,
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

void backward_conv2d(const Tensor& X, const Tensor& Y, const Tensor& Ker,
                     const Tensor& b, const Tensor& dY, Tensor& dX,
                     Tensor& dK, Tensor& db) {
#ifdef SHAPE_CHECK
    assert(X.shape.size() >= 3 && Ker.shape.size() == 4 && b.shape.size() == 1);
#endif
    int W = X.shape.back();
    int H = X.shape[X.shape.size() - 2];
    int C_in = X.shape[X.shape.size() - 3];
    int N = X.size / (C_in * H * W);
    int C_out = Ker.shape[0];
    int K = Ker.shape[2];
#ifdef SHAPE_CHECK
    assert(Ker.shape[1] == C_in && Ker.shape[2] == K && Ker.shape[3] == K);
    assert(b.shape[0] == C_out);
    assert(Y.size == N * C_out * H * W);
    assert(dY.size == Y.size && dX.size == X.size);
    assert(dK.size == Ker.size && db.size == b.size);
#endif
    _backward_conv2d(X.data.get(), Y.data.get(), Ker.data.get(), b.data.get(),
                     N, C_in, H, W, C_out, K,
                     dY.data.get(), dX.data.get(), dK.data.get(), db.data.get());
}

void _forward_maxpool(const float* X, float* Y, float* M, int N, int C, int H, int W, int K) {
    GpuFunc::maxpool_fw(Y, M, X, N, C, H, W, K);
}

void forward_maxpool(const Tensor& X, Tensor& Y, Tensor& M, int K) {
#ifdef SHAPE_CHECK // it can handle (..., H, W) actually, but for simplicity we check 3D+
    assert(X.shape.size() >= 3);
#endif
    int W = X.shape.back();
    int H = X.shape[X.shape.size() - 2];
    int C = X.shape[X.shape.size() - 3];
    int N = X.size / (C * H * W);
#ifdef SHAPE_CHECK
    assert(Y.size == N * C * ((H + K - 1) / K) * ((W + K - 1) / K));
    assert(M.size == Y.size);
#endif
    _forward_maxpool(X.data.get(), Y.data.get(), M.data.get(), N, C, H, W, K);
}


void _backward_maxpool(const float* X, const float* Y, const float* M,
                       int N, int C, int H, int W, int K,
                       const float* dY, float* dX) {
    GpuFunc::maxpool_bw(dX, M, dY, N, C, H, W, K);
}

void backward_maxpool(const Tensor& X, const Tensor& Y, const Tensor& M,
                      const Tensor& dY, Tensor& dX, int K) {
#ifdef SHAPE_CHECK
    assert(X.shape.size() >= 3);
#endif
    int W = X.shape.back();
    int H = X.shape[X.shape.size() - 2];
    int C = X.shape[X.shape.size() - 3];
    int N = X.size / (C * H * W);
#ifdef SHAPE_CHECK
    assert(Y.size == N * C * ((H + K - 1) / K) * ((W + K - 1) / K));
    assert(M.size == Y.size);
    assert(dY.size == Y.size && dX.size == X.size);
#endif
    _backward_maxpool(X.data.get(), Y.data.get(), M.data.get(),
                      N, C, H, W, K,
                      dY.data.get(), dX.data.get());
}

void _forward_softmax(const float* X, float* Y, int N, int C) {
    float *rowmx = nullptr;
    cudaMalloc(&rowmx, sizeof(float) * N);
    GpuFunc::rowMax(rowmx, X, N, C);
    GpuFunc::mapShiftExp(Y, X, rowmx, N, C);
    GpuFunc::rowSum(rowmx, Y, N, N * C, 1.0f, 0.0f);
    GpuFunc::mapDiv(Y, Y, rowmx, N, C);
    cudaFree(rowmx);
}

void forward_softmax(const Tensor& X, Tensor& Y) {
#ifdef SHAPE_CHECK
    assert(X.size == Y.size);
    assert(X.shape.size() >= 2);
#endif
    int C = X.shape.back();
    int N = X.size / C;
    _forward_softmax(X.data.get(), Y.data.get(), N, C);
}

void _forward_celoss(const float* P, const float* L, int N, int C, float* loss) {
    float* H = nullptr;
    cudaMalloc(&H, sizeof(float) * N);
    GpuFunc::filter(H, P, L, N, C);
    GpuFunc::mapNegLog(H, H, N);
    GpuFunc::rowSum(loss, H, 1, N, 1.0f, 0.0f);
    cudaFree(H);
}

void forward_celoss(const Tensor& P, const Tensor& L, Tensor& loss) {
#ifdef SHAPE_CHECK
    assert(P.shape.size() == 2);
    assert(L.shape.size() == 1);
    assert(P.shape[0] == L.shape[0]);
    assert(loss.size == 1);
#endif
    int N = P.shape[0];
    int C = P.shape[1];
    _forward_celoss(P.data.get(), L.data.get(), N, C, loss.data.get());
}

void _backward_softmax_celoss(const float* P, const float* L, int N, int C, float* dP) {
    cudaMemcpy(dP, P, sizeof(float) * N * C, cudaMemcpyDeviceToDevice);
    GpuFunc::mapFilterSubeq(dP, P, L, N, C);
    float div = 1.0f / N;
    cublasSscal(_handle, N * C, &div, dP, 1);
}

void backward_softmax_celoss(const Tensor& P, const Tensor& L, Tensor& dP) {
#ifdef SHAPE_CHECK
    assert(P.shape.size() == 2);
    assert(L.shape.size() == 1);
    assert(P.shape[0] == L.shape[0]);
    assert(dP.size == P.size);
#endif
    int N = P.shape[0];
    int C = P.shape[1];
    _backward_softmax_celoss(P.data.get(), L.data.get(), N, C, dP.data.get());
}
