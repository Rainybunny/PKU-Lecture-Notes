&emsp;&emsp;这是 ltr《离散数学与结构》的课程笔记. 其实上学期末就应该发出来, 但当时觉得没记完的东西有点多, 导致笔记不够完美 (指不如雨兔伟大的 lww 笔记). Anyway, 其实大部分内容也是详实易读的, 还是希望能给其他需要品尝 ltr 的小朋友一些帮助. 其中群论部分强烈安利 [雨兔伟大的 lww 笔记](https://www.cnblogs.com/rainybunny/p/18906111).

&emsp;&emsp;如果你觉得这份笔记内容还不够丰盈, 可以去 <https://liutianren.com/discrete/lecture_notes.pdf> 下载 "官方" 笔记. 当然, "官方" 的代价是事无巨细且有点防自学, 我觉得除了第十章和第十一章外你都可以看雨兔的 awa.

[TOC]

$$
\mathscr{Lorain~y~w~la~Lora~blea.}

\newcommand{\DS}[0]{\displaystyle}

% operators alias
\newcommand{\opn}[1]{\operatorname{#1}}
\newcommand{\card}[0]{\opn{card}}
\newcommand{\lcm}[0]{\opn{lcm}}
\newcommand{\char}[0]{\opn{char}}
\newcommand{\Char}[0]{\opn{Char}}
\newcommand{\Min}[0]{\opn{Min}}
\newcommand{\rank}[0]{\opn{rank}}
\newcommand{\Hom}[0]{\opn{Hom}}
\newcommand{\End}[0]{\opn{End}}
\newcommand{\im}[0]{\opn{im}}
\newcommand{\tr}[0]{\opn{tr}}
\newcommand{\diag}[0]{\opn{diag}}
\newcommand{\coker}[0]{\opn{coker}}
\newcommand{\id}[0]{\opn{id}}
\newcommand{\sgn}[0]{\opn{sgn}}
\newcommand{\Res}[0]{\opn{Res}}
\newcommand{\Ad}[0]{\opn{Ad}}
\newcommand{\ord}[0]{\opn{ord}}
\newcommand{\Stab}[0]{\opn{Stab}}
\newcommand{\conjeq}[0]{\sim_{\u{conj}}}
\newcommand{\cent}[0]{\u{\degree C}}
\newcommand{\Sym}[0]{\opn{Sym}}
\newcommand{\Var}[0]{\opn{Var}}
\newcommand{\wg}[0]{\wedge}
\newcommand{\Wg}[0]{\bigwedge}
\newcommand{\sq}[0]{\opn{\square}}

% symbols alias
\newcommand{\E}[0]{\exist}
\newcommand{\A}[0]{\forall}
\newcommand{\l}[0]{\left}
\newcommand{\r}[0]{\right}
\newcommand{\ox}[0]{\otimes}
\newcommand{\lra}[0]{\leftrightarrow}
\newcommand{\llra}[0]{\longleftrightarrow}
\newcommand{\iso}[1]{\overset{\sim}{#1}}
\newcommand{\eps}[0]{\varepsilon}
\newcommand{\Ra}[0]{\Rightarrow}
\newcommand{\Eq}[0]{\Leftrightarrow}
\newcommand{\d}[0]{\mathrm{d}}
\newcommand{\e}[0]{\mathrm{e}}
\newcommand{\i}[0]{\mathrm{i}}
\newcommand{\j}[0]{\mathrm{j}}
\newcommand{\k}[0]{\mathrm{k}}
\newcommand{\Ex}[0]{\mathbb{E}}
\newcommand{\D}[0]{\mathbb{D}}
\newcommand{\oo}[0]{\infty}
\newcommand{\tto}[0]{\rightrightarrows}
\newcommand{\mmap}[0]{\hookrightarrow}
\newcommand{\emap}[0]{\twoheadrightarrow}
\newcommand{\actl}[0]{\curvearrowright}
\newcommand{\actr}[0]{\curvearrowleft}
\newcommand{\nsubg}[0]{\triangleleft}
\newcommand{\nsupg}[0]{\triangleright}
\newcommand{\lin}[0]{\lim_{n\to\oo}}
\newcommand{\linf}[0]{\liminf_{n\to\oo}}
\newcommand{\lsup}[0]{\limsup_{n\to\oo}}
\newcommand{\ser}[0]{\sum_{n=1}^\oo}
\newcommand{\serz}[0]{\sum_{n=0}^\oo}
\newcommand{\isoto}[0]{\overset\sim\to}
\newcommand{\F}[0]{\mathbb F}
\newcommand{\x}[0]{\times}
\newcommand{\M}[0]{\mathbf{M}}
\newcommand{\T}[0]{\intercal}
\newcommand{\Co}[0]{\complement}
\newcommand{\alp}[0]{\alpha}
\newcommand{\lmd}[0]{\lambda}
\newcommand{\mmid}[0]{\parallel}

% symbols with parameters
\newcommand{\der}[1]{\frac{\d}{\d #1}}
\newcommand{\ul}[1]{\underline{#1}}
\newcommand{\ol}[1]{\overline{#1}}
\newcommand{\wt}[1]{\widetilde{#1}}
\newcommand{\br}[1]{\l(#1\r)}
\newcommand{\bk}[1]{\l[#1\r]}
\newcommand{\ev}[1]{\l.#1\r|}
\newcommand{\wh}[1]{\widehat{#1}}
\newcommand{\eval}[1]{\l[\!\l[#1\r]\!\r]}
\newcommand{\abs}[1]{\l|#1\r|}
\newcommand{\bs}[1]{\boldsymbol{#1}}
\newcommand{\dat}[1]{\bs{\mathrm{#1}}}
\newcommand{\env}[2]{\begin{#1}#2\end{#1}}
\newcommand{\ALI}[1]{\env{aligned}{#1}}
\newcommand{\CAS}[1]{\env{cases}{#1}}
\newcommand{\pmat}[1]{\env{pmatrix}{#1}}
\newcommand{\dary}[2]{\l|\begin{array}{#1}#2\end{array}\r|}
\newcommand{\pary}[2]{\l(\begin{array}{#1}#2\end{array}\r)}
\newcommand{\pblk}[4]{\l(\begin{array}{c|c}{#1}&{#2}\\\hline{#3}&{#4}\end{array}\r)}
\newcommand{\u}[1]{\mathrm{#1}}
\newcommand{\t}[1]{\texttt{#1}}
\newcommand{\lix}[1]{\lim_{x\to #1}}
\newcommand{\ops}[1]{#1\cdots #1}
\newcommand{\seq}[3]{{#1}_{#2}\ops,{#1}_{#3}}
\newcommand{\dedu}[2]{\u{(#1)}\Ra\u{(#2)}}
\newcommand{\prv}[3]{\DS{{\DS #1} \over {\DS #2}}~(#3)}
$$

# 第零章 集合论

## $\S0.1$ 朴素集合论速通

&emsp;&emsp;老生常谈, 姑作取舍. 只记一些有意思的东西.

> **命题 0.1.1**
>
> &emsp;&emsp;证明集合等势: $\R^\N\sim\R$.

&emsp;&emsp;*→ Proof.* 考虑若 $S\sim S'$ 而 $T\sim T'$, 显然 $S^T\sim S'^{T'}$. 不妨 $\varphi:S\leftrightarrow S'$, $\psi:T\leftrightarrow T'$, 则有
$$
\pi:S^T\leftrightarrow S'^{T'},~(f:S\to T)\mapsto \varphi\circ f\circ \psi.
$$
那 $\R^\N\sim(2^\N)^\N$, 已然成立.

> **定义 0.1.2 (序)**
>
> &emsp;&emsp;对关系 $\le$, 但它满足:
>
> &emsp;&emsp;(i) $a\le a$;
>
> &emsp;&emsp;(ii) $a\le b\land b\le c\Ra a\le c$;
>
> &emsp;&emsp;(iii) $a\le b\land b\le a\Ra a=b$, 到此构成偏序关系;
>
> &emsp;&emsp;(iv) $a\le b\lor b\le a$, 到此构成全序关系;
>
> &emsp;&emsp;(v) $\A S\neq\varnothing,~\E a\in S,~\A b\in S,~a\le b$, 到此构成良序关系.

> **定义 0.1.3 (Dedekind-finite)**
>
> &emsp;&emsp;称集合 $S$ Dedekind 有限, 当且仅当 $\A T\subsetneq S,~T\prec S$.

&emsp;&emsp;遗留一些问题:

> **问题 0.1.4**
>
> &emsp;&emsp;(a) 若 $\bigcup_{i=1}^\oo S_i\sim\R$, 是否一定有 $\E i,~S_i\sim\R$?
>
> &emsp;&emsp;(b) 对 $S,T$, 是否一定有 $S\succeq T\lor T\succeq S$? 进一步说, 集合的势能否被抽象出集合, 它们的比较是否是全序?
>
> &emsp;&emsp;(c) 对无穷集 $S$, 是否有 $S\sim S\x S$?
>
> &emsp;&emsp;(d) 对 $S$, 是否一定能够定义其上的良序关系 $\le$? (一个不平凡的问题是, $S=\R$ 时能否证明?)
>
> &emsp;&emsp;(e) 若 $S\succ T$, 是否一定有 $2^S\succ 2^T$? 换句话, 若 $2^T\succeq 2^S$, 是否一定有 $T\succeq S$?

&emsp;&emsp;(a) 据称是可证明的; 事实上 (b)(c)(d) 都能由选择公理推出; (d) 与选择公理等价, 称为良序公理; (e) 依赖于连续统假设.

&emsp;&emsp;我们可以通过补充公理的方式让连续统成立 (例如, 让 $\N,2^\N,2^{2^\N},\cdots$ 给出所有势) 或者不成立 (例如, 使得存在 $\N\prec S\prec\R$, 且 $2^S=\R$).

# 第一章 谓词逻辑

## $\S1.1$ 基本语法和语义

> **定义 1.1.1 (符号表)**
>
> &emsp;&emsp;符号表 $\Sigma$ 蕴含如下符号:
>
> - 谓词 $P_1,P_2,\cdots$ (或 $P$, $Q$ 等), $\bot$;
> - 连词 $\rightarrow$, $\lor$, $\land$, $\leftrightarrow$, $\lnot$;
> - 辅助词 $($, $)$.
>
> 并记 $\Sigma^*:=\bigcup_{i=1}^\oo\Sigma^i$.

> **定义 1.1.2 (合法句)**
>
> &emsp;&emsp;合法句集 $\u{PROP}\sub\Sigma^*$, 是最小的满足如下条件的集合:
>
> - 原子命题 $P_i\in\u{PROP}$, $\bot\in\u{PROP}$;
> - 若 $\varphi,\psi\in\u{PROP}$, $(\varphi\opn{\square}\psi)\in\u{PROP}$, 其中 $\opn{\square}\in\{\leftrightarrow,\rightarrow,\lor,\land\}$;
> - 若 $\varphi\in\u{PROP}$, $\lnot\varphi\in\u{PROP}$.

> **引理 1.1.3**
>
> &emsp;&emsp;对任意描述于 $\Sigma^*$ 的命题 $A$, 若
>
> - 对任意原子命题 $P$, $A(P)$;
> - 若 $\varphi,\psi\in\Sigma^*$ 满足 $A(\varphi)$ 和 $A(\psi)$, 则 $A((\varphi\opn{\square}\psi))$;
> - 对任意 $\psi\in\Sigma^*$, 若 $A(\psi)$, 则 $A(\lnot\psi)$.
>
> 则 $\A\varphi\in\u{PROP},~A(\varphi)$.

&emsp;&emsp;*→ Proof.* $\u{PROP}':=\{\varphi\in\u{RPOP}:A(\varphi)\}$ 满足 <u>定义 1.1.2</u>, 因此 $\u{PROP}'=\u{PROP}$.

&emsp;&emsp;接下来考虑对合法句的求值. 形式上:

> **定义 1.1.4**
>
> &emsp;&emsp;为定义 $\u{PROP}$ 上的一个求值 $F:\u{PROP}\to\Omega$, 我们给出
>
> - $H_{\u{atomic}}:\{P_1,P_2,\cdots,\bot\}\to\Omega$;
> - $H_{\u{\square}}:\Omega\x\Omega\to\Omega$;
> - $H_{\lnot}:\Omega\to\Omega$.
>
> 进而定义
>
> - $F(P_i)=H_{\u{atomic}}(P_i)$, $F(\bot)=H_{\u{atomic}}(\bot)$;
> - $F((\varphi\opn{\square}\psi))=H_{\u{\square}}(F(\varphi),F(\psi))$;
> - $F(\lnot\varphi)=H_{\lnot}(F(\varphi))$.

&emsp;&emsp;可以观察到, $F$ 的求值过程等价于对表达式树的分解, 而每个二元运算都附加了括号, 这样的分解是唯一且容易严格定义的.

&emsp;&emsp;据此, 我们可以给出赋值 $v:\u{PROP}\to\{0,1\}$, 它满足 $v(\lnot\varphi)=1-v(\varphi)$, $v(\bot)=0$, 以及:
$$
v((\varphi\sq\psi))=\CAS{
	\max\{v(\varphi),v(\psi)\},&\sq=\lor;\\
	\min\{v(\varphi),v(\psi)\},&\sq=\land;\\
	1-v(\varphi)(1-v(\psi)),&\sq=\rightarrow;\\
	1-v(\varphi)(1-v(\psi))-v(\psi)(1-v(\varphi)),&\sq=\leftrightarrow.
}
$$
它自然地表达 "任何对原子命题赋真值, 并求出一个语句的真值".

&emsp;&emsp;此后, 记 $\eval\varphi_v=v(\varphi)$.

> **定义 1.1.5**
>
> &emsp;&emsp;若 $\eval{\varphi}_v=1$ 对所有赋值 $v$ 成立, 则称 $\varphi$ 为一个重言式 (tautology), 记为 $\models\varphi$;
>
> &emsp;&emsp;若对任意求值 $v$, 对所有 $\varphi\in\Gamma$ 有 $\eval\varphi_v=1$, 则 $[\![\psi]\!]_v=1$, 这记为 $\Gamma\models\psi$.

> **命题 1.1.6**
>
> &emsp;&emsp;若 $\models\varphi$, 则其原子命题的任意替换都有 $\models\varphi[\psi/P]$.

&emsp;&emsp;*→ Proof.* 考虑一个新的赋值 $v'(P_i)=\CAS{v(P_i),&P_i\neq P;\\v(\psi),&P_i=P}$ 即可.

> **定义 1.1.7**
>
> &emsp;&emsp;称 $\varphi\approx\psi$, 当且仅当 $\varphi\models\psi$ 且 $\psi\models\varphi$.

## $\S1.2$ 证明

> **定义 1.2.1 (自然推导法)**
>
> &emsp;&emsp;给出规则
> $$
> {\varphi\quad \varphi\to\psi\over\psi}~(\rightarrow\u{E}),\quad{\varphi\quad\psi\over\varphi\land\psi}~(\land\u{I}),\\
> {\DS{{[\varphi]\over\vdots}\over\psi}\over\varphi\to\psi}~(\to\u{I}),\quad {\varphi\land\psi\over\varphi},{\varphi\land\psi\over\psi}~(\land\u{E}),\\
> {\DS{{[\lnot\varphi]\over\vdots}\over\bot}\over\varphi}~(\u{RAA}),\qquad{\bot\over\varphi}(\bot).
> $$
> 配合
> $$
> \CAS{
> 	\varphi\leftrightarrow\psi &\approx &(\varphi\to\psi)\land(\psi\to\varphi),\\
> 	\varphi\lor\psi &\approx &\lnot(\lnot\varphi\land\lnot\psi),\\
> 	\lnot\varphi &\approx &\varphi\to\bot.
> }
> $$

> **例子 1.2.2**
>
> &emsp;&emsp;证明 $\vdash\lnot\lnot P\to P$.

&emsp;&emsp;*→ Proof.*
$$
{\DS{\DS
	{\DS
        [(P\to{\bot})\to{\bot}]\quad [P\to{\bot}]_1 \over
        \bot
	} (\to\u{E})
	\over
	P
} (\u{RAA})_1
\over
((P\to{\bot})\to{\bot})\to P
} (\to\u{I})
$$

> **例子 1.2.3**
>
> &emsp;&emsp;证明 $\vdash(P\to Q)\to(\lnot Q\to\lnot P)$ 以及 $\vdash(\lnot Q\to\lnot P)\to(P\to Q)$.

&emsp;&emsp;*→ Proof.*
$$
{\DS{\DS{\DS{\DS{\DS[P]_1\quad[P\to Q]_3\over Q}(\to\u{E})\quad[\lnot Q]_2\over \bot}(\to\u{E})\over \lnot P}(\to\u{I})_1\over \lnot Q\to \lnot P}(\to\u{I})_2\over (P\to Q)\to(\lnot  Q\to\lnot P)}(\to\u{I})_3
$$

$$
{\DS
	{\DS
        {\DS
            {\DS
                { [\lnot Q\to\lnot P]_3\quad [\lnot Q]_1\over \lnot P } (\to\u{E})\quad [P]_2 \over
                \bot
            }(\to\u{E}) \over
            Q
        } (\u{RAA})_1 \over
        P\to Q
    } (\to\u{I})_2 \over
    (\lnot Q\to\lnot P)\to(P\to Q)
} (\to\u{I})_3
$$

&emsp;&emsp;在自然归纳法中, 我们需要用一系列证明过程来推出一个结论 (如 $(\to\u{I})$), System K 则避免了这一点.

> **定义 1.2.4 (System K)**
>
> &emsp;&emsp;设 $\Gamma$, $\Delta$ 为命题集合, 给出规则 ($\varphi_1,\varphi_2,\cdots\Ra\psi_1,\psi_2,\cdots$ 语义上表达: 若左侧均成立, 右侧至少一个成立.)
> $$
> {\Gamma\Ra\Delta~(\Delta\subseteq \Gamma)},
> \qquad{\Gamma\Ra\Delta,\varphi\over\lnot\varphi,\Gamma\Ra\Delta},\qquad {\varphi,\Gamma\Ra\Delta\over\Gamma\Ra\Delta,\lnot\varphi},\\
> {\varphi,\psi,\Gamma\Ra\Delta\over\varphi\land\psi,\Gamma\Ra\Delta},\qquad {\Gamma\Ra\Delta,\varphi\quad\Gamma\Ra\Delta,\psi\over\Gamma\Ra\Delta,\varphi\land\psi},\\
> {\Gamma\Ra\Delta,\varphi,\psi\over\Gamma\Ra\Delta,\varphi\lor\psi},\qquad{\varphi,\Gamma\Ra\Delta\quad\psi,\Gamma\Ra\Delta\over\varphi\lor\psi,\Gamma\Ra\Delta},\\
> {\varphi,\Gamma\Ra\Delta,\psi\over\Gamma\Ra\Delta,(\varphi\to\psi)},\qquad{\Gamma\Ra\Delta,\varphi\quad\psi,\Gamma\Ra\Delta\over(\varphi\to\psi),\Gamma\Ra\Delta}.
> $$

&emsp;&emsp;同样, 当我们在 System K 中推导出 $\seq\varphi1t\Ra\psi$, 就认为 $\seq\varphi1t\vdash\psi$.

&emsp;&emsp;对于任何证明系统, 我们自然希望它满足:

- **一致性**: 若 $\Gamma\vdash\varphi$, 那么 $\Gamma\models\varphi$;
- **完备性**: 若 $\Gamma\models\varphi$, 那么 $\Gamma\vdash\varphi$.

接下来我们对自然推理系统进行验证.

> **引理 1.2.5**
>
> &emsp;&emsp;若 $\Gamma,\psi\vdash\varphi$, $\Gamma,\lnot\psi\vdash\varphi$, 那么 $\Gamma\vdash\varphi$.

> **定理 1.2.6 (完备性)**
>
> &emsp;&emsp;若 $\Gamma\models\varphi$, 那么 $\Gamma\vdash\varphi$.

&emsp;&emsp;*→ Proof.* 反复使用 <u>引理 1.2.5</u>, 只需要证明所有形如 $\Gamma,p_1,\underbrace{\lnot p_2,\cdots,p_n}_V\vdash\varphi$ 都能推出即可. 对后面 $n$ 个原子命题, 已然确定了一个唯一的赋值 $v$. 若存在某个 $\psi\in\Gamma$ 使得 $\eval\psi_v=1$, 我们希望证明 $V\vdash\psi$ (同理 $\eval\psi_v=0$ 时希望证明 $V\vdash\lnot\psi$).

&emsp;&emsp;归纳地证明. 如果 $\varphi$ 是原子命题, 不妨 $\varphi=p_i$, 则:

- 若 $\eval{p_i}_v=1$, $p_i\in V$, 那么 $V\vdash p_i$;
- 若 $\eval{p_i}_v=0,~\lnot p_i\in V$, 那么 $V\vdash\lnot p_i$.

特别地若 $\varphi=\bot$, $\eval\bot_v=0$, 显然 $V\vdash\bot\to\bot$.

&emsp;&emsp;否则, $\varphi$ 不是原子命题, 不妨 $\varphi=\psi_1\to\psi_2$, 讨论:

- 若 $\eval\varphi_v=1$, $\eval{\psi_1}=0$, 归纳知 $V\vdash\psi_1\to\bot$, 假设 $[\psi_1]$, 推出 $\bot$ 爆炸出 $\psi_2$ 并引入 $\psi_1$ 可知 $V\vdash\psi_1\to\psi_2$.
- 若 $\eval\varphi_v=1$, $\eval{\psi_2}=1$, 更容易的.
- 若 $\eval\varphi_v=0$, 同样讨论 $\eval{\psi_1}_v=1$ 或者 $\eval{\psi_2}_v=0$ 即可.

&nbsp;

&emsp;&emsp;在自然推理系统中去掉 RAA (并将 $\lor$ 加入为符号), 我们得到直觉逻辑. 它事实上与如下模型一致:

> **定义 1.2.7 (Kripke Model)**
>
> &emsp;&emsp;给定一族世界 $(W,\le)$, 其中 $\le$ 是世界上的偏序. 有赋值 $v:W\x\text{atomic PROP}\to\{0,1\}$, 满足
> $$
> W_1\le W_2\Ra v(W_1,\cdot)\le v(W_2,\cdot),\quad v(\cdot,\bot)=0,
> $$
> 而 $v:W\x\text{PROP}\to\{0,1\}$ 有
> $$
> v(W,\varphi\to\psi)=\CAS{
> 	1,&\A W'\ge W,~v(W',\varphi)\ge (W',\psi);\\
> 	0,&\text{otherwise}.
> }
> $$
> 对 $\varphi\in\text{PROP}$, 我们称 $F_i\varphi$ (语义: $\varphi$ 能被推出), 当且仅当
> $$
> \A (W,\le),v,~\A w\in W,~v(w,\varphi)=1.
> $$

&emsp;&emsp;考虑世界集 $\{W_0\le W_1\}$, $v(W_0,p)=0$, $v(W_1,p)=1$, 这样可以推出 $v(W_0,\lnot\lnot p\to p)=0$, 这样就能说明直觉逻辑无法推出这个命题.

&emsp;&emsp;直觉逻辑与类型还有强相关性. 我们将命题视作类型, "推出" 就称为一种实例的构造. 例如:
$$
P\quad P\to Q\vdash_i Q,
$$
相当于给定 $p:P$ 和 $f:P\to Q$, 我们就能构造出 $f(p):Q$. 再如, $P\to((P\to\bot)\to \bot)$ 就可以视作函数
$$
{\color{orange}\lambda}(p:P).({\color{orange}\lambda}(\varphi:P\to\bot).\varphi(p)).
$$
爆炸规则 $\bot\to P$ 也就是一个空函数 (总是能够构造出来). 但是 RAA 就无法推出, 因为我们需要做到
$$
((P\to\bot)\to\bot)\to P,
$$
但只给出了 $f:(P\to\bot)\to\bot$, 事实上无法从此构造出 $P$ 的实例.

&emsp;&emsp;例如, 我们希望构造类型 $f:(P\to S)\land(Q\to S)\to(P\lor Q\to S)$. $P\lor Q$ 可以视作 union type, $P\land Q$ 可以视作 pair type. 那么:

```python
def f(p):
    u, v = p
    def g(x):
        return u(x) if type(x) == P else v(x)
    return g
```

就是目标.

# 第二章 一阶逻辑

## $\S2.1$ 语义语法

> **定义 2.1.1 (词表)**
>
> - 常量;
>
> - 变量 $x$, $y$, $z$ 或 $x_1$, $x_2$, $\cdots$;
> - 函数 $f$, $g$, $h$ 或 $f_1$, $f_2$, $\cdots$;
> - 谓词 $\bot$, $=$, $P$, $Q$ 或 $P_1$, $P_2$, $\cdots$;
> - 连接词 $\land$, $\lor$, $\to$, $\lnot$, $\leftrightarrow$;
> - 辅助词 $($, $)$, $,$;
> - 量词 $\A$, $\E$.

> **定义 2.1.2 (term)**
>
> &emsp;&emsp;定义集合 $\u{TERM}$ 是符合以下要求中最小的:
>
> - 任何常量 $c\in\u{TERM}$, 任何变量 $x\in\u{TERM}$;
> - 如果 $t_1,t_2,\cdots\in\u{TERM}$, 则对任何函数 $f$, $f(t_1,t_2,\cdots)\in\u{TERM}$.

> **定义 2.1.3 (formula)**
>
> &emsp;&emsp;定义集合 $\u{FOR}$ 是符合以下要求中最小的:
>
> - 任何 $P$ 和 terms $t_1,t_2,\cdots$, $P(t_1,t_2,\cdots)\in\u{FOR}$;
> - 对任意 $\varphi,\psi\in\u{FOR}$, $\lnot\varphi,\varphi\to\psi,\varphi\leftrightarrow\psi,\varphi\land\psi,\varphi\lor\psi\in\u{FOR}$;
> - 对任意 $\varphi\in\u{FOR}$ 和变量 $x$, $(\A x~\varphi),(\E x~\varphi)\in\u{FOR}$.

&emsp;&emsp;在语义方面, 我们先定义结构:

> **定义 2.1.4 (structure)**
>
> &emsp;&emsp;一个结构是元组:
> $$
> \mathscr A=\br{\begin{array}{cccc}
> 	\u{Universe} & \u{Function} & \u{Predicate} & \u{Constant}\\
> 	\Omega & f:\Omega^n\to\Omega & P\subseteq\Omega^n & a_1,a_2,\cdots\in\Omega
> \end{array}}.
> $$

&emsp;&emsp;例如, $\mathscr A=(\R;\x,\opn{inv};=,<;0,1)$, 称它的类型为 $\lang 2,1;2,2;2\rang$, 它描述了一个怎样的逻辑系统能够与此结构产生语义对应. 设函数 $f\in\mathscr A$ 在这样的逻辑系统中对应符号 $\ol f$, 我们也能引入求值. 对于 $t\in\u{TERM}$:
$$
\ALI{
	\eval c_{\mathscr A} &=c,\\
	\eval x_{\mathscr A} &=x^*,\\
	\eval{f(t_1,t_2)}_{\mathscr A} &= f(\eval{t_1}_{\mathscr A},\eval{t_2}_{\mathscr A});
}
$$
对于 $\varphi,\psi\in\u{FOR}$:
$$
\ALI{
	\eval{P(t_1,t_2)}_{\mathscr A} &= P(\eval{t_1}_{\mathscr A},\eval{t_2}_{\mathscr A}),\\
	\eval{\varphi\to\psi}_{\mathscr A} &= \max\br{1-\eval{\varphi}_{\mathscr A},\eval{\psi}_{\mathscr A}},\\
	\cdots &= \cdots
}
$$
特别地, 对于量词:
$$
\ALI{
	\eval{\A x~\varphi(x)}_{\mathscr A} &= \max_{c\in\Omega}\eval{\varphi(x)}_{\mathscr A|_{x=c}},\\
	\eval{\E x~\varphi(x)}_{\mathscr A} &= \min_{c\in\Omega}\eval{\varphi(x)}_{\mathscr A|_{x=c}}.
}
$$
&emsp;&emsp;接下来考察对变量的替换行为.

> **定义 2.1.5 (free/bounded variables)**
>
> &emsp;&emsp;以 $\opn{V}(t)$ 表示 $t\in\u{TERM}$ 中的所有变量集合, 以 $\opn{FV}(\varphi)$ 表示 $\varphi\in\u{FOR}$ 中所有自由变量的集合, 满足
>
> - $\varphi=P(t_1,t_2)$ 时, $\opn{FV}(\varphi)=\opn{V}(t_1)\cup\opn{V}(t_2)$;
> - $\opn{FV}(\varphi\opn{\square}\psi)=\opn{FV}(\varphi)\cup\opn{FV}(\psi)$;
> - $\opn{FV}(\u Q x~\varphi)=\opn{FV}(\varphi)\setminus\{x\}$.

> **定义 2.1.6 (替换规则)**
>
> &emsp;&emsp;以 $\varphi[t/x]$ 记 "在 $\varphi$ 中将所有变量 $t$ 替换为 $x$" 的语义, 定义为:
>
> - $\varphi=P(t_1,t_2)$ 时, $\varphi[t/x]=P(t_1[t/x],t_2[t/x])$, 这里 $t$ 对 $x$ 一定是自由的;
> - $(\varphi\opn{\square}\psi)[t/x]=\varphi[t/x]\opn{\square}\psi[t/x]$, 要求 $t$ 在 $\varphi$ 和 $\psi$ 中对 $x$ 都是自由的.
> - $(\u Qx~\varphi)[t/x]=\u Qx~\varphi$;
> - $(\u Qy~\varphi)[t/x]=\u Qy~\varphi[t/x]$, 要求 $x\in\opn{FV}(\varphi)$ 或者 \[$t$ 在 $\varphi$ 中对 $x$ 自由且 $y\notin\opn{V}(t)$\].

&emsp;&emsp;然后研究对命题的推导.

> **定义 2.1.7**
>
> &emsp;&emsp;对结构 $\mathscr A$ 和 $\varphi\in\u{FOR}$, 定义 $\models$:
>
> - 若 $\u{FV}(\varphi)=\varnothing$, $\mathscr A\models\varphi$ 当且仅当 $\eval\varphi_{\mathscr A}=1$;
> - 若 $\opn{FV}(\varphi)\neq\varnothing$, $\mathscr A\models\varphi$ 当且仅当 $\mathscr A\models(\A x_1~\A x_2~\cdots~\A x_n~\varphi)$;
> - 若对所有 $\varphi\in\Gamma$ 有 $\mathscr A\models\varphi$, 则称 $\mathscr A\models\Gamma$;
> - 称 $\models \varphi$, 当且仅当对所有相同类型的 $\mathscr A$ 都有 $\mathscr A\models \varphi$;
> - 称 $\Gamma\models\varphi$, 当且仅当 $\mathscr A\models\Gamma$ 给出 $\mathscr A\models\varphi$.

&emsp;&emsp;对于结构, 我们给出公理:

> **公理 2.1.8**
>
> &emsp;&emsp;(i) $\A x~x=x$;
>
> &emsp;&emsp;(ii) $\A x~\A y~x=y\to y\to x$;
>
> &emsp;&emsp;(iii) $\A x~\A y~\A z~(x=y\land y=z)\to(x=z)$;
>
> &emsp;&emsp;(iv) 公理模式:
> $$
> \A x_1~\cdots~\A x_n~\A y_1~\cdots~\A y_n~\bigwedge_{i=1}^n(x_i=y_i)\to t(\seq x1n)=t(\seq y1n),\\
> \A x_1~\cdots~\A x_n~\A y_1~\cdots~\A y_n~\bigwedge_{i=1}^n(x_i=y_i)\to (\varphi(\seq x1n)\leftrightarrow\varphi(\seq y1n)).
> $$

&emsp;&emsp;例如, 考虑结构 $(\Omega;\varnothing;=;\varnothing)$, 考虑公式
$$
\varphi_n:\E x_1~\E x_2~\cdots~\E x_n~\bigwedge_{1\le i<j\le n}\lnot(x_i=x_j),\\
\psi_n:\A x_1~\A x_2~\cdots~\A x_n~\bigvee_{1\le i<j\le n}(x_i=x_j).
$$
它们事实上分别给出 $|\Omega|\ge n$ 和 $|\Omega|<n$.

&emsp;&emsp;再如我们熟知的 Peano 算数:

> **例子 2.1.9 (Peano)**
>
> &emsp;&emsp;定义结构 $(\N;+,\cdot,S;=;0,1)$, 满足公理 $\u{PA}$:
>
> &emsp;&emsp;(i) $\A x~\lnot(S(x)=0)$.
>
> &emsp;&emsp;(ii) $\A x~\A y~S(x)=S(y)\to x=y$;
>
> &emsp;&emsp;(iii) $\A x~\A y~x+S(y)=S(x+y)$;
>
> &emsp;&emsp;(iv) $\A x~\A y~x\cdot S(y)=x\cdot y+x$;
>
> &emsp;&emsp;(v) $\A x~\A y~\A z~(x+y)\cdot z=x\cdot z+y\cdot z$;
>
> &emsp;&emsp;(vi) $\A x~\A y~\A z~x\cdot (y+z)=x\cdot y+x\cdot z$;
>
> &emsp;&emsp;(vii) $\A x~x+0=0$;
>
> &emsp;&emsp;(viii) $\A x~x\cdot 1=x$;
>
> &emsp;&emsp;(ix) 公理模式: $(\varphi(0)\land(\A x~\varphi(x)\to\varphi (S(x))))\to (\A x~\varphi(x))$.

&emsp;&emsp;回到自然推理. 当 $\Gamma\vdash\varphi(x)$ 对所有 $x\notin\opn{FV}(\psi\in\Gamma)$ 都成立时, $\Gamma\vdash\A x~\varphi(x)$, 即
$$
\prv{
	\prv{
		\u{D}
	}{\varphi(x)}\cdots
}{
	\A x~\varphi(x)
}{\A\u{I}}
$$
也有
$$
\prv{
	\A x~\varphi(x)
}{\varphi(t)}{\A\u{E}}
$$
此外可以将 $\E$ 视作 $\lnot\A\lnot$.

上面的 $=$ 公理也有
$$
\prv{}{x=x}{\u{IR}_1}\qquad\prv{x=y}{y=x}{\u{IR}_2}\\
\prv{x=y\quad y=z}{x=z}{\u{IR}_3}\qquad\prv{x_1=y_1\quad\cdots\quad x_n=y_n}{t(\seq x1n)=t(\seq y1n)}{\u{IR}_4}
$$
&emsp;&emsp;*例如*, 证明 $\u{PA}\vdash\A x~0+x=x$. 令后者为 $\varphi(x)$. 那么
$$
\prv{
	\prv{}{\varphi(0)}{\u{PA~vii}}\\
	\qquad
    \prv{
        [0+x=x]_1
    }{
        \prv{
            S(0+x)=S(x)
        }{
            \prv{
                0+S(x)=S(x)
            }{
                \prv{
                    \varphi(x)\to\varphi(S(x))
                }{
                    \A x~\varphi(x)\to\varphi(S(x))
                }{\A\u{I}}
            }{\to\u{I}}_1
        }{\u{PA~iii}}
    }{\u{IR}_4}	
}{
	\A x~\varphi(x)
}{\u{PA~ix}}
$$
(省略了部分 $\u{IR}_x$ 的使用.)

> **定理 2.1.10**
>
> &emsp;&emsp;若公理集 $\Gamma$ 是相容的, 即 $\Gamma\not\vdash\bot$, 则存在结构 $\mathscr A$, 使得 $\mathscr A\models\Gamma$.

> **定义 2.1.11**
>
> &emsp;&emsp;对闭语句 (不含自由变量) 集 (称为定理集) $T$, 若 $T=\{\text{closed}~\varphi:\Gamma\vdash\varphi\}$, 则称 $\Gamma$ 是 $T$ 的公理集.

> **定义 2.1.12**
>
> &emsp;&emsp;称定理集 $T$ 是 Henkin 定理, 当且仅当对所有 $(\E x~\varphi(x))\in T$, 存在一个常量符号 $c$, 使得 $\varphi(c)\in T$.

> **定义 2.1.13**
>
> &emsp;&emsp;称定理集 $T'\supseteq T$ 是 $T$ 的保守扩张, 当且仅当对 $T$ 对应的语言 $L$, 有 $T'\cap L=T$. 即 $T'$ 不会在 $T$ 已有的记号下引入新定理.

> **定理 2.1.14**
>
> &emsp;&emsp;对任意定理集 $T$ 和对应语言 $L$, 存在其保守扩张 $T^*$ 和对应语言 $L^*$, 使得 $T^*$ 是 Henkin 定理.

&emsp;&emsp;*→ Proof.* 直接构造, 对所有 $(\E x~\varphi(x))\in L$, 引入常量符号 $c_\varphi\in L^*$, 引入公理 $(\E x~\varphi(x)\to\varphi(c_\varphi))\in T^*$, 据此得到 $T^*$.

&emsp;&emsp;先证明, $T,(\E x~\varphi(x)\to\varphi(c_\varphi))\vdash\psi\in L$ 给出 $\psi\in T$. 通过符号替换, 只需要说明 $T\vdash(\E x~\varphi(x)\to\varphi(y))\to\psi$, 其中 $y\in L$. 由此依次反推 $T\vdash\A y~(\E x~\varphi(x)\to\varphi(y))\to\psi$, $T\vdash (\E y~(\E x~\varphi(x)\to\varphi(y)))\to\psi$ 和 $T\vdash(\E x~\varphi(x)\to\E y\varphi(y))\to\psi$, 这就给出 $T\vdash\psi$.

&emsp;&emsp;现令 $T_0=T$, $T_1=T_0^*$, ..., $T_\eps=\bigcup_{i=0}^\oo T_i$. 这就给出目标.

&emsp;&emsp;*→ Proof @ 2.1.10* 取 $T$ 对应的 $T_\eps$ 和 $L_\eps$. 定义 $\Omega:=\{\text{closed term (which has no variable)}~t\in L_\eps\}$, 并定义语义
$$
\eval{f(\seq t1n)}:=f(\eval{t_1},\cdots,\eval{t_n})=f(\seq t1n),\\
\eval{P(t_1,t_2)}:=\CAS{
	1,&P(t_1,t_2)\in T_\eps;\\
	0,&\text{otherwise}.
}
$$
&emsp;&emsp;现在的问题是, 不能保证 $P$ 和 $\lnot P$ 至少有一个在 $T_\eps$ 中. 遍历 (我们暂时认为是至多可数的) 这些 $P$, 将 $P$ (或者 $\lnot P$) 加入 $T_\eps$, 由此得到 $T_\eps^*$. 修改定义:
$$
\eval{\varphi}:=\CAS{
	1,&\varphi\in T_\eps^*;\\
	0,&\text{otherwise}.
}
$$
现在我们需要修正 $=$. 定义 $\Omega$ 上的等价关系 $t_1\sim t_2$ 当且仅当 $(t_1=t_2)\in T_\eps^*$. 最后令 $\Omega/_\sim$ 为最终的 universe, $\eval{t}=[t]$ ($t$ 所在等价类) 即可.

## $\S2.2$ 集合论

&emsp;&emsp;集合论中有谓词 $=$, $\in$, $\subseteq$ 等等, 有函数 $\varnothing$, $\cap$, $\cup$, $\setminus$ 等等. 有公理:

- **外延公理**:
    $$
    \A x~\A y~((\A z~z\in x\leftrightarrow z\in y)\to (x=y)).
    $$

- **分离公理模式**:
    $$
    \A x~\A w_1~\cdots~\A w_t~\E y~\A z~(z\in y\leftrightarrow(z\in x\land\varphi(z,\seq w1t))).
    $$
    这能给出空集 $\varnothing$ (作为常量符号) 存在, 也能直接定义取交集函数 $\cap$.

- **配对公理** ("$z=\{x,y\}$"):
    $$
    \A x~\A y~\E z~(x\in z\land y\in z).
    $$
    取 $x=y$ 能顺便给出单点集存在, 简记为 $\{x\}$.

- **并集公理** ("$y=\bigcup x$"):
    $$
    \A x~\E y~\A z~\A w~((w\in z\land z\in x)\to w\in y).
    $$
    配对公理和并集公理配合可以给出去并集函数 $\cup$; 另外, 上两条公理其实只保证了 "目标集合的超集存在", 但我们可以用分离公理模式给出目标.

- **幂集公理** ("$y=2^x$"):
    $$
    \A x~\E y~\A z~(z\subseteq x\to z\subseteq y),\quad z\subseteq x:=\A w~(w\in z\to w\in x).
    $$

- **无穷公理** ("$\E\N$"):
    $$
    \E N~(\varnothing\in N\land (\A y~(y\in N\to(y\cup\{y\})\in N))).
    $$

- **替换公理模式** ("$B=f(A)$"):
    $$
    (\A A~\A w_1~\cdots~\A w_t~(\A x~(x\in A\to\E!y~\varphi(y,x,\seq w1t))))\\
    \to (\E B~(\A x~x\in A\to\E y~(\varphi(y,x,\seq w1t)\land y\in B))),
    \\
    \E! y~\varphi(y)\leftrightarrow \E y~(\varphi(y)\land (\A z~(\varphi(z)\to z=y))).
    $$

- **正则公理**:
    $$
    \A x~(x\neq\varnothing\to\E y~(y\in x\land x\cap y=\varnothing)).
    $$

- **选择公理**:
    $$
    \A S~((\A x~x\in S\to x\neq\varnothing)\land (\A x~\A y~(x\in S\land y\in S)\to x\cap y=\varnothing))\\
    \to (\E T~\A x~(x\in S\to\E! y~y\in x\cap T)).
    $$

&emsp;&emsp;接下来引入一些常见的简记. 定义序对 $(x,y):=\{\{x\},\{x,y\}\}$, 再定义笛卡尔积 $S\x T:=\{(x,y):x\in S\land y\in T\}$ (通过并集, 幂集等公理验证其存在), 这样就能定义关系 $R\subseteq S\x T$, $aRb:=(a,b)\in R$, 进一步定义函数关系 $\A a~\E! b~aRb$.

&emsp;&emsp;接下来我们研究集合公理系统的完备性.

> **定理 2.2.1 (Gödel 不完备性)**
>
> &emsp;&emsp;存在集合公理系统下的命题 $\varphi$, $\varphi$ 无法被证明也无法被证伪.

&emsp;&emsp;*→ Proof.* 沿用公理系统下的 Peano 整数, 任给出对字母表的编码, 例如
$$
\begin{array}{cccccccc}
	1 & 2 & 3 & 4 & 5 & 6 & 7 & 8\\
	\land & \to & \lnot & \bot & = & ( & ) & \E\\ \hline
	9 & 10 & 11 & 12 & 12~00 & 12~00~00 & \cdots\\
	\A & \varnothing & 1 & x_0 & x_1	& x_2 & \cdots
\end{array}
$$
采用 $100$ 进制, 拼接符号得到字符串编码 (但我还是觉得素数编码更舒服), 设 $\ul{\varphi}$ 表示 $\varphi$ encode 出的自然数. 由此容易定义 $\u{TERM}$ 的编码集合 $\ul{\u{TERM}}$. 接下来定义可证明的集合 $\ul{\u{PROV}}$, 后续的构造你应该在各种科普里熟悉了, 且比较的 dirty, 略去.

&emsp;&emsp;*→ Proof 2nd.* 或者, 考虑图灵机 $\u{Verifier}(\ul\varphi,\u{proof})\to\{\u{accept},\u{reject}\}$, 假设这台图灵机是完备的, 即真命题存在 $\u{proof}$, 假命题不存在 $\u{proof}$, 那么可以构造图灵机 $\u{Test}(\ul{\varphi})$:
$$
\ALI{
	&\u{Test}(\ul{\varphi}):\\
	&\quad \text{enumerate~proof}~\pi:\\
	&\qquad \text{if }\u{Verifier}(\ul\varphi,\pi)\to\u{accept}:\\
	&\qquad\quad \text{output true}\\
	&\qquad \text{if }\u{Verifier}(\ul{\lnot\varphi},\pi)\to\u{accept}:\\
	&\qquad\quad \text{output false}
}
$$
而我们可以用 $\varphi$ 描述任意图灵机在任意输入下会停机这一命题, 进而得到停机问题的判定器, 但停机问题是不可判定的.

# 第三章 初等数论

&emsp;&emsp;本章起, 我们自由地使用一阶逻辑符号而只把它们视为自然语言的简写. (人话: 不魔怔了.)

## $\S3.1$ 基本符号与性质

&emsp;&emsp;抄点啥笔记呢? 看看二次剩余吧家人们.

> **定义 3.1.1**
>
> &emsp;&emsp;称 $r$ 是一个模 $p$ 的二次剩余, 当且仅当存在 $x$ 使得 $r\equiv x^2\pmod p$.

&emsp;&emsp;有一个明显的必要条件: 因为 $x^{p-1}\equiv 1$, 所以必须有 $r^{\frac{p-1}{2}}\equiv 1$. 令 Legendre 记号
$$
\br{\frac{x}{p}}:=\CAS{
	0,&x=0;\\
	1,&x\equiv y^2;\\
	-1,&\text{otherwise}.
}
$$
注意到 $x^{p-1}-1=\prod_{\alpha\in\Z_p^*}(x-\alpha)\equiv 0$, 而 $x^{p-1}-1=(x^{\frac{p-1}{2}}-1)(x^{\frac{p-1}{2}}+1)$, 所以每个 $x-\alpha$ 都恰好是左侧或右侧的因式, 也即是它们中某个的根:
$$
(x-\alpha)\mid(x^{\frac{p-1}{2}}+1)\Eq\alpha^{\frac{p-1}{2}}\equiv -1,\\
(x-\alpha)\mid(x^{\frac{p-1}{2}}-1)\Eq\alpha^{\frac{p-1}{2}}\equiv 1.
$$
而我们已知 $x\mapsto x^2$ 是二对一的, 所以 $\alpha^{\frac{p-1}{2}}\equiv 1$ 这一半就是二次剩余.

# 第四章 群论

&emsp;&emsp;只在 lww 笔记的基础上补充一些内容.

## $\S4.1$ 群同态

> **定理 4.1.1**
>
> &emsp;&emsp;对任意 $H,K\le G$, 有
> $$
> |HK|=\frac{|H||K|}{|H\cap K|}.
> $$

&emsp;&emsp;*→ Proof.* 令 $I=K\cap H$ 是群, 记 $H/I$ 表示 $I$ 在 $H$ 的左陪集集合, 考虑映射
$$
\varphi: K/I\to KH/H,\quad kI\mapsto kH.
$$
它是单射: $kH=k'H$ 给出 $k'^{-1}k\in K\cap H$, 则 $kI=k'I$. 它也自然是满射.

&emsp;&emsp;接下来见 lww 笔记 <u>11.9.4~11.9.6</u>.

> **定理 4.1.2**
>
> &emsp;&emsp;若 $K\nsubg G$, $H\le G$, 则已知 $K\cap H\nsubg H$, 且
> $$
> H/(K\cap H)\simeq HK/K.
> $$

&emsp;&emsp;*→ Proof.* 考虑 $\varphi:H\to G/K,~h\mapsto hK$, 它商掉 $\ker\varphi$ 并诱导出的 $\ol{\varphi}$ 就是需要的同构.

> **定理 4.1.3**
>
> &emsp;&emsp;若 $H\nsubg G$, $K\nsubg G$, $H\le K$, 则
> $$
> K/H\nsubg G/H
> $$
> 且
> $$
> G/K\simeq(G/H)/(K/H).
> $$

&emsp;&emsp;*→ Proof.* 考虑 $f:G/H\to G/K,~gH\mapsto gK$, 它的 kernel
$$
\ker f=\{gH:gK=K\}=K/H.
$$

> **定理 4.1.4**
>
> &emsp;&emsp;对任意有限生成的 Abel 群 $G$, 有
> $$
> G\simeq \Z\x\cdots\x\Z\x\Z_{n_1}\x\cdots\x\Z_{n_t}.
> $$

&emsp;&emsp;*→ Proof.* (事实上, 可以令标量乘法 $\x:\Z\to G\to G,~n\mapsto g\mapsto g+\cdots g$, 这样 $G$ 是有限生成的 $\Z$-模, $\Z$ 是 PID, 定理给出的就是结构定理.)

&emsp;&emsp;设 $G$ 可由 $t$ 个元素生成, 且所有由 $<t$ 个元素生成的子群满足了定理. 考虑 $f:\Z^t\to G,~(\seq c1t)\mapsto c_1a_1+\cdots c_ta_t$, 取绝对值之和最小的非 $0$ 的 $(\seq c1t)\in\ker f$, 断言: 可以适当取生成元, 使得 $c$ 中只有一个数非 $0$.

&emsp;&emsp;否则, 若 $|c_1|\ge|c_2|>0$, 现在 $\lang \seq a1t\rang=G$, $c_1a_1+\cdots+c_ta_t=0$, 那么
$$
(c_1-c_2)a_1+c_2(a_2+a_1)+\cdots=0,
$$
且 $\lang a_1,a_2+a_1,a_3,\cdots\rang=G$, 这组生成元给出同态 $f'$, 这样 $(c_1-c_2,c_2,\cdots)\in\ker f'$ 且绝对值减小.

&emsp;&emsp;现在, 我们取出了 $(m,0,\cdots)\in\ker f$, 我们知道 $\ord a_1=m$.

## $\S4.2$ 群作用

> **定理 4.2.1**
>
> &emsp;&emsp;设 $G\actl X$, $y=gx\in Gx$, 则 $\Stab_G(y)=g\Stab_G(x)g^{-1}$.

&emsp;&emsp;是显然的.

&emsp;&emsp;考虑 $\mathfrak S_n$ 上的共轭作用 $a:\sigma\mapsto\Ad_\sigma$, 对于 $\tau$, 它的 $\mathfrak S_n$-轨道是所有与之 partition type (轮换分解的轮换大小可重集) 相同的置换. 考虑一般的共轭作用 $G\actl G,~g\mapsto\Ad_g$ 我们有,
$$
\frac{|G|}{|\Stab_G(x)|}=(G:\Stab_G(x))=|Gx|.
$$
这是因为 $\Stab_G(x)\backslash G\to Gx,~\Stab_G(x)g\mapsto gx$ 给出双射. 据此有 (<u>lww 11.5.6</u> 及推论)
$$
|X|=\sum_{Gx\in G\backslash X}(G:\Stab_G(x)).
$$
习惯上, 我们提出中心, 以 $Z_G(x)$ 记 $x$ 的中心化子群, 则:
$$
|X|=|Z(G)|+\sum_{G\backslash X\ni|Gx|\ge 2}(G:Z_G(x)).
$$

> **定理 4.2.2**
>
> &emsp;&emsp;对 $p$-群 ($|G|=p^r$), $Z(G)\neq\{1\}$.

&emsp;&emsp;*→ Proof.* 根据上式, $p^r=|Z(G)|+p(\cdot)\Ra p\mid|Z(G)|$.

> **定义 4.2.3**
>
> &emsp;&emsp;称 $H\le G$ 是一个 $p$-Sylow 子群, 当且仅当 $|H|=p^r$ 且 $p^{r+1}\nmid|G|$.

> **定理 4.2.4 (Sylow)**
>
> &emsp;&emsp;对任意群 $G$:
>
> &emsp;&emsp;(i) 存在 $p$-Sylow 子群;
>
> &emsp;&emsp;(ii) 对 $p$-Sylow 子群 $P$ 和 $p$-子群 $Q$, 存在 $g$ 使得 $Q\le gPg^{-1}$ (推论有: 任意两个 $p$-Sylow 子群共轭; $p$-Sylow 子群正规当且仅当它唯一);
>
> &emsp;&emsp;(iii) 设 $n_p$ 为 $p$-Sylow 子群的个数, $|G|=p^rm$, 那么 $n_p\mid m$ 且 $n_p\equiv 1\pmod p$.

&emsp;&emsp;*→ Proof.* 不妨 $|G|=p^rm$, 有 $|G|=|Z(G)|+\sum(G:Z_G(x))$.

&emsp;&emsp;(i) 若 $p\mid Z(G)$, 由 <u>定理 4.1.4</u>, 存在 $P\simeq\Z_{p^t}$ 和 $Q$ 使得 $Z(G)=P\x Q$. 这时 $|G/P|=p^{r-t}m$, 归纳地, 取它的一个 $p$-Sylow 子群 $S/P\le G/P$, 这样有 $S$ 满足 $|S|=p^tp^{r-t}=p^r$, 是 $G$ 的 $p$-Sylow 子群.

&emsp;&emsp;若 $p\nmid Z(G)$, 则必有 $x$ 使得 $p\nmid(G:Z_G(x))$, 于是 $p^r\mid |Z_G(x)|$, 归纳地取出 $Z_G(x)$ 的 $p$-Sylow 子群即可.

&emsp;&emsp;(ii) 考虑左平移作用 $Q\x G/P\to G/P$ (注意这与上一命题的符号有差异), $p\nmid |G/P|=\sum(Q:\Stab(q_i))$, 所以可以取出一个轨道 $p\nmid |Q\cdot gP|=|Q/Q'|$, 其中 $Q'=\{q\in Q:qgP=gP\}=\Stab_Q(gP)\le Q$, 于是 $Q=Q'$.

&emsp;&emsp;(iii) *ltr 说下节课讲. 下节课忘了.*

# 第五章 环

&emsp;&emsp;初步的环知识可见 <u>lww 笔记 3.1</u>. (在以 "Ring" 称含幺环的文化里, 似乎会把不含幺的环称作 "Rng".) 这里我们认为 Integral Ring (整环) 是不含零因子的环; Integral Domain (整区?) 是无零因子的交换环 (对应 lww 的整环).

## $\S5.1$ 环同态与同构

&emsp;&emsp;可见 <u>lww 笔记 3.2</u>. 类似群上的结构, 对于同态 $f:R\to S$, 我们断言: 能够将 $\ker f$ 在 $R$ 中商掉而不丢失同态信息. 交换图如下, $q$ 是商映射, $\iota$ 是嵌入.
$$
\begin{array}{ccc}
	R & \overset{f}\to & S\\
	q\downarrow & & \uparrow \iota\\
	R/(\ker f) & \overset{\sim}{\underset{\E!\ol f}{\to}} & \im f
\end{array}
$$
类似地, 若 $A$ 是子环, $I$ 是理想, 可以验证 $A+I$ 是子环, $A\cap I$ 是 $A$ 的理想, 有
$$
(A+I)/I\simeq A/(A+I).
$$
若 $I\sub J$ 都是理想, 有
$$
R/J\simeq (R/I)/(J/I).
$$
还有
$$
\{J~\text{ideal}:J\supset I\}\leftrightarrow \{J~\text{ideal}:J\sub R/I\},\\
J\mapsto J/I.
$$
&emsp;&emsp;先来研究 $\ker f$ 的性质. 对 $a,b\in\ker f$, 显然 $f(a)=f(b)=0\Ra f(a+b)=f(ab)=0$. 对任意 $x\in R$, 也有 $f(ax)=f(a)f(x)=0$. 于是 $(\ker f,+)\le (S,+)$, 且 $\A a\in\ker f,~\A x\in R,~\{ax,xa\}\subset\ker f$, 则 $\ker f$ 是一个理想. 可见 <u>lww 笔记 6.1</u>.

&emsp;&emsp;一些环的例子:

- 自同态环. $M$: Abel 群. 则 $(\End(M),+,\circ,0_{M\to N},\id_{M\to M})$ 是环.
- 函数环. $R$: 环. $X$: 集合. 则 $R^X$ 同上地构成环.
- 多项式环. $R$: 交换环. 则 $R[X]$ 是多项式环.
- 群环 $\DS R[G]:=\l\{\sum_{i}^{\text{finite}}a_ig_i:a_i\in R,g_i\in G\r\}$ (运算即直觉结果). 其中 $G$ 是半群.
- 循环群环 $R[\Z_n]\simeq R[X]/(X^n-1)$; $\R[\N]\simeq R[X]$.
- 四元数环 (可见 <u>lww 笔记 10.8</u>), 这是一个不交换的除环.

&emsp;&emsp;对于集合 $S\sub R$, 记 $(S)$ 为包含 $S$ 的最小理想, 称为由 $S$ 生成的理想. 特别地, $S=\{s\}$ 时, $(s)$ 称为主理想.

&emsp;&emsp;明显不存在非平凡理想的交换环是域. 对于不存在非平凡理想的一般环 $R$, 我们称之为简单环 (或单环). 对于理想 $I,J$, $I+J$ 本身就是理想. 注意到 $IJ:=\l(\l\{ij:i\in I,j\in J\r\}\r)\sub I\cap J$

&emsp;&emsp;称 $I,J$ 互素, 当且仅当 $I+J=R$.

> **命题 5.1.1**
>
> &emsp;&emsp;对交换环 $R$, 若 $I+J=R$, 则 $IJ=I\cap J$.

&emsp;&emsp;*→ Proof.* 只证 $I\cap J\sub IJ$. 取 $a\in I$, $b\in J$ 使得 $a+b=1$. 对 $x\in I\cap J$, 有
$$
x=(a+b)x=\underset{\in A}{I}\overset{\in J}{x}+\underset{\in J}{b}\overset{\in I}{x}.
$$
&emsp;&emsp;对理想 $I\sub R$, 定义商环 $R/I=\{a+I:a\in R\}$, 按照定义可以验证它是一个环.

> **定理 5.1.2 (CRT)**
>
> &emsp;&emsp;对于交换环 $R$ 和其若干互素理想 $\seq I1k$, 有
> $$
> R/I_1\ops\x R/I_k\simeq R/(I_1\cdots I_k).
> $$

&emsp;&emsp;*→ Proof.* 考虑 $f:R\to R/I\x R/J,~r\mapsto (r+I,r+J)$, 则 $\ker f=I\cap J=IJ$, 现希望 $f$ 是满的. 对于任意 $(r+I,s+J)$, 注意到 (?)

## $\S5.2$ 整环与多项式环的性质

&emsp;&emsp;称 $u\in R$ 是单位, 当且仅当 $\E u^{-1}\in R,~uu^{-1}=u^{-1}u=1$, $R^\x$ 表示 $R$ 的单位集合, 它是 $R$ 的子环.

&emsp;&emsp;对整环 $R$, 定义分式域 $\opn{Frac}(R):=R\x (R\setminus\{0\})/\sim$, 其中 $(a,b)\sim(c,d)\Eq ad=bc$.

&emsp;&emsp;对整环 $R$, 明显 $\char R$ 要不是 $0$, 要不是素数. 若 $\char R=0$, 有 $\Z\sub R$; 若 $\char R=p$, 有 $\Z/p\Z\sub R$.

&emsp;&emsp;见 <u>lww 笔记 6.1</u>.

> **定理 5.2.1**
>
> &emsp;&emsp;若交换环 $R$ 满足以下两个条件, 则 $R$ 是唯一分解整环.
>
> - 因子链条件: $\nexists (a_1,a_2,\cdots),~\A i,~a_{i+1}\mid a_i\land a_i\nmid a_{i+1}$;
> - 素性条件: 对任何 $s\in R$, $s$ 不可约当且仅当 $s$ 素.

# 第六章 域

## $\S6.1$ 基本记号

&emsp;&emsp;以 $K/F$ 记子域 $F\sub K$, $[K:F]$ 记 $\dim_FK$, 即 $K$ 作为 $F$-向量空间的维数. 同理环的情况:
$$
\char F=\CAS{
	p &\Ra \F_p\sub F,\\
	0 &\Ra \Q\sub F.
}
$$

> **定理 6.1.1**
>
> &emsp;&emsp;对任意有限域 $F$, $|F|=p^d$.

&emsp;&emsp;*→ Proof.* 设 $p=\char F$, 则 $|F|=|\F_p|^{[F:\F_p]}=p^d$.

> **定理 6.1.2**
>
> &emsp;&emsp;对 $K/E/F$, 有 $[K:F]=[E:F][K:E]$.

&emsp;&emsp;*→ Proof.* 设 $m=[E:F]$, $n=[K:E]$, 分别取两个向量空间的基 $\seq\alpha 1n\in E$ 和 $\seq \beta 1n\in K$, 我们说明: $(\alpha_i\beta_j)_{ij}$ 是 $K$ 作为 $F$ 向量空间的一组基.

&emsp;&emsp;对任意 $u\in K$, 唯一地 $u=\sum_{i=1}^nc_i\beta_i$, 其中 $c_i\in E$, 则唯一地 $c_i=\sum_{j=1}^mb_{ij}\alpha_j$. 这样就验证了基底的性质.

&emsp;&emsp;一些例子:

- 对 $F[X]/(f)$, 显然 $[F[X]/(f):F]=\deg f$.
- 我们常记 $F(X)=\opn{Frac}(F[X])$, 而 $[F(X):F[X]]=\oo$.
- 若 $K/F$, $u\in K$, 则记 $F(u)$ 表示最小的包含 $F$ 和 $u$ 的 $K$ 的子域.
- 对非平凡 (保持 $1\mapsto 1$) 的环同态 $f:F\to F'$, 其中 $F$, $F'$ 也是域, 那么 $f$ 总是单射. 不然, $u\in\ker f\setminus\{0\}$, 但 $uu^{-1}=1\in\ker f$.

**扩域**

&emsp;&emsp;对于 $K/F$, $u\in K$, 一方面, 若存在不可约的 $f\in F[X]$ 使得 $f(u)=0$, 则有同构 $F[X]/(f)\simeq F(u)$. 同构可以由环同态 $\varphi: F[X]\to F(u),~g\mapsto g(u)$ 诱导出, 这里 $\ker\varphi=(f)$ (否则与 $f$ 的不可约性矛盾). 此时称 $u$ 为 $F$ 的代数数, $F(u)/F$ 称为代数扩张.

&emsp;&emsp;另一方面, 如果不存在这样的 $f$, 即 $1,u,u^2,\cdots$ 是 $F$-线性无关的, 那么同上的 $\varphi$ 是整环到域的单同态, 它能诱导出同构 $F(X)\simeq F(u)$. 此时称 $u$ 为 $F$ 的超越数, $F(u)/F$ 为超越扩张.

&emsp;&emsp;例如, $\C/\R$, $\Q(\sqrt{p_1},\sqrt{p_2},\cdots)/\Q$ 是代数扩张; $\R/\Q$, $\Q(\pi)/\Q$ 是超越扩张.

&emsp;&emsp;在 <u>高代 I 作业四 9.</u> 中亦有记载, 尺规作图能够做出的长度能够用从 $\Q$ 出发的 $2$ 度扩张达到. 设 $D_0=\Q$, 如果 $D_k/\Q(\sqrt[3]{2})$, 那么 $[D_k:D_0]=2^k$ 但是 $[\Q(\sqrt[3]{2}):D_0]=3$, 矛盾, 所以我们不能倍立方体.

**分裂域**

&emsp;&emsp;$f\in F[X]$ 在 $K/F$ 分裂, 当且仅当存在 $\seq\alpha 1d\in K$ 使得 $f=(X-\alpha_1)\cdots(X-\alpha_d)$. 称 $K$ 是 $f$ 的分裂域, 当且仅当 $f$ 在 $K$ 分裂且恰好 $K=F(\seq\alpha 1d)$.

&emsp;&emsp;对任意 $f\in F[X]$, 我们希望说明, 总存在它的分裂域 $K$. 取不可约的 $g\mid f$, 考虑扩域 $F_1:=F[Z]/(g(Z))$, 在这里,
$$
f(Z)=\frac{f}{g}(Z)\cdot g(Z)=0.
$$
所以 $f$ 在 $F_1$ 内可解. 因此 $(X-Z)\mid f(X)$. 接下来再考虑 $\frac{f(X)}{X-Z}\in F_1[X]$ 的分裂域, 这样, 在不超过 $\deg f$ 次扩张后, 我们一定能找到 $f$ 的分裂域.

&emsp;&emsp;进一步, 所有 $f$ 的分裂域是唯一的.

**有限域**

&emsp;&emsp;对任意 $p^d$, 存在有限域 $|F|=p^d$. 进一步, 它 up to 同构是唯一的, 可以记作 $\F_{p^d}$ 或者 $\opn{GF}(p^d)$.

&emsp;&emsp;考虑 $f=X^{p^d}-X\in \F_p[X]$, 它的形式导数 $\text Df=p^dX^{p^d-1}-1=-1$, $\gcd(f,\text Df)=1$, 所以 $f$ 无重根. 设 $f$ 的分裂域为 $K$, 那么
$$
F_{p^d}:=\{u\in K:f(u)=0\}
$$
是域 (Fermat 小定理 + 二项式展开容易验证).

&emsp;&emsp;设 $f\in\F_q[X]$ 不可约, $\deg f=d$, 则在 $\F_q[X]$ 中 $f\mid (X^{q^d}-X)$. 这是因为, 在 $\F_q[X]/(f)$ 中 $f$ 可解, 设有根 $f(u)=0$. 那么 $(X-u)\mid f$, 而 $(X-u)\mid(X^{q^d}-X)$, 所以 $\gcd(f,X^{q^d}-X)\neq 1$, 这在 $\F_q[X]$ 也成立. 那就只能 $\gcd=f$.

&emsp;&emsp;进一步, 我们有
$$
X^{q^d}-X=\prod_{f~\text{irred.}\in\F_q[X],~\deg f\mid d}f.
$$
对于 $\deg f=d'$ 在 $\F_q[X]$ 不可约, 有 $f\mid(X^{q^d}-X)$. 若 $d'\mid d$, 这给出 $(X^{q^{d'}}-X)\mid (X^{q^d}-X)$. 如果 $d'\nmid d$, 应当
$$
f\mid\gcd(X^{q^d}-X,X^{q^{d'}}-1)=X^{q^{\gcd(d,d')}}-X,
$$
那么 $f$ 在 $\opn{GF}(q^{\gcd(d,d')})$ 分裂, 其次数不超过 $\gcd(d,d')$, 矛盾.

**因式分解**

&emsp;&emsp;对 $f\in \F_q[X]$, 我们可以不断检查 $\gcd(f,\text Df)$ 来求出并消除 $f$ 的重根, 此后不妨 $f$ 无重根.

&emsp;&emsp;现在, 设 $f=g_1\cdot g_2\cdot\cdots$, 其中 $\deg g_1=d_1$, $\deg g_2=d_2$, 二者不可约. 如果 $d_1\neq d_2$, 不妨 $d_1<d_2$, 注意到
$$
g_1\mid \gcd(X^{q^{d_1}}-X,f),\quad g_2\nmid\gcd(X^{q^{d_2}}-X,f),
$$
所以我们通过计算 $\gcd$ (在 $\F_q[X]/(f)$ 上计算 $X^{q^{d_1}}$ 的快速幂) 可以分离 $g_1$ 和 $g_2$.

&emsp;&emsp;现在, 设 $f=f_1\cdot f_2\cdot\cdots$, 其中 $\deg f_i=d$, 均不可约. 我们知道
$$
\F_q[X]/(f)\simeq \F_q[X]/(f_1)\x\F_q[X]/(f_2)\x\cdots.
$$
在 $\F_q[X]/(f)$ 上均匀采样一个 $g$, 它同构地映到 $(g_1,g_2,\cdots)$, 若 $q\neq 2$, 那么 $g_1^{\frac{q^d-1}{2}}+1\in\{0,2\}$ (均匀). 为此计算
$$
\gcd(f,g^{\frac{q^d-1}{2}}+1),
$$
它就能期望均匀地分开 $f$ 的各个因式.

## $\S6.2^*$ Galois 理论

> **定义 6.2.1**
>
> &emsp;&emsp;称 $F\le K$ 是一个正规扩张, 若对任意不可约 $f\in F[X]$, 若 $f$ 在 $K$ 有根, 则 $f$ 在 $K$ 分裂.

&emsp;&emsp;反例如, $\Q(\sqrt[3]{2})$ 并不正规, 因为 $X^3-2=(X-\sqrt[3]{2})f$, $f$ 还是不分裂.

> **定义 6.2.2**
>
> &emsp;&emsp;称 $F\le K$ 是可离扩张, 当且仅当对任意 $k\in K$, 都存在无重根的 $f\in F[X]$, 使得 $f(k)=0$.

> **定理 6.2.3**
>
> &emsp;&emsp;$F\le K$ 是正规扩张, 当且仅当 $K$ 是某个 $f\$

> **定义 6.2.4**
>
> &emsp;&emsp;定义对 $F$ 的 Galois 扩张为正规且可离的 $F\le K$. $G:=\opn{Gal}(K/F)\sub\opn{Aut}(K)$ 为保 $F$ 不变的自同构.

&emsp;&emsp;根据定义, 以下是同构:
$$
\{H\le G\}\longleftrightarrow\{F\le E\le K\},\\
H\overset f\mapsto K^H=\{k\in K:\A h\in H,~h(k)=k\},\\
E\overset g{\mapsto}\opn{Gal}(K/E).
$$

> **引理 6.2.5**
>
> &emsp;&emsp;对于单扩域, 存在 $\alpha\in K$ 使得 $K=F(\alpha)$, $f$ 是 $\alpha$ 的极小多项式, 那么
> $$
> f=(X-\alpha_1)(X-\alpha_2)\cdots(X-\alpha_r),\quad r=[K:F].
> $$
> 则 $\alpha\mapsto\alpha_i$ 唯一确定 $g\in\opn{Gal}(K/F)$.

&emsp;&emsp;抛砖引玉了后面没了 qwq.

# 第七章 计数

## $\S7.1$ 生成函数

&emsp;&emsp;记录一些不过分常见的 facts.

&emsp;&emsp;考虑 EGF, 对 $s_n=|\mathfrak S_n|$, 有 $S=\frac{1}{1-x}$, 对 $c_n=\#\{n\text{-cycle}\}=\frac{1}{(n-1)!}$, 有 $C=\ln\frac{1}{1-x}$. 这意味着
$$
S=\exp C.
$$
因此形式的 $\exp$ 算子给出了 "任意多重组合" 的组合操作.

## $\S7.2$ Burnside 与 Polya

&emsp;&emsp;我们知道, 对于群作用 $G\actl X$, 有记号
$$
Gx:=\{gx:x\in X\},\quad G\backslash X:=\{Gx:x\in X\},\\
\Stab_G(x):=\{g:gx=x\},\quad X^g:=\{x:gx=x\},
$$
以及轨道-稳定子定理: $|G|=|\Stab_G(x)|\cdot |Gx|$.

> **引理 7.2.1 (Burnside)**
>
> &emsp;&emsp;对群作用 $G\actl X$,
> $$
> |G\backslash X|=\frac{1}{|G|}\sum_{g\in G}|X^g|.
> $$

&emsp;&emsp;*→ Proof.* 直接计算
$$
\ALI{
	|G\backslash X| &= \sum_{x\in X} \frac{1}{|Gx|}\\
	&= \sum_{x\in G}\frac{|\Stab(x)|}{|G|}\\
	&= \frac{1}{|G|}\sum_{g\in G}|X^g|.
}
$$
&emsp;&emsp;*例如*, 对 $D_4\actl X=2^{[4]}$,
$$
|D_4\backslash X|=\frac{1}{8}(2^4+2+2+2^2+2^2+2^2+2^3+2^3)=6.
$$
&emsp;&emsp;接下来, 我们取 $F=C^X$, 其中 $X$ 意为物品集合, $C$ 为颜色集合, $F\ni f:X\to C$ 为一种染色方案. 对一个作用 $G\actl X$, 我们典范地将它作为 $G\actl F,~g\mapsto f\mapsto f\circ g$. 此外, 我们定义 $c(g)$ 为 $g$ 在 $G\actl X$ 下的像 (作为 $\mathfrak S_X$ 的元素) 的轮换数. 容易看出
$$
|F^g|=|C|^{c(g)}.
$$
因此我们复述上述引理得到

> **定理 7.2.2 (Polya)**
>
> &emsp;&emsp;对 $G\actl F$,
> $$
> |G\backslash F|=\frac{1}{|G|}\sum_{g\in G}|C|^{c(g)}.
> $$

&emsp;&emsp;*例如*, 对 $F:\Z_n\to C:=[m]$, $G=\Z_n$, $ga:=g+_{\Z_n}a$ (即, 一个只能旋转不能翻转的 $n$ 阶 $m$ 颜色项链), 那么
$$
|G\backslash F|=\frac{1}{|G|}\sum_{g\in\Z_n}m^{c(g)}.
$$
我们熟知 $c(g)=\gcd(g,n)$, 化简之:
$$
|G\backslash F|= \frac{1}{|G|}\sum_{g\in\Z_n}m^{\gcd(g,n)}= \frac{1}{n}\sum_{d\mid n}m^d\varphi(n/d).
$$
&emsp;&emsp;当然, Polya 计数能与 GF 结合. 令 $c_\ell(g)$ 表示 $g$ 在 $G\actl X$ 下的像的长为 $\ell$ 的轮换数, 这允许我们在染色时更细致地对 partition type 描述染色细节. 还是以上文项链为例, 如果我们允许不染色, 令 $Z_k=m+x^k$, 用 $Z_\ell^{c_\ell(g)}$ 替换原式中的 $m^{c_{\ell}(g)}$, 最终 Polya 就能给出 up to $G$ 的, 染色方案数关于不染色珍珠数量的 GF.

&emsp;&emsp;从 GF 出发, 我们又能够通过对 $x$ 赋值来高效计算一些信息. 例如, 若我们要求只能有偶数个珍珠不染色, 就只需要将 $x=\pm 1$ 代入, 再使用普通的 Polya 即可.

&emsp;&emsp;*例如*, 我们来做一道喜闻乐见的烷烃计数 (不考虑手性异构). 设 $n\text{-C}$ 烷烃数的 GF 为 $R(x)$, 在 $\alpha\text{-C}$ 处 Burnside (这里也能认为是 GF 版本的 Polya: 令 $Z_1=R(x)$, $Z_2=R(x^2)$, $Z_3=R(x^3)$), 有
$$
R(x)=1+\frac{x}{6}(R(x)^3+3R(x)R(x^2)+2R(x^3)).
$$
"再往下就不会算了": 指可以 Newton 迭代 with FFT $\mathcal O(n\log n)$ 地算出 $R(x)\bmod x^n$. 可见 [LOJ \#6538](https://loj.ac/p/6538).

&emsp;&emsp;*例如*, 考虑 $\M_{n\x n}(\F)$ 上的共轭关系, 即 $\opn{GL}_n(\F)\actl\M_{n\x n}(\F),~A\mapsto M\mapsto AMA^{-1}$. Jordan 标准型可以作为 $\opn{GL}_n(\C)\backslash\M_{n\x n}(\C)$ 的代表元. 而在有限域 $\F=\F_q$ 上, 我们尝试用 Polya 对共轭矩阵类计数. 以 $2\x 2$ 矩阵为例
$$
|\opn{GL}_2(\F)\backslash\M_{2\x 2}(\F)| = \frac{1}{|\opn{GL}_2(\F)|}\sum_{A\in\opn{GL}_2(\F)}\#\{M\in\M_{2\x 2}(\F):AM=MA\}.
$$
后面需要一些 dirty work. 设 $M=\pmat{a&b\\c&d}$, $A=\pmat{e&f\\g&h}$, 硬算可知 $AM=MA$ 要求了
$$
\CAS{
	bg=cf,\\
	b(e-h)=f(a-d),\\
	g(a-d)=c(e-h).
}
$$
单独处理 $0$ 的情况, 做一些容斥讨论就能得到最终结果. 设 $s=|\opn{GL}_2(\F)|=(q^2-1)(q-1)$, 则:
$$
\ALI{
	|\opn{GL}_2(\F)\backslash\M_{2\x 2}(\F)| &= \frac{1}{s}(qs+(q-1)q^4-q(q-1)+(s-(q-1))\cdot q(q-1))\\
	&= \cdots\\
	&= q^2+q.
}
$$
事实上, $\M_{2\x2}(\F)$ 的共轭类有代表元
$$
\begin{array}{cccc}
	\pmat{\lambda_1\\&\lambda_2} & \pmat{\lambda\\&\lambda} & \pmat{\lambda&1\\&\lambda} & \pmat{a&1\\-b}\\
	\#=\binom{q}{2} & \#=q & \#=q & \#=\frac{q^2-q}{2}
\end{array}
$$
其中 $X^2+aX+b\in\F[X]$ 不可约: 这是 $\F$ 作为非代数闭域相较于 $\C$ 的奇异之处.

# 第八章 概率

## $\S8.1$ 概率空间初步

> **定义 8.1.1**
>
> &emsp;&emsp;设概率空间 $(\Omega,\mathbb P)$, 则 $X:\Omega\to S$ 是一个随机变量, $P(x)$ 称为其概率 (质量) 函数, 满足
> $$
> P(x)=\Pr[X=x]=\Pr[X^{-1}(x)]=\sum_{\omega\in X^{-1}(x)}\mathbb P(\omega).
> $$

&emsp;&emsp;作为理解概率空间的例子, 我们考虑 $\Omega=\{0,1\}^\N$, $\mathbb P:2^\Omega\to[0,1]$, 我们自然地期待

- $S\supset T\Ra \mathbb P(S)\ge \mathbb P(T)$;
- $S\cap T=\varnothing\Ra \mathbb P(S\cup T)=\mathbb P(S)+\mathbb P(T)$;
- $S_i\cap S_j=\varnothing\Ra \mathbb P\br{\bigcup_i S_i}=\sum_i \mathbb P(S_i)$;
- $\mathbb P(\varnothing)=0$, $\mathbb P(\Omega)=1$;
- $\mathbb P(S)=\mathbb P(S\oplus r)$, 其中 $S\ni s\oplus r$ 可以视作 $\F_2$ 向量的加法或者集合的对称差.

然而这样的 $\mathbb P$ 不存在. 我们考虑 $\Omega$ 上的等价关系 $\sim$, $a\sim b$ 当且仅当 $|a\oplus b|<\oo$. 构造
$$
S=\{\text{one representative for each equivalent class in }\Omega/\sim\},
$$
这样
$$
\mathbb P\br{\bigcup_{r\in\mathbb N}(S\oplus r)}=\mathbb P(\Omega)=1=\sum_{r\in\mathbb N}\mathbb P(S).
$$
这导致 $\mathbb P(S)\in[0,1]$ 实际上不存在. 我们知道在这样的无穷集上定义概率并不是平凡的.

> **定义 8.1.2**
>
> - 对 (离散) 随机变量 $X$, 定义其分布函数 $P_X(x)=\Pr[X=x]$;
> - 对随机变量 $X,Y$, 定义其联合分布函数 $P_{XY}(x,y)=\Pr[X=x\land Y=y]$;
> - 对随机变量 $X,Y$, 定义其条件分布 (Markov Kernel) $P_{Y\mid X}(y\mid x)=\Pr[Y=y\mid X=x]$.

&emsp;&emsp;容易看出:
$$
\ALI{
	P_{Y\mid X}(y\mid x) &= \Pr[Y=y\mid X=x]\\
	&= \frac{\Pr[X=x\land Y=y]}{\Pr[X=x]}\\
	&= \frac{P_{XY}(x,y)}{P_X(x)},
}
$$

$$
P_{XY}(x,y)=P_X(x)P_{Y\mid X}(y\mid x).
$$

以下是一些常见的分布:

|      名称      |           记号           |        概率函数 $P(x\in\N)$         |        期望        |          方差           |             PGF             |
| :------------: | :----------------------: | :---------------------------------: | :----------------: | :---------------------: | :-------------------------: |
| Bernoulli 分布 |     $\opn{Bern}(p)$      |      $\CAS{1-p,&x=0\\p,&x=1}$       |        $p$         |        $p(1-p)$         |          $1-p+pz$           |
|    二项分布    |    $\opn{Binom}(n,p)$    |    $\binom{n}{x}p^x(1-p)^{n-x}$     |        $np$        |        $np(1-p)$        |        $(1-p+pz)^n$         |
|    均匀分布    |    $\opn{Unif}([n])$     |       $[x\in[n]]\frac{1}{n}$        |  $\frac{n+1}{2}$   | $\frac{(n+1)(n-1)}{12}$ |  $\frac{z(1-z^n)}{n(1-z)}$  |
|    几何分布    |     $\opn{Geom}(p)$      |           $p(1-p)^{x-1}$            |   $\frac{1}{p}$    |    $\frac{1-p}{p^2}$    |    $\frac{pz}{1-(1-p)z}$    |
|   负二项分布   |   $\opn{NBinom}(r,p)$    |    $\binom{r+x-1}{x}p^r(1-p)^x$     | $\frac{r(1-p)}{p}$ |  $\frac{r(1-p)}{p^2}$   | $\br{\frac{p}{1-(1-p)z}}^r$ |
|  Poisson 分布  | $\opn{Poisson}(\lambda)$ | $\frac{\e^{-\lambda}\lambda^x}{x!}$ |     $\lambda$      |        $\lambda$        |     $\e^{\lambda(z-1)}$     |

如果 $X:\Omega\to S$ 中 $S$ 可以嵌入 $\R$-向量空间, 我们熟知的期望 $\Ex[X]$ 能够被定义. 常见分布的期望已在上表给出. 以推导几何分布的期望为例:
$$
\ALI{
	\Ex[X] &= \Ex[X-1\mid X>1]\\
	&= \sum_{x=2}^\oo(x-1)\Pr[X=x\mid X>1]\\
	&= \sum_{x=2}^\oo(x-1)\frac{P_X(x)}{\Pr[X>1]}\\
	&= \sum_{x=1}^\oo\frac{(x-1)P_X(x)}{1-p}\\
	&= \frac{\Ex[X]-1}{1-p}\\
	&= \frac{1}{p}.
}
$$
&emsp;&emsp;作为理解期望线性性的例子, 考虑在一个胜率为 $p=\frac{1}{2}$ 的游戏上采取倍投法下注, 游戏失败则失去下注金, 获胜则取回双倍下注金, 获胜时戒赌. 从第 $0$ 轮开始, 设随机变量 $X_n$ 表示第 $n$ 轮的收益, 明显
$$
X_n=\CAS{
	2^n,&P=2^{-(n+1)},\\
	-2^n,&P=2^{-(n+1)},\\
	0,&P=1-2^{-n}.
}
$$
有 $\Ex[X_n]=0$ 但是 $\Ex\l[\sum_{n=0}^\oo X_n\r]=1$.

&emsp;&emsp;接下来考虑方差与协方差 (定义略去). 若 $X,Y$ 独立, 容易计算
$$
\ALI{
	\Var[X+Y] &= \Ex[(X-\Ex[X]+Y-\Ex[Y])^2]\\
	&= \Var[X]+\Var[Y]+2\underbrace{\opn{Cov}[X,Y]}_{=0}.
}
$$
常见分布的方差也已在上表给出. 这里补充负二项分布和 Poisson 分布的性质:

- 负二项分布描述了 "扔出 $r$ 个正面硬币时反面的个数", $X\sim\opn{NBinom}(1,p)\Eq X+1\sim\opn{Geom}(p)$.

- $\opn{Poisson}(\lambda)=\lin\opn{Binom}\br{n,\frac{\lambda}{n}}$, 可以验证
    $$
    \ALI{
    	\lin P_{\opn{Binom}}(x) &= \lin\binom{n}{x}\br{\frac{\lambda}{n}}^x\br{1-\frac{\lambda}{n}}^{n-x}\\
    	&= \lin\frac{\cancel{n^{\ul{x}}}}{x!}\br{\frac{\lambda}{\cancel{n}}}^x\underbrace{\br{1-\frac{\lambda}{n}}^n}_{\sim\e^{-\lambda}}\\
    	&= \frac{\e^{-\lambda}\lambda^x}{x!}.
    }
    $$

> **定义 8.1.3**
>
> &emsp;&emsp;对于 $X:\Omega\to \N$, 我们可以定义其概率生成函数 (PGF) 为
> $$
> G_X(z)=\sum_{x}P_X(x)z^x=\Ex[z^X].
> $$

&emsp;&emsp;常见分布的 PGF 也已在上表给出. PGF 清晰地给出了 $\opn{Geom}(p)$ 与 $\opn{NBinom}(r,p)$ 之间的组合意义.

&emsp;&emsp;明显 $G_X(1)=1$, $G_X'(1)=\Ex[X]$; $G_X''(1)+G_X'(1)=\Ex[X^2]$, 这能进一步计算 $\Var[X]$.

&emsp;&emsp;作为使用 PGF 的例子, 我们尝试在投掷 $p$-硬币时, 连续出现两个 H 的期望次数, 设其对应随机变量 $X$. 根据组合意义可以写出
$$
G_X(z)=\underbrace{p^2z^2}_{\text{HH}}+\underbrace{p(1-p)z^2G_X(z)}_{\text{HT}\cdots}+\underbrace{(1-p)zG_X(z)}_{\text{T}\cdots}\\
\Ra G_X(z)=\frac{p^2z^2}{1-(1-p)z-p(1-p)z^2}.
$$
计算 $\Ex[X]=G_X'(1)$ 即可得到结果.

&emsp;&emsp;接下来考虑多变量的情况. 如果 $X,Y$ 独立, 那么
$$
G_{X+Y}(z)=\Ex[z^{X+Y}]=\Ex[z^X]\Ex[z^Y]=G_X(z)G_Y(z).
$$

> **定理 8.1.4 (全概率公式)**
>
> &emsp;&emsp;对随机变量 $X,Y$, 定义 $f(y):=\Ex[X\mid Y=y]$, 那么 $\Ex[X\mid Y]:=f(Y)$ 是一个随机变量, 满足
> $$
> \Ex[X]=\Ex[\Ex[X\mid Y]].
> $$

&emsp;&emsp;设 $X,Y:\Omega\to\N$, 我们尝试描述 $Z=X_1+\cdots+X_Y$.
$$
\ALI{
	G_{\sum_{i=1}^YX_i}(z) &= \Ex[z^{X_1}\cdots z^{X_Y}]\\
	&= \Ex[\Ex[z^{X_1}\cdots z^{X_Y}\mid Y]]\\
	&= \sum_y P_Y(y)\Ex[z^{X_1}\cdots z^{X_y}\mid Y=y]\\
	&= \sum_y P_Y(y)\Ex[z^{X_1}]\cdots\Ex[z^{X_y}]\\
	&= \sum_y P_Y(y)G_X(z)^y\\
	&= G_Y(G_X(z)).
}
$$
另一个关于 PGF 的 trick 是, 我们可以将它复合上 $\e^z$, 得到 $G_X(\e^t)$, 这能方便地给出:
$$
G_X(\e^t)=\Ex[\e^{tX}],\quad \ev{\frac{\d^n}{\d x^n}G_X(\e^t)}_{t=0} = \ev{\Ex[X^n\e^{tX}]}_{t=0}=\Ex[X^n].
$$

## $\S8.2$ 熵

> **定义 8.2.1 (熵)**
>
> &emsp;&emsp;设随机变量 $X$ 的分布为 $P_X$, 则定义其熵
> $$
> H[X]=-\sum_xP_X(x)\log P_X(x)=\Ex\l[\log\frac{1}{P_X(X)}\r].
> $$
> (我们指定 $\exp=\log^{-1}$ 但不规定它们的底数.)

&emsp;&emsp;以下性质是明显的:

- $0\le H[X]\le\log|X|$, 其中 $|X|:=\{x:P_X(x)>0\}$ 为 $X$ 的支撑集.
- $X\sim\opn{Unif}(\Omega)$, 则 $H[X]=\log|\Omega|$.

对 $X\sim\opn{Bern}(p)$, 我们简记 $H[X]=h(p)$.

> **定义 8.2.2 (联合熵, 条件熵)**
>
> &emsp;&emsp;对随机变量 $X,Y$, 定义它们的联合熵
> $$
> H[X,Y]=-\sum_{x,y}P_{XY}(x,y)\log P_{XY}(x,y)=\Ex\l[\log\frac{1}{P_{XY}(x,y)}\r];
> $$
> 它们的条件熵
> $$
> H[Y\mid X]=\sum_x\Pr[X=x]H[Y\mid X=x].
> $$

&emsp;&emsp;展开条件熵的式子,
$$
\ALI{
	H[Y\mid X] &= \sum_x\sum_y P_{Y\mid X}(y\mid x)\log\frac{1}{P_{Y\mid X}(y\mid x)}P_X(x)\\
	&= \sum_x\sum_y P_{XY}(x,y)\log\frac{1}{P_{Y\mid X}(y\mid x)}\\
	&= \Ex\l[\log\frac{1}{P_{Y\mid X}(Y\mid X)}\r].
}
$$
显然
$$
H[X,Y]=H[X]+H[Y\mid X]\\
\Eq\Ex\l[\log\frac{1}{P_{XY}(x,y)}\r]=\Ex\l[\log\frac{1}{P_X(X)}\r]+\Ex\l[\log\frac{1}{P_{Y\mid X}(Y\mid X)}\r].
$$
所以 $H[Y\mid X]$ 直觉上描述了 "去除 $X$ 所含信息后, $Y$ 还含有多少信息". 这样就可以发现以下命题:

> **性质 8.2.3**
>
> &emsp;&emsp;对随机变量 $X,Y$, $H[X\mid Y]\le H[X]$.

&emsp;&emsp;*→ Proof.* 直接计算
$$
\ALI{
	H[X]-H[X\mid Y] &= \Ex\l[\log\frac{1}{P_X(X)}\r]-\Ex\l[\log\frac{1}{\log P_{X\mid Y}(X\mid Y)}\r]\\
	&= \sum_x\sum_y P_{XY}(x,y)\log\frac{P_{XY}(x,y)}{P_X(x)P_Y(y)},
}
$$
Jensen 不等式给出
$$
H[X]-H[X\mid Y]\ge \br{\sum_{x,y}P_{XY}(x,y)}\log\frac{\sum_{x,y}P_{XY}(x,y)}{\sum_x\sum_yP_X(x)P_Y(y)}=0.
$$
这个性质导出如下定义:

> **定义 8.2.4 (互信息)**
>
> &emsp;&emsp;对随机变量 $X,Y$, 定义它们的互信息
> $$
> I[X;Y]=H[X]-H[X\mid Y]=H[X]+H[Y]-H[X,Y]=H[Y]-H[Y\mid X]=I[Y;X].
> $$

&emsp;&emsp;以下性质也都是符合直觉的:

> **性质 8.2.5**
>
> - 对任意函数 $f:S\to T$ (回忆随机变量 $X:\Omega\to S$), 有 $H[X]\ge H[fX]$.
> - 若 $P_{XYZ}(x,y,z)=P_X(x)P_{Y\mid X}(y\mid x)P_{Z\mid Y}(z\mid y)$, 则 $I[X;Y]\ge I[X;Z]$.

## $\S8.3$ 散度

&emsp;&emsp;对于两个分布 $P,Q$, 我们希望衡量它们的某种 "差距". 例如一般的统计距离
$$
\sum_x\frac{|P(x)-Q(x)|}{2}=\sum_x\max(0,P(x)-Q(x)).
$$
这里我们介绍散度.

> **定义 8.3.1 [Kullback-Leibler (KL) Divergence]**
>
> &emsp;&emsp;对两个分布 $P,Q$,
> $$
> \ALI{
> 	D(P\parallel Q) &= \sum_xP(x)\log\frac{P(x)}{Q(x)}\\
> 	&=\Ex_{X\sim P}\l[\log\frac{P(X)}{Q(X)}\r]\\
> 	&=\Ex_{X\sim Q}\l[\frac{P(X)}{Q(X)}\log\frac{P(X)}{Q(X)}\r].
> }
> $$
> 特别地, 若 $|P|\not\subset|Q|$, $D(P\parallel Q):=+\oo$.

&emsp;&emsp;注意 $D(P\parallel Q)$ 与 $D(Q\parallel P)$ 不总是相等.

&emsp;&emsp;简记 $D(\opn{Bern}(p)\parallel\opn{Bern}(q))=d(p,q)$.

> **性质 8.3.2**
>
> &emsp;&emsp;对 $P,Q$ 总有 $D(P\parallel Q)\ge 0$.

&emsp;&emsp;*→ Proof.* $D(P\parallel Q)=\Ex_{X\sim Q}\l[\frac{P(X)}{Q(X)}\log\frac{P(X)}{Q(X)}\r]$, 令 $f(x)=x\log x$, 则
$$
\ALI{
	D(P\parallel Q) &= \Ex_{X\sim Q}\l[f\br{\frac{P(X)}{Q(X)}}\r]\\
	&\overset{\text{Jensen's}}{\ge}f\br{\Ex_{X\sim Q}\br{\frac{P(X)}{Q(X)}}}\\
	&= f(1)=0.
}
$$

> **性质 8.3.3**
>
> &emsp;&emsp;$D(P\parallel\opn{Unif}(\Omega))=\log|\Omega|-H[P]$.

&emsp;&emsp;*→ Proof.* 展开即证.

> **命题 8.3.4 (条件散度)**
>
> &emsp;&emsp;设 $P_{XY}=P_XP_{Y\mid X}$, $Q_{XY}=Q_XQ_{Y\mid X}$, 定义这两个分布的条件散度
> $$
> D(P_{XY}\parallel Q_{XY})=D(P_X\parallel Q_X)+D\l(\l.P_{Y\mid X}\parallel Q_{Y\mid X}{}\r|{}P_X\r),
> $$
> 其中
> $$
> D\l(\l.P_{Y\mid X}\parallel Q_{Y\mid X}{}\r|{}P_X\r)=\sum_x D(P_{Y\mid X=x}\parallel Q_{Y\mid X=x})P_X(x).
> $$

&emsp;&emsp;*→ Proof.* 全 部 展 开.

&emsp;&emsp;一方面, 我们知道 $D(P_{XY}\parallel Q_{XY})\ge D(P_X\parallel Q_X)$. 另一方面, 推广就得到如下链式法则:
$$
D(P_{X_1\cdots X_n}\parallel Q_{X_1\cdots X_n})=\sum_{i=1}^n D\l(\l.P_{X_i\mid X_1\cdots X_{i-1}}\parallel Q_{X_i\mid X_1\cdots X_{i-1}}\r|P_{X_1\cdots X_{i-1}}\r).
$$

> **性质 8.3.5**
>
> &emsp;&emsp;$P,Q\mapsto D(P\parallel Q)$ 是凸的, 即对任意 $P_0,Q_0,P_1,Q_1$:
> $$
> (1-\lambda)D(P_0\parallel Q_0)+\lambda D(P_1\parallel Q_1)\ge D\l((1-\lambda)P_0+\lambda P_1\parallel(1-\lambda)Q_0+\lambda Q_1\r).
> $$

&emsp;&emsp;*→ Proof.* 设 $P_Z=Q_Z=\opn{Bern}(\lambda)$, $P_{X\mid Z=i}=P_i$, $Q$ 同理. 注意到
$$
\ALI{
	D(P_{XZ}\parallel Q_{XZ}) &= 0+D\l(\l.P_{X\mid Z}\parallel Q_{X\mid Z}\r|P_Z\r)\\
	&= \sum_zP_Z(z)D(P_{X\mid Z=z}\parallel Q_{X\mid Z=z})\\
	&= (1-\lambda)D(P_0\parallel Q_0)+\lambda D(P_1\parallel Q_1)\\
	&\overset{\text{Prop. 8.3.4}}\ge D(P_X\parallel Q_X).
}
$$
明所欲证.

> **命题 8.3.6**
>
> &emsp;&emsp;(i) 设由 $P_X$ 导出两个分布 $P_{Y\mid X}$ 和 $Q_{Y\mid X}$, 设 $P_Y(y)=\sum_xP_{Y\mid X=x}(y\mid x)P_X(x)$, $Q_Y$ 同理. 那么
> $$
> D(P_Y\parallel Q_Y)\le D(P_XP_{Y\mid X}\parallel P_XQ_{Y\mid X})=D\l(\l.P_{Y\mid X}\parallel Q_{Y\mid X}\r|P_X\r).
> $$
> &emsp;&emsp;(ii) 设 $P_X$ 和 $Q_X$ 用同一个 $P_{Y\mid X}$ 导出了 $P_Y$ 和 $Q_Y$, 那么
> $$
> D(P_X\parallel Q_X)=D(P_XP_{Y\mid X}\parallel Q_YP_{Y\mid X})-\underbrace{D\l(\l.P_{Y\mid X}\parallel P_{Y\mid X}\r|P_X\r)}_{=0}\ge D(P_Y\parallel Q_Y).
> $$

&emsp;&emsp;证明过程已在不等式中写出.

> **定义 8.3.7 (条件互信息)**
>
> &emsp;&emsp;对随机变量 $X,Y,Z$, 定义以 $Z$ 为条件的条件互信息
> $$
> I(X;Y\mid Z)=H(X\mid Z)+H(Y\mid Z)-H(X,Y\mid Z).
> $$

## $\S8.4$ 集中不等式

&emsp;&emsp;我们关心随机变量偏离其期望一定距离的概率.

> **定理 8.4.1 (Markov's Bound)**
>
> &emsp;&emsp;若随机变量 $X:\Omega\to\R_{\ge 0}$, $\alpha>1$, 则 $\Pr[X\ge\alpha\Ex[X]]\le\frac{1}{\alpha}$.

&emsp;&emsp;是平凡的.

> **定理 8.4.2 (Chebyshev's Bound)**
>
> &emsp;&emsp;若随机变量 $X:\Omega\to\R$, 则
> $$
> \Pr\l[|X-\Ex[X]|\ge a\r]\le\frac{\Var(X)}{a^2}.
> $$

&emsp;&emsp;*→ Proof.* 即 $\Pr[(X-\Ex[X])^2\ge\alpha^2\Var(X)]\le\frac{1}{\alpha^2}$, 这就是 Markov's bound.

&emsp;&emsp;例如, 若 $\seq X1n\sim\opn{Bern}(0.5)$ 两两独立 (注意着不意味着它们完全独立), 设 $\ol X=\frac{1}{n}\sum_iX_i$, 可以验证 $\Ex[\ol X]=\frac{1}{2}$, $\Var(\ol X)=\Theta(n^{-1})$, 利用 Chebyshev's bound 就能给出 $\ol X$ 偏离 $\frac{1}{2}$ 的概率约束. 这个约束比下面的 Chernoff's bound 宽松, 但它不依赖于 $\seq X1n$ 的完全独立性.

> **定理 8.4.3 (Chernoff's Bound)**
>
> &emsp;&emsp;若随机变量 $X:\Omega\to\R$, $\alpha\in\R$, 则
> $$
> \Pr[X\ge \alpha]\le\min_{t>0}\frac{\Ex[\e^{tX}]}{\e^{t\alpha}}.
> $$

&emsp;&emsp;*→ Proof.* 这是因为对任意 $t>0$ 都有
$$
\Pr[X\ge\alpha]=\Pr[\e^{tX}\ge\e^{t\alpha}]\overset{\text{Markov's}}{\le}\frac{\Ex[\e^{tX}]}{\e^{t\alpha}}.
$$
它的一个典型实例就用于估计上文提到的独立同分布的 $\seq X1n\sim\opn{Bern}(p)$. 有

> **推论 8.4.4**
>
> &emsp;&emsp;对独立同分布的 $\seq X1n\sim\opn{Bern}(p)$, 设 $q\in(p,1)$, 则有
> $$
> \Pr\l[\sum_{i=1}^n X_i\ge qn\r]\le \exp(-nd(q\mmid p))\le\e^{-2(p-q)^2n}.
> $$

&emsp;&emsp;*→ Proof.* 选取最合适的 $t$ 以最小化 $f(t):=\frac{p\e^t+(1-p)}{\e^{tq}}$ 即可. 计算
$$
\ALI{
	f'(t) &= \frac{p\e^t\e^{tq}-q\e^{tq}(p\e^t+(1-p))}{\e^{2tq}}\\
	&= \frac{1}{\e^{tq}}\br{(1-q)p\e^t-q(1-p)}.
}
$$
令 $f'(t)=0$, 有
$$
\e^{t^*}=\frac{q(1-p)}{p(1-q)}.
$$
(耐心地) 代回就给出
$$
\ALI{
	f(t^*) &= \br{\frac{1-p}{1-q}}^{1-q}\br{\frac{p}{q}}^q\\
	&=\exp\br{q\log\frac{p}{q}+(1-p)\log\frac{1-p}{1-q}}\\
	&=\exp(-d(q\mmid p)).
}
$$
这给出第一个不等式. 第二个不等式来自 $d(q\mmid p)\ge (p-q)^2\cdot2\log\e$, 参见 <u>作业九 6</u>.

&emsp;&emsp;若独立同分布的 $\seq X1n\sim\opn{Bern}(0.5)$, 我们能感受到 $X:=\sum_iX_i\approx\opn{Norm}\br{\frac{n}{2},\frac{n}{4}}$, Chernoff's bound 比较精确地给出了它的概率密度函数的指数项.

&nbsp;

&emsp;&emsp;这里回忆对 $n!$ 的估计方法.

&emsp;&emsp;由于 $\ln n!=\ln1+\cdots+\ln n$, $\ln x$ 在 $\R_{>0}$ 单增, 因此有估计
$$
\int_1^{n}\ln x\d x\le\ln n!\le\int_1^{n+1}\ln x\d x.
$$
利用上凸性, 也容易得到
$$
\ln n!\ge\int_{\frac{1}{2}}^{n+\frac{1}{2}}\ln  x\d x=\ev{(x\ln x)}_{\frac{1}{2}}^{n+\frac{1}{2}}=\br{n+\frac{1}{2}}\ln\br{n+\frac{1}{2}}-n.
$$
后者已经是前者很好的近似了. 精确地有 (<u>Stirling 公式</u>):
$$
\ln n!=n\ln n-n+\frac{\ln n}{2}+o(1).
$$
&emsp;&emsp;或者, 不严格地, 由于有 $\opn{Poisson}(\lmd)\approx\opn{Norm}(\lmd,\lmd)$, 对照概率密度函数就给出
$$
\frac{\e^{-\lmd}\lmd^n}{n!}\approx\frac{1}{\sqrt{2\pi\lmd}}\e^{-\frac{1}{2}\frac{(x-\lmd)^2}{\lmd}},
$$
令 $n=x=\lmd$, 则
$$
n!\approx \sqrt{2\pi n}\frac{n^n}{\e^n}.
$$
&nbsp;

> **引理 8.4.5**
>
> &emsp;&emsp;对 $n\in\Z_{\ge 1}$ 和 $p\in(0,1)$, $pn\in\Z$, 有
> $$
> \frac{1}{n+1}\exp(nh(p))\le\binom{n}{pn}\le\exp(nh(p)).
> $$

&emsp;&emsp;右侧来源于一个用一串约等号进行意识流估计:
$$
\ALI{
	\binom{n}{t} &= \frac{n!}{t!(n-t)!}\\
	&\approx\frac{\sqrt{2\pi n}\cdot n^n}{\sqrt{2\pi t}\cdot t^t\cdot\sqrt{2\pi(n-t)}\cdot(n-t)^{n-t}}\\
	&\approx \br{\frac{n}{t}}^t\br{\frac{n}{n-t}}^{n-t}\\
	&= \exp\br{nh\br{\frac{t}{n}}}.
}
$$
我们来严格化它.

&emsp;&emsp;*→ Proof @ 8.4.5* 设独立同分布的 $\seq X1n\sim\opn{Bern}(p)$. 一方面, $\Pr\l[\sum_iX_i=pn\r]\le 1$, 因此
$$
\binom{n}{pn}\le\br{\frac{1}{p}}^{pn}\br{\frac{1}{1-p}}^{(1-p)n}=\exp(nh(p)).
$$
另一方面, $\Pr[\sum_iX_i=pn]\ge\frac{1}{n+1}$ (高中数学亦有记载), 同理给出结论.

> **定理 8.4.6 (Sanov's Bound)**
>
> &emsp;&emsp;设独立同分布的 $\seq X1n\sim\opn{Bern}(p)$, $q\in(p,1)$, 不妨 $qn\in\Z$, 则
> $$
> \frac{1}{n+1}\exp(-nd(q\mmid p))\le\Pr\l[\sum_{i=1}^nX_i\ge qn\r]\le (n-qn+1)\exp(-nd(q\mmid p)).
> $$

&emsp;&emsp;*→ Proof.* 设 $t=qn\in[0:n]$, 则利用 <u>引理 8.4.5</u>,
$$
\ALI{
	\Pr\l[\sum_{i=1}^nX_i=t\r] &= \binom{n}{qn}p^{qn}(1-p)^{(1-q)n}\\
	&\approx\exp(nh(q))\exp\br{n\br{q\log p+(1-q)\log(1-p)}}\\
	&=\exp\br{n\br{q\log\frac{p}{q}+(1-q)\log\frac{1-p}{1-q}}}\\
	&= \exp(-nd(q\mmid p)).
}
$$
具体来说, $\approx$ 给出上下界
$$
\frac{1}{n+1}\exp(-nd(q\mmid p))\le \Pr\l[\sum_{i=1}^nX_i=t\r]\le \exp(-nd(q\mmid p)).
$$
而
$$
\max_{t\ge qn}\Pr\l[\sum_{i=1}^n X_i=t\r]\le\sum_{t=qn}^n\Pr\l[\sum_{i=1}^nX_i=t\r]\le(n-qn+1)\max_{t\ge qn}\Pr\l[\sum_{i=1}^n X_i=t\r],
$$
$t=qn$ 处取最大值, 代入上述估计就得到结论.

> **推论 8.4.7**
>
> &emsp;&emsp;设 $\Omega=\{\seq v1L\}$, 对任意 $P:\Omega\to[0,1]$, 简记 $p_i:=P(v_i)$, 对独立同分布的 $\seq X1n\sim P$, 简记 $X\sim P$.  设多重集
> $$
> S=\{\seq X1n\}\longleftrightarrow S:\Omega\to\N,~v_i\mapsto s_i=\sum_{j=1}^n[X_j=s_i].
> $$
> 为 $(\seq X1n)$ 的 type. 给定 type 集合 $A$, 有
> $$
> \max_{S\in A}\frac{1}{(n+1)^{L-1}}\exp(-nD(Q\mmid P))\le\Pr[\{X_i\}_{i=1}^n\in A]\le(n+1)^{L-1}\exp(-nD(Q\mmid P)).
> $$

&emsp;&emsp;*→ Proof.* 我们知道
$$
\Pr_{X\sim P}[\{X_i\}_{i=1}^n=S]=\binom{n}{\seq s1L}p_1^{s_1}\cdots p_L^{s_L}.
$$
设 $q_i=Q(v_i)=\frac{s_i}{n}$, 明显
$$
\frac{1}{(n+1)^{L-1}}\le\Pr_{X\sim Q}[\{X_i\}=S]\le 1,
$$
这给出
$$
\frac{1}{(n+1)^{L-1}}\exp(nH(Q))\le\binom{n}{\seq s1L}\le\exp(nH(Q)).
$$
&emsp;&emsp;对于一个 type 的集合 $A$, 用类似 <u>定理 8.4.6</u> 的估计,
$$
\ALI{
	\Pr_{X\sim P}[\{X_i\}\in A] &= \sum_{S\in A}\Pr_{X\in P}[\{X_i\}=S]\\
	&\le|A|\max_S\exp(-nD(Q\mmid P))\qquad\br{q_i:=\frac{s_i}{n}}\\
	&\le(n+1)^{L-1}\max_S\exp(-nD(Q\mmid P)).
}
$$
同理有下界
$$
\Pr_{X_i\in P}[\{X_i\}\in A]\ge\max_{S\in A}\frac{1}{(n+1)^{L-1}}\exp(-nD(Q\mmid P)).
$$

# 第九章 离散 Fourier 变换

## $\S9.1$ 从连续到离散

&emsp;&emsp;我们研究离散函数 $G\to\C$, 其中 $G$ 为有限 Abel 群. 结构定理给出, $G\simeq \Z_{n_1}\x\cdots\x\Z_{n_k}$. 先来寻找离散变换的 kernel.

> **定义 9.1.1**
>
> &emsp;&emsp;Character $\chi:G\to\mathbb \C^\x$ 是同态 (由于 $G$ 有限, 这等价于 $\chi:G\to\mathbb S^1$ 是同态), 对 $G\ni a\overset\sim\mapsto(\seq a1k)$, 定义
> $$
> \chi_a:G\to\C,~x\mapsto\omega_{n_1}^{a_1x_1}\cdots\omega_{n_k}^{a_kx_k}.
> $$

&emsp;&emsp;明显 $\hat G:=\{\chi_a\}_{a\in G}$ 是一个群, $\chi_a\chi_b=\chi_{a+b}$, $\chi_a^{-1}=\ol{\chi_a}=\chi_{-a}$. 一个有趣的性质是 $\chi_a(x)=\chi_x(a)$.

&emsp;&emsp;接下来引入 $\C^G$ 上的内积, 自然地定义 $(f\mid g):=\sum_{x\in G}f(x)\ol g(x)$, 容易验证
$$
\ALI{
	(\chi_a\mid \chi_b) &= \sum_{x\in G}X_{a-b}(x)\\
	&= \sum_{x\in G}\prod_{i=1}^k\omega_{n_i}^{(a_i-b_i)x_i}\\
	&= \prod_{i=1}^k\sum_{x_i\in\Z_{n_i}}\omega_{n_i}^{(a_i-b_i)x_i}\\
	&= \prod_{i=1}^k n_i[a_i-b_i=0]\\
	&= [a=b]|G|.
}
$$
所以 $\hat G$ 中的元素两两正交, 而 $\dim_\C \C^G=|G|$, 所以 $\hat G$ 就是 $\C^G$ 的正交基. 更一般地:

> **引理 9.1.2**
>
> &emsp;&emsp;对任意 character $\chi$, $\sum_{x\in G}\chi(x)=[\chi=\chi_0]|G|$.

&emsp;&emsp;*→ Proof.* $\chi=\chi_0$ 时显然, 若 $\chi(x^*)\neq 1$, 则
$$
\chi(x^*)\sum_{x\in G}\chi(x)=\sum_x\chi(x^*)\chi(x)=\sum_{x\in G}\chi(x^*+x)=\sum_{x\in G}\chi(x),
$$
所以 $\sum_{x\in G}\chi(x)=0$.

&emsp;&emsp;这告诉我们 $\hat G$ 给出了所有 characters (否则与 $\dim_\C\C^G=|\hat G|$ 矛盾). 那么对 $f:G\to\C$, 设 $f=\sum_b\hat f(b)\chi_b$, 就有
$$
\frac{1}{|G|}(f\mid \chi_a)=\frac{1}{|G|}\sum_{b\in G}\hat f(b)(\chi_b\mid \chi_a)=\hat f(a).
$$
以及
$$
\|f\|_2^2:=(f\mid f)=|G|\sum_{a\in G}|\hat f(a)|^2=|G|\|\hat f\|_2^2.
$$
这是我们的离散 Parseval 等式! $\hat.:\C^G\to \C^G$ 显然是一个 $\C$-线性映射.

&emsp;&emsp;定义卷积 $(f* g)(x):=\sum_{y+z=x}f(y)g(z)$, 那么
$$
f\cdot g=\sum_{a,b}\hat f(a)\hat g(b)\chi_a\chi_b=\sum_{a,b}\hat f(a)\hat g(b)\chi_{a+b},
$$
因此 $\widehat{f\cdot g}=\hat f*\hat g$.

&emsp;&emsp;接下来的故事我们也很熟悉了: 考虑将 $\hat f$ 再次与 $\chi$ 内积, 计算
$$
\ALI{
	(\hat f\mid \chi_y) &= \sum_{a\in G}\hat f(a)\ol{\chi_y}(a)\\
	&= \sum_{a\in G}\sum_{x\in G}\frac{1}{|G|}f(x)\chi_a^{-1}(x)\chi_y(a)^{-1}\\
	&= \sum_{a\in G}\sum_{x\in G}\frac{1}{|G|}f(x)\chi_a^{-1}(x+y)\\
	&= \frac{1}{|G|}\sum_{x\in G}f(x)\sum_{a\in G}\chi_{x+y}^{-1}(a)\\
	&= f(-y).
}
$$
刚刚计算了 "点积的 DFT 是 DFT 的卷积", 反过来也有
$$
\ALI{
	\widehat{f*g}(a) &= \frac{1}{|G|}(f*g\mid \chi_a)\\
	&= \frac{1}{|G|}\sum_{x\in G}(f*g)(x)\ol{\chi_a}(x)\\
	&= \frac{1}{|G|}\sum_{x\in G}\sum_{y+z=x}f(y)g(z)\ol{\chi_a}(x)\\
	&= \frac{1}{|G|}\sum_{y,z}f(y)g(z)\ol{\chi_a}(y)\ol{\chi_a}(z)\\
	&= \frac{1}{|G|}\br{\sum_yf(y)\ol{\chi_a}(y)}\br{\sum_{z}g(z)\ol{\chi_a}(z)}\\
	&= |G|\hat f(a)\hat g(a).
}
$$
&emsp;&emsp;总结一下, 我们得到了:

- $\hat G=\{\chi_a:a\in G\}$ 是 $\C^G$ 的正交基;
- $\hat\cdot\in\opn{Aut}_\C(\C^G)$ 是 $C$-向量空间 $\C^G$ 的自同构;
- $\widehat{f\cdot g}=\hat f*\hat g$, $\widehat{f*g}=|G|\cdot \hat f\cdot\hat g$.

## $\S9.2$ DFT 的应用

&emsp;&emsp;一个典型应用是简化卷积的计算. 例如, 对独立同分布的 $\seq X1n\sim P_X:G\to\R$, 那么
$$
P_{X_1\ops+X_n}=P_X^{*n}\Ra\widehat{P_{X_1\ops+X_n}}=|G|^{n-1}\widehat{P_X}^{\cdot n}.
$$
&emsp;&emsp;另一个应用场景是 Bool 函数分析 设 $f:\Z_2^n\to\{0,1\}$, $f'=(-1)^f=1-2f:\Z_2^n\to\{\pm 1\}$. 先对 $A\sub[n]$, $\alpha:A\to\{0,1\}$, 定义
$$
f_{A\gets \alpha}(x)=f(x_{A\gets\alpha}),\quad x_{A\gets\alpha}[i]=\CAS{x[i],&i\in A;\\\alpha(i),&i\notin A.}
$$
先考虑 $A=\{1\}$, $\alpha\in\{0,1\}$ 的简单情况. 注意此时 $\chi_a(x)=\prod(-1)^{a\odot x}=(-1)^{a\cdot x}$, 那么
$$
\ALI{
	\Ex_{\alp}\l[\widehat{f_{A\gets\alpha}}(a)\r] &= \frac{1}{2^n}\Ex_\alp(f_{A\gets\alpha}\mid \chi_a)\\
	&= \frac{1}{2^n}\Ex_\alp\sum_{x\in G}f_{A\gets\alpha}(x)\chi_a(x)\\
	&= \frac{1}{2^n}\sum_{x_1}\sum_{x_{\u{tail}}}\Ex_\alp[f(\alp::x_{\u{tail}})]\chi_{a_1}(x_1)\chi_{a_{\u{tail}}}(x_{\u{tail}})\\
	&= \frac{1}{2^n}\cdot\frac{1}{2}\sum_{x_1}\sum_{x_{\u{tail}}}\sum_\alp f(\alpha::x_{\u{tail}})\chi_{a_1}(x_1)\chi_{a_{\u{tail}}}(x_{\u{tail}})\\
	&= \frac{1}{2^n}\sum_{x\in\Z_2^n}f(x)\chi_{a_1}(x_1)\chi_{a_{\u{tail}}}(x_{\u{tail}})\\
	&= \CAS{
		0,&a_1=1;\\
		\hat f(a),&a_1=0.
	}
}
$$
推广地, 对任意 $A\sub[n]$, 类似可以计算
$$
\Ex_\alp\l[\widehat{f_{A\gets\alp}}(a)\r]=\CAS{
	0,&a[A]\neq0;\\
	\hat f(a),&a[A]=0.
}
$$
&emsp;&emsp;最后, 考虑随机的 $A$, $\Pr[i\in A]=p$, 那么
$$
\Ex_{A,\alp}\l[\widehat{f_{A\gets\alp}}(a)\r]=p^{\|a\|_1}\hat f(a).
$$

# 第十章 编码

&emsp;&emsp;**我没有完全学懂本章, 因而请批判性地使用本章笔记.**

&emsp;&emsp;(本章在熵中取 $\log=\log_2$.) 对随机变量 $X\sim P$ 的传递可以抽象为如下过程:
$$
X\underset{E}{\overset{\u{encoder}}\longrightarrow} c\in\{0,1\}^*\underset{D}{\overset{\u{decoder}}\longrightarrow}\hat X.
$$
当然要求

- $D(E(x))=x$;
- $\Ex[|c|]$ 尽可能小.

## $\S10.1$ 可变长无损编码

&emsp;&emsp;设 $|X|=\{x_1,x_2,\cdots\}$, 不失一般性地设 $P(x_{i+1})\le P(x_i)$. 如果我们只发送一次信息, 最优的 encoder 显然是
$$
E(x_{\ol{1b_1b_2\cdots}})=\ol{b_1b_2\cdots}.
$$
记 $L(x)=|E(x)|$, 可以说明:

> **命题 10.1.1**
>
> &emsp;&emsp;上述 $H(X)-H(L)\le\Ex[L]\le H(X)$.

&emsp;&emsp;*→ Proof.* 注意到 $P(x_i)\le \frac{1}{i}$, $L(x_i)=\lfloor\log_2i\rfloor$. 右侧有
$$
\Ex[L]=\sum_iP(x_i)\lfloor\log_2i\rfloor\le\sum_iP(x_i)\log_2i\le\sum_iP(x_i)\log_2\frac{1}{P(x_i)}=H(X).
$$
左侧, 根据定义 $H(L\mid X)=0$, 那么
$$
H(X)=H(X,L)=H(X\mid L)+H(L)\le\Ex[L]+H(L).
$$
&nbsp;

&emsp;&emsp;但我们知道, 对单字符设计的编码并不能胜任对随机字符串的发送任务. 因为典范的扩展
$$
E^*(a_1\cdots a_n):=E(a_1)\cdots E(a_n)
$$
并不能保证解码结果的唯一性. 例如 Morse 编码中 $E^*(\t{SOS})=E^*(\t{EEETTTEEE})$. 一种简单处理方式是采用 prefix-free 的编码:

> **定理 10.1.2**
>
> &emsp;&emsp;给定 $L:|X|\to\N$, 则存在 prefix-free encoder $f$ 使得 $|f(x_i)|=L(x_i)$, 当且仅当
> $$
> \sum_{x_i\in|X|}2^{-L(x_i)}\le 1.
> $$

&emsp;&emsp;证明不难.

> **算法 10.1.3 (Huffman Code)**
>
> &emsp;&emsp;《这他妈不就是合并果子吗？》——zyf

&emsp;&emsp;最优性可以通过调整法证明. 如果某时刻 $p$ 最小的两个 $x_i,x_j$ (它们各自可能对应一个单点或者合并过若干次的子树) 没有被合并在一起, 那么我们可以把 $x_i$ 与 \[$x_j$ 的兄弟\] 交换 (当二者存在一些祖后代关系时细致讨论), 总能发现交换后的编码更优.

> **定理 10.1.4**
>
> &emsp;&emsp;设 $L(x_i)=|E(x_i)|$, 其中 $E$ 是 $X$ 的 Huffman 编码, 那么
> $$
> H(X)\le\Ex[L]\le H(X)+1.
> $$

&emsp;&emsp;*→ Proof.* 对右侧, 令 $L'(x_i)=\l\lceil\log_2\frac{1}{P(x_i)}\r\rceil$, 那么
$$
\log_2\frac{1}{P(x_i)}\le L'(x_i)\le\log_2\frac{1}{P(x_i)}+1,
$$
同时
$$
\sum_i2^{-L'(x_i)}\le\sum_i2^{-\log_2\frac{1}{P(x_i)}}=1.
$$
因此 $L'$ 对应的编码 $E'$ 存在, 由 $E$ 的最优性, 由 $\Ex[L]\le\Ex[L']\le H(X)+1$.

&emsp;&emsp;对左侧, 设 $Y=E(X)$, 为每个字符编码末尾添加无穷多个 $\bot$, 由链式法则,
$$
H(X)=H(Y)=\sum_tH[Y_t\mid Y_1\cdots Y_{t-1}],
$$
其中
$$
H[Y_t\mid Y_1\cdots Y_{t-1}=y_1\cdots y_{t-1}]\CAS{
	=0,&y_{t-1}=\bot;\\
	\le 1,&y_{t-1}\neq\bot.
}
$$
那么
$$
H[Y_t\mid Y_1\cdots Y_{t-1}]\le\Pr[y_1\cdots y_{t-1}~\text{contains no}~\bot]=\Pr[|Y|\ge t].
$$
这样
$$
H(X)\le\sum_t\Pr[|Y|\ge t]=\Ex[Y]=\Ex[L].
$$

## $\S10.2$ 近无损编码

&emsp;&emsp;现在弱化对 encoder 和 decoder 的要求, 我们只期待

- $\cancel{D(E(x))=x}$ $\Pr[D(E(x))=x]\ge 1-\eps$, 其中 $\eps$ 是被控制的小量.

&emsp;&emsp;设 $X\sim P^n$, 若我们限制了 $E(X)\in\{0,1\}^L$, 一个自然的想法是将 $|X|$ 排序后只为前 $2^L$ 个点分配编码. 那么需要多大的 $L$ 才能给 $\eps$ 一个约束呢?

> **定理 10.2.1**
>
> &emsp;&emsp;当 $L\ge n(H(X)+\delta)$, 上述编码能保证 $\eps\le\e^{-\mathcal O(n\delta^2)}$.

&emsp;&emsp;*→ Proof.* 考虑 $-\log P^n(X)=\sum_i-\log P(X_i)$, 而 $\Ex[-\log P(X_i)]=H(X)$, 因此这个和式的值应当集中在 $nH(X)$ 附近.  当和式落在中心左右 $\delta$ 范围内,
$$
\#\{x=(\seq x1n):P^n(x)\ge 2^{-n(H(X)+\delta)}\}\le 2^{n(H(X)+\delta)}=2^L,
$$
我们只为它们分配编码. 那么
$$
\ALI{
	M:=\Pr[P^n(X)\le 2^{-n(H(X)+\delta)}] &= \Pr\l[\sum_i-\log P(X_i)\ge n(H(X)+\delta)\r]\overset{\u{Chernoff}}\le \e^{-\mathcal O(n\delta^2)}.
}
$$
&emsp;&emsp;这种编码的问题是, 它要求我们先验地知道 $P$ 的大量信息. 有没有什么简单又强势的 encoder 呢?

> **定理 10.2.2 (Universal Encoder)**
>
> &emsp;&emsp;在对应的函数空间均匀采样 $E:|X|\to\{0,1\}^L$, 令 $D(c):=\arg\max_x\{P^n(x):E(x)=c\}$, 对同样的 $L\ge n(H(X)+\delta)$, 有 $\Pr[D(E(x))\neq x]\le 2^{-n\delta}+2^{-\mathcal O(n\delta^2)}$.

&emsp;&emsp;*→ Proof.* 仍然按概率降序列出 $X=\{x_1,x_2,\cdots\}$, $c_i:=E(x_i)$,可以给出
$$
\ALI{
	\Pr[D(E(x))\neq x] &= \sum_iP(x_i)\Pr_E[c_i\in\{\seq c1{i-1}\}]\\
	&=\br{\sum_{i\le M}+\sum_{i>M}}P(x_i)\Pr_E[c_i\in\{\seq c1{i-1}\}]\\
	&\le \sum_{i=1}^MP(x_i)\Pr_E[c_i\in\{\seq c1{i-1}\}]+2^{-\mathcal O(n\delta^2)}\\
	&\le \sum_{i=1}^M P(x_i)\underbrace{\frac{M}{2^L}}_{\le 2^{-n\delta}}+2^{-\mathcal O(n\delta^2)}\\
	&\le 2^{-n\delta}+2^{-\mathcal O(n\delta^2)}.
}
$$
&nbsp;

&emsp;&emsp;接下来考虑带旁信息的压缩. 待发消息 $X$ 和旁信息 $Y$ 采样自联合分布 $P_{XY}$, 而在压缩或解压时, $Y=y$ 都是已知信息. 类似地取 $L=n(H(X\mid Y)+\delta)$ 也能控制错误率.

&emsp;&emsp;另一种预设是, $X,Y$ 需要各自被压缩到 $\{0,1\}^{L_1}$ 和 $\{0,1\}^{L_2}$, 再被一起解码得到 $\hat X,\hat Y$. 有两种显然的策略:

- $L_1=n(H(X)+\delta)$, $L_2=n(H(Y\mid X)+\delta)$, 我们先解码 $\hat X$, 在根据 $\hat X$ 解码 $\hat Y$; 这也是最小的可行的 $L_2$.
- $L_2=n(H(Y)+\delta)$, $L_1=n(H(X\mid Y)+\delta)$, 同理; 这也是最小的可行的 $L_1$.

事实上, 只有 $L_1,L_2$ 在各自可行范围内, 并且 $L_1+L_2\ge nH(X,Y)$ 的 $(L_1,L_2)$ 组合可行.

## $\S10.3$ 信道编码

&emsp;&emsp;在现实的信息通过信道 (channel) 传递, 信道将对信息引入噪音. 抽象地, 我们认为信道的输出 $Y$ 与输入 $X$ 服从某个条件分布 $P_{Y\mid X}$. 例如 binary erase channel: $P_{Y\mid X}(b\mid b)=1-\eps$, $P_{Y\mid X}(\bot\mid b)=\eps$, 应对它的自然想法是将每个 bit 重发若干次 (repetition code), 即
$$
W=w_1w_2\cdots\overset{\u{encode}}\longrightarrow w_1w_1w_1w_2w_2w_2\cdots\overset{\u{channel}}\longrightarrow \underbrace{\hat w_{11}\hat w_{12}\hat w_{13}}_{\hat w_1}\underbrace{\hat w_{21}\hat w_{22}\hat w_{23}}_{\hat w_2}\cdots
$$
显然 $\Pr[\hat w_1=w_1]\ge 1-\eps^3$. 但这种编码会让码长增大两倍.

&emsp;&emsp;另一种手段是, 我们在 encode 阶段取随机的 $\Z_2^n$ 内的线性映射 $\opn{encode}:\{0,1\}^n\to\{0,1\}^L$, 而
$$
f:=(\opn{drop}~\bot)\circ\opn{bechannel}\circ\opn{encoder}:\{0,1\}^n\to\{0,1\}^{(1-\eps)L}.
$$
也是一个随机线性映射. $(1-\eps)L$ (略微) 大于 $n$, 它几乎总是满秩, 即几乎总能还原出发送的信息.

&emsp;&emsp;以上 $(1-\eps)~\u{bit}$ 被称为 binary erase channel 的容量 (capacity). 一般地:

> **定义 10.3.1**
>
> &emsp;&emsp;信道 $P_{Y\mid X}$ 的容量为 $C:=\max_{P_X}I_{XY\sim P_XP_{Y\mid X}}(X;Y)$.

&emsp;&emsp;另一种常见的信道是 binary symmetric channel: $P_{Y\mid X}(b\mid b)=1-\eps$, $P_{Y\mid X}(1-b\mid b)=\eps$. 我们声称 $X\sim\opn{Bern}(1/2)$ 时取容量达到最大值, $Y=X\oplus Z$, 其中 $Z\sim\opn{Bern}(\eps)$, 容易计算
$$
C=I(X;Y)=H(Y)-H(Y\mid X)=1-H(Z)=1-h(\eps)=d\br{\eps\mmid \frac{1}{2}}.
$$

> **定义 10.3.2 ($[2^n,L,d]_{\Z_p}$-编码)**
>
> &emsp;&emsp;设某对 $2^n$ 的空间编码的 encoder 的像集为 $\mathcal C\sub\Z_p^L$, 则称其为 $[2^n,L,d]_{\Z_p}$-编码, 当且仅当
> $$
> \A c,c'\in\mathcal C,~\Delta_{\u{Hamming}}(c,c'):=\#\{i:c[i]\neq c'[i]\}\ge d.
> $$

&emsp;&emsp;例如, 随机的 $\{0,1\}^n\to\{0,1\}^L$ 大概率是 $L$-$d$-$2$ 编码:

> **命题 10.3.3**
>
> &emsp;&emsp;对 $\{0,1\}^n\to\{0,1\}^L$, 当 $L>\frac{n}{1-h(d/L)}$, 存在线性映射是 $[2^n,L,d]_{\Z_p}$-编码.

&emsp;&emsp;*→ Proof.* 任取定 $c,c'$, 那么
$$
\Pr\l[\Delta(c,c')\le d\r]=\Pr\l[\frac{\Delta(c,c')}{L}\le\frac{d}{L}\r]\overset{\u{Chernoff}}\le\exp\br{-Ld\br{\frac{d}{L}\mmid \frac{1}{2}}}.
$$
那么
$$
\ALI{
	\Pr\l[\min_{x\neq x'}\Delta(\opn{enc}(x),\opn{enc}(x'))\le d\r] &\le \sum_{x\neq x'}\Pr[\Delta(c,\opn{enc}(x'))\le d]\\
	&\le 2^n\exp\br{-Ld\br{\frac{d}{L}\mmid \frac{1}{2}}}\\
	&= 2^{n-L\br{1-h(d/L)}}.
}
$$
&emsp;&emsp;对更广的域, 如 $W=\F_p^n$, 有更方便的编码方式. 例如 Reed-Solomon 编码: 定义
$$
\opn{enc}:w_0\cdots w_{n-1}\mapsto f(0)\cdots f(L-1),\quad f:=\sum_{i=0}^{n-1}w_ix^i.
$$
明显它是一个 $[p^n,L,L-n]_{\F_p}$ 编码, 也就是说, 当码字被任意修改不超过 $\frac{L-n}{2}$ 位时, 我们总能唯一还原原始输入, 接下来讨论还原的过程.

&emsp;&emsp;设 $f(0)\cdots f(L-1)$ 被修改为 $c_0\cdots c_{L-1}$, 如果我们获得了 mask 多项式 $h(x)=\prod_{i\in S}(x-i)$, 其中 $S=\{i:f(i)\neq c_i\}$, 这时对 $x\in [0:L-1]$ 有 $f(x)h(x)=c_xh(x)$, $\deg f\le n$, $\deg h\le\frac{L-n}{2}$, 事实上对 $\deg p+\deg q\le L$, $p(x)=c_xq(x)$ 是可解的, 这样我们就得到了 $f(x)$.

&nbsp;

&emsp;&emsp;更一般地, 设 $\opn{enc}(w)=x_w$, 最优秀的 decoder 显然是 $\opn{dec}(y)=\arg\max_w(P_{Y\mid X})^n(y\mid x_w)$. 作为一个负责任的 encoder, 我们至少需要保证这个 $\opn{dec}$ 不产生错误解码, 即对任意 $w$ 和 $w'\neq w$, 需要保证
$$
(P_{Y\mid X})^L(y\mid X=x_w)>(P_{Y\mid X})^L(y\mid X=x_{w'})\\
\Eq \log(P_{Y\mid X})^L(y\mid X=x_w)>\log (P_{Y\mid X})^L(y\mid X=x_{w'})\\
\Eq \log\frac{(P_{XY})^L(x_w,y)}{(P_X)^L(x_w)(P_Y)^L(y)}>\log\frac{(P_{XY})^L(x_{w'},y)}{(P_X)^L(x_{w'})(P_Y)^L(y)}.
$$
令
$$
i(x,y)=\log\frac{(P_{XY})^L(x_w,y)}{(P_X)^L(x_w)(P_Y)^L(y)},
$$
注意它满足
$$
\Ex_{X,Y\sim(P_{XY})^L}[i(X,Y)]=I(X;Y).
$$
我们希望
$$
i(x_w,y)>i(x_{w'},y).
$$
(Intuitively 我们计算二者期望, 并通过它们在各自期望的集中性 bound 解码失败的概率.)

&emsp;&emsp;事实上 $\Pr[i(x_w,y)<i(x_{w'},y)]<2^{-LC}$, 但后面我 track lost 了 qwq.

# 第十一章 Markov 链

&emsp;&emsp;**我没有完全学懂本章, 因而请批判性地使用本章笔记.**

## $\S11.1$ 基本性质

&emsp;&emsp;对一列随机变量 $X_0,X_1,\cdots$, 称其具有 Markov 性质, 当且仅当对任意 $X_i$, condition on $X_i$ 时事件 $(X_0,\cdots,X_{i-1})$ 和 $(X_{i+1},\cdots)$ 独立.  我们尤其关心具有时间统一性 (time-homogeneous) 的 Markov 链, 即各 kernel $P_{X_1\mid X_0}=P_{X_2\mid X_1}=\cdots=P$. 记号上, 我们规定 $P:\Omega\x\Omega\to[0,1]$ 是一个随机矩阵 (stochastic matrix), $P(x,y)$ 表示 condition on $x$ 时下一随机变量取 $y$ 的概率.

&emsp;&emsp;这样的记号能够带来一定便利. 例如, 令分布 $\mu$ 作为一个行向量, 那么 $\mu P$ 就是 $X_t\sim \mu$ 时 $X_{t+1}$ 的分布. $(Pf)(x)=\Ex[f(X_{t+1})\mid X_t=x]=:\Ex_x[f(X_1)]$. (这里 $f:|X|\to\R$ 视作列向量, 分布 $x:|X|\to\R$ 视作行向量.) 明显 $P^t(x,y)=\Pr_x[X_t=y]$.

> **定义 11.1.1**
>
> - 称 $\pi$ 是一个 Markov 链 $P$ 的稳态分布, 当且仅当 $\pi P=\pi$;
> - 定义 Markov 链 $P$ 的 hitting time $\N\cup\{\oo\}\ni\tau_x=\min\{t\ge 0:X_t=x\}$;
> - 定义 Markov 链 $P$ 的 return time $\N^*\cup\{\oo\}\ni\tau_x^+=\min\{t>0:X_t=x\}$.

> **定义 11.1.2**
>
> &emsp;&emsp;Markov 链可能满足如下性质:
>
> - 时间统一性;
> - 有限性, $|\Omega|<\oo$;
> - 不可约性, 对任意 $x,y\in\Omega$, 存在 $t$ 使得 $P^t(x,y)>0$. 记这个关系为 $xRy$. (即概率转移强连通.)

> **引理 11.1.3**
>
> &emsp;&emsp;对有限不可约的 Markov 链, $\A x,y\in\Omega,~\Ex_x[\tau_y]<\oo$. $\A x\in\Omega,~\Ex_x[\tau_x^+<\oo]$.

&emsp;&emsp;*→ Proof.* 对 $z\in\Omega$, 存在 $t_z>0$ 使得 $P^{t_z}(z,y)>0$, $t:=\max_zt_z<\oo$ 存在, $p:=\min_zP^{t_z}(z,y)>0$. 我们尝试说明总有 $\Pr_x[\tau_y^+> 2t]\le(1-p)^2$. 这是因为
$$
\ALI{
	\Pr_x[\tau_y^+>2t] &= \Pr_x[\tau_y^+> t]\Pr_x[\tau_y^+> 2t\mid \tau_y^+> t]\\
	&= \Pr_x[\tau_y^+> t]\sum_z\underbrace{\Pr[\A i\in[t+1:2t],~y\neq X_i\mid X_t=z]}_{\le 1-p}\cdot\Pr_x[X_t=z\mid\tau_y^+> t]\\
	&\le (1-p)^2.
}
$$
同理, $\Pr_x[\tau_y^+> kt]\le(1-p)^k$, 这样直接计算 $\Ex_x[\tau_y^+]=\sum_{i=0}^{+\oo}\Pr_x[\tau_y^+>i]$ 即可说明其收敛. $\Ex_x[\tau_x^+]$ 同理.

> **定理 11.1.3**
>
> &emsp;&emsp;当 Markov 链满足 <u>定义 11.1.2</u> 的三条性质时, 存在稳态分布 $\pi$.

&emsp;&emsp;*→ Proof.* 记 $\wt\pi_x(y):=\Ex_x[\#\{t\in[1:\tau_x^+]:X_t=y\}]$, 显然 $\wt\pi_x(x)=1$, $\sum_y\wt\pi_x(y)=\Ex_x[\tau_x^+]$. 将它归一化为 $\pi_x$, 我们只需说明 $\pi_x$ 就是一个稳态分布.

&emsp;&emsp;利用 Markov 性质拆解:
$$
\ALI{
	\wt\pi_x(y) &= \sum_{t=1}^{+\oo}\Pr_x[X_t=y\land t\le\tau_x^+]\\
	&= \sum_{t=1}^{+\oo}\sum_z\underbrace{\Pr_x[X_t=y\mid X_{t-1}=z\land t-1<\tau_x^+]}_{=P(z,y)}\Pr_x[X_{t-1}=z\land t-1<\tau_x^+]\\
	&= \sum_zP(z,y)\sum_{t=1}^{+\oo}\Pr_x[X_{t-1}=z\land t-1<\tau_x^+]\\
	&= \sum_zP(z,y)\sum_{t=0}^{+\oo}\Pr_x[X_t=z\land t<\tau_x^+]\\
	&= \sum_zP(z,y)\wt\pi_x(z)\\
	&= (\wt\pi_x P)(y).
}
$$

> **定义 11.1.5**
>
> &emsp;&emsp;定义 $h$ 在 $x$ 和谐 (harmonic), 当且仅当 $\Ex_x[h(X_1)]=h(x)$. 称 $h$ 是和谐的, 当且仅当 $h$ 在所有 $x\in\Omega$ 和谐, 即 $h=Ph$.

> **推论 11.1.6**
>
> &emsp;&emsp;<u>定理 11.1.3</u> 下 $\pi$ 存在且唯一.

&emsp;&emsp;*→ Proof.* 只需证明 $\rank(P-\bs 1)=|\Omega|-1$, 即 $\dim\{h:(P-\bs 1)h=0\}=1$, 其中 $h$ 是和谐函数.

&emsp;&emsp;令 $\alp=\max_xh(x)$, 设 $h(x)=\alp$, 则 $\A y,~\E t,~P^t(x,y)>0$, 所以
$$
(P^th)(x)=h(x)=\alp=\sum_{z}P^t(x,z)h(z).
$$
然而 $h(x)$ 是最大的, 右侧就必须满足 $h(y)=\alp$, 这样 $h\equiv\alpha$ 是常数函数. 明所欲证.

&emsp;&emsp;结合 <u>定理 11.1.3</u> 的构造, 我们平凡地给出 $\pi(x)=\pi_x(x)=\frac{1}{\Ex_x[\tau_x^+]}$.

> **定义 11.1.7**
>
> &emsp;&emsp;称 Markov 链上 $x$ 的周期为 $\gcd\{t:P^t(x,x)>0\}$. 称 Markov 链无周期, 当且仅当所有 $x\in\Omega$ 的周期都为 $1$.

> **定理 11.1.8**
>
> &emsp;&emsp;若 Markov 链有限, 不可约, 无周期, 则对任意分布 $\mu$ 都有 $\lim_{t\to\oo}\mu P^t=\pi$.

&emsp;&emsp;*→ Proof.* 存在 $N$, 使得 $n>N$ 时 $P^n(x,y)$ 恒正 (此事在小凯的疑惑中亦有记载). 任取定这样一个 $n$, 存在常数 $c_x>0$ 使得
$$
\A x,~\A y,~(\delta_x P^n)(y)\ge\pi(y)\cdot c_x.
$$
令 $c=\min_xc_x>0$, 那么
$$
\A \mu,\A y,~(\mu P^n)(y)\ge \pi(y)\cdot c.
$$
这样
$$
\mu P^n=c\pi+(1-c)\mu',\\
\mu P^{2n}=c\pi+(1-c)(c\pi+(1-c)\mu'')=(1-c)c\pi+(1-c)^2\mu'',\\
\cdots
$$
最终就能给出 $\lim_{t\to\oo}\mu P^t=\pi$.

## $\S11.2$ 例子与技巧

> **例子 11.2.1 (带吸收壁一维游走)**
>
> &emsp;&emsp;考虑一个带吸收壁的一位随机游走: $P(k,k\pm 1)=\frac{1}{2}$, $P(n,n)=P(0,0)=1$. 我们希望计算从 $k$ 出发成功到达 $n$ 的概率 $f(k)$, 到达 $1$ 或 $n$ 的期望时间 $g(k)$.

&emsp;&emsp;*→ Solution.* 这里严格按照 Markov 链的性质操演,
$$
\ALI{
	f(k) &= \Pr_k[\u{win}]\\
	&= \sum_i\Pr_k[\u{win}\mid X_1=i]\Pr_k[X_1=i]\\
	&= \frac{1}{2}\br{\Pr_k[\u{win}\mid X_1=k+1]+\Pr_k[\u{win}\mid X_1=k-1]}\\
	&= \frac{1}{2}(f(k+1)+f(k-1)).
}
$$
容易解出 $f(k)=\frac{k}{n}$. 记随机变量 $\tau=\max\{t:X_t\in\{0,n\}\}$, 那么
$$
\ALI{
	g(k) &= \frac{1}{2}\br{\Ex_k[\tau\mid X_1=k-1]+\Ex_k[\tau\mid X_1=k+1]}\\
	&= \frac{1}{2}(1+g(k-1))+\frac{1}{2}(1+g(k+1)).
}
$$
也是容易计算的.

> **例子 11.2.2 (卡牌收集)**
>
> &emsp;&emsp;假设有 $n$ 种卡牌, 每次均匀随机获得一张, 计算期望需要多久集齐 $n$ 种卡.

&emsp;&emsp;*→ Solution.* 对称性使得我们不必关心卡牌具体种类, 只需要关心种类数量. $P(0,1)=P(n,n)=1$, $P(k,k)=\frac{k}{n}$, $P(k,k+1)=\frac{n-k}{n}$. 设所求随机变量为 $\tau$, 容易利用线性性计算 $\Ex_0[\tau]=\sum_{k=0}^{n-1}\frac{n}{n-k}=nH_n\sim n\ln n$.

&emsp;&emsp;此外, 非酋也需要关注
$$
\ALI{
	\Pr_0[\tau\ge n\ln n+\eps n] &\le \sum_{i=1}^n\Pr_0[i\text{-th card not collected at this time}]\\
	&= n-\br{1-\frac{1}{n}}^{n\ln n+\eps n}\\
	&\approx n\br{\frac{1}{\e}}^{\ln n+\eps}\\
	&= \e^{-\eps}.
}
$$

> **例子 11.2.3 [超立方体游走 / Ehrenfest 瓮 (urn) 模型]**
>
> &emsp;&emsp;(a) 考虑 $n$ 维超立方体 $\Omega=\{0,1\}^n$, 均匀随机游走 $P'(x,y)=\frac{1}{n}[\|x-y\|_1=1]$, 这个游走有周期 $2$. 我们可以引入 lazy walk $P(x,x)=\frac{1}{2}$ 来消除周期.
>
> &emsp;&emsp;(b) 考虑装在两个瓮里的总共 $n$ 个小球, 每次我们均匀随机选取一个小球, 将它拿出并放入另一个瓮. 即 $\wt P(k,k+1)=\frac{n-k}{n}$, $\wt P(k,k-1)=\frac{k}{n}$.

&emsp;&emsp;*→ Solution.* 感性上容易发现 $P'$ 链下的 $\|x\|_1$ 遵循 $\wt P$. $P$ 则对应了 $\wt P$ 的 lazy 版本.


> **引理 11.2.4 (细致平衡 Detailed Balanced)**
>
> &emsp;&emsp;当 $\A x,y\in\Omega$, 有 $\pi(x)P(x,y)=\pi(y)P(y,x)$, 称 $\pi$ 是细致平衡的. 若 $\pi$ 细致平衡, 则 $\pi$ 是稳态. 进一步若 $P$ 单连通, 则 $\pi$ 细致平衡当且仅当 $\pi$ 是稳态.

&emsp;&emsp;*→ Proof.* Intuitively 容易验证.


> **例子 11.2.5 (生灭链)**
>
> &emsp;&emsp;考虑 Markov 链 $P(k,k+1)=p_k$, $P(k,k-1)=q_k$, $P(k,k)=r_k=1-p_k-q_k$, $q_0=0$. 我们关心它的稳态分布.

&emsp;&emsp;*→ Solution.* 使用 <u>引理 11.2.4</u>, 可以给出 $\frac{\pi(k+1)}{\pi(k)}=\frac{p_k}{q_{k+1}}$, 那么就有
$$
\wt\pi(k)=\sum_{i=1}^k\frac{p_{k-1}}{q_k},\quad \pi=\frac{\wt \pi}{\|\wt \pi\|_1}.
$$

> **例子 11.2.6 (一维随机游走)**
>
> &emsp;&emsp;考虑 $\Z$ 上的随机游走, $P(x,x\pm 1)=\frac{1}{2}$, $\tau_0=\min\{t:X_t=0\}$, 我们希望研究 $\Ex_k[\tau_0]$.

&emsp;&emsp;*→ Solution.* 略.

&nbsp;

> **例子 11.2.7 (Monte-Carlo)**
>
> &emsp;&emsp;我们希望进行采样 $x\sim\mu(x)$, 但 $\mu$ 很复杂, $\Omega$ 巨大. 以 $\Omega=\{0,1\}^n$, $\mu(x)=\e^{-c\opn{loss}(x)}$ 为例.

&emsp;&emsp;*→ Solution.* 考虑如下算法:

- 均匀采样 $x\in\Omega$ 作为起点;
- 不断重复:
    - 均匀采样 $y\in\Omega$ 使得 $\|x-y\|_1=1$;
    - $x\gets y~\text{w.p.}~\alpha(x,y)$.

这给出了一个 Markov 链上的游走, 我们希望 $\mu$ 恰好是这个链的稳态, 这样在足够多次迭代后, $x$ 的分布收敛于 $\mu$. 根据 <u>引理 11.2.4</u>, 我们希望
$$
\mu(x)\frac{1}{n}\alpha(x,y)=\mu(y)\frac{1}{n}\alpha(y,x).
$$
取尽量大的 $\alpha$ 增加收敛速度, 最终
$$
\alpha(x,y)=\min\l\{1,\frac{\mu(y)}{\mu(x)}\r\}.
$$
&emsp;&emsp;更进一步, 采样 $y$ 时用 $y\sim\psi(x,y)$, $\psi$ 有细致平衡的稳态 $\pi$, 同样也有
$$
\alpha(x,y)=\min\l\{1,\frac{\mu(y)\pi(x)}{\mu(x)\pi(y)}\r\}.
$$
&nbsp;

> **定义 11.2.8 (Mixing Time)**
>
> &emsp;&emsp;对 Markov 链 $P$, 令
> $$
> d(t)=\sup_\mu\Delta_{\u{TV}}(\mu P^t,\pi),\quad \ol d(t)=\sup_{\mu,\nu}\Delta_{\u{TV}}(\mu P^t,\nu P^t);\\
> t_{\u{mix}}(\eps)=\min\{t:d(t)\le\eps\}.
> $$
> (显然 $d(t)\le\ol d(t)\le 2d(t)$.) 其中 $\Delta_{\u{TV}}$ 是全变差距离.

&emsp;&emsp;*例如*, 考虑超立方体上的 lazy walk, 当每个维度被选取一次时, 所有坐标都均匀随机, 这很像一个卡牌收集 (<u>例子 11.2.2</u>) 过程. 直接写出
$$
d(n\ln n+\eps n)\le\e^{-\eps}.
$$
&nbsp;

> **定理 11.2.9 (Coupling)**
>
> &emsp;&emsp;对分布 $P_X,P_Y$, 有
> $$
> \Delta_{\u{TV}}(P_X,P_Y)=\min_{P_{XY}}\Pr_{(X,Y)\sim P_{XY}}[X\neq Y].
> $$

&emsp;&emsp;*→ Proof.* 设 $P_X=\wh M+\wh Q_X$, $P_Y=\wh M+\wh Q_Y$, 其中 $\|\wh Q_X\|_1=\|\hat Q_Y\|_1=\Delta_{\u{TV}}(P_X,P_Y)$, $\|\wh M\|_1=1-\Delta_{\u{TV}}(P_X,P_Y)$, 我们构造
$$
\wh P_{XY}(x,y)=\wh M(x,y)[x=y]+\frac{\wh Q_X(x)\wh Q_Y(y)}{\Delta_{\u{TV}}(P_X,P_Y)}.
$$
或者说, 以 $1-\Delta(X,Y)$ 的概率, 从 $\frac{\wh M}{1-\Delta(x,y)}$ 采样 $x=y$; 否则从 $\frac{\wh P\wh Q}{\Delta(x,y)^2}$ 采样 $(x,y)$. 我们声称这就是 $\arg\min$.

&nbsp;

> **例子 11.2.10**
>
> &emsp;&emsp;考虑 $\Z_n$ 上的 lazy walk, 我们研究其上的两个点的 Markov 链 $P$, 满足
> $$
> P((x,y),(x',y'))=\CAS{
> 	\frac{1}{4},&x'=y'=x\pm 1\land x=y;\\
> 	\frac{1}{2},&x'=y'=x\land x=y;\\
> 	\frac{1}{4},&x'=x\land y'=y\pm 1\land x\neq y;\\
> 	\frac{1}{4},&x'=x\pm 1\land y'=y\land x\neq y.
> }
> $$

&emsp;&emsp;可以看出 $P$ 的边缘分布仍然是 lazy walk, 但两维不独立. 事实上 $Z:=X-Y$ 由恰好是以 $0$ 和 $n$ 为吸收壁的一维随机游走.
$$
\ol d(t)\le \Pr[X_t\neq Y_t]=\Pr[Z_t\notin\{0,n\}]=\Pr[\tau>t],
$$
其中 $\tau$ 是吸收壁游走的返回时间.

> **例子 11.2.11**
>
> &emsp;&emsp;考虑图 $G$ 上边不同色的均匀随机染色, 我们从任意染色 $f$ 出发, 通过不断重复:
>
> - 均匀随机取 $u\in V$;
> - 均匀随机令 $f(u)\gets C\setminus\{f(v):(u,v)\in E\}$
>
> 来得到合法染色的采样. 我们需要估计混合时间 $d(\eps)$ 的上界.

&emsp;&emsp;*→ Solution.* 略.

# 第十二章 图

## $\S12.1$ 基本性质

```python
from OI.图论 import 图, 度, 子图, 路径, 简单路径, 连通性, 连通块, 树, 团, 独立集, 完全图, 二分图
```

&emsp;&emsp;以下不加说明地令 $n=|V|$, $m=|E|$.

> **定理 12.1.1 (矩阵树)**
>
> &emsp;&emsp;对 $G=(V,E)$, 设 $D=\diag(\seq d1n)$, $A$ 为 $G$ 的邻接矩阵, 则其 Laplace 矩阵 $L:=D-A$ 则其任意 $n-1$ 阶主子式为 $\#\{T~\text{tree}:T\subset G\}$.

> **引理 12.1.2**
>
> &emsp;&emsp;上述语境下, 引入 incidence matrix $E\in \M_{n\x m}(\R)$, 第 $i$ 列对应一条边 $(u,v)$, 任令 $E_{ui}=1$, $E_{vi}=-1$. 那么
> $$
> EE^\T=L.
> $$

&emsp;&emsp;*→ Proof.* $EE^\T=\sum_{i=1}^m E_{:,i}\x E_{i,:}$, 直接对比即可.

&emsp;&emsp;*→ Proof @ 12.1.1* 不妨只证明去掉第一行第一列有 $\det \mathcal L=\#\{T~\text{tree}:T\sub G\}$. 回忆 Cauchy-Binet 定理,
$$
\det(AB)=\sum_{S\sub[m]\land |S|=n}\det(A_S)\det(B_S),\quad A\in\M_{n\x m}(\R),B\in\M_{m\x n}(\R).
$$
设 $\mathcal E$ 表示 $E$ 去掉第一行的矩阵, 则 $\mathcal E\mathcal E^\T=\mathcal L$, 所以
$$
\ALI{
	\det\mathcal L &= \sum_{S\sub[m]\land |S|=n-1}\det \mathcal E_S\det  \mathcal E_S^\T.
}
$$
只需验证
$$
\det\mathcal E_S=\pm[\{e_i\in E:i\in S\}~\text{form a tree}]..
$$
按定义, 考虑每个 $\sigma\in\opn{Aut}(\{1\}\cup S)$ 的贡献, 由于加上 $1$ 自环后只有 $n$ 条边, 如果 $\sigma$ 含有非 $1$ 自环的环 贡献为 $0$; 否则 $\sigma$ 只能指向以 $1$ 为根的父亲, 贡献为 $\pm 1$.

> **例子 12.1.3**
>
> &emsp;&emsp;考虑有向图 $G=(V,E)$, $(u,v)\in E\Ra u<v$. 计数从 $1$ 到 $n$ 的路径.

&emsp;&emsp;*→ Solution.* 设邻接矩阵为 $A$, 显然只需要计算 $((\bs 1-A)^{-1})_{1n}$. 考虑伴随矩阵, 可知
$$
\#\{\text{path}\}=(-1)^{n+1}\det (\bs 1-A)_{[1:n-1]\x[2:n]}=\det(A-\bs 1)_{[1:n-1]\x[2:n]}.
$$

> **定理 12.1.4 (Euler)**
>
> &emsp;&emsp;对连通平面图 $G$, $|V|+|F|-|E|=2$, 其中 $F$ 是面集合.

&emsp;&emsp;*→ Proof.* 归纳即可.

> **定理 12.1.5**
>
> &emsp;&emsp;设 $G$ 的点染色数 $\chi(G)$, 则 $\chi(G)\cdot \max\{|S|:S\sub V~\text{independent set}\}\ge n$.

&emsp;&emsp;*→ Proof.* 每种颜色都是独立集.

## $\S12.2$ 代数图论初探

&emsp;&emsp;<u>定理 12.1.4</u> 的 "平面" 可以认为是欧式平面, 我们也能引入其他面, 例如球面或者甜甜圈面, 这时连通图的 $|V|+|F|-|E|$ 的值由曲面拓扑性质决定. 这事实上被称为曲面的 Euler 示性数 $\chi$. (例如在甜甜圈面上, $|V|+|F|-|E|=0$.)

> **定理 12.2.1**
>
> &emsp;&emsp;平面上的连通平面图 $G$ 一定能够点 $5$ 染色.

&emsp;&emsp;*→ Proof.* 进一步探讨 Euler 定理, 我们可以将 $|E|$ 和 $|F|$ 的贡献分配到结点上:

- 对每条边, 给两个顶点分别贡献 $-\frac{1}{2}$ 的权值;
- 对每个面, 设其有 $\ell$ 个顶点, 给每个顶点贡献 $\frac{1}{\ell}$.

这样, 设 $\deg(u)=\ell$, 分别是 $\seq a1\ell$ 面的顶点, 则 $u$ 的贡献就是
$$
w_u:=1+\sum_{i=1}^\ell \br{\frac{1}{a_i}-\frac{1}{2}}.
$$
由于 $\sum_{u\in V}w_u>0$, $\frac{1}{a_i}-\frac{1}{2}\le-\frac{1}{6}$, 所以一定存在一个度数不超过 $5$ 的点 $u$, 我们任取 $u$ 的两个邻接点 (这是不那么平凡的情况) $x,y$, 将 $x,u,y$ 压缩为一个点, 归纳地完成 $5$ 染色, 最后展开 $x,u,y$, 其中 $x,y$ 继承原来的颜色, $u$ 一定有办法取为至多四个邻接颜色之外的颜色. 因此平面图一定能够 $5$ 染色.

&emsp;&emsp;顺便, 我们熟知平面图存在对偶图, 这样平面图点染色和面染色总是等价的.

&nbsp;

&emsp;&emsp;考虑 Laplace 矩阵 $L=D-A$ 对 $f:V\to\R$ 的作用:
$$
(Lf)(u)=\sum_{(u,v)\in E}(f(u)-f(v)),
$$
而 $L$ 对应的二次型作用在 $(f,f)$ 上就是
$$
f^\T Lf=\sum_{(u,v)\in E}(f(u)-f(v))^2,
$$
所以 $L$ 是半正定的. 设其特征值为 $\seq\lmd 1n$, 那么:

> **定理 12.2.2**
>
> &emsp;&emsp;上述 $\lmd=0$ 的几何重数为 $G$ 的极大连通块数.

&emsp;&emsp;*→ Proof.* 容易根据极大连通块构造互相正交的特征向量 (某个连通块内全 $1$, 外部全 $0$). 一般地, 找到 $f$ 绝对值最大的位置 $u$, 由于 $f(u)$ 是其邻接点 $f$ 值的平均数, 可知 $u$ 整个连通块的值都是 $f(u)$, 这已经是刚刚找到的特征向量的线性组合.

&emsp;&emsp;对连通图, 继续考察其他特征值. 对于 $n$ 元环, 可以验证
$$
\theta_j(u)=\e^{2\pi\i\frac{ju}{n}},\quad \lmd_j=2\br{1-\cos\frac{2\pi j}n}.
$$
某种程度上, 连通图的第二小的特征值反映了连通性的 "强弱".
&emsp;&emsp;对有 $n$ 片花瓣的菊花图, 由 <u>lww 笔记 9.11.2 (Courant-Fischer)</u>, 我们有
$$
\lmd_i=\min_{S\sub V,~|S|=i}\max_{v\in S}\frac{v^\T L v}{v^\T v}.
$$
可以据此验证 $\lmd_1=0$, $\seq\lmd 2n=1$, $\lmd_{n+1}=n+1$.

> **命题 12.2.3**
>
> &emsp;&emsp;称每个点度数均为 $d$ 的图为 $d$-正则图, 则 $L=d\bs 1-A$, $\lmd_i=d-\mu_i$, 其中 $\mu_i$ 为 $A$ 的特征值.

> **命题 12.2.4**
>
> &emsp;&emsp;对无向图 $G$ 的邻接矩阵 $A$ 和其特征值 $\seq\mu1 n$, 有
>
> - $d_{\u{avg}}\le\mu_1\le d_{\max}$;
> - $\mu_1=\max_v\frac{v^\T A v}{v^\T v}$;
> - $\mu_1=\mu_2$ 当且仅当图不连通;
> - $\mu_1=-\mu_n$ 当且仅当图是二分图;
> - $\chi(G)\ge 1-\frac{\mu_1}{\mu_n}$.

&emsp;&emsp;*→ Proof.* 我们证明二分性. 一方面 $\mu_1=-\mu_n$ 时, 有
$$
\mu_1=|\mu_n|=\frac{|\theta^\T A\theta|}{|\theta^\T\theta|}\le\frac{\theta_{\u{abs}}^\T A\theta_{\u{abs}}}{\theta_{\u{abs}}^\T\theta_{\u{abs}}}\le\mu_1,
$$
即 $\theta_{\u{abs}}$ 就是 $\mu_1$ 对应的特征向量. 而为了取等, 有
$$
\theta^\T A\theta=\sum_{(u,v)\in E}\theta(u)\theta(v)\Ra \A(u,v)\in E,~\theta(u)\theta(v)\le 0.
$$
而 $\theta_{\u{abs}}$ 在每个位置必须严格${}>0$ (否则左乘 $A$ 之后与非 $0$ 值相邻的 $0$ 变为正数, 不是特征向量). 这样 $\theta$ 的符号已经成功给出了一个二部划分.

&emsp;&emsp;另一方面, 如果 $V=L\sqcup R$ 可二部划分, 对任意特征值 $\mu$ 和其特征向量 $\theta$, 令
$$
\theta_{\u{flip}}(u)=\theta(u)\cdot(-1)^{[u\in R]},
$$
显然 $A\theta_{\u{flip}}=-\mu\theta_{\u{flip}}$, 明所欲证.

&nbsp;

&emsp;&emsp;接下来考虑随机图 $\mathcal G(n,p)$.

&emsp;&emsp;对 $\mathcal G(n,\frac{1}{2})$, 由于 $d_{\u{avg}}\approx d_{\u{max}}\approx\frac{n}{2}$,它的 $\mu_1$ 一定在 $\frac{n}{2}$ 左右, 对应一个几乎均匀的特征向量, 我们将它剔除. 考虑 $A-\frac{1}{2}\bs 1$, 它的对角线为 $-\frac{1}{2}$, 其余每个位置都是均匀的 $\pm\frac{1}{2}$, 对称.

> **定义 12.2.5**
>
> &emsp;&emsp;对 $S\sub V$, 设 $\part S=S\cup\{v:\E u\in V,~(u,v)\in E\}$, 若对任意 $|S|<\frac{n}{2}$ 都有
> $$
> \frac{|\part S|}{|S|}\ge 1+\Omega(1),
> $$
> 则称 $G$ 是一个 expander 图.

# 第十三章 概率方法

## $\S13.1$ 引例

> **定理 13.1.1 (Erdos)**
>
> &emsp;&emsp;Ramsey 数 $R(k,k)>2^{k/2-1}$. (回忆 $R(k,\ell)=\min\{n\in \N:\A |V|=n,~G~\text{contains}~k\text{-clique or}~\ell\text{-indep. set}\}$.)

&emsp;&emsp;*→ Proof.* 考虑随机图 $\mathcal G(n,\frac{1}{2})$, 在其上, 如果
$$
\Ex[\#\{k\text{-clique}\}+\#\{k\text{-indep. set}\}]=2\x\binom{n}{k}2^{-\binom{k}{2}}<1,
$$
既不含 $k$-团也不含 $k$-独立集的存在概率就大于 $0$. 选取 $n=2^{k/2-1}$, 代入估计即可.

&emsp;&emsp;另一方面, 考察图中所有点与一个选定点的连边情况, 归纳地有
$$
R(k,\ell)\le R(k-1,\ell)+R(k,\ell-1)+1.
$$
所以我们有 $R(k,k)=\mathcal O(2^k)$. 总之就有 $R(k,k)=2^{\Theta(k)}$.

> **命题 13.1.2**
>
> &emsp;&emsp;设集合 $|X|=n\ge 2k$, $\Omega\sub 2^X$, $A\in \Omega\Ra |A|=k$, 且 $A,B\in\Omega\Ra A\cap B\neq\varnothing$, 则 $|\Omega|\le\binom{n-1}{k-1}$.

&emsp;&emsp;*→ Proof.* 取等容易: 选定 $x\in\bigcap\Omega$ 即可.

&emsp;&emsp;对一般地 $\Omega$, 设 $X=\Z_n$, 考虑 $X$ 上的随机排列 $\sigma$, 设 $A_i=\{i,i+1,\cdots,i+k-1\}$, 显然 $\Pr[\sigma(S)=A_i]=\frac{1}{\binom{n}{k}}$, 注意 $\sigma(\Omega)$ 仍然是一个合法集合; 一个合法集合里至多包含 $k$ 个 $A_i$, 那么
$$
\Ex[|\sigma(\Omega)\cap\{\seq A0{n-1}\}|]=\sum_{S\in\Omega}\Pr[\sigma(S)\in\{\seq A0{n-1}\}]=\frac{n}{\binom{n}{k}}\cdot|\Omega|\le k.
$$

> **命题 13.1.3**
>
> &emsp;&emsp;考虑两列集合 $\seq A1n$, $\seq B1n$, 满足 $|A_i|=k$, $|B_i|=\ell$, $A_i\cap B_i=\varnothing$, $i\neq j\Ra A_i\cap B_j\neq\varnothing$, 那么 $n\le\binom{k+\ell}{k}$.

&emsp;&emsp;*→ Proof.* 设 $X=\bigcup A_i\cup B_i$, 考虑 $X$ 上的随机全序 $\le_X$, 设事件 $E_i:\A x\in A_i,~\A y\in B_i,~x<y$. 为满足要求, $E_i$ 最多发生一个, 所以 $\Pr[E_i]\le\frac{1}{n}$. 而 $\Pr[E_i]=\frac{1}{\binom{k+\ell}{k}}$, 明所欲证.

## $\S13.2$ Alternation

> **定理 13.2.1**
>
> &emsp;&emsp;对任意 $k\ge 2$ 和 $n\ge k$, 存在 $M\in\M_{n\x n}(\F_2)$, 满足
>
> - $M$ 中 $1$ 的个数为 $\Omega\br{n^{2-\frac{2}{k+1}}}$;
> - $M$ 中不存在 $k\x k$ 的子矩阵 (这里子矩阵不要求连续下标).

&emsp;&emsp;*→ Proof.* 考虑一个随机阵, 其中每个元素独立取自 $\opn{Bern}(p)$. 则其中
$$
\Ex[\#\{1\text{-submatrix}\}]=p^{k^2}\binom{n}{k}\binom{n}{k},
$$
对每个这样的子矩阵, 我们任意将其中一个 $1$ 赋为 $0$, 操作完成后
$$
\Ex[\#\{1\}]\ge pn^2-p^{k^2}\binom{n}{k}\binom{n}{k}.
$$
据称取
$$
p^*=\br{\frac{n^2}{k^2n^{2k}}}^{\frac{1}{k^2-1}}
$$
就能达到目标.

> **定理 13.2.2**
>
> &emsp;&emsp;对任意 $k,\ell$, 存在图 $G$ 使得 $g(G)\ge \ell$ 且 $\chi(G)\ge k$. (回忆 $g(G)$ 是 $G$ 的最小环长, $\chi(G)$ 是 $G$ 的最小色数.)

&emsp;&emsp;*→ Proof.* 考虑 $\mathcal G(n,p)$, 其中
$$
\Ex[\#\{i\text{-cycle}\}]=\frac{n^{\ul i}}{i}p^i\le n^ip^i.
$$
取 $p=n^{\frac{1}{2\ell}-1}$,
$$
\Ex[\#\{\le\ell\text{-cycle}\}]\le n^3p^3+\cdots+n^\ell p^\ell=\mathcal O((np)^\ell)=o(n).
$$
令 $\alp(G)$ 为 $G$ 的最大独立集大小, 回忆 <u>定理 12.1.5</u> 有 $\chi(G)\alp(G)\ge n$, 那么令 $a=\frac{3}{p}\log n$, 有
$$
\Pr[\alp(G)\ge a]\le\binom{n}{a}(1-p)^{\binom{a}{2}}<\frac{1}{2},
$$
总之
$$
\Pr[\#\{\le\ell\text{-cycle}\}\le 2\sqrt{n}\land \alp(G)<a]>0.
$$
适当删除 $\mathcal O(\sqrt{n})$ 边破环, $\alp(G)\le\frac{3}{p}\log n+\sqrt{n}=o(n)$, 这样 $\chi (G)\ge n/\alp(G)$ 总能足够大.

> **命题 13.2.3**
>
> &emsp;&emsp;对有限集 $B\sub\Z\setminus\{0\}$, 存在 sum-free 的 $A\sub B$, 使得 $|A|>\frac{|B|}{3}$.

&emsp;&emsp;*→ Proof.* 选取足够大的素数 $p=3k+2$, 将 $B$ 嵌入 $\Z_p\setminus\{0\}$. 我们关心 $S=\{k+1,\cdots,2k+1\}$, 随机取 $r\in\F_p^\x$, 则
$$
\Ex[|rB\cap S|]=|B|\frac{k+1}{3k+1},
$$
因此存在 $r_0$ 使得 $|r_0B\cap S|>\frac{|B|}{3}$, 选择 $A=r_0^{-1}(r_0 B\cap S)$ 即可.

> **命题 13.2.4**
>
> &emsp;&emsp;存在 $n$ 阶竞赛图的 Hamilton 路径数不小于 $\frac{n!}{2^{n-1}}$.

&emsp;&emsp;*→ Proof.* 后者是 Hamilton 路径数的期望值.

> **命题 13.2.5**
>
> &emsp;&emsp;对竞赛图, 称其满足 $S_k$ 性质, 当且仅当 $\A T\in\binom{V}{k},~\E u\in V,~\A v\in T,~(u,v)\in E$. 则当 $n\ge k^22^k$, 总存在竞赛图满足 $S_k$ 性质.

&emsp;&emsp;*→ Proof.* 考虑随机竞赛图, 对任一 $T\in\binom{V}{k}$, $\Pr[u\tto T]=2^{-k}$, $\Pr[\A u~u\not\tto T]= (1-2^{-k})^{n-k}$. 对 $T$ union bound 出
$$
\Pr[\E T~\A u~u\not\tto T]\le\binom{n}{k}(1-2^{-k})^{n-k}.
$$

## $\S13.3$ 二次矩方法

> **例子 13.3.1**
>
> &emsp;&emsp;估计 $\binom{2n}{n}$.

&emsp;&emsp;*→ Solution* 设随机变量 $\seq X1{2n}\sim\opn{Bern}(\frac{1}{2})$, 则 $\Ex[\sum X_i]=n$, $\Var[\sum X_i]=\frac{n}{2}$, 那么
$$
\Pr\bk{\abs{\sum X_i-n}\ge\alp}\le\frac{n}{2\alp^2}.
$$
取 $\alp=\sqrt{n}$, 又已知 $\sum X_i=n$ 时单点概率最大, 所以
$$
\Pr\bk{\sum X_i=n}\ge\frac{1}{2\sqrt{n}+1}\Pr\bk{\abs{\sum X_i-n}\le\sqrt{n}}\ge\frac{1}{2(2\sqrt{n}+1)}.
$$

> **例子 13.3.2**
>
> &emsp;&emsp;设 $\nu(x)=\#\{p\in\mathbb P:p\mid x\}$, 则
> $$
> \#\l\{x\in[1:n]:\abs{\nu(x)-\ln\ln n}>\lmd\sqrt{\ln\ln n}\r\}\le\lmd^{-2}.
> $$

&emsp;&emsp;*→ Proof.* 设 $X\sim\opn{Unif}([1:n])$, 随机变量 $X_p:=[p\mid X]$, 则 $\nu(X)=\sum_p X_p$. 我们知道
$$
\nu(X)-10<\sum_{p<n^{0.1}}X_p\le\nu(X),
$$
估计中间这项,
$$
\Ex\bk{\sum_{p<n^{0.1}}X_p}=\sum_{p<n^{0.1}}\br{\frac{1}{p}-\mathcal O\br{\frac{1}{n}}}=\ln\ln n^{0.1}+o(1)=\ln\ln n+o(1).
$$
&emsp;&emsp;再来估计方差,
$$
\ALI{
	\Var\bk{\sum_{p<n^{0.1}}X_p} &= \sum_{p<n^{0.1}}\Var[X_p]+2\sum_{p<q<n^{0.1}}\opn{Cov}[X_p,X_q]\\
	&\le \sum_{p<n^{0.1}}\frac{1}{p}+2\sum_{p<q<n^{0.1}}\br{\frac{1}{pq}-\br{\frac{1}{p}-\frac{1}{n}}\br{\frac{1}{q}-\frac{1}{n}}}\\
	&\le  \ln\ln n+o(1)+o(1).
}
$$
所以
$$
\Pr\bk{\abs{\nu(X)-\Ex[\nu(X)]}\ge\lmd\sqrt{\ln\ln n}}\le\lmd^{-2}.
$$

> **定理 13.3.3**
>
> &emsp;&emsp;对随机图上的任意单调性质 $\mathcal P$, 存在阈值函数 $m^*:\N\to\N$, 使得
> $$
> m(n)=\omega(m^*(n))\Ra\lin\Pr[\mathcal P(\mathcal G(n,m(n)))]=1,\\
> m(n)=o(m^*(n))\Ra\lin\Pr[\mathcal P(\mathcal G(n,m(n)))]=0.
> $$
> 另外:
>
> - 如果存在 $\eps>0$ 使得上述两条分别替换为 $(1\pm\eps)m^*(n)$ 仍然成立, 则称 $m^*$ 是 sharp 阈值.
> - 如果存在 $\eps(n)=o(1)$, 使得上条替换仍然成立, 则称 $m^*$ 是 super sharp 阈值. 

&emsp;&emsp;*→ Proof.* 若 $m=m^*\cdot k$, 其中 $k=\omega(1)$, 由单调性我们知道
$$
1-\Pr[\lnot\mathcal P(\mathcal G(n,m^*))]^k\le\Pr[\mathcal P(\mathcal G(n,m))].
$$
另一侧同理 ($m^*=m\cdot k$, $k=\omega(1)$), 这样, 构造
$$
m^*(n)=\min\l\{m:\Pr[\mathcal P(\mathcal G(n,m))]\ge\frac{1}{2}\r\}
$$
显然它就是一个合法的阈值函数.

&emsp;&emsp;例如, 在 $\mathcal G=\mathcal G\br{n,\frac{\ln n-\alp(n)}{n}}$ 上, 某个点孤立的概率为
$$
\Pr[v~\text{isolated}]=\br{1-\frac{\ln n-\alp(n)}{n}}^{n-1}\approx \frac{\e^{\alp(n)}}{n}.
$$
则 $\Ex[\#\{\text{isolated}\}]=\e^{\alp(n)}$, 而
$$
\Var\bk{\sum X_v}=\sum_v\Var[X_v]+\sum_{u\ne v}\opn{Cov}[X_u,X_v]\le \e^{\alp(n)}+\frac{\ln n\cdot\e^{2\alp(n)}}{n}+\mathcal O(1)=\e^{\alp(n)}+\mathcal O(1).
$$
所以
$$
\Pr[\mathcal G~\text{connected}]\le\frac{\e^{\alp(n)}}{\br{\e^{\alp(n)}}^2}=\e^{-\alp(n)}.
$$
&emsp;&emsp;另一方面, 我们可以直接求小连通块的期望数量. 对 $p=\frac{\ln n+\alp(n)}{n}$ 有
$$
\ALI{
	\Ex[\#\{\text{connected component}\in[2:n/2]\}] &\le \sum_{k=2}^{n/2}\binom{n}{k}k^{k-2}p^{k-1}(1-p)^{k(n-k)}\\
	&\approx\sum_k \frac{\sqrt{n}n^n}{\sqrt{k(n-k)}(n-k)^{n-k}}k^{-2}p^{k-1}(1-p)^{k(n-k)}\\
	&= \sum_k\frac{n^{1.5}}{k(n-k)}\frac{n^{n-k}}{(n-k)^{n-k}}k^{-2}\\
	&\qquad\quad{}\x\br{\ln n+\alp(n)}^{k-1}\br{1-\frac{\ln n+\alp(n)}{n}}^{k(n-k)}\\
	&\le \cdots\\
	&< \sum_k n\br{\frac{\ln n}{\sqrt{n}}}^k.
}
$$
所以 $k\ge 3$ 的时候都是小量. 对 $k=2$ 单独估算也能得到 $o(1)$ 的界, 最终就知道 $\Pr[\mathcal G~\text{unconnected}]=o(1)$.

> **定理 13.3.4 (Lovász 局部性引理)**
>
> &emsp;&emsp;对 $n$ 个事件 $\seq A1n$, 设 $G=(V,E)$ 满足 $A_v$ 对 $\{A_u\}_{u\neq v\land (u,v)\notin E}$ 独立. 设 $p=\max\Pr[A_i]$, $d$ 为图中最大度, $\e pd<1$, 则 $\Pr[\A v~\lnot A_v]>0$.

&emsp;&emsp;*例如*, 我们尝试对 $d$-正则图 $G$ 进行边染色, 使得其不包含同色三角形. 我们对每条边均匀随机染 $[1:c]$ 中的颜色, 记坏事件 $A_{uvw}$ 表示 $(u,v,w)$ 是同色三角形, 则在 $A$ 的依赖关系图中, 最大度 $\Delta\le\frac{3(d-2)}{2}$, 设 $\Pr[A_{uvw}]\le\frac{1}{c^2}$, 取 $c\ge\sqrt{\frac{3}{2}(d-2)}$ 即可保证方案存在.