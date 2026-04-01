## 项目总体说明

这个 lab 把前几次作业实现的 GPU-only `Tensor`（基于 CUDA 的内存管理）与常用的神经网络算子封装为一个 Python 扩展模块 `mytensor`，并提供了一套单元测试用于与 PyTorch 的 `torch.nn.functional` 做结果对比，确保算子实现的正确性。

- 使用 `pybind11` 将本地 C++/CUDA 实现暴露到 Python；
- 将 7 个常用模块（Sigmoid、ReLU、FullyConnected、Convolution2D、MaxPool、Softmax、CrossEntropyLoss）以函数接口形式绑定到 Python；
- 提供从 Python 侧把 NumPy 数据（例如 MNIST）转换为 `mytensor.Tensor` 的路径；
- 在 Python 侧对每个算子做单元测试（与 PyTorch 对齐），以便后续构建更高层训练框架时减少调试开销。

## 文件结构（主要文件）

（下列文件均已打包提交。）

```
./
├── CMakeLists.txt             # build 脚本（使用 pybind11 与 CUDA）
├── readme.md                  # 本说明文档
├── src/
│   ├── cudabase.cu            # CUDA 辅助函数与 kernel 的实现
│   ├── cudabase.cuh           # CUDA 辅助声明（cublas/curand wrapper，GpuFunc 接口）
│   ├── functional.cu          # 高层算子调用（封装 GpuFunc 到 Tensor API）
│   ├── functional.h
│   ├── pybind.cpp             # pybind11 绑定（暴露 mytensor 模块与 Tensor）
│   ├── tensor.cu              # Tensor 类实现（GPU-only）
│   └── tensor.h
└── build/
    └── test.py                # Python 单元测试，用于与 torch 进行对比验证
```

## 构建与运行

在项目根目录下：

```bash
mkdir -p build && cd build
cmake ..
make -j
```

构建成功后会得到 Python 扩展模块 `mytensor`（动态库），可以用 Python 导入并运行测试：

```bash
cd build && python test.py
```

## 设计与实现要点

### Tensor 封装（`src/tensor.cu` / `src/tensor.h` / `src/pybind.cpp`）

- Tensor 仅支持 GPU（device_t::GPU），在构造时通过 `cudaMalloc` 在设备上分配内存；CPU 支持在当前提交中未实现（会抛出异常）。
- 提供的 Python 绑定接口（在 `pybind.cpp` 中）将 `Tensor` 暴露为 `mytensor.Tensor`，支持以下常用操作：
    - 构造器：空构造、按 shape 构造、从 numpy (`pybind11::array_t<float>`) 构造、拷贝构造；
    - 查询方法：`shape()`、`stride()`、`size()`、`offset()`、`device()`；
    - 数据交互：`from_list()`（把 Python list/array 写入 Tensor）、`to_list()`（把 Tensor 内容读回为 Python list），以及 `cpu()`/`gpu()` 接口（目前 `cpu()` 会抛出异常，`gpu()` 用于一致性）。
- 从 NumPy 构造会把 Host 数据拷贝到 Device（`cudaMemcpyHostToDevice`），`to_list()` 会把 Device 数据拷回 Host。

使用示例（Python）：

```py
import numpy as np
import mytensor as mt

arr = np.random.randn(2,3).astype(np.float32)
T = mt.Tensor(arr, mt.device_t.GPU)   # 从 numpy 创建
print(T.shape())
lst = T.to_list()                     # 以 flat list 返回，测试代码里会根据 shape 重塑为 ndarray
```

### 算子封装（`src/functional.cu` / `src/functional.h`）

- 将七类算子以函数接口导出到 Python，接口函数名在 `functional.h` 中声明并在 `pybind.cpp` 中绑定，示例：
    - `forward_relu(X, Y)` / `backward_relu(X, Y, dY, dX)`
    - `forward_sigmoid(X, Y)` / `backward_sigmoid(X, Y, dY, dX)`
    - `forward_fc(X, Y, W, b)` / `backward_fc(X, Y, W, b, dY, dX, dW, db)`
    - `forward_conv2d(X, Y, Ker, b)` / `backward_conv2d(X, Y, Ker, b, dY, dX, dK, db)`
    - `forward_maxpool(X, Y, M, K)` / `backward_maxpool(X, Y, M, dY, dX, K)`
    - `forward_softmax(X, Y)`
    - `forward_celoss(P, L, loss)` / `backward_softmax_celoss(P, L, dP)`
- 这些高层接口主要负责：输入校验（在开启 `SHAPE_CHECK` 时）、为输出分配/初始化（或确保覆盖写入）以及调用 `GpuFunc` 中的 kernel 或 cublas 封装。下层的矩阵乘、img2col / col2img、pool mask 等细节在 `cudabase.cu` 中实现。

注意事项：接口采用的是“传入输出 Tensor 的引用并写入”的风格，所以调用方需要事先按正确形状创建输出 Tensor 对象。

### MNIST 加载与 Tensor 转换（Python 侧）

- 在 `build/test.py` 中示例地使用 `torchvision.datasets.MNIST` 下载并加载数据（若环境没有安装 torchvision，则对应测试会被跳过）。
- 将读取到的图像数据转为 NumPy ndarray（float32，归一化到 [0,1]），然后通过 `mt.Tensor(np_array, mt.device_t.GPU)` 转换为本实现的 Tensor，便于后续直接调用 C++/CUDA 层的算子进行训练/验证。

### 测试策略（`build/test.py`）

- 为了验证算子数值正确性，针对每个算子都使用了与 PyTorch 相同的输入数据做对比：
    - 生成多样化输入（多形状、正负值、较大动态范围），在 Python 侧分别构造 `torch.tensor`（启用 autograd）和 `mt.Tensor`；
    - 在 `mytensor` 上执行 `forward_*`，在 PyTorch 上执行相应 `torch.nn.functional`；比较前向输出的元素值；
    - 随机生成上游梯度 `dY`，在 `mytensor` 上调用 `backward_*` 获得 `dX`/`dW`/`db` 等；在 PyTorch 上用 autograd 计算梯度并比较。
  
- softmax 与 cross-entropy：测试中直接比较 softmax+celoss 的联合反向输出 `dP`（不另行单独对 softmax 做反向），计算方式与 PyTorch 的 softmax+negative-log-likelihood 相对应。
- 单元测试会尽可能覆盖多种形状与边界（例如非整除的 pool 尺寸、padding 保持输出大小的 conv2d），以捕捉潜在的 shape/stride 错误。
- 单元测试结果（取一次本地运行结果）：
    ```bash
    $ cd build && python test.py
    .......
    ----------------------------------------------------------------------
    Ran 7 tests in 3.848s
    
    OK
    ```

## 正确性细节与已做的改进

- 因为所有算子把结果写入由调用方准备的输出 Tensor，有些实现可能会在累加时依赖目标缓冲区已被置零。为避免该类问题，代码中已确保对累加目标明确地先清零或在调用聚合函数时使用 beta=0 的语义。例如 `forward_celoss` 现在在求和时使用 `rowSum(..., alpha=1.0f, beta=0.0f)` 来保证写入而不是累加旧值；其他需要累加的目标（如 `dK`）也会在函数内做 `cudaMemset(..., 0, ...)`。
- 其它算子（如 `maxpool`）也对 mask/输出做了显式初始化（例如 `cudaMemset(msk, 0, ...)`），以保证在未初始化的输出内存上也能得到正确结果。
