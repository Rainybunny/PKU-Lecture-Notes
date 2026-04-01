#ifndef CUDABASE_CUH
#define CUDABASE_CUH

#define DataType template<typename data_t = float>

const size_t CUDA_THREADS_NUM = 512;

inline size_t getCudaBlocks(size_t N) {
    return (N + CUDA_THREADS_NUM - 1) / CUDA_THREADS_NUM;
}

#define KERNEL_SET(N) <<<getCudaBlocks(N), CUDA_THREADS_NUM>>>

#define CUDA_KERNEL_LOOP(i, N) \
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < (N); \
         i += blockDim.x * gridDim.x)


namespace GpuFunc {

DataType
__global__ void addEq(data_t* a, const data_t* b, size_t size) {
    CUDA_KERNEL_LOOP(i, size) {
        a[i] += b[i];
    }
}

DataType
__global__ void setOnes(data_t* a, size_t size) {
    CUDA_KERNEL_LOOP(i, size) {
        a[i] = 1;
    }
}

DataType
__global__ void relu(const data_t* input, data_t* output, size_t size) {
    CUDA_KERNEL_LOOP(i, size) {
        output[i] = (input[i] > 0) * input[i];
    }
}

DataType
__global__ void reluGradAdd(const data_t* input, const data_t* grad_output,
                            data_t* grad_input, size_t size) {
    CUDA_KERNEL_LOOP(i, size) {
        grad_input[i] += (input[i] > 0) * grad_output[i];
    }
}

DataType
__global__ void sigmoid(const data_t* input, data_t* output, size_t size) {
    CUDA_KERNEL_LOOP(i, size) {
        output[i] = 1 / (1 + exp(-input[i]));
    }
}

DataType
__global__ void sigmoidGradAdd(const data_t* input, const data_t* grad_output,
                               data_t* grad_input, size_t size) {
    CUDA_KERNEL_LOOP(i, size) {
        data_t sig = 1 / (1 + exp(-input[i]));
        grad_input[i] += sig * (1 - sig) * grad_output[i];
    }
}

DataType
__global__ void _sumShared(const data_t* input, data_t* output, size_t size) {

}

DataType
void sum(const data_t* input, data_t* output, size_t size) {
    data_t *tmp[2];
    static const size_t SHMEM = sizeof(data_t) * CUDA_THREADS_NUM;
    const size_t mask = (size_t)tmp[0] ^ (size_t)tmp[1];
    
    size_t nexs = getCudaBlocks(size);
    cudaMalloc((void**)tmp, sizeof(data_t) * nexs);
    cudaMalloc((void**)tmp + 1, sizeof(data_t) * getCudaBlocks(nexs));

    const data_t *cur = input;
    data_t *nex = tmp[0];
    while (size > 1) {
        _sumShared<<<nexs, CUDA_THREADS_NUM, SHMEM>>>(cur, nex, size);
        nex = (data_t*)((size_t)nex ^ mask);
        cur = (data_t*)((size_t)nex ^ mask); // same as nex's update
        size = nexs, nexs = getCudaBlocks(size);
    }
    cudaMemcpy(output, cur, sizeof(data_t), cudaMemcpyDeviceToDevice);
    cudaFree(tmp[0]), cudaFree(tmp[1]);
}

} // namespace GpuFunc

#endif // CUDABASE_CUH