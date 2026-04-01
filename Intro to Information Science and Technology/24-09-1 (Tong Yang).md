**大数据和大模型中的概率数据结构**

- 无错 (经典) 数据结构 --- 概率数据结构 (允许误差, 换取时空优化).
- 四色定理, 费马小定理, 垂直领域大模型 <-> 概率数据结构.



- 融合数学猜想, 设计出独特的概率数学结构: Sketch, 以解决 "集合-元素-集合" 的关系问题 (集合相似性, 集合差异, 元素归属判断)



*多集合查询*: 有 $n$ 个无交集合, 快速判断给定元素属于哪个集合. 先考虑 $n=2$, $S=S^+\sqcup S^-$.

- 两种解决方案: hash table, *bloom filter*. 再降低空间?

*四色过滤器*:

&emsp;&emsp;若 $|S|=n$, 将某元素 $a$ 映射到 $(x,y)\in[0..n-1]^2$, 视作邻接表对 $|V|=n$ 的这张图连边. $S^+$ 中的边为实线, $S^-$ 中为虚边.

- trivial solution: 实边异色, 虚边同色, 尝试四染色.

    支持插入: 暴力扩散修改颜色.

- Shifting Coloring Embedder: 用 $\log_2n$ 个 filter, 每个节点存 $\log_2n$ bit 的 hash value (数学上等价于暴力二进制分组, 但 memory friendly).

- 大集合异色, 小集合同色, 缩点后度数更均匀, 更易染色成功.

- 优点: 内存低, 误差小

*Bloom Filter*: 单集合属于判断.

hash table 单 bit 记录, 每个 $key$ 同时将 $K$ 个 hash 到的 bit set, 查询要求所有 hash 到的 bit 全部 on. 以此降低 false positive rate. $m$ 长度的表, $n$ 元素集合, 取 $k=m/n\ln 2$.

cm sketch, cu sketch (表上 bit 增多, 单次只将最小位置 $+1$). couns sketch (表上 $\pm 1$, 多位置结果取中位数.)

---

*费马 Sketch*: 单, 多集合的差异

- 丢包转换为差集: (ID, 包数);
- 用模操作压入素数域.
- 用 Fermat 小定理还原.
- 丢包检测: hash, 几乎无错, Fermat 小定理还原.



- 两个桶, $(val, count)$, 插入 $f$, 找到两个桶的位置, 直接 $(val,count=1)$ 相加 (不管冲突), $val$ 对大素数 $p$ 取模.
- 本地桶和云端桶相减, 剩下的是 $\Delta$ 的 hash.
- 尝试 $valsum/count$ 得到 $id$, 如果重新 hash 回到这个桶 (rehash verification), 我们就认为这是一个纯纯的 $id$, 得到纯净桶, 以此清理另一个桶, 不断搜索扩展直到成功清理所有桶.
- 优化正确率: 附带一个和 $val$ 参与事件完全相同的随机指纹 $fp$, 解码时同时校验 $fp$.

---

**垂直领域大模型 RAG 与概率数据结构**

Question -> Retrieval (Query->Texts) -> Prompt

提取与问题 embed 到的向量 "相似" 的知识库向量.

$\Ra$ 给定向量集合 $V$ 和配备的距离 $d$, 查询给出 $\bs v,k$, 找到距离 $\bs v$ 最近的 $k$ 个 $V$ 中的向量.

瓶颈是算距离 $\Ra$ 降维.

*PQ 算法*

向量分块 (高维聚类容易失效) -> 聚类 -> 存储类中心向量编号, 中心向量值存入码本 (code book).

*QET 算法*

"树状聚类, 保留向量规律."

e.g. 原向量两两维一组, 小的丢到左边, 大的丢到右边, 树形分类. 数值范围上更相似.---

---

Cache Replacement Policies:

Least Recently/Frequently Used, ...

将内存中 $key$ 和 $val$ 解绑. 记录 $key$ 到真实 $val$ 的置换 $S$. 在 LRU 中, 每次将置换内某一位置的数挪到第一位. 希望将置换映射到一个有限循环群上的数字, 若能, 称之 encodable. 两个 encodable 群的直积也 encodable.

