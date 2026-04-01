**面向大模型的数据准备**

机器学习模型遇到了瓶颈, 性能收益来源发生转变: 模型 $\to$ 数据 (质量, 数量). 高质量数据能打破 scaling law.

Pre-training -> Supervised Fine-tuning

Pre-training: 数据收集, 去重, 评估, 调度, ...

- 数据过滤: 去除低质量数据. 基于: 分类器, 启发式规则, Metric
- 数据去重: Exact-based (完全重复), Fuzzy-based (文字上类似), Embedding-based (语义上类似).
- 数据配比: 基于统计, 基于 Proxy Model.

Fine-tuning

- Low training data instruction tuning.
- Method: embedding -> clustering -> sampling -> tuning
- 调度: 数据出现次序 (避免负迁移或知识遗忘).
- 数据课程 和 灾难性遗忘. Dual stage mixed fine-tuning.

---

多模态大模型

Pre-training: 获取不同模态对齐.

关键帧抽取

Open-DataFlow-Eval