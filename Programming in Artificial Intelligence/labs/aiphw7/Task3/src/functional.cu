#include "cudabase.cuh"
#include "functional.h"
#include <cuda_runtime.h>
#include <cublas_v2.h>

namespace {

struct CachedDeviceBuf {
    float* ptr = nullptr;
    size_t cap_bytes = 0;
    ~CachedDeviceBuf() {
        if (ptr) cudaFree(ptr);
    }
    float* get_bytes(size_t bytes) {
        if (bytes <= cap_bytes && ptr) return ptr;
        if (ptr) cudaFree(ptr);
        cudaMalloc(&ptr, bytes);
        cap_bytes = bytes;
        return ptr;
    }
};

CachedDeviceBuf g_conv2d_xhat;
CachedDeviceBuf g_bn_dxcur;
CachedDeviceBuf g_bn_dgcur;
CachedDeviceBuf g_bn_dbcur;
CachedDeviceBuf g_bn_varcorr;

CachedDeviceBuf g_softmax_rowmx;
CachedDeviceBuf g_celoss_tmp;

CachedDeviceBuf g_smce_rowmx;
CachedDeviceBuf g_smce_rowsum;
CachedDeviceBuf g_smce_xy;

} // namespace

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

void backward_relu(Tensor& X, const Tensor& Y) {
    _backward_relu(X.data.get(), Y.data.get(), X.size, Y.grad.get(), X.grad.get());
}

void _forward_sigmoid(const float* X, float* Y, int N) {
    GpuFunc::sigmoid_fw(Y, X, N);
}

void forward_sigmoid(const Tensor& X, Tensor& Y) {
    _forward_sigmoid(X.data.get(), Y.data.get(), X.size);
}

void _backward_sigmoid(const float* X, const float* Y, int N, const float* dY, float* dX) {
    GpuFunc::sigmoid_bw(dX, X, dY, N);
}

void backward_sigmoid(Tensor& X, const Tensor& Y) {
    _backward_sigmoid(X.data.get(), Y.data.get(), X.size, Y.grad.get(), X.grad.get());
}

void _forward_fc(const float* X, float* Y, const float* W,
                 const float* b, int N, int C_in, int C_out) {
    GpuFunc::broadcast(Y, b, N * C_out, C_out);
    GpuFunc::gemm(X, W, Y, N, C_out, C_in, CUBLAS_OP_N, CUBLAS_OP_T);
}

void forward_fc(const Tensor& X, Tensor& Y, const Tensor& W, const Tensor& b) {
#ifdef SHAPE_CHECK
    assert(W.shape.size() == 2 && b.shape.size() == 1);
    assert(X.size / X.shape[0] == W.shape[1] && Y.size / Y.shape[0] == W.shape[0]);
    assert(b.shape[0] == W.shape[0]);
    assert(X.shape[0] == Y.shape[0]);
#endif
    _forward_fc(X.data.get(), Y.data.get(), W.data.get(), b.data.get(),
                X.shape[0], W.shape[1], W.shape[0]);
}

void _backward_fc(const float* X, const float* Y, const float* W,
                  const float* b, int N, int C_in, int C_out, const float* dY,
                  float* dX, float* dW, float* db) {
    GpuFunc::gemm(dY, W, dX, N, C_in, C_out, CUBLAS_OP_N, CUBLAS_OP_N, 1.0f, 1.0f);
    GpuFunc::gemm(dY, X, dW, C_out, C_in, N, CUBLAS_OP_T, CUBLAS_OP_N, 1.0f, 1.0f);
    GpuFunc::colSum(db, dY, C_out, N * C_out);
}

void backward_fc(Tensor& X, const Tensor& Y, Tensor& W, Tensor& b) {
    _backward_fc(X.data.get(), Y.data.get(), W.data.get(), b.data.get(),
                 X.shape[0], W.shape[1], W.shape[0],
                 Y.grad.get(), X.grad.get(), W.grad.get(), b.grad.get());
}

/**
 * @brief (zero-padding) & (square kernel with odd width) 2D convolution layer
 * @param X shape=(..., H, W, C_in)
 * @param Ker shape=(C_out, C_in, K, K)
 * @param b shape=(C_out)
 * @return shape=(..., H, W, C_out)
 */
void _forward_conv2d(const float* X, float* Y, const float* Ker,
                     const float* b, int N, int H, int W, int C_in, int C_out, int K) {
    const int CKK = C_in * K * K;
    const int OUT_SIZE = N * H * W * C_out;
    float* Xhat = g_conv2d_xhat.get_bytes(sizeof(float) * (size_t)N * (size_t)(H * W) * (size_t)CKK);
    GpuFunc::img2col(Xhat, X, N, H, W, C_in, K);
    GpuFunc::broadcast(Y, b, OUT_SIZE, C_out, 1);
    // Xhat: (NHW,CKK), Ker: (C_out,CKK)
    GpuFunc::gemm(Xhat, Ker, Y, N * H * W, C_out, CKK, CUBLAS_OP_N, CUBLAS_OP_T, 1.0f, 1.0f);
}

void forward_conv2d(const Tensor& X, Tensor& Y, const Tensor& Ker, const Tensor& b) {
#ifdef SHAPE_CHECK
    assert(X.shape.size() == 4);
    assert(X.shape[0] == Y.shape[0]);
    assert(X.shape[1] == Y.shape[1]);
    assert(X.shape[2] == Y.shape[2]);
    assert(Ker.shape.size() == 4);
    assert(Ker.shape[0] == Y.shape[3]);
    assert(Ker.shape[1] == X.shape[3]);
    assert(Ker.shape[2] == Ker.shape[3]);
    assert(Ker.shape[2] % 2 == 1);
    assert(b.shape.size() == 1);
    assert(b.shape[0] == Ker.shape[0]);
#endif
    int C_in = X.shape.back();
    int W = X.shape[X.shape.size() - 2];
    int H = X.shape[X.shape.size() - 3];
    int N = X.size / (H * W * C_in);
    int C_out = Ker.shape[0];
    int K = Ker.shape[2];
    _forward_conv2d(X.data.get(), Y.data.get(), Ker.data.get(), b.data.get(),
                    N, H, W, C_in, C_out, K);
}

void _backward_conv2d(const float* X, const float* Y, const float* Ker,
                      const float* b, int N, int H, int W, int C_in, int C_out, int K,
                      const float* dY, float* dX, float* dK, float* db) {
    const int CKK = C_in * K * K, NHW = N * H * W;
    float* Xhat = g_conv2d_xhat.get_bytes(sizeof(float) * (size_t)NHW * (size_t)CKK);
    GpuFunc::img2col(Xhat, X, N, H, W, C_in, K);

    // dY: (NHW,C_out), Xhat: (NHW,CKK)
    // dK = dY^T * Xhat
    GpuFunc::gemm(dY, Xhat, dK, C_out, CKK, NHW, CUBLAS_OP_T, CUBLAS_OP_N, 1.0f, 1.0f);

    // db = sum dY over N, H, W
    GpuFunc::colSum(db, dY, C_out, NHW * C_out);

    // dX: dXhat = dY * Ker, then col2img
    float *dXhat = Xhat; // reuse Xhat buffer, safe because gemm overwrites dXhat
    // cudaMalloc(&dXhat, sizeof(float) * NHW * CKK);
    GpuFunc::gemm(dY, Ker, dXhat, NHW, CKK, C_out, CUBLAS_OP_N, CUBLAS_OP_N, 1.0f, 0.0f);
    GpuFunc::col2img(dX, dXhat, N, H, W, C_in, K);
}

void backward_conv2d(Tensor& X, const Tensor& Y, Tensor& Ker, Tensor& b) {
    int C_in = X.shape.back();
    int W = X.shape[X.shape.size() - 2];
    int H = X.shape[X.shape.size() - 3];
    int N = X.size / (C_in * H * W);
    int C_out = Ker.shape[0];
    int K = Ker.shape[2];
    _backward_conv2d(X.data.get(), Y.data.get(), Ker.data.get(), b.data.get(),
                     N, H, W, C_in, C_out, K,
                     Y.grad.get(), X.grad.get(), Ker.grad.get(), b.grad.get());
}

void _forward_maxpool(const float* X, float* Y, float* M, int N, int H, int W, int C, int K) {
    GpuFunc::maxpool_fw(Y, M, X, N, H, W, C, K);
}

void forward_maxpool(const Tensor& X, Tensor& Y, Tensor& M, int K) {
    int C = X.shape.back();
    int W = X.shape[X.shape.size() - 2];
    int H = X.shape[X.shape.size() - 3];
    int N = X.size / (C * H * W);
    _forward_maxpool(X.data.get(), Y.data.get(), M.data.get(), N, H, W, C, K);
}


void _backward_maxpool(const float* X, const float* Y, const float* M,
                       int N, int H, int W, int C, int K,
                       const float* dY, float* dX) {
    GpuFunc::maxpool_bw(dX, M, dY, N, H, W, C, K);
}

void backward_maxpool(Tensor& X, const Tensor& Y, const Tensor& M, int K) {
    int C = X.shape.back();
    int W = X.shape[X.shape.size() - 2];
    int H = X.shape[X.shape.size() - 3];
    int N = X.size / (C * H * W);
    _backward_maxpool(X.data.get(), Y.data.get(), M.data.get(),
                      N, H, W, C, K,
                      Y.grad.get(), X.grad.get());
}

void _forward_batchnorm(const float* X, float* Y, float* Xhat,
                        float* mean, float* var, float* run_mean, float* run_var,
                        const float* gamma, const float* beta, int N, int C,
                        float eps, float momentum, bool training) {
    if (training) { // update mean (or mean is mean_running)
        cudaMemset(mean, 0, sizeof(float) * C);
        GpuFunc::colSum(mean, X, C, N * C);
        GpuFunc::scale(mean, 1.0f / N, C);
        GpuFunc::expMovingAvg(run_mean, mean, C, momentum);
    } else {
        mean = run_mean;
    }

    if (training) { // update var (or var is var_running)
        // var = mean((x - mean)^2)
        // Use Y as a temporary buffer for (x - mean) to avoid allocating.
        // Safe because we'll overwrite Y fully in batchnormForward below.
        GpuFunc::channelShift(Y, X, mean, N, C);
        GpuFunc::channelDot(var, Y, Y, N, C, 1.0f, false); // overwrite
        GpuFunc::scale(var, 1.0f / N, C);
        // PyTorch updates running_var using the unbiased estimator (N/(N-1) * var).
        // Keep `var` biased for normalization/backward, but update running stats with correction.
        if (N > 1) {
            float* varcorr = g_bn_varcorr.get_bytes(sizeof(float) * (size_t)C);
            cudaMemcpy(varcorr, var, sizeof(float) * (size_t)C, cudaMemcpyDeviceToDevice);
            GpuFunc::scale(varcorr, (float)N / (float)(N - 1), C);
            GpuFunc::expMovingAvg(run_var, varcorr, C, momentum);
        } else {
            GpuFunc::expMovingAvg(run_var, var, C, momentum);
        }
    } else {
        var = run_var;
    }
    // Produce normalized xhat and affine output in one pass.
    GpuFunc::batchnormForward(Y, Xhat, X, mean, var, gamma, beta, N, C, eps);
}

/**
 * @brief Batch Normalization forward pass
 * @param X treated as shape=(N, C) (suitable for (N,H,W,C) images)
 * @param gamma shape=(C)
 * @param beta shape=(C)
 */
void forward_batchnorm(const Tensor& X, Tensor& Y, Tensor& Xhat,
                       Tensor& mean, Tensor& var, Tensor& run_mean, Tensor& run_var,
                       const Tensor& gamma, const Tensor& beta, float eps, float momentum) {
    int N = X.size / X.shape.back();
    int C = X.shape.back();
    _forward_batchnorm(X.data.get(), Y.data.get(), Xhat.data.get(),
                       mean.data.get(), var.data.get(), run_mean.data.get(), run_var.data.get(),
                       gamma.data.get(), beta.data.get(), N, C, eps, momentum, X.useGrad);
}

void _backward_batchnorm(const float* X, const float* Y, const float* Xhat,
                         const float* mean, const float* var,
                         const float* gamma, const float* beta, int N, int C, float eps,
                         const float* dY, float* dX, float* dgamma, float* dbeta) {
    float* dXcur = g_bn_dxcur.get_bytes(sizeof(float) * (size_t)N * (size_t)C);
    float* dGcur = g_bn_dgcur.get_bytes(sizeof(float) * (size_t)C);
    float* dBcur = g_bn_dbcur.get_bytes(sizeof(float) * (size_t)C);

    GpuFunc::colSum(dBcur, dY, C, N * C, 1.0f / N, 0.0f);
    GpuFunc::channelDot(dGcur, dY, Xhat, N, C, 1.0f / N, false);

    cudaMemcpy(dXcur, dY, sizeof(float) * N * C, cudaMemcpyDeviceToDevice);
    GpuFunc::channelShift(dXcur, dXcur, dBcur, N, C);
    GpuFunc::channelDotShift(dXcur, dXcur, Xhat, dGcur, N, C);
    GpuFunc::batchnormBackwardScale(dXcur, var, gamma, N, C, eps);

    float scale = (float)N; // rescale dGcur and dBcur
    cublasSaxpy(_handle, C, &scale, dGcur, 1, dgamma, 1);
    cublasSaxpy(_handle, C, &scale, dBcur, 1, dbeta, 1);
    scale = 1.0f;
    cublasSaxpy(_handle, N * C, &scale, dXcur, 1, dX, 1);
}

/**
 * @brief Batch Normalization backward pass
 * @param X treated as shape=(N, C) (suitable for (N,H,W,C) images)
 * @note It's operator's duty to maintain running mean and var if needed.
 */
void backward_batchnorm(Tensor& X, const Tensor& Y, const Tensor& Xhat,
                        const Tensor& mean, const Tensor& var,
                        Tensor& gamma, Tensor& beta, float eps) {
    int N = X.size / X.shape.back();
    int C = X.shape.back();
    _backward_batchnorm(X.data.get(), Y.data.get(), Xhat.data.get(),
                        mean.data.get(), var.data.get(),
                        gamma.data.get(), beta.data.get(), N, C, eps,
                        Y.grad.get(), X.grad.get(), gamma.grad.get(), beta.grad.get());
}

void _forward_softmax(const float* X, float* Y, int N, int C) {
    float* rowmx = g_softmax_rowmx.get_bytes(sizeof(float) * (size_t)N);
    GpuFunc::rowMax(rowmx, X, N, C);
    GpuFunc::mapShiftExp(Y, X, rowmx, N, C);
    GpuFunc::rowSum(rowmx, Y, N, N * C, 1.0f, 0.0f);
    GpuFunc::mapDiv(Y, Y, rowmx, N, C);
}

void _forward_dropout(const float* X, float* Y, float* mask, int N, float p) {
    GpuFunc::dropout_fw(X, N, p, Y, mask);
}

void forward_dropout(const Tensor& X, Tensor& Y, Tensor& mask, float p) {
    int N = (int)X.size;
    if (X.useGrad) {
        float keep = 1.0f - p;
        GpuFunc::bernoulliSample(mask.data.get(), N, keep);
        _forward_dropout(X.data.get(), Y.data.get(), mask.data.get(), N, p);
    } else {
        cudaMemcpy(Y.data.get(), X.data.get(), sizeof(float) * N, cudaMemcpyDeviceToDevice);
    }
}

void _backward_dropout(const float* dY, const float* mask, int N, float p, float* dX) {
    GpuFunc::dropout_bw(dY, mask, N, p, dX);
}

void backward_dropout(Tensor& X, const Tensor& Y, const Tensor& mask, float p) {
    int N = (int)X.size;
    _backward_dropout(Y.grad.get(), mask.data.get(), N, p, X.grad.get());
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
    float* H = g_celoss_tmp.get_bytes(sizeof(float) * (size_t)N);
    GpuFunc::filter(H, P, L, N, C);
    GpuFunc::mapNegLog(H, H, N);
    GpuFunc::rowSum(loss, H, 1, N, 1.0f, 0.0f);
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

void _forward_softmax_celoss(const float* X, const float* L, int N, int C, float* P, float* loss) {
    // Compute softmax probabilities (for backward/metrics) and a numerically-stable CE loss.
    // loss = sum_i (logsumexp(X_i) - X_i[label_i])
    float* rowmx = g_smce_rowmx.get_bytes(sizeof(float) * (size_t)N);
    float* rowsum = g_smce_rowsum.get_bytes(sizeof(float) * (size_t)N);
    float* x_y = g_smce_xy.get_bytes(sizeof(float) * (size_t)N);

    // rowmx = max_j X[i,j]
    GpuFunc::rowMax(rowmx, X, N, C);
    // P = exp(X - rowmx)
    GpuFunc::mapShiftExp(P, X, rowmx, N, C);
    // rowsum = sum_j exp(X - rowmx)
    GpuFunc::rowSum(rowsum, P, N, N * C, 1.0f, 0.0f);
    // Normalize probabilities: P /= rowsum
    GpuFunc::mapDiv(P, P, rowsum, N, C);
    // x_y = X[i, label[i]]
    GpuFunc::filter(x_y, X, L, N, C);
    // rowsum = log(rowsum) + rowmx  (logsumexp)
    GpuFunc::mapLog(rowsum, rowsum, N);
    GpuFunc::addEq(rowsum, rowmx, N);
    // rowsum = rowsum - x_y
    GpuFunc::scale(x_y, -1.0f, N);
    GpuFunc::addEq(rowsum, x_y, N);
    // loss = sum rowsum
    GpuFunc::rowSum(loss, rowsum, 1, N, 1.0f, 0.0f);
}

void forward_softmax_celoss(const Tensor& X, const Tensor& L, Tensor& P, Tensor& loss) {
    int N = X.shape[0];
    int C = X.shape[1];
    _forward_softmax_celoss(X.data.get(), L.data.get(), N, C, P.data.get(), loss.data.get());
}

void _backward_softmax_celoss(const float* P, const float* L, int N, int C, float* dX, float scale) {
    // dX = scale * (P - onehot(L))
    cudaMemcpy(dX, P, sizeof(float) * N * C, cudaMemcpyDeviceToDevice);
    GpuFunc::mapFilterSubeq(dX, dX, L, N, C);
    cublasSscal(_handle, N * C, &scale, dX, 1);
}

/**
 * No need output tensor, directly write to P.grad
 */
void backward_softmax_celoss(Tensor& P, const Tensor& L) {
    int N = P.shape[0];
    int C = P.shape[1];
    _backward_softmax_celoss(P.data.get(), L.data.get(), N, C, P.grad.get(), 1.0f);
}

void backward_softmax_celoss(Tensor& X, const Tensor& L, const Tensor& pred, float scale) {
    int N = X.shape[0];
    int C = X.shape[1];
    _backward_softmax_celoss(pred.data.get(), L.data.get(), N, C, X.grad.get(), scale);
}

Tensor zerosLike(const Tensor& src, bool useGrad) {
    Tensor Z(src.getShape(), useGrad);
    Z.zeroData();
    if (useGrad) Z.zeroGrad();
    return Z;
}

void adamStep(Tensor& X, Tensor& m, Tensor& v,
              float lr, float beta1, float beta2, float eps, float weight_decay,
              int t) {
    GpuFunc::adamStep(X.data.get(), X.grad.get(), m.data.get(), v.data.get(),
                      lr, beta1, beta2, eps, weight_decay, t, X.size);
}

Tensor rowArgmax(const Tensor& input) {
    Tensor output(shape_t({ input.shape[0] }), false);
    GpuFunc::rowArgmax(output.data.get(), input.data.get(), input.shape[0], input.shape[1]);
    return output;
}

Tensor differ(const Tensor& A, const Tensor& B) {
    Tensor C(A.getShape(), false);
    GpuFunc::differ(C.data.get(), A.data.get(), B.data.get(), A.size);
    return C;
}

/**
 * This function is not designed for computation graph, only for evaluation purpose.
 */
float sumAll(const Tensor& input) {
    Tensor output(shape_t({ 1 }), false);
    GpuFunc::rowSum(output.data.get(), input.data.get(), 1, input.size, 1.0f, 0.0f);
    float h_output;
    cudaMemcpy(&h_output, output.data.get(), sizeof(float), cudaMemcpyDeviceToHost);
    return h_output;
}
