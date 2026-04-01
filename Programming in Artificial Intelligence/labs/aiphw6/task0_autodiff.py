"""
本文件我们给出进行自动微分的步骤
你可以将hw5的对应代码复制到这里
"""

from typing import List, Dict, Tuple
from basic_operator import Op, Value

def find_topo_sort(node_list: List[Value]) -> List[Value]:
    """
    给定一个节点列表，返回以这些节点结束的拓扑排序列表。
    一种简单的算法是对给定的节点进行后序深度优先搜索（DFS）遍历，
    根据输入边向后遍历。由于一个节点是在其所有前驱节点遍历后才被添加到排序中的，
    因此我们得到了一个拓扑排序。
    """
    ## 请于此填写你的代码
    visited = {}
    topo_order: List[Value] = []
    for node in node_list:
        if node not in visited:
            topo_sort_dfs(node, visited, topo_order)
    return topo_order


def topo_sort_dfs(node, visited, topo_order):
    """Post-order DFS"""
    ## 请于此填写你的代码
    visited[node] = True
    for inp in getattr(node, "inputs", []):
        if inp not in visited:
            topo_sort_dfs(inp, visited, topo_order)
    topo_order.append(node)
    

def compute_gradient_of_variables(output_tensor, out_grad):
    """
    对输出节点相对于 node_list 中的每个节点求梯度。
    将计算结果存储在每个 Variable 的 grad 字段中。
    """
    # map for 从节点到每个输出节点的梯度贡献列表
    node_to_output_grads_list = {}
    # 我们实际上是在对标量 reduce_sum(output_node) 
    # 而非向量 output_node 取导数。
    # 但这是损失函数的常见情况。
    node_to_output_grads_list[output_tensor] = [out_grad]

    # 根据我们要对其求梯度的 output_node，以逆拓扑排序遍历图。
    topo_order = find_topo_sort([output_tensor])
    reverse_topo_order = list(reversed(topo_order))

    ## 请于此填写你的代码
    for n in topo_order:
        n.grad = None

    for node in reverse_topo_order:
        grads = node_to_output_grads_list.get(node, [])
        if len(grads) == 0:
            continue
        total_grad = grads[0]
        for g in grads[1:]:
            total_grad = total_grad + g

        if getattr(node, "requires_grad", False):
            node.grad = total_grad
        else:
            node.grad = None

        if getattr(node, "op", None) is None:
            continue

        in_grads = node.op.gradient_as_tuple(total_grad, node)
        for inp, g in zip(node.inputs, in_grads):
            if g is None:
                continue
            if inp in node_to_output_grads_list:
                node_to_output_grads_list[inp].append(g)
            else:
                node_to_output_grads_list[inp] = [g]
