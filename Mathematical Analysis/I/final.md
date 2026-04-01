[TOC]

$$
\mathscr{Lorain~wy~Lora~blea.}

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
\newcommand{\loop}[0]{\circlearrowleft}
\newcommand{\go}[0]{\triangleright}

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
\newcommand{\algo}[1]{\begin{array}{r|l}#1\end{array}}
\newcommand{\dary}[2]{\l|\begin{array}{#1}#2\end{array}\r|}
\newcommand{\pary}[2]{\l(\begin{array}{#1}#2\end{array}\r)}
\newcommand{\pblk}[4]{\l(\begin{array}{c|c}{#1}&{#2}\\\hline{#3}&{#4}\end{array}\r)}
\newcommand{\u}[1]{\mathrm{#1}}
\newcommand{\t}[1]{\text{#1}}
\newcommand{\tb}[1]{\textbf{#1}}
\newcommand{\os}[2]{\overset{#1}{#2}}
\newcommand{\lix}[1]{\lim_{x\to #1}}
\newcommand{\ops}[1]{#1\cdots #1}
\newcommand{\seq}[3]{{#1}_{#2}\ops,{#1}_{#3}}
\newcommand{\dedu}[2]{\u{(#1)}\Ra\u{(#2)}}
\newcommand{\prv}[3]{\DS{{\DS #1} \over {\DS #2}}~(#3)}
$$

# 第一章 函数

## $\S1.1$ 实数

> *Tips.*
>
> &emsp;&emsp;看到逻辑的重要性.
>
> &emsp;&emsp;数学定义 $=$ 已知 $+$ 逻辑运算 $\Ra$ something new.

&nbsp;

&emsp;&emsp;无理数集 $\mathbb I$ 用 $\Q$ 的分划来定义.

> **定义 1.1.1 (分划和实数)**
>
> &emsp;&emsp;令 $\Q=A\cup B$, 其中 $A\cap B=\varnothing$ 且 $\A a\in A,~\A b\in B,~a<b$, $B$ 无最小值. 此时称分划 $(A\mid B)$ 是一个实数. 形式地,
> $$
> \R=\{(A\mid B):(A\mid B)\text{ is a partition of }\Q\}.
> $$

可以看出, $(A\mid B)$ 存在两类形式:


- $A$ 存在最大值, 显然 $(A\mid B)\in\Q$;
- $A$ 无最大值, 则它给出了一个所谓的无理数. 例如 $B:=\{r\in\Q : r>0,r^2>2\},~A:=\Q\setminus B\Ra(A\mid B)=:\sqrt2$.

&emsp;&emsp;我们承认, 可以利用有理数集 $A$ 里的已有运算定义出实数 $(A\mid B)$ 的序和四则运算.

> **定理 1.1.2 (Dedekind, 实数的完备性)**
>
> &emsp;&emsp;设 $(E\mid F)$ 为 $\R$ 的一个分划, 则 $E$ 必有最大数.

&emsp;&emsp;*→ Proof.* $(\tilde{A}\mid \tilde{B})$ 为 $\Q$ 的分划, 其中 $\tilde{A}=\bigcup_{(A\mid B)\in E}A$, 那么 $\tilde A=\arg\max E$.

&nbsp;

> **定义 1.1.3 (序数)**
>
> &emsp;&emsp;对集合 $A,B$, 若存在单射 $\varphi:A\to B$, 则称 $|A|\le|B|$. 若存在双射 $\varphi:A\to B$, 则称 $|A|=|B|$.

> **定理 1.1.4 (Schröder-Bernstein)**
>
> &emsp;&emsp;若 $|A|\le|B|$ 且 $|B|\le|A|$, 则 $|A|=|B|$.

&emsp;&emsp;*→ Proof.* $\le$ 的传递性是容易证明的. 此后, 取各自的单射 $f:A\to B$, $g:B\to A$, 则 $h:A\mapsto(g\circ f)(A),~a\mapsto (g\circ f)(a)$ 是 $A$ 与 $h(A)$ 间的双射. 那么现在我们得到了 $|h(A)|\le|g(B)|\le|A|$ 且 $|h(A)|=|A|$, 我们需要证明 "夹在中间" 的 $|g(B)|$ 和两侧的势相等.

&emsp;&emsp;形式地, 我们只需要证明:

> **引理 1.1.5**
>
> &emsp;&emsp;如果集合 $X,Y,Z$ 满足 $Z\sub Y\sub X$ 且 $|X|=|Z|$, 则 $|X|=|Y|$. 

&emsp;&emsp;*→ Proof.*&emsp;设 $f:X\to Z$ 是双射, 那么, 例如, 可以用以下方式给出双射 $g:X\to Y$:
$$
g(x)=\begin{cases}
f(x),&\E n\in\Z_{>0}, x\in f^n(X)\setminus f^n(Y);\\
x,&\text{otherwise}.
\end{cases}
$$
你需要看图:

<img src="assets/1-1.webp" alt="1-1.webp" style="zoom:25%;" />

我们的目标是通过双射 "消除" 最大的灰环. 为此, 我们让所有灰环映射向比自己小一圈的灰环, 所有白环不动, 这样就达成目的了; 最终还会剩下 $\bigcap_{n=0}^\oo f^n(X)$ 和 $\bigcap_{n=0}^\oo f^n(Y)$, 实际上直接取 $f$ 在其上的限制就能得到双射.

> **例子 1.1.6**
>
> &emsp;&emsp;1) $|Q\cap[0,1]|=|\Z_{>0}|$.
>
> &emsp;&emsp;2) $|\mathbb I\cap[0,1]|>|\N|$.
>
> &emsp;&emsp;3) 是否存在 $S\sub[0,1]$, 使得 $|Z_{>0}|<|S|<|[0,1]|$.
>
> &emsp;&emsp;4) $|\mathbb I\cap [0,1]|=|[0,1]|$.
>
> &emsp;&emsp;5) (不加转化地证明) $|\mathbb I\cap[0,1]|\neq|\Z_{>0}|$.
>
> &emsp;&emsp;6) 在 $[0,1]$ 内随机取 $N$ 次数, 求取到有理数的期望个数.

&emsp;&emsp;1), 2) 典; 3) 表述了连续统假设, 是不可证明或证伪的.

&emsp;&emsp;4) 任取一列无理数 $\{s_1,s_2,\cdots\}$, 列出有理数 $\{q_1,q_2,\cdots\}$, 将 $\{s_1,s_2,\cdots\}$ 映到两序列的并, 其余点不变.

&emsp;&emsp;5) 反证, 在二进制小数点后奇数位构造 $\{1,0,1,0,0,1,0,0,0,1,\dots\}$, 偶数位 $k$ 保证与被列出无理数中的第 $k/2$ 个不同即可.

&emsp;&emsp;6) 承认取在 $(a,b)$ 内的概率是 $a-b$, 我们需要证明 $|\Q\cap[0,1]|$ 零测就能说明答案是 $0$. 列出有理数 $\{q_1,q_2,\cdots\}$, 任取 $\delta>0$, 总能用一列长度分别为 $\{\delta\cdot2^{-k}:k=1,2,\dots\}$ 的依次覆盖这些数, 区间总长度是 $\delta\to0$.

## $\S1.3$ 函数的性质

> **定义 1.3.1 (上下界, 上下确界)**
>
> &emsp;&emsp;设 $E\sub\R$, 称 $E$ 有上界, 当且仅当 $\E A\in\R,~\A x\in E,~x\le A$;
>
> &emsp;&emsp;若 $M$ 为 $E$ 的上界, 且 $\A\eps>0,~\E x\in E,~M-\eps<x$, 则 $M$ 为 $E$ 的上确界, 记为 $M=\sup E$.

&emsp;&emsp;例如, $E=\{x:x^2<2\}$, 我们就有 $\sup E=\sqrt 2,~\inf E=-\sqrt 2$. 这里, 我们发现上确界不一定在 $\Q$ 内存在.

> **定理 1.3.2 (确界存在)**
>
> &emsp;&emsp;若非空的 $E\sub\R$ 存在上界, 则 $\sup E$ 在 $\R$ 内存在.

&emsp;&emsp;*→ Proof.* 这和 <u>定理 1.1.2</u> 本质上相同. 取 $(\tilde A\mid\tilde B)$ 为 $\Q$ 的分划, 其中 $\tilde A=\bigcup_{(A\mid B)\in E}A$, 则该分划给出了 $E$ 的上确界.

> **练习 1.3.3** (P22 例 1.3.7)
>
> &emsp;&emsp;若定义在 $\R$ 上的函数 $f$ 有基本周期 $\tau>0$, 且 $\A x\in(0,\tau),~f(0)\neq f(x)$, 则 $g:x\mapsto f(x^2)$ 不是周期函数.

&emsp;&emsp;考虑反证. 如果 $g$ 有周期 $T$, 那么
$$
g(x+T)=f((x+T)^2)=f(x^2+2xT+T^2)=f(x^2)=g(x).
$$
考察 $x=0$ 时的情况,
$$
g(T)=f(T^2)=g(0).
$$
根据条件, 有 $T^2=k\tau~(k\in\Z_{>0})$, 即 $T=\sqrt{k\tau}$. 再令 $x=\sqrt{(k+1)\tau}$ 代入原式,
$$
f\l(\l((2k+1)+2\sqrt{k(k+1)}\r)\tau\r)=f((k+1)\tau)=f(0).
$$
所以, $2\sqrt{k(k+1)}\in\Z$. 不妨设 $(t/2)^2=k(k+1)$, 注意应当有 $k<t/2<k+1$, 所以这样的 $t/2\in\Z$ 是不存在的.

> *Tips.*
>
> &emsp;&emsp;熟悉第一章剩的.

# 第二章 序列的极限

## $\S2.1$ 序列极限的定义

> **定义 2.1.1 (极限)**
>
> &emsp;&emsp;对序列 $\{a_n\}$, $\A\eps>0,~\E N,~\A n\ge N,~|a-a_n|<\eps$, 则称 $a$ 为 $\{a_n\}$ 的极限. 此外, 若 $a=+\oo$, 这里可定义作 $\A M>0,~\E N,~\A n\ge N,~a>M$. $a=-\oo$ 同理.

> **例子 2.1.2**
>
> &emsp;&emsp;验证 $\lim_{n\to\oo}\sqrt[n]{n}=1$.

&emsp;&emsp;*→ Proof.* 取定 $\eps>0$, 希望 $|\sqrt[n]{n}-1|<\eps$, 只需要 $n<(1+\eps)^n\Leftarrow n<\frac{1}{2}n(n-1)\eps^2$, 可得知 $n>\frac{2}{\eps^2}+1$, 相应地任取一个 $N$ 就行.

> **例子 2.1.3**
>
> &emsp;&emsp;若 $\lim_{n\to\oo}a_n=a$, 则 $\DS\lim_{n\to\oo}\frac{a_1+a_2+\cdots+a_n}{n}=a$ ($a=\pm\oo$ 亦成立, 证明稍作修正即可.)

&emsp;&emsp;*→ Proof.* 取定 $\eps>0$, 存在 $N$, 使得 $n\ge N$ 时 $|a_n-a|<\eps$, 那么
$$
\sum_{k=N}^n\frac{a_k-a}{n}<\sum_{k=N}^b\frac{|a_k-a|}{n}<\eps;
$$
另一方面, 根据 $N$, 可以找到 $N'$, 使得 $n\ge N'$ 时,
$$
\sum_{k=1}^{N-1}\frac{a_k}{n}<\eps.
$$
最终取 $N\gets\max\{N,N'\}$, 可知 $\dfrac{a_1+a_2+\cdots+a_n}{n}<2\eps$.

## $\S2.2$ 极限的性质

>**性质 2.2.1**
>
> &emsp;&emsp;若 $\A n\ge n_0,~a_n\le b_n\le c_n$ 且 $\lim_{n\to\oo}a_n=\lim_{n\to\oo}c_n=x$, 则 $\lim_{n\to\oo}b_n=x$.

> **例子 2.2.2**
>
> &emsp;&emsp;证明 $\DS\lim_{n\to\oo}\frac{n^k}{a^n}=0~(k\in\Z_{>0})$.

&emsp;&emsp;*→ Proof.* 当 $n\ge k+1$ 时, 令 $a=1+h~(h>0)$, 那么
$$
0\le\frac{n^k}{(1+h)^n}\le\frac{n^k}{\binom{n}{k+1}h^{k+1}}=\frac{(k+1)!}{\prod_{t=0}^k(1-t/n)\cdot h^{k+1}n}\to 0.
$$

> **性质 2.2.3**
>
> &emsp;&emsp;若 $a_n\to a,b_n\to b$, 那么:
>
> - $a_n\pm b_n\to a\pm b$.
> - $a_nb_n\to ab$.
> - $a_n/b_n\to a/b~(b\neq 0)$.

> **例子 2.2.4**
>
> &emsp;&emsp;1) 求 $\lim_{n\to\oo}a_n$, 其中 $a_n=5n^5-4n^4+3$.
>
> &emsp;&emsp;2) ..., 其中 $a_n=\frac{5n^4+4n^4+9}{n^5+b^3+2}$.
>
> &emsp;&emsp;3) ..., 其中 $a_n=\sin\sqrt{n^2+1}\pi-\sin n\pi$.

&emsp;&emsp;1) $a_n=n^5(5-\frac{4}{n}+\frac{3}{n^5})$, 利用性质即可. 2) 上下除以 $n^5$ 即可.

&emsp;&emsp;3)
$$
a_n=2\cos\frac{\sqrt{n^2+1}+n}{2}\pi\sin\frac{\sqrt{n^2+1}-n}{2}\pi,
$$
而 $\sqrt{n^2+1}-n\to0$, 后一项 $\to0$ 而前一项有界, 所以 $a_n\to 0$.

&nbsp;

> **性质 2.2.5**
>
> - 若 $\{a_n\}$ 收敛, 则其有界.
>
> - 对收敛的 $\{a_n\},\{b_n\}$, 若 $\E N,~\A n>N,~a_n\le b_n$, 那么 $a\le b$. 若 $a<b$, 那么 $\E N,~\A n>N,~a_n<b_n$.
>
> - 若 $\{a_n\}$ 收敛, 则其任意子列收敛于同值.
>
>     $\Ra$ 那么若存在两个子列极限不同, 则原序列不收敛.

## $\S2.3$ 单调收敛原理

> **定理 2.3.1**
>
> &emsp;&emsp;若单调上升的 $\{a_n\}$ 有上界, 则其收敛且 $\lim_{n\to\oo}a_n=\sup_{n\ge 1}a_n=:a$.

&emsp;&emsp;*→ Proof.* 由上确界定义, $\A \eps>0,~\E a_N>a-\eps$, 那么 $\A n\ge N,~a-a_n<\eps$.

&nbsp;

> **例子 2.3.2**
>
> &emsp;&emsp;1) 令 $a_n=(1+\frac{1}{n})^n$, 证明其极限 $e$ 存在.
>
> &emsp;&emsp;2) $e$ 是无理数.

&emsp;&emsp;1) 先说明其单增性,
$$
\begin{aligned}
	a_n&=\sum_{k=0}^n\binom{n}{k}\frac{1}{n^k}\\
	&=1+1+\sum_{k=2}^n\frac{1}{k!}\l(1-\frac{1}{n}\r)\l(1-\frac{2}{n}\r)\cdots\l(1-\frac{k-1}{n}\r).
\end{aligned}
$$
类似地,
$$
a_{n+1}=1+1+\sum_{k=2}^n\frac{1}{k!}\l(1-\frac{1}{n+1}\r)\l(1-\frac{2}{n+1}\r)\cdots\l(1-\frac{k}{n+1}\r)+\l(\frac{1}{n+1}\r)^{n+1}>a_n.
$$
再说明上界存在. 这里直接抄原来的东西啦,
$$
\begin{aligned}
	a_n &= \sum_{k=0}^n\binom{n}{k}\frac{1}{n^k}\\
	&= \sum_{k=0}^n\frac{n!}{k!(n-k)!}\cdot\frac{1}{n^k}\\
	&= \sum_{k=0}^n\frac{1}{k!}\cdot\frac{n!}{(n-k)!n^k}\\
	&\le \sum_{k=0}^n\frac{1}{k!} \le 1+1+\sum_{k=2}^n\frac{1}{2^{k-1}}\\
	&<3.
\end{aligned}
$$
所以极限 $e$ 存在.

&emsp;&emsp;2) 先证明 $\DS e=\lim_{n\to\oo}\l(1+\frac{1}{1!}+\frac{1}{2!}+\cdots+\frac{1}{n!}\r)$. 在刚刚的证明中已有 $e\le\cdots$, 我们需要说明 $e\ge\cdots$. 固定一个 $K\in\N$, 当 $n\ge K$ 时,
$$
a_n\ge1+1+\sum_{k=2}^K\frac{1}{k!}\l(1-\frac{1}{n}\r)\cdots\l(1-\frac{k-1}{n}\r).
$$
使 $n\to\oo$, 左侧为 $e$, 右侧 $\to1+1+\sum_{k=2}^K\frac{1}{k!}$, 再让 $K\to\oo$, 就有 $e\ge\cdots$, 得到目标.

&emsp;&emsp;易裂项放缩证明 $2<e<3$. 接下来, 假设 $e=\frac{q}{p}~(p>1,~p\perp q)$, 则 $p!e=(p-1)!q\in\N$, 即
$$
\begin{aligned}
	p!e&=p!\l(1+\cdots+\frac{1}{p!}+\frac{1}{(p+1)!}+\cdots\r)\\
	&=n_0+p!\l(\frac{1}{(p+1)!}+\cdots\r)\\
	&=n_0+\frac{1}{p+1}+\frac{1}{(p+1)(p+2)}+\cdots\\
	&\in\l(n_0+\frac{1}{p+1},n_0+\frac{2}{p+1}\r),
\end{aligned}
$$
但它一定不是一个整数. (或者, 直接考察一个 $>p$ 的素数也能证明.)

&emsp;&emsp;例如对粘性流体中的弹簧振子, 有
$$
m\ddot x+kx+\gamma\dot x=0.
$$
"尝试" $x=e^{\alpha t}$, 那么
$$
m\alpha^2+\gamma\alpha+k=0
$$
有两根 $\alpha_1,\alpha_2$, 可以写出通解 $x=c_1e^{\alpha_1t}+c_2e^{\alpha_2 t}$ (这能视作一个二维的线性空间), 根据初始条件求出 $c_1,c_2$ 即可.

&emsp;&emsp;*相关探索: Stirling 公式, 第二 Euler 常数.*

## $\S2.4$ 实数连续性的基本定理

> **定理 2.4.1 (Cauchy 收敛原理)**
>
> &emsp;&emsp;实数序列 $\{a_n\}$ 收敛 $\Eq$ $\A\eps>0,~\E N,~\A n,m\ge N,~|a_m-a_n|<\eps$.

&emsp;&emsp;例如 $a_n=\sum_{i=1}^n \frac{\sin i}{i^2}$ 就容易以此说明收敛. 对某个 $\eps>0$,
$$
\begin{aligned}
	|a_{n+p}-a_n| &= \l|\sum_{k=n+1}^{n+p}\frac{\sin k}{k^2}\r|\\
	&\le \sum_{k=n}^{n+p-1}\frac{1}{k(k+1)}\\
	&= \frac{1}{n}-\frac{1}{n+p}\\
	&<\eps.
\end{aligned}
$$
取任意 $N>\frac{1}{\eps}$ 即可.

&emsp;&emsp;我们稍后给出本定理的证明.

&nbsp;

> **定理 2.4.2 (区间套)**
>
> &emsp;&emsp;若有一列 $[a_1,b_1]\supset [a_2,b_2]\supset\cdots$ 且 $b_n-a_n\to 0$, 则
> $$
> \E c\in\R,~\bigcap_{n=1}^\oo[a_n,b_n]=\{c\}.
> $$

&emsp;&emsp;事实上, 还有 $\lin a_n=\lin b_n=c$; 这等价于 Dedekind 定理.

&nbsp;

> **定理 2.4.3 (Bolzano-Weierstrass)**
>
> &emsp;&emsp;若 $\{a_n\}$ 有界, 则 $\{a_n\}$ 存在收敛的子列 $\{a_{n_k}\}_{k=1}^\oo$.

> **定理 2.4.4 (聚点)**
>
> &emsp;&emsp;设 $E\sub\R$, 称 $x_0$ 为 $E$ 的聚点, 当且仅当 $\A \delta>0,U_\circ(x_0,\delta)\cap E\neq\varnothing$. 则有界的无穷点列必有聚点.

&emsp;&emsp;*→ Proof @2.4.3* 似乎原来对它的证明不太聪明. 只需要在 $\{a_n\}$ 的界 $[-M,M]$ 上取区间套, 二分地缩小区间, 每次顺便选出一个元素即可. <u>定理 2.4.3</u> 和 <u>定理 2.4.4</u> 显然是等价的.

&emsp;&emsp;*→ Proof @2.4.1* 左推右平凡. 只说明右推左. 取 $\eps=1$ 可知原数列有界, 则它存在收敛的子列 $\{a_{n_k}\}_{k=1}^\oo\to a$, 下证原序列也收敛到 $a$. 对 $\eps>0$, 在子列中可以取出 $N_1$, 使得 $k>N_1\Ra |a_{n_k}-a|<\frac{\eps}{2}$. 再在原序列取 $N_2$, 使得 $n,m> N_2\Ra |a_n-a_m|<\frac{\eps}{2}$, 最终令 $N=\max\{n_{N_1},N_2\}$, 当 $n>N$ 时, $|a_n-a|<|a_n-a_{n_{N_1}}|+|a_{n_{N_1}}-a|<\eps$.

&nbsp;

> **定理 2.4.5 (压缩映像)**
>
> &emsp;&emsp;若 $f:[a,b]\to[a,b]$ 满足 $|f(x)-f(x')|<q|x-x'|~(0<q<1)$, 则 $\E! x_*\in[a,b],~f(x_*)=x_*$.

&emsp;&emsp;*→ Proof.* 可以直接说明, $\A x\in[a,b],\lin f^n(x)=x_*$ 给出了不动点, 这是因为迭代序列是 Cauchy 列. 唯一性反证就行.

&emsp;&emsp;例如对 $|q|<1$, $x-q\sin x=a\Ra x=a+q\sin x$ 是 $f:x\mapsto q\sin x$ 的不动点, 由此可直接得知该方程有唯一解.

&nbsp;

> **定理 2.4.6 (有限覆盖)**
>
> &emsp;&emsp;设 $\mathcal U=\{U_i=(c_i,d_i)\}_{i\in I}$ 是 $[a,b]$ 的一个开覆盖, 则必有有限的 $J\sub I$, 使得 $\bigcup_{j\in J}U_j\supset[a,b]$.

&emsp;&emsp;*→ Proof.* 反证, 对 $[a,b]$, 二分地取出一个到 $x\in[a,b]$ (这要求了 $[a,b]$ 是闭的) 的区间套, 使得这一族区间都必须被无穷个开区间覆盖. 然而, 必然有一个 $U_k\supset\{x\}$, 它使得套住 $x$ 的无穷多个小区间实际上可以被一个开区间覆盖 (这要求了 $\mathcal U$ 是开区间集), 得到矛盾.

&emsp;&emsp;由此也可以推知 <u>定理 2.4.4</u>, 仍考虑反证, 若不存在聚点, 则能够对每个 $x\in E$ 取出邻域 $U(x,\delta_x)$, $\mathcal U=\bigcup_{x\in E}U(x,\delta_x)$ 是 $[-M,M]$ 的开覆盖, 取出一个有限开覆盖, 则 $E$ 只有有限个点, 矛盾.

&emsp;&emsp;到此可以声明, 至少在 $\R$ 上, 区间套定理, 有限覆盖定理, Weierstrass 定理, 聚点定理是两两等价的; 区间套定理与 Dedekind 定理等价, 而 Cauchy 收敛原理也与它们等价.

&nbsp;

> **定理 2.4.7 (Lebesgue)**
>
> &emsp;&emsp;设 $\mathcal U=\{U_i\}_{i\in I}$ 是 $[a,b]$ 的一个开覆盖, 则 $\E\delta>0,~\A x,x'\in[a,b],~|x-x'|<\delta\Ra\E i\in I,~x,x_i\in U_i$. 称 $\delta$ 为 $\mathcal U$ 的一个 Lebesgue 数.

&emsp;&emsp;*→ Proof.* 考虑 $\mathcal U$ 的有限覆盖的端点升序列为 $\{c_1,c_2,\cdots,c_n\}$, 直接取 $\delta=\min_{i=1}^{n-1}\{c_{i+1}-c_i\}$ 即可.

&emsp;&emsp;或者也可以反证, 对 $\delta=\frac{1}{n}$, $\E x_n,x_n'\in[a,b],~|x_n-x_n'|<\delta\land \not\E U_i\supset\{x_n,x_n'\}$, 则有界的 $\{x_n\}$ 具有收敛的子列, 设其收敛到 $x\in[a,b]$, 显然 $\{x_n'\}$ 也收敛到 $x$. 然而, 必然存在 $U_i\ni x$, 它明显导致假设矛盾.

## $\S2.5$ 上下极限

> **定义 2.5.1 (上下极限)**
>
> &emsp;&emsp;对 $\{a_n\}$, 设 $|a_n|\le M$, 令
> $$
> h_n=\sup_{k\ge n}\{a_k\},\quad\ell_n=\inf_{k\ge n}\{a_k\}.
> $$
> 并定义
> $$
> \lsup a_n=\lin h_n,\quad\linf a_n=\lin\ell_n.
> $$
> 为 $\{a_n\}$ 的上, 下极限.

&emsp;&emsp;由于 $-M\le\ell_n\le a_n\le h_n\le M$ 而 $\{h_n\}$ 单减, $\{\ell_n\}$ 单增, 所以这两个序列都存在极限. 显然, 若 $\lin a_n=a$, 必然有 $\lsup a_n=\linf a_n=a$.

> **例子 2.5.2**
>
> &emsp;&emsp;1) 若 $\{a_n\}$ 有下界且 $a_{n+m}\le a_n+a_m$, 则 $\lin a_n/n$ 存在.
>
> &emsp;&emsp;2) $\lin\sin n$ 不存在.

&emsp;&emsp;(例如, $a_n=\log\|A^n\|$, 则 $\lin a_n/n=\max\{\|\lambda\|:\lambda\text{ is a char of }A\}$.)

&emsp;&emsp;*→ Proof.* 1) 任取 $p\in\Z_{\ge 1}$, 对 $n=kp+r~(0\le r<p)$, 不妨 $a_0=0$, 则
$$
a_n=a_{kp+r}\le a_{kp}+a_r\le ka_p+a_r\\
\Ra \frac{a_n}{n}\le\frac{ka_p}{kp+r}+\frac{a_r}{n}\to\frac{a_p}{p}.
$$
因此
$$
\lsup\frac{a_n}{n}\le\frac{a_p}{p}\quad(\A p\in\Z_{\ge 1})\\
\Ra\lsup\frac{a_n}{n}\le\inf_{p\ge 1}\l\{\frac{a_p}{p}\r\}\le\liminf_{p\to\oo}\frac{a_p}{p}.
$$
最终就有
$$
\lsup\frac{a_n}{n}=\linf\frac{a_n}{n}=\lin a_n.
$$
&emsp;&emsp;2) 由于 $\frac{\pi}{2}>1$, 那么 $[2k\pi+\frac{\pi}{4},2k\pi+\frac{3\pi}{4}]$ 里有无穷个自然数, 它们的 $\sin\ge\frac{\sqrt 2}{2}$, 因此 $\lsup\sin n\ge\frac{\sqrt 2}{2}$. 同理, 最终可知上下极限不相等, 所以极限不存在.

&nbsp;

> **定理 2.5.3**
>
> &emsp;&emsp;1) $\lsup-a_n=-\linf a_n$.
>
> &emsp;&emsp;2)
> $$
> \linf a_n+\linf b_n\le\linf(a_n+b_n)\\\le\linf a_n+\lsup b_n\le\lsup(a_n+b_n)\\\le\lsup a_n+\lsup b_n.
> $$
> &emsp;&emsp;3) 对 $\{a_n\}$, 存在一个子列, 使得
> $$
> \lim_{k\to\oo}a_{n_k}=\lsup a_n.
> $$

&emsp;&emsp;关于 2), 形如 $\inf\{a_n,a_{n+1},\cdots\}+\inf\{b_n,b_{n+1},\cdots\}\le\inf\{a_n+b_n,\cdots\}$ 地研究即可.

&nbsp;

> **例子 2.5.4**
>
> &emsp;&emsp;固定 $\lambda\ge 2$, 若 $y_n=x_n+\lambda x_{n+1}$, 则 $\lin x_n$ 存在等价于 $\lin y_n$ 存在.

&emsp;&emsp;右推左是显然的, 讨论左推右. 先说明 $x_n$ 有界. 由于 $|y_n|\le M$, 又 $|x_n|\le M\Ra |x_{n+1}|=\frac{|y_n-x_n|}{\lambda}\le M$, 所以 $\{x_n\}$ 有界, 上下极限存在. 由 $x_n=y_n-\lambda x_{n+1}$ 得, $h=\lsup(y_n-\lambda x_n)=y-\lambda\ell$, 下极限也有 $\ell=y-\lambda h$, 所以只能 $h=\ell$, 极限存在.

# 第三章 函数极限与连续性

## $\S 3.1$ 函数的极限

> **定义 3.1.1 ($\eps-\delta$ 语言)**
>
> &emsp;&emsp;若 $f(x)$ 在 $U_\circ(x_0,\delta_0)$ 有定义, 且 $\A\eps>0,~\E\delta\in(0,\delta_0),~\A x\in U_\circ (x_0,\delta),~|f(x)-A|<\eps$, 则称 $f(x)$ 在 $x_0$ 有极限 $A$, 记作 $\lim_{x\to x_0}f(x)=A$. 类似定义左极限 $\lim_{x\to x_0-0}f(x)=:f(x_0-0)=A$ 和右极限 $\lim_{x\to x_0+0}f(x)=:f(x_0+0)=A$.

&emsp;&emsp;例如对 $\lim_{x\to x_0}\sin x=\sin x_0$, 先研究二者之差,
$$
|\sin x-\sin x_0|=\l|2\cos\frac{x+x_0}{2}\sin\frac{x-x_0}{2}\r|\le2\l|\frac{x-x_0}{2}\r|=|x-x_0|<\eps,
$$
所以直接取 $\delta=\eps$, 验证 $\eps-\delta$ 语言即可.

&emsp;&emsp;又如 $(0,1)$ 上的 Dirichlet 函数 $D(x)=[x\in\Q]$, 明显它在任何一点都不存在极限. 但若考虑 Riemann 函数
$$
R(x)=\begin{cases}
\frac{1}{p},&x=\frac{q}{p},~p\perp q;\\
0,&x\notin\Q.
\end{cases}
$$
它却处处存在极限, 极限都为 $0$. 对 $x_0\in(0,1)$, 对任意的 $\eps>0$, 注意满足 $\frac{1}{p}\ge\eps\Ra p\le\frac{1}{\eps}$ 的 $\frac{q}{p}$ 只有有限个, 能够列为 $x_1,x_2,\cdots,x_{n_\eps}$ (将 $x_0$ 排除), 记它们的到 $x_0$ 的最小距离为 $m$, 取 $\delta=m$, 就有 $\A x\in U_\circ(x_0,\delta),~|R(x)-0|<\eps$.

&nbsp;

> **性质 3.1.2**
>
> &emsp;&emsp;若在 $U_\circ(x_0,\delta_0)$ 上有 $f(x)\le g(x)\le h(x)$ 且 $\lim_{x\to x_0}f(x)=\lim_{x\to x_0}h(x)=A$, 则 $\lim_{x\to x_0}g(x)=A$.

> **例子 3.1.3**
>
> &emsp;&emsp;求证 $\DS\lim_{x\to0}\frac{\sin x}{x}=1$.

&emsp;&emsp;(还没引入级数定义, 我们姑且认定 $\sin x$ 由单位圆上的几何长度定义.)

&emsp;&emsp;先证明 $f(0+0)=1$, 对 $0<x<\pi/2$, 考虑三角形和扇形的面积, 有
$$
\frac{1}{2}\sin x<\frac{1}{2}x<\frac{1}{2}\tan x \Ra \cos x<\frac{\sin x}{x}<1,
$$
根据 <u>性质 3.1.2</u>, 可以夹出 $f(0+0)=1$. 另一面, $\frac{\sin(-t)}{-t}=\frac{\sin t}{t}$, 是一样的.

&nbsp;

> **定义 3.1.4 ($\eps-M$ 语言)**
>
> &emsp;&emsp;若 $\A\eps>0,~\E M>0,~\A x\ge M,~|f(x)-A|<\eps$, 则记 $\lix{+\oo}f(x)=A$.

> **例子 3.1.5**
>
> &emsp;&emsp;求证 $\DS\lix{+\oo}\l(1+\frac{1}{x}\r)^x=e$.

&emsp;&emsp;当 $x\ge 2$, 可以夹出
$$
\l(1+\frac{1}{\lfloor x\rfloor +1}\r)^{\lfloor x\rfloor}\le\l(1+\frac{1}{x}\r)^x\le\l(1+\frac{1}{\lfloor x\rfloor}\r)^{\lfloor x\rfloor+1}.
$$
显然左右两侧的整数列极限都是 $e$, 因此原式成立.

&emsp;&emsp;当然, 再结合 $\l(1+\frac{1}{-n}\r)^{-n}=e$, 可以得到 $\DS\lix\oo\l(1+\frac{1}{x}\r)^x=e$; 类似也有 $\DS\lix 0\l(1+x\r)^{1/x}=e$.

> **性质 3.1.6 (四则运算)**
>
> &emsp;&emsp;(同理序列极限, 承认幂运算性质.)

> **例子 3.1.7**
>
> &emsp;&emsp;求 $\DS\lix0(1-\sin x)^{\cot 3x}$.

&emsp;&emsp;考虑凑出 $(1+t)^{1/t}$ 的形式, 同时利用 <u>性质 3.1.6</u> 中的四则运算和幂运算性质有:
$$
\begin{aligned}
	\DS\lix0(1-\sin x)^{\cot 3x}
	&= \lix 0(1-\sin x)^{\frac{1}{-\sin x}\cdot\frac{-\sin x}{\sin 3x}\cdot\cos 3x}\\
	&= \lix 0 e^{\frac{-(\sin x)/x}{3(\sin 3x)/(3x)}\cos 3x}\\
	&= \lix 0 e^{-\frac{1}{3}\cos 3x}\\
	&= e^{-\frac{1}{3}}.
\end{aligned}
$$
&nbsp;

&emsp;&emsp;接下来, 把数列极限的更多结论搬到函数上.

>**定理 3.1.8**
>$$
>\lix{x_0}f(x)\text{ exists}\Eq\A\{x_n\}\to x_0\land x_n\neq x_0,~\lin  f(x_n)\text{ exists}.
>$$

&emsp;&emsp;*→ Proof.* 左推右, 设 $\lix{x_0}f(x)=A$, 则 $\lin f(x_n)=A$ 显然. 右推左, 若 $\{x_n\}\to x_0$ 和 $\{x_n'\}\to x_0$, 且 $f(x_n)\to A$, $f(x_n')\to A'$, 断言 $A=A'$. 否则, $z_n=\{x_1,x_1',x_2,x_2',\cdots\}\to x_0$ 中 $\lin f(z_n)$ 不存在. 下证 $\lix{x_0}f(x)=A$. 若否, 则存在 $\eps_0>0$, 对 $\delta_n=\frac{1}{n}$, 都有 $\tilde x_n\in U_\circ(x_0,\delta_n)$, 使得 $|f(\tilde x_n)-A|>\eps_0$. 显然 $\{\tilde x_n\}\to x_0$, 但 $\lin f(\tilde x_n)\neq A$, 矛盾.

> **定理 3.1.9 (Cauchy)**
> $$
> \lix{x_0}f(x)\text{ exists}\Eq\A\eps>0,~\E\delta>0,~\A x,x'\in U_\circ(x_0,\delta),~|f(x)-f(x')|<\eps.
> $$

&emsp;&emsp;*→ Proof.* 左推右容易. 右推左, 利用 <u>定理 3.1.8</u>, 取出 $\{f(x_n)\}$ 的 Cauchy 列证明极限存在.

> **定义 3.1.10 (函数的上下极限)**
>
> &emsp;&emsp;若 $f$ 在 $(x_0-\delta_0,x_0)$ 上有上界, 在其上定义
> $$
> h(\delta):=\sup_{0<x_0-x<\delta}f(x),
> $$
> 并定义
> $$
> \limsup_{x\to x_0-0}f(x)=\lim_{\delta\to 0+0}h(\delta).
> $$

> **定理 3.1.11**
> $$
> \lix{x_0-0} f(x)\text{ exists} \Eq \limsup_{x\to x_0-0}f(x)=\liminf_{x\to x_0-0}f(x).
> $$

&emsp;&emsp;到此, 我们有 a) 定义, b) 单调上升有上界则有极限, c) Cauchy 收敛原理, d) 上下极限四种手段研究函数极限的存在性.

## $\S3.2$ 函数的连续性

> **定义 3.2.1 (连续性)**
>
> &emsp;&emsp;若定义在 $(a,b)$ 上的 $f$ 对某个 $x_0\in(a,b)$, 满足 $\lix{x_0}f(x)=f(x_0)$, 则称 $f$ 在 $x_0$ 连续.
>

&emsp;&emsp;典型如 $f(x)=x\sin\frac{1}{x}~(x\neq 0),~f(0)=0$; $f(x)=\sin x/x~(x\neq 0),~f(0)=1$; $f(x)=(1+x)^{1/x}~(x\neq 0),~f(0)=e$ 在定义域连续. 上文的 Riemann $R(x)$ 在一切无理点连续, 在一切有理点不连续.

&emsp;&emsp;类似地, 可以定义函数的左右连续性:

> **定义 3.2.2 (左右连续)**
>
> &emsp;&emsp;若 $\lix{x_0+0}f(x)=f(x_0)$, 则 $f$ 在 $x_0$ 右连续;
>
> &emsp;&emsp;若 $\lix{x_0-0}f(x)=f(x_0)$, 则 $f$ 在 $x_0$ 左连续.

&emsp;&emsp;典型如 $f(x)=x-\lfloor x\rfloor~(x\ge 0)$ 只是右连续的.

- 若 $x_0$ 处的左右极限相等但不等于 $f(x_0)$, 则称 $x_0$ 为可去间断点.
- 若 $x_0$ 处的左右极限存在但不连续, 则称 $x_0$ 为第一类间断点.
- 否则即 $x_0$ 至少一侧极限不存在, 则称 $x_0$ 为第二类间断点.

> **定义 3.2.3 (连续函数)**
>
> &emsp;&emsp;若 $f$ 在 $(a,b)$ 内任意一点都连续, 则称 $f$ 为 $(a,b)$ 上的连续函数, 记为 $f\in C(a,b)$.
>
> &emsp;&emsp;若定义在 $[a,b]$ 的 $f$ 在 $(a,b)$ 内任意一点都连续, 在 $a$ 右连续, 在 $b$ 左连续, 同理有 $f\in C[a,b]$.

&nbsp;

> **定理 3.2.4 (介值定理)**
>
> &emsp;&emsp;若 $f\in C[a,b]$ 满足 $f(a)<f(b)$, 则 $\A\eta\in(f(a),f(b)),~\E\xi\in(a,b),~f(\xi)=\eta$.

&emsp;&emsp;*→ Proof.* 区间套, 可以套出 $f(c)\le\eta\land f(c)\ge\eta$.

&emsp;&emsp;例如, 这容易给出 $x-a\sin x-b=0$ 至少有一个根的证明 (前文用压缩映像证明了 $|a|<1$ 的情形). 这也说明, 任何奇数次多项式方程都有至少一个实根.

> **例子 3.2.5**
>
> &emsp;&emsp;若 $f\in C(S^1)$ (以单位圆上的点集为定义域, $\R$ 为值域的连续函数), 则一定存在一直径上两点 $A,B$, 使得 $f(A)=f(B)$.

&emsp;&emsp;*→Proof.* 设 $g(\theta)=f(e^{i\theta})$, $h(\theta)=g(\theta+\pi)-g(\theta)$, 则 $h\in C[0,\pi]$. 注意 $h(0)=g(\pi)-g(0)$, $h(\pi)=g(0)-g(\pi)$, 二者要么同 $0$ 要么异号, 异号时根据介值定理也能取出一个 $g(\theta+\pi)=g(\theta)$.

> **性质 3.2.6**
>
> &emsp;&emsp;a) 若 $f,g$ 在 $x_0$ 连续, 那么 $f\pm g,fg,f/g$ 在 $x_0$ 有意义时则连续.
>
> &emsp;&emsp;b) 若 $f$ 在 $x_0$ 连续, $y:=f(x_0)\in D_g$ 且 $g$ 在 $y$ 连续, 则 $g\circ f$ 在 $x_0$ 连续.

> **命题 3.2.7**
>
> &emsp;&emsp;若 $f:(a,b)\emap(c,d)$ 严格单增, 那么 $f$ 和 $f^{-1}$ 皆连续.

&emsp;&emsp;证明不难. 这直接给出, $\sin:(-\pi/2,\pi/2)\to(-1,1)$ 和 $\arcsin:(-1,1)\to(-\pi/2,\pi/2)$ 都连续; $\cos:(0,\pi)\to(-1,1)$ 和 $\arccos:(-1,1)\to(0,\pi)$ 都连续; $\tan:(-\pi/2,\pi/2)\to\R$, $\arctan:\R\to(-\pi/2,\pi/2)$ 都连续.

&emsp;&emsp;对一般的指数函数, 有定义
$$
a^x:=\sup\{a^r:r\le x,~r\in\Q\}.\quad (a>1)
$$
首先, $x_1<x_2\Ra a^{x_1}<a^{x_2}$, 根据定义是明显的. 因此已有 $f(x_0-)\le f(x_0)\le f(x_0+)$, 希望证明 $f(x_0-)=f(x_0+)$. 下证对 $\eps>0$, 都有
$$
1\le\frac{f(x_0+)}{f(x_0-)}\le 1+\eps.
$$
利用 Archimedes 原理, 对充分大的 $N$, 使得 $(q-2)/N<x_0<q/N$, 因此 $a^{(q-2)/N}\le f(x_0-)\le f(x_0)\le f(x_0+)\le a^{q/N}$. 那么 $f(x_0+)/f(x_0-)\le 2/N$, 则只能 $f(x_0+)=f(x_0-)$. 得知 $a^{\bs\cdot}:\R\to(0,\oo)$ 是一个严格单增的连续函数, $\log_a:(0,\oo)\to\R$ 也是连续的.

&emsp;&emsp;对幂函数, 可以写作
$$
x^\alpha=e^{\alpha\ln x}.\quad(x>0)
$$
是连续的. 结合 <u>性质 3.2.6</u>, 我们证明了初等函数都是连续的.

## $\S3.3$ 闭区间上连续函数的基本性质

> **定理 3.3.1 (有界性)**
>
> &emsp;&emsp;若 $f\in C[a,b]$, 则 $\E M\ge 0,\A x\in[a,b],~|f(x)|\le M$.

&emsp;&emsp;*→ Proof.* 根据连续性, 对一切 $x\in [a,b]$, 都存在邻域 $U(x,\delta_x)$, 使得 $f$ 在 $U(x,\delta_x)\cap[a,b]$ 有界. 由于 $[a,b]$ 是紧的, 覆盖 $\mathcal U=\{U(x,\delta_x):x\in[a,b]\}$ 存在一个有限的子覆盖, 这样就能取出 $M$.

&emsp;&emsp;或者, 可以反证, 不妨设 $f$ 无上界. 那么 $\A n\in\N,~\E x_n\in[a,b],~f(x_n)>n$. 则 $\{x_n\}$ 有界, 存在收敛子列 $\{x_{n_k}\}\to x_0$. 由于 $f$ 连续, 就有 $\{f(x_{n_k})\}\to f(x_0)$, 这与 $\{f(x_{n_k})\}\to\oo$ 矛盾.

&nbsp;

> **定理 3.3.2 (最值定理)**
>
> &emsp;&emsp;若 $f\in C[a,b]$, 则 $\E x_0\in[a,b],~f(x_0)=\sup_{x\in[a,b]}\{f(x)\}$; $\E y_0\in[a,b],~f(y_0)=\inf_{y\in[a,b]}\{f(y)\}$.

&emsp;&emsp;*→ Proof.* 用 <u>定理 3.3.1</u> 的反证手法即可证明.

&nbsp;

> **定义 3.3.3 (一致连续)**
>
> &emsp;&emsp;称 $f$ 在 $I=\lang a,b\rang$ ($\ul\lang\in\{\ul(,\ul[\}$) 上一致连续, 当且仅当 $\A\eps>0,~\E\delta>0,~\A x_1,x_2\in I,~|x_1-x_2|<\delta\Ra|f(x_1)-f(x_2)|<\eps$.

> **定理 3.3.4 (一致连续性)**
>
> &emsp;&emsp;若 $f\in C[a,b]$, 则 $f$ 在 $[a,b]$ 上一致连续.

&emsp;&emsp;(例如, $f(x)=1/x~(x\in(0,1))$ 是连续的, 但不是一致连续的.)

&emsp;&emsp;*→ Proof.* 考虑有限开覆盖的 Lebesgue 数即可.

&emsp;&emsp;也能反证. 若某个 $\eps_0>0$ 使得 $\A n\in\N,~\E x_n,y_n\in I,~|x_n-y_n|<1/n\land |f(x_n)-f(y_n)|\ge\eps_0$, 取 $\{x_n\}$ 的一收敛子列 $\{x_{n_k}\}\to z$, 显然也有 $\{y_{n_k}\}\to z$, 再根据连续性, 这给出 $|f(z)-f(z)|\ge\eps_0$, 这是不可能的.

&emsp;&emsp;由 $1/x$ 的例子可以看出, 一致连续性与区间关联. 形式地, 若 $f$ 在 $\lang a,b\rang$ 一致连续, 那么它一定在其子区间连续; 但若 $f$ 不一致连续, 它也可能在其子区间一致连续.

> **例子 3.3.5**
>
> &emsp;&emsp;证明 $f(x)=\sqrt x$ 在 $[0,\oo)$ 上一致连续.

&emsp;&emsp;$|\sqrt{x_1}-\sqrt{x_2}|\le\sqrt{|x_1-x_2|}<\eps$, 取 $\delta=\eps^2$ 即可. 当然, 如果只注意到了 $|\sqrt{x_1}-\sqrt{x_2}|=|x_1-x_2|/(\sqrt{x_1}+\sqrt{x_2})<\eps$ 形式的放缩, 可以先在 $[0,2]$ 上用 <u>定理 3.3.4</u> 说明一致连续性, 对 $[1,\oo)$ 再构造 $\delta$ (这时分母就有意义了). 注意这里需要留出一段交集, 调控 $\delta$ 使得 $x_1,x_2$ 一定同时落在某个 case 中.

## $\S3.4$ 无穷小量与无穷大量的阶

&emsp;&emsp;一些极限结论:
$$
\lix0\frac{a^x-1}{x}=\lim_{t\to0}\frac{1}{\frac{1}{t}\log_a(1+t)}=\frac{1}{\log_a e}=\ln a.
$$

$$
\lix0\frac{(1+x)^\mu-1}{x}=\lix0\frac{e^{\mu\ln(1+x)}-1}{\mu\ln(1+x)}\frac{\mu\ln(1+x)}{x}=\lix0\frac{\mu\ln(1+x)}{x}=\mu.
$$

&emsp;&emsp;例如,
$$
\lix0\frac{\ln\cos x}{x^2} = \lix0 \frac{\ln\l(1-2\sin^2\frac{x}{2}\r)}{-2\sin^2\frac{x}{2}}\frac{-2\sin^2\frac{x}{2}}{4\l(\frac{x}{2}\r)^2} = -\frac{1}{2}.
$$

> **定义 3.4.1 (无穷小量)**
>
> &emsp;&emsp;若 $\lix{x_0}f(x)=0$, 则称 $f(x)$ 为一个无穷小量.
>
> - 若两无穷小量 $f,g$ 满足 $\lix0f(x)/g(x)=0$, 则称 $f$ 为 $g$ 的更高阶无穷小, 记为 $f(x)=\omicron(g(x))$.
> - 若 ... 满足 $\lix0f(x)/g(x)=1$, 称二者为等价无穷小量, 记为 $f(x)\sim g(x)$.
> - 若 ... 满足 $\lix0f(x)/g(x)=\text{Constant}\neq0$, 则称二者为同阶无穷小量. (有时记为 $f(x)=O(g(x))$.)

&emsp;&emsp;容易构造说明, 在乘除的极限里, 等价无穷小量可以任意替换; 加减法存在时则不一定可行 (低阶量抵消后, 被忽略的高阶量会影响结果). 例如 $\lix0(\tan x-\sin x)/x^3$,
$$
\lix0\frac{\tan x-\sin x}{x^3}=\lix0\frac{\sin x(1-\cos x)}{x^3\cos x}=\lix0\frac{1-\cos x}{x^2}=\lix0\frac{2\sin^2\frac{x}{2}}{x^2}=\frac{1}{2}.
$$

# 第四章 导数与微分

## $\S4.1$ 导数

> **定义 4.1.1 (导数)**
>
> &emsp;&emsp;若 $f$ 在 $U(x_0,\delta)$ 内有定义, 且
> $$
> \lim_{\Delta x\to 0}\frac{f(x_0+\Delta x)-f(x)}{\Delta x_0}
> $$
> 存在, 则称 $f$ 在 $x_0$ 处可导, 将此值称为 $f$ 在 $x_0$ 处的导数, 记为 $f'(x_0)$. 类似地定义左导数 $f_-'(x_0)$ 和右导数 $f_+'(x_0)$.

&emsp;&emsp;容易验证, $(\sin x)'=\cos x$ (和差化积), $(a^x)'=a^x\ln a$ (结合 $\S3.4$ 结论), $(x^\mu)'=\mu x^{\mu-1}$ (结合 $\S3.4$ 结论).

&emsp;&emsp;由于有
$$
\lix{x_0}\frac{f(x)-f(x_0)-f'(x_0)(x-x_0)}{x-x_0}=0,
$$
就给出
$$
f(x)=f(x_0)+f'(x_0)(x-x_0)+\omicron(x-x_0).
$$
即 $f'(x_0)$ 给出了 $f$ 在 $x_0$ 处一次逼近的系数.

&emsp;&emsp;明显 $f'(x_0)$ 存在当且仅当 $f_-'(x_0)$ 和 $f_+'(x_0)$ 都存在且相等, 也蕴含着 $f$ 在 $x_0$ 连续.

## $\S4.2$ 求导数的方法

> **性质 4.2.1 (四则运算)**
>
> &emsp;&emsp;假设所涉及导数都存在的前提下,
>
> - $(f+g)'=f'+g'$.
> - $(fg)'=fg'+f'g$.
> - $f/g=(f'g-g'f)/g^2$.

&emsp;&emsp;*→ Proof.* 对于除法, 由于 $g'(x)$ 存在, 可知 $g$ 在 $x$ 连续. 又 $g(x)\neq 0$, 所以存在 $\delta_0>0$, 使得 $\A|\Delta x|<\delta_0,~g(x+\Delta x)\neq 0$. 这时
$$
\begin{aligned}
	\lim_{\Delta x\to 0}\frac{1}{\Delta x}\l(\frac{f(x+\Delta x)}{g(x+\Delta x)}-\frac{f(x)}{g(x)}\r)
	&= \lim_{\Delta x\to 0}\frac{1}{\Delta x}\frac{f(x+\Delta x)g(x)-f(x)g(x)+f(x)g(x)-f(x)g(x+\Delta x)}{g(x+\Delta x)g(x)}\\
	&= \frac{f'(x)g(x)-f(x)g'(x)}{g(x)^2}.
\end{aligned}
$$
例如,
$$
(\tan x)'=\l(\frac{\sin x}{\cos x}\r)'=\frac{\cos^2 x+\sin^2 x}{\cos^2 x}=\frac{1}{\cos^2 x},\\
(\cot x)'=\l(\frac{\cos x}{\sin x}\r)'=-\frac{1}{\sin^2 x}.
$$

> **性质 4.2.2**
>
> &emsp;&emsp;设 $f:(a,b)\emap(c,d)$ 严格单调, 则 $f^{-1}=g$ 存在. 此时若 $f(x_0)=y_0$ 处 $f'(x_0)$ 存在且不为 $0$, 那么 $g'(y_0)$ 存在且满足 $f'(x_0)g'(y_0)=1$. 

&emsp;&emsp;*→ Proof.* 对充分小的 $\Delta y\neq 0$, 由连续性明显 $\Delta x=g(y_0+\Delta y)-g(y_0)\neq 0$ 也充分小, 则
$$
\frac{g(y_0+\Delta y)-g(y_0)}{\Delta y}=\frac{\Delta x}{\Delta y}=\frac{1}{\frac{\Delta y}{\Delta x}}=\frac{1}{f'(x_0)}.
$$
例如, 由于 $\sin:(-\pi/2,\pi/2)\emap(-1,1)$, 就有
$$
(\arcsin x)'=\frac{1}{(\sin y)'|_{y=\arcsin x}}=\frac{1}{\cos(\arcsin x)}=\frac{1}{\sqrt{1-x^2}},\\
(\arccos x)'=(\pi/2-\arcsin x)'=-\frac{1}{\sqrt{1-x^2}}.
$$
再如, 由于 $\tan:\R\emap(-\pi/2,\pi/2)$, 有
$$
(\arctan x)'=\frac{1}{(\tan y)'|_{y=\arctan x}}=\cos^2(\arctan x)=\frac{1}{1+\tan^2(\arctan x)}=\frac{1}{1+x^2},\\
(\opn{arccot} x)'=-\frac{1}{1+x^2}.
$$
以及
$$
(\log_a x)'=\frac{1}{(a^y)'|_{y=\log_a x}}=\frac{1}{x\ln a}.
$$

> **性质 4.2.3 (链式法则)**
>
> &emsp;&emsp;若 $f'(x_0)$ 和 $g'(x_0)$ 存在, 则 $h=g\circ f$ 在 $x_0$ 可导, 且 $h'(x_0)=g'(f(x_0))f'(x_0)$.

&emsp;&emsp;注意处理 $\Delta y=0$ 的情况. 例如令
$$
A(t)=\begin{cases}
	\frac{g(y_0+t)-g(y_0)}{t},&t\neq 0;\\
	g'(y_0),&t=0.
\end{cases}
$$
来研究 $A(\Delta y)\frac{\Delta y}{\Delta x}$.

&emsp;&emsp;注意一个比较特别的: $(\ln|x|)'=\frac{1}{x}$.

&nbsp;

**隐函数**

&emsp;&emsp;对于 $F(x,y)=0$, 若 $\A x\in(a,b),~\E! y=f(x),~F(x,y)=0$, 则称 $f$ 是该方程确定的隐函数, 这里承认 $f$ 可导

&emsp;&emsp;例如对 Kepler 方程 $y-\eps\sin y=x$, 就有 $y'-\eps\cos y\cdot y'=1\Ra y'=\frac{1}{1-\eps \cos y}$.

&nbsp;

**参数方程**

&emsp;&emsp;$\DS\begin{cases}x=x(t),\\y=y(t)\end{cases}$ 给出参数方程, 若承认反函数 $t=g(x)$ 存在且可导, 那么 $y'(x)=y'(t)t'(x)=\frac{y'(t)}{x'(t)}$.

&nbsp;

**极坐标**

&emsp;&emsp;$r=r(\theta)$ 给出极坐标系下的曲线. 例如心形线 $r=a(1+\cos\theta)$, 纺锤线 $r^2=a^2\cos2\theta$. 某点斜率可由 $y'(\theta)/x'(\theta)$ 给出.

## $\S 4.3$ 微分

> **定义 4.3.1**
>
> &emsp;&emsp;若 $f$ 在 $U(x_0,\delta_0)$ 上有定义, 称 $f(x)$ 在 $x_0$ 可微, 当且仅当存在常数 $A$, 使得 $f(x_0+\Delta x)-f(x_0)=A\Delta x+\omicron(\Delta x)$.

&emsp;&emsp;容易证明, $f$ 在 $x_0$ 可微当且仅当其在 $x_0$ 可导, 此时有 $A=f'(x_0)$. (不过这一命题在无穷维不一定成立.)

> **定义 4.3.2**
>
> &emsp;&emsp;若 $f$ 在 $x_0$ 可微, 则称 $\Delta x\mapsto A\Delta x$ 为 $f(x)$ 在 $x_0$ 时的微分映射, $\d y=f'(x_0)\d x$ 称为 $f(x)$ 在 $x_0$ 的微分.

&emsp;&emsp;注意区分微分和微分映射的概念.

## $\S4.4$ 高阶导数与高阶微分

&emsp;&emsp;一些常见结果:
$$
\sin^{(n)}x=\sin\l(x+\frac{\pi n}{2}\r),\quad \cos^{(n)}x=\cos\l(x+\frac{\pi n}{2}\r).
$$

> **定理 4.4.1 (Leibnitz 公式)**
> $$
> (fg)^{(n)}=\sum_{k=0}^n\binom{n}{k}f^{(k)}g^{(n-k)}.
> $$

&emsp;&emsp;*→ Proof.* 归纳之, $n=1$ 明显成立. 若 $n$ 时成立, 考虑 $n+1$ 时,
$$
\begin{aligned}
	(fg)^{(n+1)} &= \sum_{k=0}^n\binom{n}{k}(f^{(k)}g^{(n-k)})'\\
	&= \sum_{k=0}^n\binom{n}{k}(f^{(k+1)}g^{(n-k)}+f^{(k)}g^{(n-k+1)})\\
	&= \sum_{k=0}^{n+1}\l(\binom{n}{k}+\binom{n}{k-1}\r)f^{(k)}g^{(n+1-k)}\\
	&= \sum_{k=0}^{n+1}\binom{n+1}{k}f^{(k)}g^{(n+1-k)}.
\end{aligned}
$$
因此结论成立.

&emsp;&emsp;高阶导数可以记为
$$
f^{(n)}(x)=\frac{\d^n y}{(\d x)^n}=\frac{\d^n y}{\d x^n},
$$
$\d x^n$ 是 $(\d x)^n$ 的简记. 也写作 $\d^ny=f^{(n)}(x)\d x^n$. 对于自变量 $x$, 有 $\d(\d x)=0$.

&emsp;&emsp;例如, 对 $z=g(f(x))$, 有
$$
\begin{aligned}
	\d^2z&=\d(g'(y)\d y)\\
	&=\d(g'(y))\d y+{\color{red} g'(y)\d^2 y}\\
	&=g''(y)\d y^2+g'(y)\d^2 y\\
	&=g''(y)(f'(x)\d x)^2+g'(y)f''(x)\d x^2\\
	&=(g''(y)f'(x)^2+g'(y)f''(x))\d x^2.
\end{aligned}
$$
只有一阶微分具有形式不变性, 因为对非自变量的高阶微分会出现<font color="red">红色</font>项.

# 第五章 导数的应用

## $\S5.1$ 微分中值定理

> **引理 5.1.1 (Fermat 中值)**
>
> &emsp;&emsp;若 $f$ 定义于 $(a,b)$ 且 $x_0\in(a,b)$ 为其一个极值点, 则若 $f'(x_0)$ 存在, 必有 $f'(x_0)=0$.

&emsp;&emsp;*→ Proof.* 根据极值点定义, $\DS f_+'(x_0)=\lix{x_0+}\frac{f(x)-f(x_0)}{x-x_0}\le 0$, 同理 $\DS f_-'(x_0)=\lix{x_0-}\frac{f(x)-f(x_0)}{x-x_0}\ge 0$, 因此导数存在时只能有 $f'(x_0)=0$.

> **定理 5.1.2 (Rolle 中值)**
>
> &emsp;&emsp;设 $f\in C{[a,b]}$, 在 $(a,b)$ 上导数存在, 且 $f(a)=f(b)$, 则 $\E\xi\in(a,b),~f'(\xi)=0$.

&emsp;&emsp;*→ Proof.* 研究函数最大最小值, 对非常数函数, 最大最小值必有至少一者在 $(a,b)$ 中. 根据 <u>引理 5.1.1</u>, 此处导数为 $0$.

> **定理 5.1.3 (Lagrange 中值)**
>
> &emsp;&emsp;设 $f\in C{[a,b]}$, 在 $(a,b)$ 上导数存在, 则 $\E\xi\in(a,b),~f'(\xi)=\frac{f(a)-f(b)}{a-b}$.

&emsp;&emsp;*→ Proof.* 令 $F(x)=f(x)-\frac{f(b)-f(a)}{b-a}(x-a)$, 那么 $F(a)=F(b)$, 根据 <u>定理 5.1.2</u>, 可以给出 $\xi$.

> **定理 5.1.4 (Darboux 介值)**
>
> &emsp;&emsp;设 $f\in C{[a,b]}$, 在 $(a,b)$ 上导数存在, $f_+'(a)<f_-'(b)$, 那么 $\A\eta\in(f_+'(a),f_-'(b)),~\E\xi\in(a,b),~f'(\xi)=\eta$.

&emsp;&emsp;*→ Proof.* 先设 $f_+'(a)<0$, $f_-'(b)>0$, 由 $\DS\lix{a+}\frac{f(x)-f(a)}{x-a}<0$ 知 $\E x'\in(a,b),~f(x')<f(a)$. 同理 $\E x''\in(a,b),~f(x'')<f(b)$. 故 $f(x)$ 的最小值在 $(a,b)$ 中取到, 由 <u>引理 5.1.1</u>, 存在 $f'(\xi)=0$. 一般情况, 令 $F(x)=f(x)-\eta x$ 即可.

> **定理 5.1.5 (Cauchy 中值)**
>
> &emsp;&emsp;若 $f,g\in C[a,b]$, 且各自导数在 $(a,b)$ 存在, $g'(x)\neq 0$, 则
> $$
> \E\xi\in(a,b),~\frac{f(b)-f(a)}{g(b)-g(a)}=\frac{f'(\xi)}{g'(\xi)}.
> $$

&emsp;&emsp;*→ Proof.* 这相当于是曲线 $x=g(t),~y=f(t)$ 上的 Lagrange 中值定理. 具体地, 构造
$$
h(x)=f(x)-\frac{f(b)-f(a)}{g(b)-g(a)}(g(x)-g(a))\in C[a,b].
$$
可用 Rolle 中值定理取出 $h'(\xi)=0$, 移项即得.

&nbsp;

&emsp;&emsp;上述中值定理可以给出一些直接的结论. 例如:

- $f'(x)\equiv 0\Eq f(x)\equiv C$.
- 若 $\A x\in(a,b),~|f'(x)|\le M$, 则 $f$ 在 $(a,b)$ 一致连续. (反之未必, 例如 $\sqrt x$.)

> **例子 5.1.6**
>
> &emsp;&emsp;(a) 当 $-1<x$ 且 $x\neq 0$, 证明
> $$
> \frac{x}{1+x}<\ln(1+x)<x.
> $$
> &emsp;&emsp;(b) 设 $0<a<b$, 证明
> $$
> (1+a)\ln(1+a)+(1+b)\ln(1+b)<(1+a+b)\ln(1+a+b).
> $$
> 

&emsp;&emsp;(a) 当 $x>0$, 令 $f(t)=\ln(1+t)\in C[0,x]$, 中值定理可以给出 $x>f(x)-f(0)=\ln (1+x)=f'(\xi)(x-0)=\frac{x}{1+\xi}>\frac{x}{1+x}$, 其中 $\xi\in(0,x)$. 当 $x<0$ 类似分析.

&emsp;&emsp;(b) 令 $f(t)=(1+t)\ln(1+t)$, 那么 $f(a+b)-f(b)=f'(\xi)a=a\ln(1+\xi)+a>a\ln(1+a)+\ln(1+a)$.

## $\S5.2$ L' Hospital 法则

> **定理 5.2.1**
>
> &emsp;&emsp;设 $f(x)$ 和 $g(x)$ 定义于 $(a,a+\delta_0)$ 且各处导数存在. 若以下三点皆成立:
>
> - $f(a+)=g(a+)=0$;
> - $g'(x)\neq 0$;
> - $\DS\lix{a+}\frac{f'(x)}{g'(x)}=:L$ 广义存在;
>
> 则有 $\DS\lix{a+}\frac{f(x)}{g(x)}=L$.

&emsp;&emsp;*→ Proof.* 补充 $f(a)=g(a):=0$, 对任意 $x\in(a,a+\delta_0)$, 总存在 $\xi\in(a,x)$, 使得

$$
\frac{f(x)}{g(x)}=\frac{f(x)-f(a)}{g(x)-g(a)}=\frac{f'(\xi)}{g'(\xi)}.
$$

由于右式极限存在且 $x\to a+$ 同时有 $\xi\to a+$, 这就给出了结论.

&emsp;&emsp;一个不适用的例子:
$$
0=\lix{0+}\frac{x^2\sin  x^{-1}}{x}\neq\lix{0+}\frac{2x\sin x^{-1}-\cos x^{-1}}{1}~(\text{not exists}).
$$
虽然总是有 $\xi=\xi_x\in(0,x)$, 使得
$$
\frac{x^2\sin x^{-1}}{x}=\frac{2\xi\sin\xi^{-1}-\cos\xi^{-1}}{1},
$$
但 $\lix{0+}$ 和 $\lim_{\xi\to 0+}$ 并不等价.

&nbsp;

> **定理 5.2.2**
>
> &emsp;&emsp;设 $f(x)$ 和 $g(x)$ 定义于 $(\delta_0,+\oo)$ 且各处导数存在. 若以下三点皆成立:
>
> - $f(+\oo)=g(+\oo)=0$;
> - $g'(x)\neq 0$;
> - $\DS\lix{+\oo}\frac{f'(x)}{g'(x)}=:L$ 广义存在;
>
> 则有 $\DS\lix{+\oo}\frac{f(x)}{g(x)}=L$.

&emsp;&emsp;*→ Proof.* 令 $F(t)=f(1/t)$, $G(t)=g(1/t)$, 二者在 $(0,1/\delta_0)$ 可导. 明显 $\lix{+\oo}f(x)/g(x)=\lim_{t\to 0+}F(t)/G(t)$, 验证
$$
\lim_{t\to0+}\frac{F'(t)}{G'(t)}=\frac{f(1/t)\cdot-t^{-2}}{g(1/t)\cdot-t^{-2}}=L
$$
存在, 套用 <u>定理 5.2.1</u> 即可.

&nbsp;

> **定理 5.2.3**
>
> &emsp;&emsp;设 $f(x)$ 和 $g(x)$ 定义于 $(a,a+\delta_0)$ 且各处导数存在. 若以下三点皆成立:
>
> - $f(a+)=\oo$, $g(a+)=\oo$;
> - $g'(x)\neq 0$;
> - $\DS\lix{a+}\frac{f'(x)}{g'(x)}=:L$ 广义存在;
>
> 则有 $\DS\lix{a+}\frac{f(x)}{g(x)}=L$.

&emsp;&emsp;*→ Proof.* 对 $x\in(a,a+\delta_0)$, 取 $x_1\in(x,\delta_0)$, 那么
$$
\frac{f(x)-f(x_1)}{g(x)-g(x_1)}=\frac{f(x)}{g(x)}{\color{red}\frac{1-\frac{f(x_1)}{f(x)}}{1-\frac{g(x_1)}{g(x)}}}=\frac{f'(\xi)}{g'(\xi)},
$$
希望让<font color="red">红色</font>项趋于 $1$. 任给 $\eps>0$, 则存在 $\delta_1>0$, 使得当 $x\in(a,a+\delta_1)$ 时,
$$
L-\eps/2<\frac{f'(x)}{g'(x)}<L+\eps/2.
$$
任取定 $x_1\in(a,a+\delta_1)$ 以及 $\delta_2\in(0,\min\{x_1-a,\delta_1\})$, 使得 $x\in(a,a+\delta_2)$ 时恒有 $|f(x_1)/f(x)|,|g(x_1)/g(x)|<1$. 对 $x\in(a,a+\delta_2)$ 有
$$
L-\eps/2<\frac{f(x)-f(x_1)}{g(x)-g(x_1)}=\frac{f(x)}{g(x)}\frac{1-\frac{f(x_1)}{f(x)}}{1-\frac{g(x_1)}{g(x)}}=\frac{f'(\xi)}{g'(\xi)}<L+\eps/2.
$$
其中 $\xi\in(x,x_1)$, 因此贡献了两侧不等号. 令繁分式项为 $h(x,x_1)$, 那么
$$
\frac{L-\eps/2}{h(x,x_1)}<\frac{f(x)}{g(x)}<\frac{L+\eps/2}{h(x,x_1)}.
$$
由于 $x_1$ 固定时 $h(a+)=1$, 所以存在 $\delta_3\in(0,\delta_2)$, 当 $x\in(a,a+\delta_3)$ 时,
$$
L-\eps<\frac{f(x)}{g(x)}<L+\eps.
$$

&nbsp;

> **定理 5.2.4**
>
> &emsp;&emsp;设 $f(x)$ 和 $g(x)$ 定义于 $(c,+\oo)$ 且各处导数存在. 若以下三点皆成立:
>
> - $f(+\oo)=\oo$, $g(+\oo)=\oo$;
> - $g'(x)\neq 0$;
> - $\DS\lix{+\oo}\frac{f'(x)}{g'(x)}=:L$ 广义存在;
>
> 则有 $\DS\lix{+\oo}\frac{f(x)}{g(x)}=L$.

&emsp;&emsp;*→ Proof.* 令 $F(t)=f(t^{-1})$, $G(t)=g(t^{-1})$, 则 $t\in(0,1/c)$,
$$
\lix\oo\frac{f(x)}{g(x)}=\lim_{t\to0+}\frac{F(t)}{G(t)}=\lim_{t\to0+}\frac{f'(t^{-1})\cdot-t^{-2}}{g'(t^{-1})\cdot-t^{-2}}=L.
$$
使用 <u>定理 5.2.3</u> 即证.

&nbsp;

&emsp;&emsp;例如验证
$$
f(x)=\begin{cases} e^{-x^{-2}}, & x\neq 0;\\ 0,&x=0. \end{cases}
$$
满足
$$
f^{(n)}(x)=\begin{cases} P_n(x^{-1})e^{-x^{-2}},& x\neq 0;\\ 0, & x=0. \end{cases}
$$
其中 $P_n(x^{-1})$ 表示关于 $x^{-1}$ 的多项式. 对 $f'(0)$, 有
$$
f'(0)=\lim_{t\to 0}\frac{e^{-t^{-2}}}{t}=\lim_{y\to\oo}\frac{y}{e^{y^2}}=\lim_{y\to\oo}\frac{1}{2ye^{y^2}}=0.
$$
$f'(x)=2x^{-3}e^{-x^{-2}}~(x\neq 0)$. 下归纳证明.
$$
f^{(n+1)}(x)=\begin{cases} P_{n+1}(x^{-1})e^{-x^{-2}},& x\neq 0;\\ 0, & x=0. \end{cases}
$$

$$
f^{(n+1)}(0)=\lim_{t\to 0}\frac{f^{(n)}(t)-f^{(n)}(0)}{t}=\lim_{y\to\oo}\frac{Q_n(y)}{e^{y^2}}=0.
$$

## $\S5.3$ Taylor 公式

&emsp;&emsp;研究何时能有 $f(x)=a_0+a_1(x-x_0)+\cdots+a_n(x-x_0)^n+\omicron((x-x_0)^n)$. 明显 $\{a_n\}$ **若存在**则唯一.

> **定理 5.3.1 (Taylor)**
>
> &emsp;&emsp;若 $f^{(n)}(x)$ 存在, 则上述多项式逼近存在, 且有
> $$
> f(x)=f(x_0)+\frac{f'(x_0)}{1!}(x-x_0)+\frac{f''(x_0)}{2!}(x-x_0)+\cdots+\frac{f^{(n)}(x_0)}{n!}(x-x_0)^n+\omicron((x-x_0)^n).
> $$
> 称为 $f(x)$ 在 $x_0$ 的 Taylor 多项式. 此时余项称为 Peano 余项. 高阶小量部分可以记作 $R_n(x)$.

&emsp;&emsp;*→ Proof.* 欲证
$$
\lix{x_0}\frac{\DS f(x)-\sum_{k=0}^n\frac{f^{(k)}(x_0)}{k!}(x-x_0)^k}{(x-x_0)^n}=0.
$$
左侧洛 $n-1$ 次, 得
$$
\lix{x_0}\frac{\DS f^{(n-1)}(x)-(f^{(n-1)}(x_0)+f^{(n)}(x_0)(x-x_0))}{n!(x-x_0)}=0.
$$
利用定义可得结论.

&emsp;&emsp;对初等函数在 $x_0=0$ 处的展开, 常见结论:
$$
e^x=1+x+\frac{x^2}{2!}\ops+\frac{x^n}{n!}+\omicron(x^n),\\
\sin x=x-\frac{x^3}{3!}\ops+\frac{(-1)^k}{(2k+1)!}x^{2k+1}+\omicron(x^{2k+2}),\\
\cos x=1-\frac{x^2}{2!}+\frac{x^4}{4!}\ops+\frac{(-1)^k}{(2k)!}x^{2k}+\omicron(x^{2k+1}),\\
\ln(1+x)=x-\frac{x^2}{2}\ops+\frac{(-1)^{n-1}}{n}x+\omicron(x^n),\\
(1+x)^\alpha=1+\alpha x\ops+\frac{\alpha^{\ul n}}{n!}x^n+\omicron(x^n).\quad(\alpha\in\R)
$$
当然, 也可以利用复合, 通过 Taylor 展开反求一些导数.

&emsp;&emsp;例: 展开 $\sin x~(x_0=1)$, $\arcsin x~(x_0=0)$.

> **定理 5.3.2 (Lagrange 余项)**
>
> &emsp;&emsp;如果 $f^{(n+1)}(x)$ 在 $(a,b)\ni x_0$ 也存在, 则余项可以写为
> $$
> f(x)=f(x_0)+\frac{f'(x_0)}{1!}(x-x_0)+\frac{f''(x_0)}{2!}(x-x_0)+\cdots+\frac{f^{(n)}(x_0)}{n!}(x-x_0)^n+\frac{f^{(n+1)}(\xi)}{(n+1)!}(x-x_0)^{n+1}.
> $$
> 其中 $\xi\in(x,x_0)$ 存在. 这时余项称为 Lagrange 余项. 当 $f^{(n+1)}(\xi)$ 有界时, 才能以此推出 Peano 余项. $\xi$ 也能写作 $\xi=x_0+\theta(x-x_0)$, 其中 $\theta\in(0,1)$.

&emsp;&emsp;*→ Proof.* 令 $F(t)=f(x)-\sum_{k=0}^n\frac{f^{(k)}(t)}{k!}(x-t)^k$, $G(t)=(x-t)^{n+1}$, 希望研究 $\frac{F(x_0)}{G(x_0)}$. 注意到
$$
\frac{F(x_0)}{G(x_0)}=\frac{F(x_0)-F(x)}{G(x_0)-G(x)}=\frac{F'(\xi)}{G'(\xi)}{\color{red}=}\frac{f^{(n+1)}(\xi)}{(n+1)!}.
$$
(最后一个等号需要一定验算.)

> **定理 5.3.3**
>
> &emsp;&emsp;设 $f\in C[a,b]$, 则对任意 $\eps>0$, 都存在多项式 $P$, 使得
> $$
> \max_{x\in[a,b]}|f(x)-P(x)|<\eps.
> $$

&emsp;&emsp;*→ Proof.* 不妨 $[a,b]=[0,1]$. *证明思想上*, 设随机事件 $Y\in\{0,1\}$ with $P\{Y=1\}=x$, 由于 $\lin\frac{Y_1\ops+Y_n}{n}=x$, 因此
$$
\lin f\l(\frac{Y_1\ops+Y_n}{n}\r)=f(x).
$$
严格地, 令
$$
P_n(x)=\sum_{k=0}^nf\l(\frac{k}{n}\r)\binom{n}{k}x^k(1-x)^{n-k},
$$
那么
$$
P_n(x)-f(x)=\sum_{k=0}^n\l(f\l(\frac{k}{n}\r)-f(x)\r)\binom{n}{k}x^k(1-x)^{n-k}.
$$
由于 $f$ 一致连续, 因此对任意 $\eps>0$, 能够取出 $\delta>0$, 使得 $|x_1-x_2|<\delta\Ra|f(x_1)-f(x_2)|<\eps/2$. 这样,
$$
\begin{aligned}
	|P_n(x)-f(x)|
	&\le\l(\sum_{|k/n-x|<\delta}+\sum_{|k/n-x|\ge\delta}\r)\l|f\l(\frac{k}{n}\r)-f(x)\r|\binom{n}{k}x^k(1-x)^{n-k}\\
	&<\eps/2+\frac{M}{2n\delta^2}.
\end{aligned}
$$
当 $n$ 足够大时便得证. 其中第二步放缩用到
$$
\sum_{k=0}^n\l(\frac{k}{n}-x\r)^2\binom{n}{k}x^k(1-x)^{n-k}=\frac{x(1-x)}{n}.
$$

> **定理 5.3.4 (Lagrange 插值)**
>
> &emsp;&emsp;给定点值 $\{(x_k,y_k)\}_{k=0}^n$, 求一 $n$ 次多项式 $p(x)$ 使得 $p(x_k)=y_k$. 则可令
> $$
> \omega_k(x)=\frac{\prod_{i\neq k}(x-x_k)}{\prod_{i\neq k}(x_i-x_k)},
> $$
> 并给出
> $$
> p(x)=L_n(x):=\sum_{i=0}^ny_i\omega_i(x).
> $$

&emsp;&emsp;容易验证.

> **定理 5.3.5**
>
> &emsp;&emsp;设 $f^{(n+1)}(x)$ 在 $[a,b]$ 存在, 以 $\{x_k\}$ 插值出多项式 $L_n(x)$, 则
> $$
> \A x\in[a,b]\setminus\{x_k\},~\E\xi\in[a,b],~f(x)-L_n(x)=\frac{f^{(n+1)}(\xi)}{(n+1)!}\omega(x).
> $$
> 其中
> $$
> \omega(x)=\prod_{i=0}^n(x-x_i).
> $$

&emsp;&emsp;*→ Proof.* 固定 $x$, 令
$$
F(t)=f(t)-L_n(t)-\frac{f(x)-L_n(x)}{\omega(x)}\omega(t).
$$
则 $F(t)$ 有 $n+2$ 个零点 $x,x_0,\cdots,x_n$, 所以 $F^{(n+1)}(t)$ 在 $[a,b]$ 必有零点 $\xi$, 这就给出
$$
f^{(n+1)}(\xi)-\frac{f(x)-L_n(x)}{\omega(x)}(n+1)!=0\Ra f(x)-L_n(x)=\frac{f^{(n+1)}(\xi)}{(n+1)!}\omega(x).
$$

> **定理 5.3.6**
>
> &emsp;&emsp;设对 $f$ 在 $x_0$ 处的 $n$ 阶 Taylor 展开为 $T_n(x)$, 则对任意 $n$ 次多项式 $p_n(x)\neq T_n(x)$, 使得存在 $\delta>0$, 使得 $(x_0-\delta,x_0+\delta)$ 上各点都有 $|f(x)-T_n(x)|<|f(x)-p_n(x)|$.

&emsp;&emsp;*→ Proof.* 直接比较二者无穷小量的阶数.

## $\S5.4$ 利用导数研究函数

> **命题 5.4.1**
>
> &emsp;&emsp;若 $f'(x)$ 在 $(a,b)$ 存在, 则
>
> - $f'(x)\ge 0\Eq f(x)\uparrow$.
> - $f'(x)\ge0\land\lnot(\E I\sub (a,b),~\A x\in I,~f(x)=0)\Eq f(x)\uparrow_{\text{strictly}}$.

> **定义 5.4.2**
>
> &emsp;&emsp;称 $f(x)$ 为 $(a,b)$ 上的下凸函数, 当且仅当
> $$
> \A x_1,x_2\in(a,b),~\A t\in(0,1),~f(tx_1+(1-t)x_2)\le tf(x_1)+(1-t)f(x_2).
> $$

&emsp;&emsp;这等价于, 对一列 $x_1,\cdots,x_n\in(a,b)$, $t_1,\cdots,t_n\in(0,1)$ 且 $\sum t_k=1$, 都有
$$
f(t_1x_1\ops+t_nx_n)\le t_1f(x_1)\ops+t_nf(x_n).
$$
归纳即证. 更进一步, 可以推广到定积分形式. 若 $f\in R[a,b]$ 且 $f(x)\in(a,b)$, 有
$$
g\br{\frac{1}{b-a}\int_a^bf(x)\d x}\le\frac{1}{b-a}\int_a^bg(f(x))\d x.
$$
例如取下凸的 $g(x)=x\ln x$ 以及 $(0,+\oo)$ 上的概率分布 $p(x)$, 可以得出信息熵满足:
$$
H:=-\int_0^{+\oo}p(x)\ln p(x)\d x=-\int_0^{+\oo}g(p(x))\d x.
$$


&emsp;&emsp;这也能给出, 对与 $x_1<x_3<x_2$, 一定有
$$
\frac{f(x_3)-f(x_1)}{x_3-x_1}\le\frac{f(x_2)-f(x_1)}{x_2-x_1}\le\frac{f(x_2)-f(x_3)}{x_2-x_3}.\quad(*)
$$
只需要取 $x_3=tx_1+(1-t)x_2$, 即 $t=\frac{x_2-x_3}{x_2-x_1}$, 那么
$$
f(x_3)\le\frac{x_2-x_3}{x_2-x_1}f(x_1)+\frac{x_3-x_1}{x_2-x_1}f(x_1).
$$
左右减去 $f(x_1)$ 稍作整理得左侧, 减去 $f(x_2)$ 整理得右侧. 结论可以整理为
$$
\dary{cc}{x_3-x_1&f(x_3)-f(x_1)\\ x_2-x_1 & f(x_2)-f(x_1)}=
\dary{ccc}{1&x_1&f(x_1) \\ 1&x_3&f(x_3) \\ 1&x_2&f(x_2)}\ge 0.
$$
不妨调整顺序为 $x_1<x_2<x_3$, 令 $x_2=tx_1+(1-t)x_3$, 那么
$$
\env{aligned}{
	\dary{ccc}{1&x_1&f(x_1) \\ 1&x_2&f(x_2) \\ 1&x_3&f(x_3)}
	&=\dary{ccc}{1&x_1&f(x_1) \\ 1-t-(1-t)&x_2-tx_1-(1-t)x_3&f(x_2)-tf(x_1)-(1-t)f(x_3) \\ 1&x_3&f(x_3)}\\
	&=\dary{ccc}{1&x_1&f(x_1) \\ 0&0&f(x_2)-tf(x_1)-(1-t)f(x_3) \\ 1&x_3&f(x_3)}\\
	&=(-1)^{2+3}(f(x_2)-tf(x_1)-(1-t)f(x_3))(x_3-x_1)\\
	&\ge 0.
}
$$
&emsp;&emsp;还证明过, 如果已知 $f$ 连续, 则中点凸就等价于凸.

> **命题 5.4.3**
>
> &emsp;&emsp;若 $f'$ 在 $(a,b)$ 存在, 则 $f$ (严格) 下凸当且仅当 $f'(x)$ (严格) 单调递增.

&emsp;&emsp;*→ Proof.* 若 $f$ 下凸, 运用 $(*)$ 不等式, 比较 $x_1-h,x_1,x_2,x_2+h$ 相邻两点割线斜率即可.

&emsp;&emsp;若 $f'(x)$ 单调递增, 先用中值定理证明 $(*)$, 再据此推出凸性.

> **命题 5.4.4**
>
> &emsp;&emsp;若 $f''$ 在 $(a,b)$ 存在, 则
>
> &emsp;&emsp;(i) $f(x)$ 下凸等价于 $f''(x)\ge 0$.
>
> &emsp;&emsp;(ii) $f(x)$ 严格下凸等价于 $f''(x)\ge 0$ 且在任何子区间不恒为 $0$.

> **命题 5.4.5**
>
> &emsp;&emsp;若 $(a,b)$  上下凸的 $f(x)$ 一阶可导等价于 $\A x_0\in(a,b),~\A x\in(a,b),~f(x)\ge f(x_0)+f'(x_0)(x-x_0)$.

&emsp;&emsp;*→ Proof.* 左推右, $f(x)-f(x_0)=f'(\xi)(x-x_0)\ge f'(x_0)(x-x_0)$ ($x_0,x$ 大小关系不影响.) 右推左, 用 $(*)$.

> **定理 5.4.6 (Legendre 变换)** \*
>
> &emsp;&emsp;设 $f''(x)>0$, 定义 $f^*(p)=\sup_x\{px-f(x)\}$ 为其 Legendre 变换. 则 $f^*(p)$ 也是凸的, 且 $(f^*(p))^*(x)=f(x)$.

> *Remark.*
>
> &emsp;&emsp;画个图很直观, 你自己画喵.
>
> &emsp;&emsp;这和 kyq 给出的凸函数构造手段 (至少在几何直观上) 有很强的关联性, 说不定她就是这么干的.

> **命题 5.4.7**
>
> &emsp;&emsp;设 $f''(x)$ 在 $(a,b)$ 存在, 若 $x_0$ 为拐点 (凹凸性转变的点), 那么  $f''(x_0)=0$. 若该点 $f^{(3)}(x_0)$ 存在且不为零, 那么 $f''(x_0)=0$ 时 $x_0$ 必为拐点.

> **定义-命题 5.4.8**
>
> &emsp;&emsp;若 $\lix{+\oo}(f(x)-ax-b)=0$, 则称 $y=ax+b$ 为 $x\to+\oo$ 时 $f$ 的渐近线. 这等价于
> $$
> \lix{+\oo}\frac{f(x)}{x}=a\land \lix{+\oo}(f(x)-ax)=b.
> $$

# 第六章 不定积分

**分部积分法**

&emsp;&emsp;由于有
$$
u(x)v(x)=\int u'(x)v(x)\d x+\int u(x)v'(x)\d x\Eq uv=\int v\d u+\int u\d v,
$$
所以
$$
\int u\d v=uv-\int v\d u.
$$
&emsp;&emsp;例如
$$
\env{aligned}{
	\int x\arctan x\d x &= \frac{1}{2}\int\arctan x\d x^2\\
	&= \frac{1}{2}\br{x^2\arctan x-\int \frac{x^2}{1+x^2}\d x}\\
	&= \frac{1}{2}\br{x^2\arctan x-x+\arctan x}+C.
}
$$

$$
\env{aligned}{
	\int\arcsin x\d x &= x\arcsin x-\int\frac{x}{\sqrt{1-x^2}}\d x\\
    &= x\arcsin x+\frac{1}{2}\int\frac{\d(1-x^2)}{\sqrt{1-x^2}}\\
    &= x\arcsin x+\sqrt{1-x^2}+C.
}
$$

$$
\env{aligned}{
	I:=\int\sqrt{x^2+a^2}\d x &= x\sqrt{x^2+a^2}-\int x\d\sqrt{x^2+a^2}\\
	&= x\sqrt{x^2+a^2}-\int\frac{x^2}{\sqrt{x^2+a^2}}\d x\\
	&= x\sqrt{x^2+a^2}-I+a^2\int\frac{\d x}{\sqrt{x^2+a^2}}.
}
$$

再做 $x=a\tan t$ 的换元即可. 换元之后需要求一个 $\int\sec x\d x$, 一种暴力手段是直接用后文的三角函数有理式积分.

&nbsp;

**有理函数**

&emsp;&emsp;对实多项式 $Q_n(x)$, 可以分解为 $Q_n(x)=b_n(x-x_1)(x-x_2)\cdots[(x-z_1)(x-\ol{z_1})][(x-z_2)(x-\ol{z_2})]\cdots$, 或者写作
$$
Q_n(x)=\prod_{i=1}^r (x-x_i)^{k_i}\cdot\prod_{i=1}^s (x^2+p_ix+q_i)^{\ell_i}
$$
对 $P_m(x)~(m<n)$, 总存在分解
$$
\frac{P_m(x)}{Q_n(x)}=\sum_{i=1}^r \sum_{j=1}^{k_i}\frac{A_{ij}}{(x-x_i)^j}+\sum_{i=1}^s\sum_{j=1}^{\ell_i}\frac{B_{ij}x+C_{ij}}{(x^2+p_ix+q_i)^j}.\quad (A_*,B_*,C_*\in\R)
$$
对上式各项的积分相对容易: 用换元或递推公式可以处理. 由 Bezout 定理, 设 $Q_n(x)=(x-x_1)^{k_1}Q'(x)$, 那么存在 $M(x),N(x)$, 使得 $M(x)(x-x_1)^{k_1}+N(x)Q'(x)=1$, 所以
$$
\frac{1}{Q_n(x)}=\frac{M(x)(x-x_1)^{k_1}+N(x)Q'(x)}{(x-x_1)^{k_1}Q'(x)}=\frac{N(x)}{(x-x_1)^{k_1}}+\frac{M(x)}{Q'(x)}.
$$
如此归纳操作 (对共轭根也类似), 即可给出分解. 这实质上给出 $\R^n=\R^r\oplus(\R^2)^s$ 的一组基 (前者作为 $\R$-向量空间, 后者作为 $\R^2$-向量空间; 虽然这样写有点奇怪).

&emsp;&emsp;有个奇怪的例子:
$$
\env{aligned}{
	\int\frac{1}{1+x^4}\d x &= \frac{1}{2}\int\frac{\br{1+\frac{1}{x^2}}-\br{1-\frac{1}{x^2}}}{\frac{1}{x^2}+x^2}\d x\\
	&= \frac{1}{2}\int\frac{1}{\br{x-\frac{1}{x}}^2+2}\d\br{x-\frac{1}{x}}.
}
$$
&nbsp;

**三角函数有理式**

&emsp;&emsp;对二元有理函数 $R(x,y)$, 研究
$$
I=\int R(\sin x,\cos x)\d x.
$$
有 "万能变换":
$$
t:=\tan\frac{x}{2}\Ra
\env{cases}{
	\DS\sin x=2\sin\frac{x}{2}\cos\frac{x}{2}=\frac{2t}{1+t^2},\\
	\DS\cos x=\cos^2\frac{x}{2}-\sin^2\frac{x}{2}=\frac{1-t^2}{1+t^2}.
}
$$
因此
$$
I=\int R\br{\frac{2t}{1+t^2},\frac{1-t^2}{1+t^2}}\frac{2}{1+t^2}\d t.
$$
归约到上一类问题.

---

&emsp;&emsp;以下为 lpd 放飞自我.

**Kepler 三定律与万有引力定律的等价性**

&emsp;&emsp;从 Kepler 定律出发, 以恒星质心作为原点建立极坐标系, 行星坐标 $(r,\theta)$, Kepler 第一定律给出
$$
r=\frac{b^2}{a+c\cos\theta}=\frac{p}{1+\epsilon\cos\theta},
$$
即
$$
u:=\frac{1}{r}=\frac{1}{p}+\frac{\epsilon}{p}\cos\theta.
$$
以 (复平面上的) $z=z(t)$ 作为坐标, 有
$$
z=re^{i\theta}.
$$
那么
$$
v=\dot z=\dot re^{i\theta}+r\dot\theta\cdot ie^{i\theta}.
$$
这给出自然坐标系下的
$$
\bs v=\bs v_r+\bs v_\theta.
$$
再次求导,
$$
\env{aligned}{
	\dot v &= \ddot re^{i\theta}+\dot r\dot\theta\cdot ie^{i\theta}+(\dot r\dot\theta+r\ddot\theta)ie^{i\theta}-r\dot\theta^2\cdot e^{i\theta}\\
	&= \underbrace{(\ddot r-r\dot\theta^2)}_{a_r}e^{i\theta}+\underbrace{(2\dot r\dot\theta+r\ddot\theta)}_{a_\theta}ie^{i\theta}.
}
$$
根据 Newton 第二定律,
$$
\env{aligned}{
	F &= F_re^{i\theta}+F_\theta ie^{i\theta}\\
	&= ma_re^{i\theta}+ma_\theta ie^{i\theta}.
}
$$
所以
$$
\env{cases}{
	F_r=m(\ddot r-r\dot\theta^2),\\
	F_\theta=m(2\dot r\dot\theta+r\ddot\theta).
}
$$
&emsp;&emsp;由 Kepler 第二定律,
$$
\dot A=\frac{1}{2}r^2\dot\theta=C\Ra r^2\dot\theta=:h=2C\Ra 2r\dot r\dot\theta+r^2\ddot\theta=0.
$$
已然说明 $F_\theta=0$, $F$ 为向心力. .......................

&nbsp;

&emsp;&emsp;从万有引力定律出发, 已知 $F=G\frac{Mm}{r^2}$ 是向心力. 结合前文推导,
$$
\env{cases}{
	\ddot r-r\dot\theta^2=-\frac{K}{r^2},\\
	2\dot r\dot\theta+r\ddot\theta=0\Ra(r^2\dot\theta)'=0.
}
$$
已有 Kepler 第二定律. 设 $u=r^{-1}$, 欲证
$$
u=\frac{1}{p}+\frac{\epsilon}{p}\cos\theta
$$
可以合理地假设: $\theta$ 与 $t$ 一一对应. 这样 $t'(\theta)=\frac{1}{\theta'(t)}$, $u(t)$ 可视为 $u(\theta)$.  因此
$$
\env{aligned}{
	\frac{\d r}{\d t} &= \frac{\d r}{\d\theta}\cdot\frac{\d\theta}{\d t}=\der\theta\br{\frac{1}{u}}\cdot\frac{\d\theta}{\d t}\\
	&= \frac{-u'(\theta)}{u(\theta)^2}\theta'(t)=-r(t)^2\theta'(t)u'(\theta)\\
	&= -hu'(\theta).
}
$$
再有
$$
r''(t)=-hu''(\theta)\theta'(t)=-h\frac{u''(\theta)}{r(t)^2}\cdot r(t)^2\theta'(t)=-h^2u(\theta)^2u''(\theta).
$$
利用已有方程可得出
$$
u''(\theta)+u(\theta)=\frac{K}{h^2}\\
\Ra u(\theta)=\frac{K}{h^2}+C_1\cos\theta+C_2\sin\theta=\frac{1}{p}+C\cos(\theta-\theta_0).
$$
可以取作
$$
u(\theta)=\frac{1}{p}+\frac{\epsilon}{p}\cos(\theta-\theta_0).
$$
&emsp;&emsp;Kepler 第三定律就是简单角动量相关推导了, 我们在信物作业里写过.

&nbsp;

**信息熵**

> **定理 (Shannon 非前缀编码)**
>
> &emsp;&emsp;对信息 $\{(A_i,p_i)\}_{i=1}^n$ ($A_i$ 为字符, $p_i$ 为对应出现概率), 则对任一码长为 $\{L_i\}_{i=1}^n$, 其平均码长满足
> $$
> L=\sum_{i=1}^np_iL_i\ge H(p).
> $$
> 且存在一种编码 $\{L_i\}_{i=1}^n$, 使得
> $$
> L\le H(P)+1.
> $$

> **引理 (Kraft)**
>
> &emsp;&emsp;存在非前缀编码 $\{L_n\}$ 当且仅当
> $$
> \sum_{i=1}^n\frac{1}{2^{L_i}}\le 1.
> $$

&emsp;&emsp;基于此, 注意有 $\log_2(1+x)\le\frac{x}{\ln 2}$, 所以
$$
\env{aligned}{
	H(P)-L &= -\sum_{i=1}^n p_i\log_2p_i-\sum_{i=1}^np_iL_i\\
	&= \sum_{i=1}^np_i\log_2\br{\frac{1}{p_i2^{L_i}}-1+1}\\
	&= \sum_{i=1}^np_i\frac{\frac{1}{p_i2^{L_i}}-1}{\ln2}\\
	&\le 0.
}
$$
对于存在性, 取 $L_i$ 使得 $\frac{1}{2^{L_i}}\le p_i<\frac{1}{2^{L_i-1}}$, 引理保证这能够做到. 之后代入验证即可.

&emsp;&emsp;连续情景上, 对概率分布密度 $\rho(x)$, 同样有
$$
-\sum_{i=-\oo}^\oo (\rho(x_i)\Delta x_i)\log(\rho(x_i)\Delta x_i)\overset{\Delta x\to 0}{=}-\int_{-\oo}^{+\oo}\rho(x)\log\rho(x)\d x+\log \Delta x.
$$
把前者定义为热力学熵
$$
H(\rho):=-\int_{-\oo}^{+\oo}\rho(x)\log\rho(x)\d x.
$$
&emsp;&emsp;设全体固定均值和方差的概率密度函数
$$
D:=\l\{\rho:\R\to\R\mid\int_{-\oo}^{+\oo}\rho(x)\d x=1,~\rho(x)\ge0,~\int x\rho(x)\d x=0,~\int x^2\rho(x)\d x=1\r\},
$$
则
$$
\arg\max_{\rho\in D}H(\rho)=\{\rho_0(x)\},
$$
其中 $\rho_0$ 为标准正态分布
$$
\rho_0(x)=\frac{1}{\sqrt{2\pi}}e^{-\frac{x^2}{2}}.
$$
&emsp;&emsp;根据 $-u\log u$ 的上凸性, $-u\ln u\le -w\ln w+(-\ln w-1)(u-w)$, 整理可得
$$
u-u\ln u\le w-u\ln w \\
\Ra \rho(x)-\rho(x)\ln\rho(x)\le\rho_0(x)-\rho(x)\ln\rho_0(x)\\
\Ra -\int\rho(x)\ln \rho(x)\d x\le-\int\rho(x)\ln\rho_0(x).
$$
右侧展开:
$$
\env{aligned}{
	-\int\rho(x)\ln\rho_0(x) &= -\int \rho(x)\ln\frac{e^{-\frac{x^2}{2}}}{\sqrt{2\pi}}\d x\\
    &= \ln\sqrt{2\pi}+\frac{1}{2}.
}
$$
这给出 $H(\rho)\le\ln{\sqrt{2\pi}}+\frac{1}{2}$, 而严格凸性保证仅有 $\rho_0$ 取等.
