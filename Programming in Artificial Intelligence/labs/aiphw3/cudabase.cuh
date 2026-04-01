#ifndef CUDABASE_CUH
#define CUDABASE_CUH

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
} _handle;

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
} _curandGen;

const int CUDA_THREADS_NUM = 512;
const float EPS = 1e-10f;

inline int getCudaBlocks(int N) {
    return (N + CUDA_THREADS_NUM - 1) / CUDA_THREADS_NUM;
}

#define KERNEL_SET(N) <<<getCudaBlocks(N), CUDA_THREADS_NUM>>>

#define CUDA_KERNEL_LOOP(i, N) \
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (N); \
         i += blockDim.x * gridDim.x)

namespace GpuFunc {

__global__ void _addEq(float* a, const float* b, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        a[i] += b[i];
    }
}

inline void addEq(float* a, const float* b, int N) {
    _addEq KERNEL_SET(N) (a, b, N);
}

__global__ void _setOnes(float* a, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        a[i] = 1;
    }
}

inline void setOnes(float* a, int N) {
    _setOnes KERNEL_SET(N) (a, N);
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
inline void broadcast(float* dst, const float* src, int N, int M, int C = 1) {
#ifdef SHAPE_CHECK
    assert(N % M == 0);
#endif
    _broadcast KERNEL_SET(N) (dst, src, N, M, C);
}

__global__ void _maxpool_fw(float* dst, float* msk, const float* src,
                            int N, int C, int H, int W, int K) {
    int oH = (H + K - 1) / K, oW = (W + K - 1) / K;
    CUDA_KERNEL_LOOP(i, N * C * oH * oW) {
        int t = i;
        int n = t / (C * oH * oW); t %= (C * oH * oW);
        int c = t / (oH * oW); t %= (oH * oW);
        int h = t / oW * K, w = t % oW * K;
        float mxv = -1e20f;
        int p0 = -1, q0 = -1;
        for (int p = h; p < h + K && p < H; ++p) {
            for (int q = w; q < w + K && q < W; ++q) {
                int id = ((n * C + c) * H + p) * W + q;
                float val = src[id]; msk[id] = 0;
                if (mxv < val) mxv = val, p0 = p, q0 = q;
            }
        }
        dst[i] = mxv, msk[((n * C + c) * H + p0) * W + q0] = 1;
    }
}

inline void maxpool_fw(float* dst, float* msk, const float* src,
                       int N, int C, int H, int W, int K) {
    cudaMemset(msk, 0, sizeof(float) * N * C * H * W);
    _maxpool_fw KERNEL_SET(N * C * ((H + K - 1) / K) * ((W + K - 1) / K))
    (dst, msk, src, N, C, H, W, K);
}

__global__ void _maxpool_bw(float* dst, const float* msk, const float* src,
                            int N, int C, int H, int W, int K) {
    int oH = (H + K - 1) / K, oW = (W + K - 1) / K;
    CUDA_KERNEL_LOOP(i, N * C * H * W) {
        int t = i;
        int n = t / (C * H * W); t %= (C * H * W);
        int c = t / (H * W); t %= (H * W);
        int h = t / W, w = t % W;
        int oh = h / K, ow = w / K;
        dst[i] = msk[i] * src[((n * C + c) * oH + oh) * oW + ow];
    }
}

inline void maxpool_bw(float* dst, const float* msk, const float* src,
                       int N, int C, int H, int W, int K) {
    _maxpool_bw KERNEL_SET(N * C * H * W) (dst, msk, src, N, C, H, W, K);
}

__global__ void _img2col(float* dst, const float* src, int N,
                         int C, int H, int W, int K) {
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
        ? src[((n * C + c) * H + h) * W + w] : 0.0f;
    }
}

/**
 * @brief Convert image to column matrix
 * @param src shape=(...N, C, H, W)
 * @param dst shape=(...N, H*W, C*K*K), K is kernel size, zero-padding
 */
inline void img2col(float* dst, const float* src, int N,
                    int C, int H, int W, int K) {
    _img2col KERNEL_SET(N * H * W * C * K * K) (dst, src, N, C, H, W, K);
}

__global__ void _col2img(float* dst, const float* src, int N,
                         int C, int H, int W, int K) {
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
            atomicAdd(&dst[((n * C + c) * H + h) * W + w], src[i]);
        }
    }
}

/**
 * @brief Convert column matrix back to image (for grad calculation)
 * @param src shape=(...N, H*W, C*K*K), K is kernel size, zero-padding
 * @param dst shape=(...N, C, H, W)
 */
inline void col2img(float* dst, const float* src, int N,
                    int C, int H, int W, int K) {
    cudaMemset(dst, 0, sizeof(float) * N * C * H * W);
    _col2img KERNEL_SET(N * H * W * C * K * K) (dst, src, N, C, H, W, K);
}

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

inline void rowMax(float* dst, const float* src, int N, int C) {
    _rowMax KERNEL_SET(N) (dst, src, N, C);
}

__global__ void _mapShiftExp(float* dst, const float* src,
                             const float* rowmx, int N, int C) {
    CUDA_KERNEL_LOOP(i, N * C) {
        dst[i] = expf(src[i] - rowmx[i / C]);
    }
}

inline void mapShiftExp(float* dst, const float* src,
                        const float* rowmx, int N, int C) {
    _mapShiftExp KERNEL_SET(N * C) (dst, src, rowmx, N, C);
}

__global__ void _mapDiv(float* dst, const float* src,
                       const float* rowsum, int N, int C) {
    CUDA_KERNEL_LOOP(i, N * C) {
        dst[i] = src[i] / rowsum[i / C];
    }
}

inline void mapDiv(float* dst, const float* src,
                   const float* rowsum, int N, int C) {
    _mapDiv KERNEL_SET(N * C) (dst, src, rowsum, N, C);
}

__global__ void _mapNegLog(float* dst, const float* src, int N) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = -logf(src[i] + EPS);
    }
}

inline void mapNegLog(float* dst, const float* src, int N) {
    _mapNegLog KERNEL_SET(N) (dst, src, N);
}

__global__ void _mapFilterSubeq(float* dst, const float* src,
                               const int* label, int N, int C) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i * C + label[i]] -= 1.0f;
    }
}

inline void mapFilterSubeq(float* dst, const float* src,
                           const int* label, int N, int C) {
    _mapFilterSubeq KERNEL_SET(N) (dst, src, label, N, C);
}

__global__ void _filter(float* dst, const float* src, const int* idx, int N, int C) {
    CUDA_KERNEL_LOOP(i, N) {
        dst[i] = src[i * C + idx[i]];
    }
}

/**
 * @brief Gather elements from src according to idx
 */
inline void filter(float* dst, const float* src, const int* idx, int N, int C) {
    _filter KERNEL_SET(N) (dst, src, idx, N, C);
}

/* Below are functions supported by CUBLAS */

/**
 * @brief Compute y = alpha * op(A) * x + beta * y
 * @param A op(A) treated as a matrix of shape (M, N), ROW MAJOR
 * @param x treated as a vector of shape (N)
 * @param y treated as a vector of shape (M)
 */
void gemv(const float* A, const float* x, float* y,
          int M, int N, cublasOperation_t transA = CUBLAS_OP_N,
          float alpha = 1.0f, float beta = 1.0f) {
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
          cublasOperation_t transA = CUBLAS_OP_N, cublasOperation_t transB = CUBLAS_OP_N,
          float alpha = 1.0f, float beta = 1.0f) {
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
 * @brief Compute dst[i] = sum_j src[j * N + i] + dst[i]
 * @param dst shape=(N)
 * @param src shape=(...,N), size=M=K*N
 */
void colSum(float* dst, const float* src, int N, int M) {
#ifdef SHAPE_CHECK
    assert(N % M == 0);
#endif
    int K = M / N;
    float *one = nullptr;
    cudaMalloc(&one, sizeof(float) * K);
    setOnes(one, K);
    gemv(src, one, dst, N, K, CUBLAS_OP_T);
    cudaFree(one);
}

/**
 * @brief Compute dst[i] = alpha sum_j src[i * M + j] + beta * dst[i]
 * @param dst shape=(N)
 * @param src shape=(N,...), size=M=N*K
 */
void rowSum(float* dst, const float* src, int N, int M,
            float alpha = 1.0f, float beta = 1.0f) {
#ifdef SHAPE_CHECK
    assert(M % N == 0);
#endif
    int K = M / N;
    float *one = nullptr;
    cudaMalloc(&one, sizeof(float) * K);
    setOnes(one, K);
    gemv(src, one, dst, N, K, CUBLAS_OP_N, alpha, beta);
    cudaFree(one);
}

void sample(float* dst, int N) {
    curandGenerateUniform(_curandGen, dst, N);
}

} // namespace GpuFunc

#endif // CUDABASE_CUH