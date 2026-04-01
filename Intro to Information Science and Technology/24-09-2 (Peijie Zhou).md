**Exploring AI for Genomics Research.** (Gen-omics)

- Intuition Symbolic vs Connectionist (<- 可解释性?)
- 零数据, 小数据, 大数据, 全数据; "组合爆炸", "维度灾难".
- Transformer, Scaling Law, Emergent Behavior.
- "智库观点 | 鄂维南院士: 人工智能的 ..."

---

Big (Whole) Data in Multi-Omics. $\mathcal{Cell}\times\mathcal{Gene}\to\R$, 考察基因的表达量 (e.g. mRNA 含量)

"从不同的指标 (RNA, Pr, ...) 衡量一个细胞的状态."

Human Genome Project,

Human Cell Atlas

The $\pi$-HuB Project.

---

Omics 的两种数据形式:

- Sequence
    - Big Data: Language Models (CNN, LSTM).
    - Whole Data: DNA-BERT, Uni-RNA, AlphaFold.
- Tabular
    - Small Data: Clustering, XGBoost.
    - Big Data: Variational Inference (scVI).
    - Whole Data: scBERT, Geneformer, scFoundation.

AlphaFold: Find how the protein folds.

- 给定氨基酸序列, 计算稳定折叠后每个氨基酸的空间坐标.
- "构象是能量函数的极小值"
- 冷冻电镜结果: 序列 -> 构象 数据.
- AlphaFold 2: Transformer. Sequence -> Structure.
- AlphaFold 3: Diffusion.

---

基因组学大模型

Original Sequence -> Input Sequence (3 base as a "word") -> Pre-training (mask words, then try to recover it, with transformer) Embedding...

基于 Transformer 架构的转录组学基础模型. "把细胞变成一句话" -> transformer

"它就是一种信仰."

用例: 模拟基因敲除/过表达结果.

---

Current Bottlenecks

- 传统任务上比拼 "刷点", 缺乏令人信服的真实落地场景.
- 模型可解释性差, 没有机制性发现.
- 静态数据 vs 动态数据: "死物学".

---

胚胎移植的培养液中, 抽取婴儿的 DNA 信息. 纯净婴儿 / 父母 DNA ->> 培养液中 DNA.