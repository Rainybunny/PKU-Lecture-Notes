**运算符前向运算 (Forward ops)**:
- **实现方法**：在 `task1_operators.py` 中各算子 `compute` 函数主要使用 NumPy 原语实现前向计算（如 `np.exp`, `np.log`, `np.transpose`, `np.reshape`, `np.broadcast_to`, `np.sum` 等）。
- **要点**：注意保持输入/输出的形状与 dtype 一致；对于 `Transpose` 支持显式 `axes` 参数并在缺省时做最后两个维度的交换；`BroadcastTo` 使用 `np.broadcast_to` 保证行为与 NumPy 一致。

**反向计算 (Backward / gradients)**:
- **实现方法**：在每个算子中实现 `gradient`，返回与输入数量对应的梯度 Tensor 或 None。梯度使用已实现的张量运算（如乘法、加法、幂、对数等），方便链式组合。
- **重要细节**：
	- 对于逐元素操作，直接使用链式求导规则（例如乘法对左/右的导数分别为 out_grad * rhs, out_grad * lhs）。
	- 对于标量作为操作数（如 `MulScalar`/`AddScalar`/`DivScalar`/`PowerScalar`），返回单元素元组或单个梯度并正确处理标量因子。
	- 当存在广播时，需要在反向沿着广播的维度上求和以恢复输入形状；我在 `BroadcastTo.gradient` 中找出被广播的轴并对 `out_grad` 做 `sum` 后再 `reshape` 回输入形状。
	- 对 `Summation`，梯度通过将 `out_grad` reshape 成在被求和维度上为 1 的形状然后 `broadcast_to` 回去；若 `axes=None`（全局求和），则将其 reshape 为全 1 的形状再广播。
	- `Transpose.gradient` 通过对梯度再做相反的转置（即把同样的 axes 参数传递给 transpose）恢复原始维度。
	- `MatMul.gradient` 使用矩阵微分的标准规则：对 A 的梯度为 out_grad @ B^T，对 B 的梯度为 A^T @ out_grad，注意使用张量的 `transpose()` 接口。
	- 非光滑点（ReLU）使用输入值构造 0/1 掩码（使用 `Tensor.make_const` 包装 NumPy 掩码），再乘以 out_grad 实现梯度截断。

**拓扑排序 (Topological sort)**:
- **实现方法**：在 `task2_autodiff.py` 中实现了对给定输出节点的 post-order DFS。当从输出节点向输入边反向遍历并在所有前驱访问完成后将节点加入结果列表，就得到了一个合法的拓扑顺序。
- **要点**：使用 `visited` 映射避免重复遍历；返回的顺序适合之后取反以进行反向传播（从输出往输入累积梯度）。

**自动微分 (Autodiff / gradient aggregation)**:
- **实现方法**：实现了 `compute_gradient_of_variables(output_tensor, out_grad)`，核心思路为：
	1. 用字典 `node_to_output_grads_list` 保存每个节点来自后续节点的梯度贡献（列表形式）。
	2. 初始化输出节点的贡献列表为 `[out_grad]`，对整个图做拓扑排序并反序遍历。
	3. 在遍历时，将某节点收到的多个梯度贡献相加得到 `total_grad`，若节点 `requires_grad`，则将该值写入节点的 `grad` 字段。
	4. 若节点是由某个算子生成（存在 `op`），调用 `node.op.gradient_as_tuple(total_grad, node)` 获取针对每个输入的梯度贡献，再把这些梯度累加到对应输入的 `node_to_output_grads_list` 中以供后续传播。
- **重要细节**：
	- 聚合多个来源的梯度时逐项相加，保证多条路径的梯度正确累积。
	- 跳过 `None` 梯度（有些算子可能对某些输入没有梯度），并对非 `requires_grad` 的节点不保留最终 `grad`。
	- 在开始传播前清理/初始化节点的 `grad` 字段，避免历史遗留影响。
