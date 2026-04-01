import math
from SST_2.dataset import traindataset, minitraindataset
from fruit import get_document, tokenize
import pickle
import numpy as np
from importlib.machinery import SourcelessFileLoader
from autograd.BaseGraph import Graph
from autograd.BaseNode import *

np.random.seed(19491001)

class NullModel:
    def __init__(self):
        pass

    def __call__(self, text):
        return 0


class NaiveBayesModel:
    def __init__(self):
        self.dataset = traindataset() # 完整训练集，需较长加载时间
        # self.dataset = minitraindataset() # 用来调试的小训练集，仅用于检查代码语法正确性

        # 以下内容可根据需要自行修改，不修改也可以完成本题
        self.token_num = [{}, {}] # token在正负样本中出现次数
        self.V = 0 # 语料库token数量
        self.pos_neg_num = [0, 0] # 正负样本数量
        self.count()

    def count(self):
        # MYCODE
        for text, label in self.dataset:
            self.pos_neg_num[label] += 1
            for token in text:
                if token not in self.token_num[label]:
                    self.token_num[label][token] = 1
                    if token not in self.token_num[label ^ 1]:
                        self.V += 1
                else:
                    self.token_num[label][token] += 1

    def __call__(self, text):
        # MYCODE
        ALPHA = 1 # Laplace coefficient
        pr = [self.pos_neg_num[i] / sum(self.pos_neg_num) for i in [0, 1]]
        for i in [0, 1]:
            for token in text:
                count = self.token_num[i].get(token, 0)
                pr[i] *= (count + ALPHA) / (self.pos_neg_num[i] + ALPHA * self.V)
        return 0 if pr[0] > pr[1] else 1


def buildGraph(dim, num_classes, L): #dim: 输入一维向量长度, num_classes:分类数
    # 以下类均需要在BaseNode.py中实现
    # 也可自行修改模型结构
    graph = Graph([
        Mask(dim),
        Attention(dim), relu(),
        LayerNorm((L, dim)), ResLinear(dim), relu(),
        LayerNorm((L, dim)), Mean(1),
        Linear(dim, num_classes), LogSoftmax(), NLLLoss(num_classes)
    ])
    return graph


save_path = "model/attention.npy"

class Embedding():
    def __init__(self):
        self.emb = dict() 
        with open("words.txt", encoding='utf-8') as f: #word.txt存储了每个token对应的feature向量，self.emb是一个存储了token-feature键值对的Dict()，可直接调用使用
            for i in range(50000):
                row = next(f).split()
                word = row[0]
                vector = np.array([float(x) for x in row[1:]])
                self.emb[word] = vector
        
    def __call__(self, text, max_len=50):
        # MYCODE
        # 利用self.emb将句子映射为一个二维向量（LxD），注意，同时需要修改训练代码中的网络维度部分
        # 默认长度L为50，特征维度D为100
        # 提示: 考虑句子如何对齐长度，且可能存在空句子情况（即所有单词均不在emd表内） 

        UNK = -100
        PAD = 100
        res = UNK * np.ones((max_len, 100))
        for i in range(min(max_len, len(text))):
            token = text[i]
            if token in self.emb:
                res[i] = self.emb[token]
        if len(text) < max_len:
            for i in range(len(text), max_len):
                res[i] = PAD * np.ones((100,))
        return res



class AttentionModel():
    def __init__(self):
        self.embedding = Embedding()
        with open(save_path, "rb") as f:
            self.network = pickle.load(f)
        self.network.eval()
        self.network.flush()

    def __call__(self, text, max_len=50):
        X = self.embedding(text, max_len)
        X = np.expand_dims(X, 0)
        pred = self.network.forward(X, removelossnode=1)[-1]
        haty = np.argmax(pred, axis=-1)
        return haty[0]


class QAModel():
    def __init__(self):
        self.document_list = get_document()

    def tf(self, word, document):
        # MYCODE
        # 返回单词在文档中的频度
        # document变量结构请参考fruit.py中get_document()函数
        return document['document'].count(word) / len(document['document'])

    def idf(self, word):
        # MYCODE
        # 返回单词IDF值，提示：你需要利用self.document_list来遍历所有文档
        # 注意python整除与整数除法的区别
        occur = 0
        for doc in self.document_list:
            occur += doc['document'].count(word) > 0
        return np.log10(len(self.document_list) / (1 + occur))

    def tfidf(self, word, document):
        # MYCODE
        # 返回TF-IDF值
        return self.tf(word, document) * self.idf(word)

    def __call__(self, query):
        query = tokenize(query) # 将问题token化
        # MYCODE
        # 利用上述函数来实现QA
        # 提示：你需要根据TF-IDF值来选择一个最合适的文档，再根据IDF值选择最合适的句子
        # 返回时请返回原本句子，而不是token化后的句子，可以参考README中数据结构部分以及fruit.py中用于数据处理的get_document()函数
        best_w, best_key, best_doc = -np.inf, None, None
        for token in query:
            for doc in self.document_list:
                w = self.tfidf(token, doc)
                if w > best_w: best_w, best_key, best_doc = w, token, doc

        # print(f"best keyword = {best_key}")

        def local_idf(word):
            occur = 0
            for sent in best_doc['sentences']:
                occur += sent[0].count(word) > 0
            return np.log10(len(best_doc['sentences']) / (1 + occur))

        best_c, best_sent = -1, None
        keywords = query
        keywords.sort(key=lambda tk: local_idf(tk), reverse=True)

        # print(f"top keywords = {keywords}")

        for sent in best_doc['sentences']:
            c = 0
            for kw in keywords:
                if sent[0].count(kw) > 0:
                    c += 1
                else:
                    break
            if c > best_c:
                best_c, best_sent = c, sent
        
        # print(f"found {best_c} {sent[0]} {sent[1]}")
        return best_sent[1]


modeldict = {
    "Null": NullModel,
    "Naive": NaiveBayesModel,
    "Attn": AttentionModel,
    "QA": QAModel,
}

import time # only for testing

class TimeKeeper:
    def __init__(self):
        self.last = time.time()

    def __call__(self, msg):
        print(msg + f" | {time.time() - self.last:.2f} sec")
        self.last = time.time()

if __name__ == '__main__':
    _tk = TimeKeeper()

    embedding = Embedding()
    lr = 1.23e-3   # 学习率
    wd1 = 0  # L1正则化
    wd2 = 1.5e-4  # L2正则化
    batchsize = 128
    max_epoch = 10
    
    max_L = 50
    num_classes = 2
    feature_D = 100
    
    graph = buildGraph(feature_D, num_classes, max_L) # 维度可以自行修改

    # 训练
    # 完整训练集训练有点慢
    best_train_acc = 0
    dataloader = traindataset(shuffle=True) # 完整训练集
    # dataloader = minitraindataset(shuffle=True) # 用来调试的小训练集

    _tk("Start training")
    for i in range(1, max_epoch+1):
        hatys = []
        ys = []
        losss = []
        graph.train()
        X = []
        Y = []
        cnt = 0
        for text, label in dataloader:
            x = embedding(text, max_L)
            label = np.zeros((1)).astype(np.int32) + label
            X.append(x)
            Y.append(label)
            cnt += 1
            if cnt == batchsize:
                X = np.stack(X, 0)
                Y = np.concatenate(Y, 0)
                graph[-1].y = Y
                graph.flush()
                pred, loss = graph.forward(X)[-2:]
                hatys.append(np.argmax(pred, axis=-1))
                ys.append(Y)
                graph.backward()
                graph.optimstep(lr, wd1, wd2)
                losss.append(loss)
                cnt = 0
                X = []
                Y = []

        loss = np.average(losss)
        acc = np.average(np.concatenate(hatys)==np.concatenate(ys))
        # print(f"epoch {i} loss {loss:.3e} acc {acc:.4f}")
        _tk(f"epoch {i} loss {loss:.3e} acc {acc:.4f}")
        if acc > best_train_acc:
            best_train_acc = acc
            with open(save_path, "wb") as f:
                pickle.dump(graph, f)