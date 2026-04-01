#include "cudabase.cuh"
#include <cstdio>
#include <cassert>

const int CUDA_THREADS_NUM = 512;
const float EPS = 1e-10f;

int getCudaBlocks(int N) {
    return (N + CUDA_THREADS_NUM - 1) / CUDA_THREADS_NUM;
}

#define KERNEL_SET(N) <<<getCudaBlocks(N), CUDA_THREADS_NUM>>>

#define CUDA_KERNEL_LOOP(i, N) \
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (N); \
         i += blockDim.x * gridDim.x)

cublasHandleWrapper _handle;
curandGeneratorWrapper _curandGen;

namespace GpuFunc {

// Simple cached device buffer helpers (process-lifetime).
namespace {

struct CachedDeviceBuf {
    float* ptr = nullptr;
    size_t cap = 0; // number of float elements
    ~CachedDeviceBuf() {
        if (ptr) cudaFree(ptr);
    }
    float* get(size_t n) {
        if (n <= cap && ptr) return ptr;
        if (ptr) cudaFree(ptr);
        cudaMalloc(&ptr, sizeof(float) * n);
        cap = n;
        return ptr;
    }
};

CachedDeviceBuf g_ones;
int g_ones_cap = 0;

CachedDeviceBuf g_channelDot_tmp;

} // namespace

void manualSeed(unsigned long long seed) {
    curandSetPseudoRandomGeneratorSeed(_curandGen, seed);
}

__global__ void _offset(float* a, float val, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        a[i] += val;
    }
}

void offset(float* a, float val, int N) {
    _offset KERNEL_SET(N) (a, val, N);
}

__global__ void _scale(float* a, float val, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        a[i] *= val;
    }
}

void scale(float* a, float val, int N) {
    _scale KERNEL_SET(N) (a, val, N);
}

__global__ void _addEq(float* a, const float* b, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        a[i] += b[i];
    }
}

void addEq(float* a, const float* b, int N) {
    _addEq KERNEL_SET(N) (a, b, N);
}

__global__ void _setOnes(float* a, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        a[i] = 1;
    }
}

void setOnes(float* a, int N) {
    _setOnes KERNEL_SET(N) (a, N);
}

__global__ void _setVals(float* a, int N, float val) {
    CUDA_KERNEL_LOOP(i, N) {
        a[i] = val;
    }
}

void setVals(float* a, int N, float val) {
    _setVals KERNEL_SET(N) (a, N, val);
}

__global__ void _relu_fw(float* dst, const float* src, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = fmaxf(src[i], 0);
    }
}

void relu_fw(float* dst, const float* src, int N) {
    _relu_fw KERNEL_SET(N) (dst, src, N);
}

__global__ void _relu_bw(float* dst, const float* src, const float* grad_out, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] += (src[i] > 0 ? grad_out[i] : 0);
    }
}

void relu_bw(float* dst, const float* src, const float* grad_out, int N) {
    _relu_bw KERNEL_SET(N) (dst, src, grad_out, N);
}

__global__ void _sigmoid_fw(float* dst, const float* src, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = 1.0f / (1.0f + expf(-src[i]));
    }
}

void sigmoid_fw(float* dst, const float* src, int N) {
    _sigmoid_fw KERNEL_SET(N) (dst, src, N);
}

__global__ void _sigmoid_bw(float* dst, const float* src, const float* grad_out, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        float s = 1.0f / (1.0f + expf(-src[i]));
        dst[i] += grad_out[i] * s * (1 - s);
    }
}

void sigmoid_bw(float* dst, const float* src, const float* grad_out, int N) {
    _sigmoid_bw KERNEL_SET(N) (dst, src, grad_out, N);
}

__global__ void _broadcast(float* dst, const float* src, int N, int M, int C) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = src[i % (C * M) / C];
    }
}

/**
 * @brief broadcast vector [src_0]^C[src_1]^C ... to dst[0..N-1]
 * to make its intended ROW VECTORs be dst
 */
void broadcast(float* dst, const float* src, int N, int M, int C) {
#ifdef SHAPE_CHECK
    assert(N % (M * C) == 0);
#endif
    _broadcast KERNEL_SET(N) (dst, src, N, M, C);
}

#define imgId(n, h, w, c, H, W, C) (int)((((n) * (H) + (h)) * (W) + (w)) * (C) + (c))

__global__ void _maxpool_fw(float* dst, float* msk, const float* src,
                            int N, int H, int W, int C, int K) {
    int oH = (H + K - 1) / K, oW = (W + K - 1) / K;
    CUDA_KERNEL_LOOP(i, N * oH * oW * C) {
        int t = i;
        int n = t / (oH * oW * C); t %= (oH * oW * C);
        int h = t / (oW * C) * K; t %= (oW * C);
        int w = t / C * K, c = t % C;
        float mxv = -1e20f;
        int p0 = -1, q0 = -1;
        for (int p = h; p < h + K && p < H; ++p) {
            for (int q = w; q < w + K && q < W; ++q) {
                float val = src[imgId(n, p, q, c, H, W, C)];
                if (mxv < val) mxv = val, p0 = p, q0 = q;
            }
        }
        dst[i] = mxv;
        if (msk != nullptr) msk[imgId(n, p0, q0, c, H, W, C)] = 1;
    }
}

void maxpool_fw(float* dst, float* msk, const float* src,
                int N, int H, int W, int C, int K) {
    if (msk != nullptr) {
        cudaMemset(msk, 0, sizeof(float) * N * H * W * C);
    }
    int dst_size = N * ((H + K - 1) / K) * ((W + K - 1) / K) * C;
    _maxpool_fw KERNEL_SET(dst_size) (dst, msk, src, N, H, W, C, K);
}

__global__ void _maxpool_bw(float* dst, const float* msk, const float* src,
                            int N, int H, int W, int C, int K) {
    int oH = (H + K - 1) / K, oW = (W + K - 1) / K;
    CUDA_KERNEL_LOOP(i, N * H * W * C) {
        if (msk[i] != 0) { // must be 1.0f
            int t = i;
            int n = t / (H * W * C); t %= (H * W * C);
            int h = t / (W * C); t %= (W * C);
            int w = t / C, c = t % C;
            int oh = h / K, ow = w / K;
            dst[i] += src[imgId(n, oh, ow, c, oH, oW, C)];
        }
    }
}

void maxpool_bw(float* dst, const float* msk, const float* src,
                int N, int H, int W, int C, int K) {
    _maxpool_bw KERNEL_SET(N * H * W * C) (dst, msk, src, N, H, W, C, K);
}

__global__ void _img2col(float* dst, const float* src, int N,
                         int H, int W, int C, int K) {
    int KK = int(K * K), CKK = int(C * KK), half = int(K / 2);
    int WCKK = int(W * CKK), HWCKK = int(H * WCKK), S = int(N * HWCKK);
    CUDA_KERNEL_LOOP(i, S) {
        int t = i;
        int n = t / HWCKK; t %= HWCKK;
        int h = t / WCKK; t %= WCKK;
        int w = t / CKK; t %= CKK;
        int c = t / KK; t %= KK;
        int p = t / K, q = t % K;
        h += p - half, w += q - half;
        dst[i] = (h >= 0 && h < int(H) && w >= 0 && w < int(W))
        ? src[imgId(n, h, w, c, H, W, C)] : 0.0f;
    }
}

/**
 * @brief Convert image to column matrix
 * @param src shape=(...N, H, W, C)
 * @param dst shape=(...N, H*W, C*K*K), K is kernel size, zero-padding
 */
void img2col(float* dst, const float* src, int N,
             int H, int W, int C, int K) {
    _img2col KERNEL_SET(N * H * W * C * K * K) (dst, src, N, H, W, C, K);
}

__global__ void _col2img(float* dst, const float* src, int N, int H, int W, int C, int K) {
    int KK = int(K * K), CKK = int(C * KK), half = int(K / 2);
    int WCKK = int(W * CKK), HWCKK = int(H * WCKK), S = int(N * HWCKK);
    CUDA_KERNEL_LOOP(i, S) {
        int t = i;
        int n = t / HWCKK; t %= HWCKK;
        int h = t / WCKK; t %= WCKK;
        int w = t / CKK; t %= CKK;
        int c = t / KK; t %= KK;
        int p = t / K, q = t % K;
        h += p - half, w += q - half;
        if (h >= 0 && h < int(H) && w >= 0 && w < int(W)) {
            atomicAdd(&dst[imgId(n, h, w, c, H, W, C)], src[i]);
        }
    }
}

/**
 * @brief Convert column matrix back to image (for grad calculation)
 * @param src shape=(...N, H*W, C*K*K), K is kernel size, zero-padding
 * @param dst shape=(...N, H, W, C), dst = dst + [true image from src]
 */
void col2img(float* dst, const float* src, int N, int H, int W, int C, int K) {
    _col2img KERNEL_SET(N * H * W * C * K * K) (dst, src, N, H, W, C, K);
}

#undef imgId

__global__ void _rowMax(float* dst, const float* src, int N, int C) {
    CUDA_KERNEL_LOOP(i, N) {
        float mxv = -1e20f;
        for (int j = 0; j < C; ++j) {
            float val = src[i * C + j];
            mxv = mxv < val ? val : mxv;
        }
        dst[i] = mxv;
    }
}

void rowMax(float* dst, const float* src, int N, int C) {
    _rowMax KERNEL_SET(N) (dst, src, N, C);
}

__global__ void _rowArgmax(float* dst, const float* src, int N, int C) {
    CUDA_KERNEL_LOOP(i, N) {
        float mxv = -1e20f;
        int idx = -1;
        for (int j = 0; j < C; ++j) {
            float val = src[i * C + j];
            if (mxv < val) mxv = val, idx = j;
        }
        dst[i] = (float)idx;
    }
}

void rowArgmax(float* dst, const float* src, int N, int C) {
    _rowArgmax KERNEL_SET(N) (dst, src, N, C);
}

__global__ void _differ(float* dst, const float* a, const float* b, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = a[i] != b[i]; // intended for integer tensor
    }
}

void differ(float* dst, const float* a, const float* b, int N) {
    _differ KERNEL_SET(N) (dst, a, b, N);
}

__global__ void _mapShiftExp(float* dst, const float* src,
                             const float* rowmx, int N, int C) {
    CUDA_KERNEL_LOOP(i, N * C) {
        dst[i] = expf(src[i] - rowmx[i / C]);
    }
}

void mapShiftExp(float* dst, const float* src,
                        const float* rowmx, int N, int C) {
    _mapShiftExp KERNEL_SET(N * C) (dst, src, rowmx, N, C);
}

__global__ void _mapDiv(float* dst, const float* src,
                       const float* rowsum, int N, int C) {
    CUDA_KERNEL_LOOP(i, N * C) {
        dst[i] = src[i] / rowsum[i / C];
    }
}

void mapDiv(float* dst, const float* src,
                   const float* rowsum, int N, int C) {
    _mapDiv KERNEL_SET(N * C) (dst, src, rowsum, N, C);
}

__global__ void _mapNegLog(float* dst, const float* src, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = -logf(src[i] + EPS);
    }
}

void mapNegLog(float* dst, const float* src, int N) {
    _mapNegLog KERNEL_SET(N) (dst, src, N);
}

__global__ void _mapLog(float* dst, const float* src, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = logf(src[i]);
    }
}

void mapLog(float* dst, const float* src, int N) {
    _mapLog KERNEL_SET(N) (dst, src, N);
}

__global__ void _mapFilterSubeq(float* dst, const float* src,
                               const float* label, int N, int C) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i * C + (int)label[i]] -= 1.0f;
    }
}

void mapFilterSubeq(float* dst, const float* src,
                           const float* label, int N, int C) {
    _mapFilterSubeq KERNEL_SET(N) (dst, src, label, N, C);
}

__global__ void _filter(float* dst, const float* src, const float* idx, int N, int C) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = src[i * C + (int)idx[i]];
    }
}

/**
 * @brief Gather elements from src according to idx
 */
void filter(float* dst, const float* src, const float* idx, int N, int C) {
    _filter KERNEL_SET(N) (dst, src, idx, N, C);
}

__global__ void _adamStep(float* tensor, const float* grad, float* m, float* v,
                          float lr, float beta1, float beta2, float eps, float weight_decay,
                          int t, size_t size) {
    CUDA_KERNEL_LOOP(i, size) {
        float ng = grad[i] + weight_decay * tensor[i];
        m[i] = beta1 * m[i] + (1 - beta1) * ng;
        v[i] = beta2 * v[i] + (1 - beta2) * ng * ng;
        float m_hat = m[i] / (1 - powf(beta1, t));
        float v_hat = v[i] / (1 - powf(beta2, t));
        tensor[i] -= lr * m_hat / (sqrtf(v_hat) + eps);
    }
}

void adamStep(float* tensor, const float* grad, float* m, float* v,
              float lr, float beta1, float beta2, float eps, float weight_decay,
              int t, size_t size) {
    _adamStep KERNEL_SET(size) (tensor, grad, m, v, lr, beta1, beta2, eps, weight_decay, t, size);
}

__global__ void _channelShift(float* dst, const float* src, const float* mean, int N, int C) {
    CUDA_KERNEL_LOOP(i, N * C) {
        dst[i] = src[i] - mean[i % C];
    }
}

void channelShift(float* dst, const float* src, const float* mean, int N, int C) {
    _channelShift KERNEL_SET(N * C) (dst, src, mean, N, C);
}

__global__ void _setNormFactors(float* dst, const float* var, const float* gamma,
                                float eps, int C) {
    CUDA_KERNEL_LOOP(c, C) {
        dst[c] = gamma[c] / sqrtf(var[c] + eps);
    }
}

__global__ void _channelScale(float* dst, const float* src, const float* var_gamma,
                              const float* beta, int N, int C, float eps) {
    if (beta != nullptr) {
        CUDA_KERNEL_LOOP(i, N * C) {
            int cid = i % C;
            dst[i] = src[i] * var_gamma[cid] + beta[cid];
        }
    } else {
        CUDA_KERNEL_LOOP(i, N * C) {
            int cid = i % C;
            dst[i] = src[i] * var_gamma[cid];
        }
    }
}

void channelScale(float* dst, const float* src, const float* var,
                  const float* gamma, const float* beta, int N, int C, float eps) {
    float* var_gamma = nullptr;
    cudaMalloc(&var_gamma, sizeof(float) * C);
    _setNormFactors KERNEL_SET(C) (var_gamma, var, gamma, eps, C);
    _channelScale KERNEL_SET(N * C) (dst, src, var_gamma, beta, N, C, eps);
    cudaFree(var_gamma);
}

__global__ void _bn_forward(float* y, float* xhat, const float* x,
                           const float* mean, const float* var,
                           const float* gamma, const float* beta,
                           int NC, int C, float eps) {
    CUDA_KERNEL_LOOP(i, NC) {
        int cid = i % C;
        float invstd = rsqrtf(var[cid] + eps);
        float xn = (x[i] - mean[cid]) * invstd;
        xhat[i] = xn;
        y[i] = xn * gamma[cid] + (beta ? beta[cid] : 0.0f);
    }
}

void batchnormForward(float* y, float* xhat, const float* x,
                      const float* mean, const float* var,
                      const float* gamma, const float* beta,
                      int N, int C, float eps) {
    const int NC = N * C;
    _bn_forward KERNEL_SET(NC) (y, xhat, x, mean, var, gamma, beta, NC, C, eps);
}

__global__ void _bn_backward_scale(float* dx, const float* var, const float* gamma,
                                  int NC, int C, float eps) {
    CUDA_KERNEL_LOOP(i, NC) {
        int cid = i % C;
        dx[i] *= gamma[cid] * rsqrtf(var[cid] + eps);
    }
}

void batchnormBackwardScale(float* dX, const float* var, const float* gamma,
                            int N, int C, float eps) {
    const int NC = N * C;
    _bn_backward_scale KERNEL_SET(NC) (dX, var, gamma, NC, C, eps);
}

__global__ void _channelDotShift(float* dst, const float* src,
                                 const float* xhat, const float* dgamma, int N, int C) {
    CUDA_KERNEL_LOOP(i, N * C) {
        int cid = i % C;
        dst[i] = src[i] - xhat[i] * dgamma[cid]; // dgamma is scaled by 1/N previously
    }
}

void channelDotShift(float* dst, const float* src, const float* xhat,
                     const float* dgamma, int N, int C) {
    _channelDotShift KERNEL_SET(N * C) (dst, src, xhat, dgamma, N, C);
}

__global__ void _expMovingAvg(float* running, const float* current, int C, float momentum) {
    CUDA_KERNEL_LOOP(i, C) {
        running[i] = (1.0f - momentum) * running[i] + momentum * current[i];
    }
}

void expMovingAvg(float* running, const float* current, int C, float momentum) {
    _expMovingAvg KERNEL_SET(C) (running, current, C, momentum);
}

/* Below are functions supported by CUBLAS */

/**
 * @brief Compute y = alpha * op(A) * x + beta * y
 * @param A op(A) treated as a matrix of shape (M, N), ROW MAJOR
 * @param x treated as a vector of shape (N)
 * @param y treated as a vector of shape (M)
 */
void gemv(const float* A, const float* x, float* y,
          int M, int N, cublasOperation_t transA,
          float alpha, float beta) {
    // y = alpha * (!op)(A^T) * x + beta * y
    int oriM = M, oriN = N;
    if (transA == CUBLAS_OP_N) std::swap(oriM, oriN); // A's shape, row major.
    transA = (transA == CUBLAS_OP_N) ? CUBLAS_OP_T : CUBLAS_OP_N;
    cublasSgemv(_handle, transA, oriM, oriN,
                &alpha, A, oriM, x, 1,
                &beta, y, 1);
}

/**
 * @brief Compute C = alpha * op(A) * op(B) + beta * C
 * @param A op(A) treated as a matrix of shape (M, K), ROW MAJOR
 * @param B op(B) treated as a matrix of shape (K, N), ROW MAJOR
 * @param C treated as a matrix of shape (M, N), ROW MAJOR
 */
void gemm(const float* A, const float* B, float* C, int M, int N, int K,
          cublasOperation_t transA, cublasOperation_t transB,
          float alpha, float beta) {
    // C^T = alpha * opB(B^T) * opA(A^T) + beta * C^T
    // C just represents C^T in cublas's view
    int ldb = (transB == CUBLAS_OP_N) ? N : K;
    int lda = (transA == CUBLAS_OP_N) ? K : M;
    cublasSgemm(_handle, transB, transA,
                N, M, K,
                &alpha, B, ldb, A, lda,
                &beta, C, N);
}

/**
 * @brief Compute dst[i] = alpha * sum_j src[j * N + i] + beta * dst[i]
 * @param dst shape=(N)
 * @param src shape=(...,N), size=M=K*N
 */
void colSum(float* dst, const float* src, int N, int M, float alpha, float beta) {
#ifdef SHAPE_CHECK
    assert(M % N == 0);
#endif
    int K = M / N;
    float* one = g_ones.get((size_t)K);
    if (g_ones_cap < K) {
        setOnes(one, K);
        g_ones_cap = K;
    }
    gemv(src, one, dst, N, K, CUBLAS_OP_T, alpha, beta);
}

/**
 * @brief Compute dst[i] = alpha sum_j src[i * M + j] + beta * dst[i]
 * @param dst shape=(N)
 * @param src shape=(N,...), size=M=N*K
 */
void rowSum(float* dst, const float* src, int N, int M,
            float alpha, float beta) {
#ifdef SHAPE_CHECK
    assert(M % N == 0);
#endif
    int K = M / N;
    float* one = g_ones.get((size_t)K);
    if (g_ones_cap < K) {
        setOnes(one, K);
        g_ones_cap = K;
    }
    gemv(src, one, dst, N, K, CUBLAS_OP_N, alpha, beta);
}

__global__ void _hadamard(float* dst, const float* a, const float* b, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = a[i] * b[i];
    }
}

/**
 * @brief Compute dst[c] = sum_n a[n,c] * b[n,c] + acc * dst[c]
 * @param dst shape=(C)
 * @param a shape=(N,C)
 * @param b shape=(N,C)
 */
void channelDot(float* dst, const float* a, const float* b, int N, int C, float alpha, bool acc) {
    const int NC = N * C;
    float* tmp = g_channelDot_tmp.get((size_t)NC);
    _hadamard KERNEL_SET(NC) (tmp, a, b, NC);
    const float beta = acc ? 1.0f : 0.0f;
    colSum(dst, tmp, C, NC, alpha, beta);
}

/**
 * @brief Fill dst with uniform samples in [-bound, bound)
 */
void uniformSample(float* dst, int N, float bound) {
    curandGenerateUniform(_curandGen, dst, N);
    bound *= 2;
    cublasSscal(_handle, N, &bound, dst, 1);
    offset(dst, -bound / 2, N);
}

__global__ void _bernoulli_thresh(float* dst, int N, float p) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = dst[i] < p ? 1.0f : 0.0f;
    }
}

void bernoulliSample(float* dst, int N, float p) {
    curandGenerateUniform(_curandGen, dst, N);
    _bernoulli_thresh KERNEL_SET(N) (dst, N, p);
}

__global__ void _dropout_fw(const float* X, const float* mask, int N, float scale, float* Y) {
    CUDA_KERNEL_LOOP(i, N) {
        Y[i] = X[i] * mask[i] * scale;
    }
}

void dropout_fw(const float* X, int N, float p, float* Y, const float* mask) {
    float scale = 1.0f / (1.0f - p);
    _dropout_fw KERNEL_SET(N) (X, mask, N, scale, Y);
}

__global__ void _dropout_bw(const float* dY, const float* mask, int N, float scale, float* dX) {
    CUDA_KERNEL_LOOP(i, N) {
        dX[i] += dY[i] * mask[i] * scale;
    }
}

void dropout_bw(const float* dY, const float* mask, int N, float p, float* dX) {
    float scale = 1.0f / (1.0f - p);
    _dropout_bw KERNEL_SET(N) (dY, mask, N, scale, dX);
}

void sync() {
    cudaDeviceSynchronize();
}

void cudaCheck(const char* msg) {
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        fprintf(stderr, "=== PANIC at %s ===\nCUDA Error: %s\n", msg, cudaGetErrorString(err));
        assert(false);
    }
}

} // namespace GpuFunc
