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
\newcommand{\cent}[0]{\u{\degree C}}

% symbols alias
\newcommand{\E}[0]{\exist}
\newcommand{\A}[0]{\forall}
\newcommand{\l}[0]{\left}
\newcommand{\r}[0]{\right}
\newcommand{\eps}[0]{\varepsilon}
\newcommand{\Ra}[0]{\Rightarrow}
\newcommand{\Eq}[0]{\Leftrightarrow}
\newcommand{\d}[0]{\mathrm{d}}
\newcommand{\oo}[0]{\infty}
\newcommand{\mmap}[0]{\hookrightarrow}
\newcommand{\emap}[0]{\twoheadrightarrow}
\newcommand{\lin}[0]{\lim_{n\to\oo}}
\newcommand{\linf}[0]{\liminf_{n\to\oo}}
\newcommand{\lsup}[0]{\limsup_{n\to\oo}}
\newcommand{\F}[0]{\mathbb F}
\newcommand{\x}[0]{\times}
\newcommand{\M}[0]{\mathbf{M}}
\newcommand{\T}[0]{\intercal}

% symbols with parameters
\newcommand{\der}[1]{\frac{\d}{\d #1}}
\newcommand{\ul}[1]{\underline{#1}}
\newcommand{\ol}[1]{\overline{#1}}
\newcommand{\br}[1]{\l(#1\r)}
\newcommand{\abs}[1]{\l|#1\r|}
\newcommand{\bs}[1]{\boldsymbol{#1}}
\newcommand{\env}[2]{\begin{#1}#2\end{#1}} % why not?
\newcommand{\pmat}[1]{\env{pmatrix}{#1}}
\newcommand{\dary}[2]{\l|\begin{array}{#1}#2\end{array}\r|}
\newcommand{\pary}[2]{\l(\begin{array}{#1}#2\end{array}\r)}
\newcommand{\pblk}[4]{\l(\begin{array}{c|c}{#1}&{#2}\\\hline{#3}&{#4}\end{array}\r)}
\newcommand{\u}[1]{\mathrm{#1}}
\newcommand{\lix}[1]{\lim_{x\to #1}}
\newcommand{\ops}[1]{#1\cdots #1}
\newcommand{\seq}[3]{{#1}_{#2}\ops,{#1}_{#3}}
\newcommand{\dedu}[2]{\u{(#1)}\Ra\u{(#2)}}
$$

# 第一章 综观

## $\S1.1$ 何为代数

&emsp;&emsp;"Algebra" $\approx$ The act of solving equations, eps. polynomial equations.

&emsp;&emsp;例如, 对于三次方程 $Y^3+aY^2+bY+c=0$. 令 $X=Y+a/3$, 可整理得
$$
X^3+pX+q=0.
$$
令 $X=u+v$,
$$
(u^3+v^3+q)+(u+v)(3uv+p)=0.
$$
我们希望
$$
\begin{cases}
u^3+v^3+q=0,\\
3uv+p=0.
\end{cases}
$$
上式${}\times u^3$, 利用下式化简,
$$
u^6+(uv)^3+qu^3=0\Ra u^6+qu^3-(p/3)^3=0.
$$
得到关于 $u^3$ 的二次方程, 这样我们就能给出原方程的一个根了.

## $\S1.3$ 从线性方程组到 Gauss-Jordan 消元法

&emsp;&emsp;对于线性方程组 $A\bs x=\bs b$, 可以将其记作增广矩阵形式
$$
\left(\begin{array}{ccc|c}
a_{11} & \cdots & a_{1n} & b_1\\
\vdots & \ddots & \vdots & \vdots\\
a_{m1} & \cdots & a_{mn} & b_m
\end{array}\right).
$$
其中左侧为系数矩阵.

>**算法 1.3.1 (Gauss-Jordan 消元法)**
>
>&emsp;&emsp;用三种初等行变换将系数矩阵简化为*行梯矩阵*, 过程中保证解集不变.
>
>- A) 变换 $A(i,k,c)$: 令第 $k$ 行加上 $c$ 倍的第 $i$ 行;
>
>- B) 变换 $B(i,k)$: 交换第 $i$ 行和第 $k$ 行;
>
>- C) 变换 $C(i,c)$: 将第 $i$ 行每一项乘上 $c$.

&emsp;&emsp;(可以发现 B, C 其实都弱于 A, 不知道为什么要写成三类变换, 估计为了描述变换矩阵的形式差异吧.)

&emsp;&emsp;*Update.* 确实, 这三种变换对应的初等矩阵形式是本质不同的, 值得分开讨论.

&emsp;&emsp;此外, 这三种变换的逆都显然存在且容易给出. 行梯矩阵就是通常所说的上三角矩阵, 简化行梯矩阵则是指完成主元回代消元的行梯矩阵 (主元系数为 $1$, 主元列除主元对应位置外全 $0$).

&emsp;&emsp;若存在 $\begin{pmatrix}0 & \cdots & 0 &\mid&1\end{pmatrix}$ 则无解, 否则每个主元都可以用自由元表示. 消元过程你我心知肚明, 不提.

&nbsp;

&emsp;&emsp;作业题中提到并证明了矩阵 $A,B$ 的行等价关系 (记为 $A\sim B$), 同时可以定义 $A$ 的行等价类 $\{B:B\sim A\}$ (或许可以记为 $[A]$?). 根据 G-J 消元法, 我们可以通过在每个等价类里选取唯一的一个简化行梯矩阵来得到所有等价类的代表元集合.

# 第二章 集合, 映射与关系

## $\S2.1$ 集合概论

&emsp;&emsp;公理集合论: ZFC. 见 $\S2.1$, 我们应该很熟悉了. 例如, 从公理体系出发, 可以定义二元组
$$
(a,b):=\{\{a\},\{a,b\}\}\in\mathcal P(\mathcal P(A\cup B)),\quad(a\in A,b\in B).
$$
注意我们允许 $a=b$, 这时二元组退化为 $(a,a)=\{\{a\}\}$. 进而, 可以定义 Descartes 积
$$
A\times B:=\{(a,b)\in\mathcal P(\mathcal P(A\cup B)):a\in A,b\in B\}.
$$
为了避免 Russell 悖论, 在严格的形式语言中我们要求运用分离公理构造集合 $\{x:P(x)\}$ 时必须限定 $x$ 在一个已有集合 $A$ 内选取, 即应当写成 $\{x\in A:P(x)\}$. 一般地, 对集族 $\mathcal A=\{A_i\}_{i\in I}$, 定义
$$
\Pi \mathcal A=\prod_{i\in I}A_i=\{\text{tuple}~(a_i)_{i\in I}:a_i\in A_i\},
$$
其中一个 tuple 可以看做一个 $I\to\cup\mathcal A$ 的映射.

## $\S2.2$ 映射的运算

> **定义 2.2.1 (映射)**
>
> &emsp;&emsp;一个从 $A$ 到 $B$ 的映射是某个子集 $\Gamma\sub A\times B$, 使得 $\A a\in A,~\E!b\in B,~(a,b)\in\Gamma$.

&emsp;&emsp;若令所有 $A\to B$ 的映射为集合 $B^A$, 那么自然有 $B^A\sub\mathcal P(A\times B)$. 

> **练习 2.2.2**
>
> &emsp;&emsp;1) $\A A\neq\varnothing,~\nexists f\in \varnothing^A$.
>
> &emsp;&emsp;2) $\A B,~\E! f\in B^\varnothing$.

&emsp;&emsp;$\Gamma_f=\varnothing$, "$\A a\in\varnothing,~\E!b\in B,~(a,b)\in\varnothing$" 是正确的.

## $\S2.3$ 集合的积与无交并

> **定义 2.3.1 (无交并)**
>
> &emsp;&emsp;$C=A\sqcup B\Eq C=A\cup B\land A\cap B=\varnothing$.

&emsp;&emsp;例如, 希望找到某个 $C$, 使得对 $f:A\mmap C$ 和 $g:B\mmap C$ 满足 $C=f(A)\sqcup g(B)$. 直接将 $f,g$ 的像附带上一个不同的 tag 就行.

&emsp;&emsp;进一步地, 可以得到:

> **性质 2.3,2**
>
> &emsp;&emsp;若存在 $f,g,C$ 和另一对 $f',g',C'$ 满足上述性质, 那么存在 $h:C\overset{1:1}\to C'$, 使得 $hf=f',hg=g'$.

&emsp;&emsp;*→ Proof.* 可以直接构造证明. 对 $c\in C$, 取
$$
h:c\mapsto\begin{cases}
f'(a),&\E! a\in A,~f(a)=c;\\
g'(a),&\E! b\in B,~f(b)=c.
\end{cases}
$$
还能证明这样的 $h$ 是唯一的.

## $\S2.4$ 序结构

> **定义 2.4.1 (关系)**
>
> &emsp;&emsp;$A$ 上的关系 $R$ 是一个 $A$ 的子集 $R\sub A\times A$. 记 $aRa'\Eq(a,a')\in R$.

> **定义 2.4.2 (偏序集)**
>
> &emsp;&emsp;称 $(A,\preceq)$ 是一个偏序集, 其中 $\preceq$ 是定义在集合 $A$ 上的二元关系, 且满足:
>
> 1. (自反) $a\preceq a$;
> 2. (传递) $a\preceq b\land b\preceq c\Ra a\preceq c$;
> 3. (反身) $a\preceq b\land b\preceq a\Ra a=b$.

&emsp;&emsp;若删去 3., 将得到预序 (pre-order) 结构. 如果补充上

4. $\A a,b\in A,~a\preceq b\lor b\preceq a$.

则得到一个全序结构. 顺便, 定义 $a\prec b\Eq a\preceq b\land a\neq b$.

&emsp;&emsp;例如, 在 $\Z$ 上, 定义 $m\preceq n\Eq m\mid n$, 那么它仅是一个预序结构; 如果在 $\Z_{>0}$ 上则是一个偏序结构.

&emsp;&emsp;又如, 对任意集合 $A$, $(\mathcal P(A),\sub)$ 显然是一个偏序关系.

&emsp;&emsp;对 $(A,\preceq)$, 令 $G=(V,E)$ 其中 $V=A$, $E=\{(a,b)\in A\times A:a\preceq b\}$ 同时删去所有可被传递的边, 则得到一个所谓的 Hasse 图 (例见 P54). 如果 $G$ 可以嵌入来自 $(B,\preceq_B)$ 的 $G'$, 则它们对应的偏序集 (或预序集) 存在一个保持序关系映射 $f:A\mmap B$, 使得 $a\preceq_A b\Ra f(a)\preceq_B f(b)$. 特别地, 如果 $G$ 和 $G'$ 同构时, 则存在一个保序双射 $f:A\overset{1:1}{\to} B$, 使得 $f$ 和 $f^{-1}$ 都是保序的. *(定义存疑)*

## $\S2.5$ 等价关系与商集

> **定义 2.5.1 (等价关系)**
>
> &emsp;&emsp;称 $A$ 上的二元关系 $\sim$ 是一个等价关系, 当且仅当其满足
>
> 1. (自反) $a\sim a$;
> 2. (传递) $a\sim b\land b\sim c\Ra a\sim c$;
> 3. (对称) $a\sim b\Eq b\sim a$.

&emsp;&emsp;一个最为平凡的例子就是 $(A,=)$. 还有一个经典例子是同余关系 $(\Z,\equiv_m)$, 其中 $a\equiv b\pmod m$ 则认为二者等价.

&emsp;&emsp;在 $(A,\sim)$ 上, 对 $a\in A$, 定义 $C(a)=\{x\in A:x\sim a\}$ 为 $a$ 的等价类, 那么对 $a,a'\in A$, 以下三条显然等价:

1. $a\sim a'$;
2. $C(a)=C(a')$;
3. $C(a)\cap C(a')\neq\varnothing$.

可知, $A$ 是其上所有等价类的无交并. 并定义 $(A/\sim)\sub\mathcal P(A)$ 为 $A$ 的等价类的集族, 称为商集, 为此也可以配套一个商映射 $q:A\to A/\sim,~a\mapsto[a]$.

&emsp;&emsp;例如, 在 $(\Z,\equiv_n)$ 下, $[k]=k+n\Z$, 商集往往则直接写作 $\Z/n\Z$, 即其剩余系. 此外, 我们已经讨论过, 对 $n\times m$ 矩阵上的行等价关系也是等价关系, Gauss-Jordan 算法则实质上给出了一种商映射.

## $\S2.6$ 从正整数集到有理数集

&emsp;&emsp;承认 $(\Z_{\ge 0},+,\times,\le)$ 上所有性质. 依赖商集可以方便地由 $\Z_{\ge 0}$ 定义 $\Z:=\Z_{\ge 0}^2/\sim$, 其中 $(m,n)\sim(m',n')\Eq m+n'=m'+n$, 不难验证它是等价关系, 并记 $q:(m,n)\mapsto\lang m,n\rang$ ("$m-n$"). 再定义运算:

- $\lang m,n\rang+\lang m',n'\rang:=\lang m+m',n+n'\rang$;
- $\lang m,n\rang\times\lang m',n'\rang:=\lang mm'+nn',mn'+nm'\rang$;
- $\lang m,n\rang\le\lang m',n'\rang\Eq m+n'\le n+m'$.

良定性的 dirty work 不提. 此后我们将能够给出相反数: $\A x\in\Z,~\E!(-x)\in Z,~x+(-x)=\lang 0,0\rang$: 对 $x=\lang m,n\rang$ 取 $-x=\lang n,m\rang$ 即可.

&emsp;&emsp;实质上, $\N$ 到 $\Z$ 完备了加法逆元, 这是因为我们将 "不可逆" 的 "减法" 运算直接附带为二元组信息. 模仿此, $\Z\to\Q$ 是容易的. 定义 $\Q=\Z\times(\Z\setminus\{0\})/\sim$, where $(r,s)\sim(r',s')\Eq rs'=r's$. 验证一下传递性, $(r,s)\sim(r'',s'')\sim(r',s')$ 可知 $rs''=sr''$ 和 $r''s'=r's''$, 对应相乘得 $rr''s's''=r'r''ss''$, 单独讨论 $r''=0$, 其余情况可消去知 $rs'=r's$. $(r,s)$ 的等价类记作 $[r,s]$. 显然 $\Z$ 可通过 $r\mapsto[r,1]$ 嵌入 $\Q$. 定义运算

- $[r_1,s_1]+[r_2,s_2]=[r_1s_2+r_2s_1,s_1s_2]$;
- $[r_1,s_1]\times[r_2,s_2]=[r_1r_2,s_1s_2]$.
- $[r_1,s_1]\le[r_2,s_2]\Eq r_1s_2\le r_2s_1\oplus s_1\le 0\oplus s_2\le 0$. (应该是吧?)

良定性 dirty work 仍然不提. $+,\times$ 的所有性质在 $\Q$ 成立. 此外, $\times$ 存在逆元, $\A x\in\Q\setminus\{0\},~\E! x^{-1}\in\Q\setminus\{0\},~x\times x^{-1}=1$.

&emsp;&emsp;这里就会引出一个 "陌生" 的概念, 既约分数.

## $\S2.7$ 算术入门

> **定理 2.7.1 (带余除法)**
>
> &emsp;&emsp;$\A a,d\in\Z,~d\neq 0\Ra\E! q,r\in \Z,~0\le r<|d|\land a=dq+r$.

&emsp;&emsp;*(略过 $\gcd$, $\lcm$, coprimeness, prime, prime number 的定义. 后记 $\mathbb P$ 为素数集, $\mathbb P_{\pm}$ 为素元集.)*

&nbsp;

> **定理 2.7.2 [Bezout (裴蜀)]**
>
> &emsp;&emsp;对于 $\{x_n\}\sub\Z$, 有
> $$
> x_1\Z+x_2\Z+\cdots+x_n\Z=\gcd\{x_k\}\Z.
> $$

> **引理 2.7.3**
>
> &emsp;&emsp;若 $\varnothing\neq I\sub \Z$ 满足:
>
> - $\A x,y\in I,~x+y\in I$,
> - $\A a\in\Z,x\in I,~ax\in I$;
>
> 那么 $\E! g\ge 1,~I=g\Z$.

&emsp;&emsp;*→ Proof @2.7.3*&emsp;$I=\{0\}$ 显然, 否则声称 $g=\min\{x\in I:x>0\}$. 根据第二条性质, $g\Z\sub I$. 若还有 $t=kg+r~(0<r<g)\in I$, 不妨 $t>0$, 又因为 $-g\in I$, 所以必然有 $0<r\in I$, 这和 $g$ 的最小性矛盾. 因此 $g\Z=I$.&emsp;$\square$

&emsp;&emsp;*→ Proof @2.7.2*&emsp;记左侧集合为 $I$, 验证其满足 <u>引理 2.7.3</u> 的性质, 所以 $\E!g\ge 1,~I=g\Z$. 那么 $g\in I$, 就至少有 $\gcd\{x_k\}\mid g$. 另一方面, 又有 $g\mid x_k$, 那么 $g\mid\gcd\{x_k\}$. 最终 $g=\gcd\{x_k\}$.

&nbsp;

> **定理 2.7.4 (Euclid)**
>
> &emsp;&emsp;$p\in\mathbb P_{\pm}\Eq \A a,b\in\Z,~p\mid ab\to p\mid a\lor p\mid b$.

&emsp;&emsp;*→ Proof.* 左推右显然. 右推左, 若 $p=ab$, 将 $ab$ 代入命题得到 $p\mid a\lor p\mid b$, 不妨 $p\mid a$, 但是又有 $a\mid p$, 所以 $a=\pm p$, 则 $p\in\mathbb P_{\pm}$.&emsp;$\square$

> **定理 2.7.5 (算数基本定理)**
>
> &emsp;&emsp;任何 $n\in\Z\setminus\{0\}$ 都有素因子分解 $n=\pm\prod_kp_k^{\alpha_k}$, 且 $\{(p_k,\alpha_k)\}$ 唯一.

&emsp;&emsp;*→ Proof.* 不妨 $n\ge 1$, 归纳可知存在性. 唯一性, 根据 <u>定理 2.7.4</u>, 只需要对比同一个素数的幂次, 呐, 它们不是显然相等吗?&emsp;$\square$

&emsp;&emsp;在此基础上, 通过算数基本定理能够轻松地表述 $\cdot\mid\cdot,\gcd,\lcm$ 运算.

# 第三章 环, 域和多项式

## $\S3.1$ 环和域

> **定义 3.1.1 (环, 交换环)**
>
> &emsp;&emsp;一个环由五元组 $(R,+,\cdot,0_R,1_R)$ 给出, 其中 $+,\cdot:R\times R\to R$, $0_R,1_R\in R$, 此外满足
>
> 1. $(R,+,0_R)$ 是交换群;
> 2. $(x\cdot y)\cdot z=x\cdot(y\cdot z)$;
> 3. $x\cdot 1_R=1_R\cdot x=x$;
> 4. $(x+y)\cdot z=x\cdot z+y\cdot z\land z\cdot (x+y)=z\cdot x+z\cdot y$.
> 5. (附加本条则为交换环) $x\cdot y=y\cdot x$.

&emsp;&emsp;除了平凡的零环外, 一般的环都有 $0\neq 1$, 否则会有 $x=1x=0x=0$.

&emsp;&emsp;此外, 对 $n\in\Z_{\ge 0}$, 记 $nx:=\underbrace{x+x+\cdots+x}_{n\text{ items}}=(n 1_R)\cdot x$, $(-n)x:=-(nx)$, 相关运算性质不难验证. 类似地也记 $x^n=\underbrace{x\cdot x\cdot\cdots\cdot x}_{n\text{ items}}$. 结合下一段, 若 $x\in R^\times$, 则 $x^{-n}=(x^n)^{-1}=(x^{-1})^n$.

&emsp;&emsp;若 $x,y\in R$ 有 $xy=1$, 则称 $y$ 是 $x$ 右逆, $x$ 是 $y$ 的左逆. 左右逆未必存在也未必唯一, 矩阵环上的例子很明显. 如果 $x$ 即是左可逆的又是右可逆的, 则称 $x$ 是可逆的. 对可逆的 $x$, 它的左右逆一定相等. 不妨设其左右逆为 $y_L,y_R$, 则 $y_L=y_Lx y_R=y_R$. 可以记 $x$ 的逆元为 $x^{-1}$, 满足 $x\cdot x^{-1}=x^{-1}\cdot x=1$. 同时, 通常记 $R^\times:=\{x\in R:x\text{ is invertible}\}$, 可以看出 $(R^\times,\cdot,1)$ 是群.

> **定义 3.1.2 (除环)**
>
> &emsp;&emsp;若环 $R$ 满足 $R^\times=R\setminus\{0\}$, 则称 $R$ 为除环.

&emsp;&emsp;注意零环不是除环.

> **定义 3.1.3 (域)**
>
> &emsp;&emsp;交换的除环称为域.

&emsp;&emsp;例如 $\Q\sub\R\sub\C$ 都构成域. Gauss-Jordan 消元法可以在一切域上进行.

> **定义 3.1.4 (整环, Integral Domain / Entire Ring)**
>
> &emsp;&emsp;交换的, 满足乘法消去律的非零环是整环.

> **定义 3.1.5 (子环)**
>
> &emsp;&emsp;称 $R_0\sub R$ 是 $R$ 的子环, 当且仅当 $R_0$ 对 $+,\cdot$ 以及 $x\mapsto -x$ 封闭且 $0,1\in R_0$.

&emsp;&emsp;可以看出 $(R_0,+,\cdot,0_R,1_R)$ 也是环.

> **定义 3.1.6 (环的中心)**
>
> &emsp;&emsp;对环 $R$, 定义 $Z(R):=\{x\in R:\A y\in R,~xy=yx\}$ 为 $R$ 的中心.

&emsp;&emsp;可验证 $Z(R)$ 是 $R$ 的子环. 同时可以看出, $Z(R)$ 一定是交换环 (交换环也可以表述为 $R=Z(R)$ 的环).

> **定义 3.1.7 (相反环)**
>
> &emsp;&emsp;对环 $R$, 其相反环为 $R^{\opn{op}}:=(R,+,\odot,0_R,1_R)$, 其中 $x\odot y=y\cdot x$.

&emsp;&emsp;这里交换环又可以表述为 $R=R^{\opn{op}}$ 的环.

> **定义 3.1.8 (子域)**
>
> &emsp;&emsp;对域 $F$, 若 $F_0\sub F$ 是 $F$ 的子环且非零元在 $F_0$ 可逆, 则 $F_0$ 为 $F$ 的子域.

&nbsp;

&emsp;&emsp;除了 $\C$ 派生的域结构外, 另一个经典的例子是 $\Z$ 的同余类. 记$\bmod n$ 的剩余系为 $\Z/n\Z$, $[x]\in \Z/n\Z$ 为以 $x$ 为代表元的剩余类. 容易验证, $(\Z/n\Z,+,\cdot,[0],[1])$ 是一个交换环, 其中 $[x]+[y]=[x+y]$, $[x]\cdot[y]=[xy]$. 观察到:

- $\Z/n\Z$ 是零环 $\Eq n=\pm1$.
- $\Z/n\Z=\Z/(-n)\Z$, 因此不妨 $n>1$.
- $[x]\in\Z/n\Z$ 可逆 $\Eq x\perp n$.
- 当且仅当 $p\in\mathbb P$, $\Z/p\Z$ 是域, 记为 $\mathbb F_p:=\Z/p\Z$

> **定理 3.1.9**
>
> &emsp;&emsp;有限整环一定是域.

&nbsp;

&emsp;&emsp;还有一种构造新环的方式. 对一族 $(R_i)_{i\in I}$, 对它们的直积 $\prod_{i\in I}R_i$, 有 $r=(r_i)_{i\in I}$, 定义 $x+y:=(x_i+_{R_i}y_i)_{i\in I}$, 其余同理.

&emsp;&emsp;还可以给出多项式环. 对环 $R$, 定义 $R[x]=\{a_0+a_1x+\cdots+a_nx^n: n\in\Z_{\ge 0},\{a_n\}\sub R\}$. 其上有 $\sum a_ix^i+\sum b_ix^i=\sum(a_i+b_i)x^i$, $\sum a_ix^i\cdot\sum b_ix^i=\sum_i x^i\sum_j a_jb_{i-j}$. 如果 $R$ 是一个整环, 那么 $R[x]$ 也是一个整环. 同理可以给出多元多项式环 $R[x,y,\cdots]$, 实际上 $R[x,y]\sim(R[x])[y]\sim(R[y])[x]$.

## $\S 3.2$ 同态和同构

> **定义 3.2.1 (同态)**
>
> &emsp;&emsp;$R$ 到 $R'$ 的同态是一个映射 $f:R\to R'$, 使得
>
> - $f(x+y)=f(x)+f(y)$,
> - $f(xy)=f(x)f(y)$,
> - $f(1_R)=1_{R'}$.

&emsp;&emsp;据此也可以推知, $f(0_R)=0_{R'}$ ($f(0)=f(0+0)=f(0)+f(0)$, 消去); $f(-x)=-f(x)$ ($f(-x)+f(x)=f(0)=0$); $f(x^{-1})=f(x)^{-1}$ ($f(x^{-1})f(x)=f(1)=1$, 另一侧同理.)

&emsp;&emsp;若有同态 $R\overset{f}\to R'$ 和 $R'\overset{g}\to R''$, 那么也有同态 $R\overset{gf}\to R''$; 若有同态 $R\overset{f}\to R'$, 自然 $f(R)$ 是 $R'$ 的子环.

&emsp;&emsp;例如, 恒等映射 $\opn{id}_R$ 是一个同态, 对 $R$ 的子环 $R'$, $\opn{id}_{R'}$ 是一个 $R'\to R$ 的同态. 对上文 $(R_i)_{i\in I}$ 的例子, 投影算子 $\opn{pr}_j:(x_i)_{i\in I}\mapsto x_j$ 是同态, 特别地, 为了使得 $\A j\in I,~\opn{pr}_j$ 是同态, 我们只能定义出上文中逐项加乘的环结构. 当 $n\mid m$, 也存在同态 $\Z/m\Z\emap \Z/n\Z,~[x]_m\mapsto[x]_n$.

&nbsp;

> **定义 3.2.2 (同构)**
>
> &emsp;&emsp;若环同态 $f:R\to R'$ 存在一个环同态 $g:R'\to R$ 使得 $fg=\opn{id}_R$ 和 $gf=\opn{id}_{R'}$, 则 $f$ 是一个环同构.

&emsp;&emsp;如果 $f,g$ 是同构, 那么 $gf$ 也是同构, $(gf)^{-1}=f^{-1}g^{-1}$. 有记号 $f:R\overset{\sim}\to R'$ 或者 $R\simeq R'$.

&emsp;&emsp;直观上容易的性质:

> **性质 3.2.3**
>
> &emsp;&emsp;$f$ 是同构等价于 $f$ 是双射同态.

&emsp;&emsp;容易从同构验证双射, 考虑另一方面. 需要 $f^{-1}(x+y)=f^{-1}(x)+f^{-1}(y)$, 这是因为 $ff^{-1}(x+y)=x+y=f(f^{-1}(x)+f^{-1}(y))=ff^{-1}(x)+ff^{-1}(y)$; 需要 $f^{-1}(xy)=f^{-1}(x)f^{-1}(y)$, 同上. $f^{-1}(1)=1$, 这是因为 $ff^{-1}(1)=1=f(1)$.

> **定理 3.2.4 (中国剩余定理)**
>
> &emsp;&emsp;若 $n_1,n_2,\cdots,n_r\in \Z_{>0}$ 两两互素, 那么存在同态
> $$
> \Z/(n_1n_2\cdots n_r)\Z\overset{\Phi}\to\prod_{i=1}^r\Z/n_i\Z,\quad [x]_{n_1n_2\cdots n_r}\mapsto ([x]_{n_i})_{i=1}^r.
> $$
> 满足 $\Phi$ 是同构. (当然这不是完整的 CRT, CRT 还给出了逆映射的具体构造方式.)

&emsp;&emsp;*→ Proof.* 注意到两侧有限环的元素个数相等, 我们只需要证明 $\Phi$ 是单射. 先证明 $\Phi([x])=\Phi([y])\Eq\Phi([x-y])=0$ 即可, 从略.

## $\S3.3$ 多项式环

&emsp;&emsp;人们发现 $\Z$ 和 $F[x]$ 的行为相似. 例如 $F[x]$ 是一个整环, $F[x]^\x=F^\x$. 定义多项式的度数 $\deg f$, 特别地, $\deg0:=-\oo$, 那么
$$
\deg(fg)=\deg f+\deg g,\quad \deg (f+g)\le\max\{\deg f,\deg g\}.
$$

> **性质 3.3.1 (Euclidean Division)**
>
> &emsp;&emsp;对 $a,d\in F[x]$, 若 $d\neq 0$, 那么存在唯一的 $q,r\in F[x]$ 使得 $a=qd+r$ 且 $\deg r<\deg d$.

&emsp;&emsp;证明不难.

> **定义 3.3.2 (Evaluation)**
>
> &emsp;&emsp;定义多项式求值映射
> $$
> \opn{ev}_\alpha:R[x]\to R,\quad f=\sum_i r_ix^i\mapsto \sum_i r_i\alpha^i=:f(a).
> $$
> (注意 $\opn{ev}_\alpha$ 其实也给出了一个 $R[x]\to R$ 的同态.)

&emsp;&emsp;结合上述两个性质或定义, 取 $d=x-\alpha,~\alpha\in F$, 那么 $\A f\in F[x],~\E! q\in F[x],~\E! r\in F,~f=(x-\alpha)q+r$. 也就是说, $(f\bmod (x-\alpha))=f(\alpha)$. 另外, 也容易据此证明, $f\neq 0$ 的根的数量不超过 $\deg f$.

> **定义 3.3.3 (重数)**
>
> &emsp;&emsp;对 $f\neq 0$ 和 $\alpha$, $\E! m\ge 0,~f=(x-\alpha)^mg$, 这样的 $m$ 称为根 $\alpha$ 对 $f$ 的重数.

&emsp;&emsp;为说明良定, 我们可以直接说明 $F[x]$ 上具有唯一分解定理, 它的证明和 $\Z$ 类似. (类比 $\Z^\x=\{\pm1 \}$, $F[x]^\x=F^\x$.)

## $\S3.4$ 有理函数域

> **定义 3.4.1 (有理函数集)**
>
> &emsp;&emsp;类似 $\Z$ 到 $\Q$ 的构造, 对整环 $R$, 定义
> $$
> \opn{Frac}(R):=(R\x(R\setminus\{0\}))/\sim.
> $$
> 其中 $(f,g)\sim (f',g')\Eq fg'=f'g$. 将 $(f,g)$ 所在等价类记为 $[f,g]=:f/g$.

&emsp;&emsp;接下来, 为 $\opn{Frac}(R)$ 配备环运算. 容易给出

- $[f,g]+[f',g']:=[fg'+f'g,gg']$;
- $[f,g][f',g']:=[ff',gg']$;
- $\bs 1=[1,1]$, $\bs 0=[0,1]$.
- $[f,g]^{-1}=[g,f]$.

&emsp;&emsp;显然 $R$ 可以作为 $\opn{Frac}(R)$ 的子环, 只需要用 $r\mapsto[r,1]$ 嵌入即可. 这和 $\Q$ 上的讨论完全相同. 事实上, $\opn{Frac}(\Z)=\Q$. 此外, 定义
$$
\opn{Frac}(F[x])=:F(x)=\l\{\frac{f}{g}:f,g\in F[x],~g\neq 0\r\}.
$$
> **定理 3.4.2**
>
> &emsp;&emsp;$\A\text{ring }R,~\E!\text{ homomorphism }\Z\to R$.

&emsp;&emsp;*→ Proof.* 唯一性, 因为 $1\to 1_R$, 它直接给出了 $f:n\ge 0\mapsto\underbrace{1_R+\cdots+1_R}_{n\text{ items}},~-n\mapsto -f(n)$, 只需要证明 $f$ 是同态. 不难.

> **性质 3.4.3**
>
> &emsp;&emsp;设交换环上的同态 $\varphi:R\to R'$ 满足 $\varphi(R\setminus\{0\})\sub(R')^\x$, 那么存在唯一的同态 $\Phi:\opn{Frac}(R)\to R'$, 使得 $\Phi i=\varphi$, 其中 $i:r\mapsto [r,1]$.

&emsp;&emsp;*→ Proof.* 唯一性. 若已有 $\Phi$, 则 $\Phi(f/1)=\Phi(i(f))=\varphi(f)$. 对任意 $g\in R\setminus\{0\}$, 又有
$$
\Phi(1/g)\Phi(g/1)=\Phi(1)=1\Ra \Phi(g/1)=\varphi(g)^{-1}.
$$
所以只能唯一地构造
$$
\Phi(f/g)=\Phi(f/1)\Phi(1/g)=\varphi(f)\varphi(g)^{-1}.
$$
&emsp;&emsp;存在性. 按照如上结论, 先验证其良定. 若 $f/g=f'/g'$, 即 $fg'=gf'$, 那么 $\varphi(f)\varphi(g')=\varphi(g)\varphi(f')$, 移项得 $\varphi(f)\varphi(g)^{-1}=\varphi(f')\varphi(g')^{-1}$, 因此这个构造是良定的. 接下来验证其对 $+,\x,1$ 的保持, 按照构造展开即证.

> **性质 3.4.4**
>
> &emsp;&emsp;若有域 $F$ 和同态 $j:R\mmap F$, 使得 $\A x\in F,~\E f,g\in R,~g\neq 0\land x=j(f)/j(g)$, 那么 $\E! \Phi:\opn{Frac}(R)\overset\sim\to F,~\Phi i=j$.

&emsp;&emsp;*→ Proof.* 由于 $j$ 是单射且 $0_R\overset j\mapsto 0_F$, 所以 $j$ 满足 <u>性质 3.4.3</u> 中 $\varphi$ 的要求, 故而的确存在一个唯一的 $\Phi$ 使得 $\Phi i=j$, 我们需要检验它恰好是一个同构.

&emsp;&emsp;满性. 对 $x\in F$, 有 $x=j(f)/j(g)=\Phi(i(f))/\Phi(i(g))=\Phi(i(f)/i(j))$, 所以 $x$ 是 $\Phi$ 的像.

&emsp;&emsp;单性. 若 $\Phi(f/g)=\Phi(f'/g')$, 那么 $j(f)/j(g)=j(f')/j(g')\Eq j(f)j(g')=j(f')j(g)\Eq j(fg')=j(f'g)$. 因为 $j$ 是单的, 所以 $fg'=f'g$, 即 $f/g=f'/g'$.

## $\S3.5$ 域的特征

> **定义/命题 3.5.1**
>
> &emsp;&emsp;对整环 $R$, $\E!\char R\in\Z_{\ge 0},~\A n\in\Z,~n1_R=0_R\Eq\char R\mid n$. 定义其为 $R$ 的特征. 事实上, $\char R\in \{0\}\cup\mathbb P$.

&emsp;&emsp;*→ Proof.* 令 $K_R:=\{k\in\Z:k1_R=0_R\}$, 根据裴蜀定理, 一定有 $\char R\in\Z_{\ge 0}$, 使得 $K_R=(\char R)\Z$.

&emsp;&emsp;另一方面, 假设 $\char R\neq 0$, 如果 $\char R=ab$, 那么 $0_R=(ab)1_R=a(b1_R)=a(1_R\x b1_R)=(a1_R)(b1_R)$. 因为 $R$ 是整环, 所以必有 $a1_R=0\lor b1_R=0$, 则 $\char R\mid a\lor\char R\mid b$. 所以此时 $\char R\in\mathbb P$.

> **性质 3.5.2**
>
> &emsp;&emsp;a) 对整环 $R$ 的子环 $R_0$, 有 $\char R_0=\char R$. 特别地, $\char R=\char\opn{Frac}(R)$.
>
> &emsp;&emsp;b) $\A x\in R,~\char R\cdot x=0$.

&emsp;&emsp;例如 $0=\char\Z=\char\Q=\char\R=\char\C=\char Q(x)=\cdots$; $\char\mathbb F_p=p$, 无穷域不一定 $0$ 特征, 例如 $\char\mathbb F_p(x)=p$.

# 第四章 向量空间和线性映射

## $\S4.1$ 回到线性方程组

&emsp;&emsp;对域 $F$ 上的线性方程组 $A\bs x=\bs b$, 其中 $A$ 是 $m\x n$ 的矩阵. 考虑映射
$$
T:F^n\to F^m,~\bs x\mapsto A\bs x,
$$
那么求解方程组相当于给出 $T^{-1}(\bs b)$ (这应当是一个原像集合). 这里, $T$ 是一个线性映射, 也即是 $T(\bs x)+T(\bs y)=T(\bs x+\bs y)$ 和 $T(t\bs x)=tT(\bs x)~(t\in F)$. 这样, 要不 $T^{-1}(\bs b)=\varnothing$; 要不任意取出一个特解 $x\in T^{-1}(\bs b)$, 那么对任意 $x'\in T^{-1}(\bs b)$, 都有 $T(x)=T(x')\Eq T(x-x')=0\Eq x-x'\in T^{-1}(\bs 0)$. 因此 $T^{-1}(\bs b)=x+T^{-1}(\bs 0)$.

&emsp;&emsp;这里, $\bs 0\in T^{-1}(\bs 0)$, $x,y\in T^{-1}(\bs 0)\Ra x+y\in T^{-1}(\bs 0)$, $\bs x\in T^{-1}(\bs 0)\Ra t\bs x\in T^{-1}(\bs 0)$.

&emsp;&emsp;(方便起见直接用后面将定义的说法) $T^{-1}(\bs 0)$ 明显是一个线性空间, 它的任意一组基被叫做基础解系. 根据基础解系和特解 $x$ 就给出了 $T^{-1}(\bs b)$, 我们惯说的 "自由度" 实际上就是 $\rank T^{-1}(\bs 0)$.

## $\S4.2$ 向量空间

> **定义 4.2.1 (向量空间)**
>
> &emsp;&emsp;$F$ 上的向量空间 ($F$-向量空间) 是四元组 $(V,+,\cdot,0)$, 其中 $V$ 是集合, $0\in V$, $+:V\x V\to V$, $\bs\cdot:F\x V\to V$, 使得
>
> 1. 加法满足
>     - 结合律. $(u+v)+w=u+(v+w)$.
>     - 幺元性质. $u+0=0+u=u$.
>     - 交换律. $u+v=v+u$.
>     - 加法逆. $\A u\in V,~\E(-u)\in V,~u+(-u)=0$.
> 2. 纯量乘法满足
>     - 结合律. $s(tv)=(st)v$.
>     - 幺元性质. $1_F\cdot v=v$.
>     - 对加法分配律. $s(u+v)=su+sv$; $(s+t)u=su+tu$. (注意这里就有 $-v=-1\cdot v$.)

&emsp;&emsp;这个结构本身的性质和环类似, 不提.

> **定义 4.2.2 (子空间)**
>
> &emsp;&emsp;若 $V$ 是一个 $F$-向量空间, 则 $V$ 的子空间 $V_0$ 是 $V$ 的一个非空子集, 满足对 $+$ 和纯量乘法 $\cdot$ 封闭.

&emsp;&emsp;由此必然有 $0\in V_0$. 可见若 $V_0,V_1$ 是子空间, $V_0\cap V_1$ 也是一个子空间.

> **定义 4.2.3 (直积)**
>
> &emsp;&emsp;令 $(V_i)_{i\in I}$ 是一族向量空间, 定义 $\prod_{i\in I}V_i$ 上的运算
>
> - $(v_i)+(v_i')=(v_i+v_i')$;
> - $t(v_i)=(tv_i)$.
>
> 则 $\prod_{i\in I}V_i$ 也给出了一个向量空间.

&emsp;&emsp;特别地, 如果 $V_i=V$, 就有 $\prod_{i\in I} V_i=V^I$.

> **定义 4.2.4 (直和)**
>
> &emsp;&emsp;令 $(V_i)_{i\in I}$ 是一族向量空间, 定义直和
> $$
> \bigoplus_{i\in I}V_i=\l\{(v_i)_{i\in I}\in \prod_{i\in I}V_i:\#\{j\in I:v_j\neq 0\}<\oo\r\}.
> $$

&emsp;&emsp;这是一个 $\prod_{i\in I}V_i$ 的子空间. 如果 $I$ 有限, 二者相等. $V^{\oplus I}\sub V^I$. 任何一个 $V_i$ 都可被视为 $\bigoplus_{i\in I}V_i$ 的一个子空间, 并且两个子空间有 $V_i\cap V_j=\{0\}$.

## $\S4.3$ 矩阵及其运算

> **定义 4.3.1 (矩阵)**
>
> &emsp;&emsp;设 $F$ 是域, $F$ 上的矩阵是一个数组 $(a_{ij})_{m\x n}$. $F$ 上的所有 $m\x n$ 矩阵构成集合记为 $\mathbf M_{m\x n}(F)$.

&emsp;&emsp;$\mathbf M_{m\x n}(F)$ 可以被赋予向量空间的运算. 对 $A=(a_{ij}),B=(b_{ij})\in \mathbf M_{m\x n}(F)$, 定义
$$
A+B:=(a_{ij}+b_{ij}),\quad tA:=(ta_{ij}).
$$
就得到了向量空间. 特别地, 我们称 $n$ 维列向量是 $\mathbf M_{n\x 1}(F)$, 行向量则是 $\mathbf M_{1\x n}(F)$. 最平凡的 $\mathbf M_{1\x 1}(F)\simeq F$.

> **定义 4.3.2 (矩阵乘法)**
>
> &emsp;&emsp;定义矩阵乘法
> $$
> \x:\mathbf M_{m\x n}(F)\x\mathbf M_{n\x r}(F)\to\mathbf M_{m\x n}(F),\\
> (a_{ij})\x(b_{jk})\mapsto\l(\sum_{j=1}^na_{ij}b_{jk}\r)_{i,j}.
> $$

&emsp;&emsp;有性质:

- $(AB)C=A(BC)$.
- $A(B+C)=AB+AC$, $(A+B)C=AC+BC$.
- $\bs 1_{m\x m}A=A\bs 1_{n\x n}=A_{m\x n}$.
- $A(tB)=t(AB)=(tA)B$.

可见 $(\mathbf M_{n\x n}(F),+,\x)$ 是一个环. 另一方面, 我们验证了前文将线性方程组写作 $A\bs x=\bs b$ 的合理性; 推而广之,
$$
A_{m\x n}\x B_{n\x r}=\pmat{A\bs b_{\cdot1}&\cdots&A\bs b_{\cdot r}}=\pmat{\bs a_{1\cdot}B\\\vdots\\\bs a_{m\cdot}B}.
$$
如果将 $F$ 取作一个环 $R$, 那么 $A(tB)=t(AB)=(tA)B$ 不一定成立; 当 $t\in Z(R)$ 时则一定成立. $\mathbf M_{n\x n}(R)$ 仍然是一个环.

## $\S4.4$ 基和维数

&emsp;&emsp;下令 $F$ 是域, $V$ 是 $F$-线性空间, $S\sub V$ 是任意子集. 则称形如
$$
a_1v_1+\cdots+a_mv_m\quad (m\in\Z_{\ge 0},~a_i\in F,~v_i\in S)
$$
的向量为 $S$ 中元素的线性组合. 将所有线性组合构成的集合记为 $\lang S\rang$. 可以验证 $\lang S\rang$ 是一个子空间, 例如
$$
\sum_{s\in S}a_ss+\sum_{s\in S}b_ss=\sum_{s\in S}(a_s+b_s)s.
$$
且 $\lang S\rang$ 是包含 $S$ 的子空间中在 $\subseteq$ 意义下最小的一个.

> **定义 4.4.1**
>
> &emsp;&emsp;a) 若 $S\sub V$ 满足 $\lang S\rang =V$, 则称 $S$ 生成 $V$.
>
> &emsp;&emsp;b) 若存在一组不全 $0$ 的系数使得 $\sum_{s\in S}a_ss=0$, 则称 $S$ 线性相关, 称该等式为非平凡的线性关系; 否则 $S$ 线性无关.
>
> &emsp;&emsp;c) 若线性无关的 $S$ 生成 $V$, 则称 $S$ 是 $V$ 的一组基.

&emsp;&emsp;观察到, 对线性无关的 $S$, 若 $v\in\lang S\rang$, 则 $v=\sum_{s\in S}a_ss$ 的 $(a_s)$ 唯一确定. 因此,
$$
S\text{ is a base of }V\Eq \A v\in V,~\E!(a_s)_{s\in S}\text{ of finite many nonzero terms},~v=\sum_{s\in S}a_sS.
$$
这就指出 $F^{\oplus S}\simeq V$, 因为有 $\varphi:(a_s)_{s\in S}\overset{1:1}\mapsto\sum_{s\in S}a_ss$.

> **性质 4.4.2**
>
> &emsp;&emsp;对 $S\sub V$, 以下命题等价:
>
> &emsp;&emsp;(i) $S$ 是一组极小的满足 $\lang S\rang =V$ 的向量组.
>
> &emsp;&emsp;(ii) $S$ 是 $V$ 的基.
>
> &emsp;&emsp;(iii) $S$ 是极大的线性无关向量组.

&emsp;&emsp; *→ Proof.* $\u{(i)}\Ra\u{(ii)}$ 我们需要验证此时的 $S$ 是线性无关的. 否则, 有 $\sum_{s\in S} a_ss=0$ 且某个 $a_{s_0}\neq 0$. 然而这就有 $s_0=-\frac{1}{a_{s_0}}\sum_{s\neq s_0}a_ss$, 因此 $\lang S\setminus\{a_{s_0}\}\rang=\lang S\rang$, 矛盾. $\u{(ii)}\Ra\u{(i)}$ 若 $S\setminus\{s\}$ 也生成 $V$, 那么 $\sum_{t\neq s}a_tt-s=0$, 这与 $S$ 的线性无关性矛盾.

&emsp;&emsp;$\u{(ii)}\Ra\u{(iii)}$ 我们需要验证此时 $S$ 是极大的. 否则, 设 $v\in V$ 使得 $S\cup\{v\}$ 线性无关, 那么不存在 $\sum_{s\in S}a_ss-v=0$, 这与 $\lang S\rang=V$ 矛盾. $\u{(iii)}\Ra\u{(ii)}$ 根据加入任意向量的线性相关性就能给出相应的线性组合.

&emsp;&emsp;例如, 对 $F^n$, 有一组标准基 $\{e_1,\cdots,e_n\}$, 其中 $e_k^{(j)}=[j=k]1_F$. 同理对 $\mathbf M_{n\x m}(F)$ 有 $(E_{rc})_{ij}=[r=i][c=j]1_F$. 对 $F[X]$ 有基 $\{1,X,X^2,\cdots\}$. 上文中提出 $A\bs x=\bs b$ 的解构成 $F^n$ 的子空间, 基础解系就是其一组基.

> **性质 4.4.3**
>
> &emsp;&emsp;(i) $V$ 的基存在.
>
> &emsp;&emsp;(ii) 对 $V$ 的任意两组基 $B,B'$, 一定有 $|B|=|B'|=:\dim V$.
>
> &emsp;&emsp;(iii) 任意独立集 $S$ 可被增广为基.

&emsp;&emsp;*→ Proof.* 只讨论有限生成的 $V$. 对 (i), 只需要从任意生成 $V$ 的有限的 $S$ 开始, 迭代地任意删去一个与其他向量线性相关的向量, 最终就能得到基.

> **引理 4.4.4**
>
> &emsp;&emsp;如果 $V=\lang s_1,\cdots,s_n\rang$, 那么 $\A m>n,~\{v_1,\cdots,v_m\}\text{ is linear dependent}$.

&emsp;&emsp;*→ Proof.* 设 $v_i=\sum_ja_{ij}s_j$, 考虑一组 $\{x_m\}\sub F^m$, 使得
$$
\sum_ix_iv_i=\sum_ix_i\sum_{j}a_{ij}s_j=\sum_j s_j\sum_i a_{ij}x_i=0.
$$
此方程组的主元数量不超过 $\min\{n,m\}=n$, 而有 $m>n$ 个变元, 因此必然存在非全 $0$ 解, 这导致 $\{v_m\}$ 线性相关.

&emsp;&emsp;*→ ...Proof @4.4.3* 引理直接推知 (ii) 成立.

&emsp;&emsp;对 (iii), 不断选取与 $S$ 线性无关的 $v$ 加入 $S$, 根据引理, 这能在有限步内完成进而得到极大的线性无关子集, 这就是基.

&nbsp;

> **命题 4.4.5**
>
> &emsp;&emsp;对一列 $F$-向量空间 $V_{i\in I}$, 设它们有基 $B_{i\in I}$, 那么
> $$
> \bigsqcup_{i\in I}B_i=:B\text{ is a base of }\bigoplus_{i\in I}V_i.
> $$

&emsp;&emsp;*→ Proof.* 对 $v=\sum_{j\in J}v_j~(\#J<\oo)$, 展开有
$$
v=\sum_{j\in J}\sum_{b\in B_j}c_b b=\sum_{b\in B}c_bb.
$$
其中 $c_b\in F$ 至多对有限个 $b$ 非零.

> **性质 4.4.6**
>
> &emsp;&emsp;对有限维的 $V$, 设 $\dim V=n$, 若有 $\{v_1,\cdots,v_n\}\sub V$, 以下命题等价:
>
> &emsp;&emsp;(i) 它们是一组基.
>
> &emsp;&emsp;(ii) 它们线性无关.
>
> &emsp;&emsp;(iii) 它们生成 $V$.

&emsp;&emsp;明显成立.

> **性质 4.4.7**
>
> &emsp;&emsp;若 $\dim V=n\in\Z_{\ge 0}$, $V_0\sub V$, 那么 $\dim V_0\le\dim V$ 且当且仅当 $V_0=V$ 时取等.

&emsp;&emsp;"$\le$" 是平凡的, 只说明取等条件. 如果 $\dim V_0=n$, 也就是存在基 $\{v_1,\cdots,v_n\}\sub V_0$, 自然它们在 $V$ 中也线性无关. 根据 <u>性质 4.4.6</u>, 这也是 $V$ 的一组基, 因此 $V=V_0$.

> **命题 4.4.8**
>
> &emsp;&emsp;(i) 对两域 $F\sub E$, $E$ 可视作 $F$-向量空间.
>
> &emsp;&emsp;(ii) 若 $E$-向量空间 $V$ 有基 $B$, $F$-向量空间 $E$ 有基 $C$, 那么 $V$ 作为 $F$-向量空间有基 $\{cb:c\in C,b\in B\}$.

&emsp;&emsp;*→ Proof.* (ii) $\A v\in V,~v=\sum_{b\in B}t_bb~(t_b\in E)$, 同时 $t_b=\sum_{c\in C}u_{bc}c$, 所以 $v=\sum_{b\in B,c\in C}u_{bc}cb$. 接下来说明这个基的确线性无关:
$$
\sum_{(b,c)}u_{bc}cb=0\Ra\sum_b\l(\sum_c u_{bc}c\r)b=0\\
\Ra\A b,~\sum_cu_{bc}c=0\Ra\A b,~\A c,~u_{bc}=0.
$$


## $\S4.5$ 线性映射

> **定义 4.5.1 (线性映射)**
>
> &emsp;&emsp;设 $V,W$ 是 $F$-线性空间, 若映射 $T:V\to W$ 满足:
>
> - $T(v_1+v_2)=Tv_1+Tv_2$;
> - $T(tv)=tT(v)$.
>
> 则 $T$ 是一个线性映射.

&emsp;&emsp;平凡例子如 $\bs 0:V\to W,~v\mapsto 0$, $\opn{id}_V:V\to V,~v\mapsto v$. 容易验证线性映射的复合也是线性映射.

> **定义 4.5.2**
>
> &emsp;&emsp;对线性映射 $T:V\to W$, 如果存在线性映射 $S:W\to V$ 满足 $ST=\opn{id}_V$, 则 $T$ 是左可逆的; 如果存在线性映射 $S:W\to V$ 满足 $TS=\opn{id}_W$, 则 $T$ 是右可逆的. 如果 $T$ 左右皆可逆, 那么称 $T$ 可逆. 可逆线性映射可以被视为线性空间间的同构.

> **命题 4.5.3**
>
> &emsp;&emsp;对线性映射 $T:V\to W$, 那么 $T$ 是同构 $\Eq$ $T$ 是双射.

&emsp;&emsp;左推右显然. 右推左, 设 $T^{-1}:W\to V$, 我们说明 $T^{-1}$ 是线性映射. 这是因为
$$
T^{-1}(w+w')=T^{-1}w+T^{-1}w'\Eq T(T^{-1}(w+w'))=T(T^{-1}w+T^{-1}w')\Eq w+w'=w+w'.
$$
以及
$$
T^{-1}(tw)=tT^{-1}(w)\Eq TT^{-1}(tw)=T(tT^{-1}(w))\Eq tTT^{-1}(w)=tw.
$$

> **命题 4.5.4**
>
> &emsp;&emsp;若 $\dim V=n$, 那么
> $$
> \{\text{isom. }F^n\overset\sim\to V\}\overset{1:1}\leftrightarrow\{\text{ordered bases of }V\}.
> $$

&emsp;&emsp;*→ Proof.* 取 $V$ 的标准基 $\{e_1,\cdots,e_n\}$, 左到右, $\varphi:T\mapsto\{Te_1,\cdots,Te_n\}$. 右到左,
$$
\psi:\{v_1,\cdots,v_n\}\mapsto\l(T:F^n\to V,~(x_1,\cdots,x_n)\mapsto \sum_{i=1}^nx_iv_i\r).
$$
验证 $\psi\varphi=\opn{id}$, 有
$$
\psi(\varphi(T))=\psi(\{T e_1,\cdots,T e_n\})=\l(T':(x_1,\cdots,x_n)\mapsto \sum_{i=1}^nx_iTe_i=T\sum_{i=1}^nx_ie_i\r),
$$
注意已有 $T'=T$. 反面, 有
$$
\varphi(\psi(\{v_1,\cdots,v_n\}))=\varphi\l(T:(x_1,\cdots,x_n)\mapsto\sum_{i=1}^nx_iv_i\r)=\{v_1,\cdots,v_n\}.
$$
&emsp;&emsp;因此, $\dim V<\oo$ 时, 就有 $V\overset\sim\to F^n$.

> **定义 4.5.5**
>
> &emsp;&emsp;若 $V,W$ 为 $F$-线性空间, 定义 $\Hom_F(V,W)$ 为所有 $V\to W$ 的线性映射, 则按照惯有意义配备 $+,\cdot$ 后, $\Hom(V,W)$ 也是隐约可见. 特别地, 定义 $\End(V)=\Hom(V,V)$.

&emsp;&emsp;更进一步, 配备映射合成 $\circ$ 作为乘法, 可以验证 $(\End(V),+,\circ)$ 构成环. 有零元 $\bs 0:v\mapsto 0$, 幺元 $\opn{id}:v\mapsto v$. 明显, $\End(V)$ 是零环当且仅当 $V=\{0\}$.

## $\S4.6$ 从线性映射观矩阵

&emsp;&emsp;设 $V,W$ 是 $F$-向量空间, 如果 $V$ 有基 $(v_j)_{j\in J}$, 那么 $\Hom(V,W)\overset\sim\to W^J$. 只需要给出
$$
\varphi:T\mapsto(Tv_j)_{j\in J},\\
\psi:(w_j)_{j\in J}\mapsto\l(\sum_{j}x_jv_j\mapsto \sum_jx_jw_j\r).
$$
~~如果遵循 Curry 化约定, 可以省略这个巨大小括号.~~ 验证不难.

&emsp;&emsp;如果 $W$ 有基 $(w_i)_{i\in I}$, 进一步有
$$
\Hom(V,W)\simeq W^J\simeq\{(a_{ij})_{i\in I,j\in J}\in F^{I\times J}:\A j,~\#\{a_{ij}\neq 0\}<\oo\}.
$$
那么对 $S\leftrightarrow(a_{ij})$ 和 $T\leftrightarrow (b_{ij})$, 有 $S+T=(a_{ij}+b_{ij})$.

&emsp;&emsp;You know what will do next. 考虑可符合的线性映射 $U\overset T\to V\overset S\to W$, 其中各个空间有基 $(u_k),(v_j),(w_i)$, 我们关心 $ST$ 对应的数组. 根据上文, 已有
$$
Sv_j=\sum_{i}a_{ij}w_i,\quad Tu_k=\sum_{j}b_{jk}v_j,
$$
那么 (注意所有求和都是有限和):
$$
ST(u_k)=S\l(\sum_jb_{jk}v_j\r)=\sum_jb_{jk}S v_j=\sum_jb_{jk}\sum_ia_{ij}w_i=\sum_i\l(\sum_j a_{ij}b_{jk}\r)w_i.
$$
(这里用到了 $F$ 上的乘法交换律, 但如果把 scalar product 定义为右乘, 则并不依赖这一点.) 因此, 若 $ST\leftrightarrow (c_{ik})$, 就有
$$
c_{ik}=\sum_ja_{ij}b_{jk}.
$$
这给出了矩阵乘法的来历. 如果 $I=\{1..m\},J=\{1..n\}$, 那么存在
$$
\mathcal M:\Hom(V,W)\overset\sim\to\mathbf M_{m\x n}(F).
$$

> **定理 4.6.1**
>
> &emsp;&emsp;以下图表交换:
> $$
> \begin{array}{ccc}
> \Hom(V,W)\x\Hom(U,V)&\overset\cdot\to&\Hom(U,W)\\
> (\mathcal M,\mathcal M)\downarrow&&\downarrow\mathcal M\\
> \mathbf M_{m\x n}(F)\x\mathbf M_{n\x r}(F)&\overset\cdot\to&\mathbf M_{m\x r}(F)
> \end{array}
> $$
>

&emsp;&emsp;例如, $\End(V)\simeq\mathbf M_{n\x n}(F)$, $\opn{id}_V\simeq \bs 1_{m\x m}$, ...

&emsp;&emsp;可以把 <u>定义 4.5.2</u> 搬过来获得矩阵的 (左, 右) 可逆的定义.

> **定义 4.6.2**
>
> &emsp;&emsp;称 $A\in\M_{n\x n}(F)$ 可逆, 当且仅当存在 $B\in\M_{n\x n}(F)$, 使得 $AB=BA=\bs 1_{n\x n}$, 将 $B$ 唯一地写作 $A^{-1}$.

&emsp;&emsp;注意可逆矩阵代表着可逆线性映射, 它给出了同构 $F^n\overset\sim\to F^m$, 因此只能有 $n=m$, 所以可逆矩阵一定是方阵.

&nbsp;

&emsp;&emsp;回到 Gauss-Jordan 消元法, 我们可以把所谓的 "初等行变换" 写成初等矩阵.

- $A(i,k,c)$ 对应 $\mathcal A(i,k,c):=\bs 1_{m\x m}+cE_{ki}$. 这是因为,
    $$
    \mathcal A(i,k,c)A=A+\pmat{\\ ca_{i1}&ca_{i2}&\cdots&ca_{in}\\&\\&}.
    $$

- $B(i,k)$ 对应 $\mathcal B(i,k):=\bs 1_{m\x m}-E_{ii}-E_{kk}+E_{ik}+E_{ki}$, 样子是
    $$
    \mathcal B(i,k)=\pmat{
    \ddots&\\
    &0&&1\\
    &&\ddots&\\
    &1&&0&\\
    &&&&\ddots
    }.
    $$
    省略号处全 $1$. 验证不难.

- $C(i,c)$ 对应 $\mathcal C(i,c):=\bs 1_{m\x m}+(c-1)E_{ii}$.

&emsp;&emsp;根据作用效果容易看出, $\mathcal A(i,k,c)^{-1}=\mathcal A(i,k,-c)$, $\mathcal B(i,k)^{-1}=\mathcal B(i,k)$, $\mathcal C(i,k)^{-1}=\mathcal C(i,k^{-1})$. 例如验证第一个,
$$
\mathcal A(i,k,c)\mathcal A(i,k,-c)=(\bs 1+cE_{ki})(\bs 1-cE_{ki})=\bs 1-c^2E_{ki}^2\overset{k\neq i}=\bs 1.
$$
&emsp;&emsp;因为初等行变换对应可逆矩阵, 这也给出消元法给出的任何一个中间方程组和原方程组都同解.

## $\S4.8$ 核, 像与消元法

> **定义 4.8.1 (核, 像)**
>
> &emsp;&emsp;对线性映射 $T:V\to W$, 定义其核为
> $$
> \ker T:=\{v\in T:Tv=0\}=T^{-1}(0).
> $$
> 定义其像为
> $$
> \im T:=\{w\in W:\E v\in V,~Tv=w\}.
> $$

&emsp;&emsp;容易验证它们都是各自所属空间的子空间.

&emsp;&emsp;注意到对 $w\in W$, 要不有 $w\notin\im T\Eq T^{-1}(w)=\varnothing$, 要不有 $\E v_0\in T,~Tv_0=w$. 对于后者, $\A v\in V,~Tv=w\Eq Tv-Tv_0=0$, 这给出 $v-v_0\in\ker T$. 因此 $T^{-1}(w)=v_0+\ker T$. 即, $w$ 的原像要不为空, 要不为 $\ker T$ 的平移. 例如, $T$ 是单射就等价于 $\ker T=\{0\}$; $T$ 是满射自然则有 $W=\im T$.

> **定理 4.8.2**
>
> &emsp;&emsp;对有限生成的线性映射 $T:V\to W$, 有
> $$
> \dim T=\dim\ker T+\dim\im T.
> $$

&emsp;&emsp;*→ Proof.* 首先, 由于前者是 $T$ 的子空间, 后者由 $TB$ 生成 ($B$ 是 $T$ 的基), 所以它们的维数都是有限的. 任选 $\im T$ 的一组基 $\{w_r\}$, 同时任给出 $w_i=Tv_i$. 再任选 $\ker T$ 的一组基 $\{u_k\}$. 断言: $\{v_r\}\cup\{u_k\}$ 是 $V$ 的基.

&emsp;&emsp;先验证其线性无关. 如果有 $\sum_ia_iv_i+\sum_ib_iu_i=0$, 两侧同时施加 $T$, 有 $\sum_ia_iw_i=0$, 这给出 $\A i,~a_i=0$, 那就只有 $\A i,~b_i=0$, 智能是平凡的线性关系.

&emsp;&emsp;再验证其生成 $T$. 对任意 $v\in T$, 有 $Tv=\sum_ia_iw_i\Ra T\l(v-\sum_ia_iv_i\r)=Tv-\sum_ia_iw_i=0$, 因此 $v-\sum_ia_iv_i=\sum_ib_iu_i\in\ker T$, 最终 $v=\sum_ia_iw_i+\sum_ib_iu_i$.

> **推论 4.8.3**
>
> &emsp;&emsp;若 $\dim V=\dim W<\oo$, 那么 $T:V\to W$ (i) 是同构, (ii) 是单的, (iii) 是满的; 三者等价.

&emsp;&emsp;*→ Proof.* 也即是, $\dim\ker T=0\Eq\dim\im T=\dim T$, 二者都能给出 $T$ 是双射.

> **定义 4.8.4 (秩)**
>
> &emsp;&emsp;对线性映射 $T$, 定义其秩
> $$
> \rank T:=\dim\im T.
> $$
> (同理可以定义矩阵的秩.)

&emsp;&emsp;对矩阵 $A:F^n\to F^m$, 有 $\im A=\lang Ae_1,\cdots,Ae_n\rang$, 也即 $A$ 的列向量的张成空间, 所以 $\rank A$ 也被成为 $A$ 的列秩, 同理可以给出其行秩的定义. 稍后将说明行秩和列秩相等. 同时, 根据 <u>定理 4.8.2</u>, 在有限维情况可以写出 $\rank A=\dim\ker A$.

> **命题 4.8.5**
>
> &emsp;&emsp;若矩阵 $A\overset{\mathbf{G-J}}\to A'$, $r:=\#\text{pivots in }A'$, 那么 $r=\rank A$.

&emsp;&emsp;*→ Proof.* 设 $A=\pmat{v_1&\cdots& v_n}$. 对 $A'$, 可以取出它的主元列编号 $1\le i_1<\cdots<i_r\le n$, 这样 $\{v_{i_r}\}$ 就给出了 $\lang v_1,\cdots,v_n\rang$ 的基.

> **命题 4.8.6**
>
> &emsp;&emsp;若 $A\in\M_{m\x m}(F)$, 那么以下命题等价:
>
> &emsp;&emsp;(i) $A$ 可逆.
>
> &emsp;&emsp;(ii) $\ker A=\{0\}$.
>
> &emsp;&emsp;(iii) $\rank A=m$.
>
> &emsp;&emsp;(iv) $A=U_1\cdots U_k$, 其中 $U_i$ 是初等矩阵.

&emsp;&emsp;(i)(ii)(iii) 可以由 <u>推论 4.8.3</u> 给出.

&emsp;&emsp;$\u{(iii)}\Ra\u{(iv)}$ 因为 $\rank A=m$, 必然有 $A\overset{\mathbf{G-J}}\to\bs 1$, 将消元法的行变换取逆即可得到 $A=U_1\cdots U_k$.

&emsp;&emsp;$\u{(iv)}\Ra\u{(i)}$ 初等矩阵可逆.

> **算法 4.8.7 (矩阵求逆)**
>
> &emsp;&emsp;输入 $A\in\M_{m\x m}(F)$, 只需对 $(A\mid \bs 1_{m\x m})$ 进行消元法, 最终若 $A'\neq\bs 1$, 根据 <u>命题 4.8.6.(i)(iv)</u>, 它不可逆; 否则已经得到 $(\bs 1_{m\x m}\mid A^{-1})$.

> **练习 4.8.8**
>
> &emsp;&emsp;若 $A=(\min\{i,j\})_{1\le i,j\le m}$, 用消元法证明其可逆.

&emsp;&emsp;*→ Solution.* 用第 $k$ 行消元后, $A|_{[k+1,n]}=(\min\{i,j\})_{1\le i,j\le n-k}$, 归纳即可说明其可被消元为 $\bs 1$.

## $\S4.7$ 从矩阵转置到对偶空间

> **定义 4.7.1**
>
> &emsp;&emsp;对环 $R$ 上的 $m\x n$ 矩阵 $A=(a_{ij})$, 定义其转置为 $n\x m$ 矩阵, 满足
> $$
> A^\intercal=(a_{ji}).
> $$

&emsp;&emsp;容易看出

- $(A+B)^\intercal=A^\intercal+B^\intercal$.
- $(sA)^\T=sA^\T$.
- $A^{\T\T}=A$.
- $(A^\T)^{-1}=(A^{-1})^\T$.
- $(AB)^\T=B^\T A^\T$.

说明最后一式:
$$
\begin{aligned}
	(AB)^\T_{ij} &= \sum_{\ell}a_{j\ell}b_{\ell i}\\
	&= \sum_\ell (a^\T)_{\ell j}(b^\T)_{i\ell}\\
	&= (B^\T A^\T)_{ij}.
\end{aligned}
$$
此外, 可以看出, 初等矩阵的转置仍然是同类型的初等矩阵.

&emsp;&emsp;这样, 可以定义行秩 $\opn{row rank} A=\rank A^\T$, 稍后说明这也就是 $\rank A$.

> **定义 4.7.2**
>
> &emsp;&emsp;若 $A,B\in\M_{m\x n}(F)$, 称 $A,B$ 相抵, 当且仅当存在 $ Q\in\M_{m\x m}(F)^\x$ 和 $P\in\M_{n\x n}(F)^\x$, 使得
> $$
> B=QAP.
> $$

&emsp;&emsp;显然相抵是等价关系. 根据 <u>定理 4.8.6.(i)(iv)</u>, $A,B$ 相抵 $\Eq$ 二者可以通过初等行列变换相互到达.

> **命题 4.7.3**
>
> &emsp;&emsp;$A,B$ 相抵当且仅当 $\rank A=\rank B$.

&emsp;&emsp;*→ Proof.* 左推右, 只需要说明 $\rank A=\rank(QAP)$, 这是因为 $\rank A=\dim\im A$ 而 $\im A\simeq\im(AP)\simeq\im(QAP)$.

&emsp;&emsp;右推左, 对给定的 $A$, 自然存在一个可逆的 $Q$, 使得 $QA$ 是简化行梯矩阵, 有 $r=\rank A$ 个主元. 在 $QA$ 上, 可以先通过初等列变换将主元列聚拢到 $r\x r$ 范围内, 再通过初等列变换将主元行右侧全部零化, 得到 $D_r~((D_r)_{ij}=[i=j][i\le r])$, 这时 $A$ 相抵于 $D_r$. 由于 $\rank A=\rank B$, 所以 $B$ 相抵于 $D_r$, 等价传递得 $A$ 相抵于 $B$.

> **定理 4.7.4**
>
> &emsp;&emsp;$\rank A^\T=\rank A$.

&emsp;&emsp;*→ Proof.* 取可逆的 $P,Q$, 使得 $D_r^{m\x n}=QAP$, 其中 $r=\rank A$. 那么 $(D_r^{m\x n})^\T=P^\T A^\T Q^\T=D_r^{n\x m}$, 所以 $A^\T$ 相抵于 $D_r^{n\x m}$, 这已经给出 $\rank A=\rank A^\T$.

&emsp;&emsp;明显 $\rank A\le\min\{n,m\}$, 取等时则称 $A$ 满秩.

> **定义 4.7.5**
>
> &emsp;&emsp;对 $F$-线性空间 $V$, 定义 $V^\vee=\Hom(V,F)$ 为 $V$ 的对偶空间.

&emsp;&emsp;令 $T\in\Hom(V,W)$, 那么 $T^\T:W^\vee\to V^\vee,~\lambda\mapsto\lambda T$, 其中 $\lambda T$ 即合成映射 $V\overset{\lambda}\to W\overset T\to F$.

> **定义 4.7.6**
>
> &emsp;&emsp;对有限维 $V$ 的基向量 $v_i$,定义
> $$
> \check v_i\in V^\vee,\quad \check v_i\l(\sum_{j=1}^nx_jv_j\r)=x_i.
> $$

$\{\check v_n\}$ 称为 $\{v_n\}$ 的对偶基, 它们是 $V^\vee$ 的基.

&emsp;&emsp;*→ Proof.* 线性无关性: $\sum_it_i\check v_i=0\Eq \sum_it_i\check v_i(v_j)=0\Eq t_j=0~(\A j)$.

&emsp;&emsp;对 $\lambda\in V^\vee$, 令 $t_i=\lambda(v_i)$, 考察
$$
\l(\lambda-\sum_it_i\check v_i\r)(v_j)=\lambda v_j-t_j=0.
$$
因此 $\lambda=\sum_{i=1}^nt_i\check v_i$.

&emsp;&emsp;例如对列向量空间 $V=F^n=\M_{n\x 1}(F)$, 有 $V^\vee=\M_{1\x n}(F)$ 为行向量空间.

## $\S4.9$ 基的变换: 矩阵的共轭与相抵

&emsp;&emsp;设 $V$ 有基 $\{v_n\}$, $W$ 有基 $\{w_m\}$, 那么 $V\to W$ 的线性映射有
$$
\mathcal{\bs M}:\Hom(V,W)\overset\sim\to\M_{m\x n}(F).
$$
同时又有同构 $\varphi_v:F^n\overset\sim\to V$ 和 $\varphi_w:F^m\overset\sim\to W$, 那么以下图表交换:
$$
\begin{array}{ccc}
V & \overset{T}\to & W\\
\varphi_V\uparrow&&\uparrow \varphi_W\\
F^n&\overset{\mathcal{\bs M}(T)}\to&F^m
\end{array}
$$
考察 $e_j\in F^n$ 在两条路径中的变换, 最终根据
$$
Tv_j=\sum_{i}a_{ij}w_i
$$
即得.

&emsp;&emsp;定义映射
$$
\bs P_{v'}^v:F^n\to F^n,\quad (x_1',\cdots,x_n')\mapsto(x_1,\cdots,x_n)\text{ where }\sum x_iv_i=\sum x_i'v_i'.
$$
这相当于给出 $F^n\overset{\varphi_{V'}}\to V$ 和 $F^n\overset{\bs P}\to F^n\overset{\varphi_V}\to V$ 交换, 即 $\bs P=\varphi^{-1}_V\varphi_{V'}$, 它是可逆的线性映射, 这也就有
$$
v_j'=\sum_i P_{ij}v_i.
$$

>**定理 4.9.1**
>
>&emsp;&emsp;对 $V$ 的有序基 $v,v'$ 和 $W$ 的有序基 $w,w'$ 以及任意 $T\in\Hom(V,W)$, 有
>$$
>\mathcal{\bs M}_{v'}^{w'}(T)=\bs P_w^{w'}\mathcal{\bs M}_v^w(T)\bs P_{v'}^v=(\bs P_{w'}^w)^{-1}\mathcal{\bs M}_v^w(T)\bs P_{v'}^v.
>$$

&emsp;&emsp;"共轭矩阵在不同基下表征了相同的线性映射."

&emsp;&emsp;对一个可逆的 $P$, 能够给出 $\M_{n\x n}(F)\overset\sim\leftrightarrow\M_{n\x n}(F),~A\mapsto P^{-1}AP$.


## $\S4.10$ 直和分解

> **定义 4.10.1**
>
> &emsp;&emsp;给定 $F$-向量空间 $V$ 和其一族子空间 $(V_i)_{i\in I}$, 定义由外直和到 $V$ 的线性映射:
> $$
> \sigma:\bigoplus_{i\in I}^{\u{ext}}V_i\to V,\quad (v_i)_{i\in I}\mapsto\sum_{i\in I}v_i~(\u{finite~sum}).
> $$

&emsp;&emsp;我们关心何时 $\sigma$ 为同构, 这样便能在各个 $V_i$ 上的研究性质, 进而组合出 $V$ 的性质.

> **定义 4.10.2**
>
> &emsp;&emsp;给定 $F$-向量空间 $V$, 一族子空间 $(V_i)_{i\in I}$ 的和是
> $$
> \sum_{i\in I}V_i:=\l\{\text{finite sum}\sum_iv_i\in V:\A i,~v_i\in V_i\r\}.
> $$

&emsp;&emsp;它是 $\sigma$ 的像集, 也是一个子空间.

> **定义-命题 4.10.3**
>
> &emsp;&emsp;给定 $F$-向量空间 $V$, 一族子空间 $(V_i)_{i\in I}$, $I\neq\varnothing$, 若对每个 $i\in I$ 都有
> $$
> V_i\cap\sum_{j\neq i}V_j=\{0\}.
> $$
> 则将 $\sum_{i\in I}V_i$ 记为 $\bigoplus_{i\in I}V_i$, 称为 $(V_i)_{i\in I}$ 的内直和, 简称直和; $V_i$ 称为其中的直和项. 同时断言, 以上条件成立当且仅当 $\sigma$ 是同构.

&emsp;&emsp;*→ Proof.* $\sigma$ 是单射意味着 $\sum_{i\in I}v_i=\sum_iv_i'\Eq (\A i,~v_i=v_i')\Eq\sum_i v_i=0\Eq(\A i,~v_i=0)$. 若上述条件成立而有 $\sum_jv_j=0,~v_i\neq 0$, 这时给出 $v_i=-\sum_{j\neq i}v_j\in V_i\cap\sum_{j\neq i}V_j$, 矛盾. 另一方面, 如果 $\E i,~V_i\cap\sum_{j\neq i}V_j\neq\{0\}$, 同理给出 $\sigma$ 不是单射.

&emsp;&emsp;因此, 当定义条件被满足时,
$$
\bigoplus_{i\in I}^{\u{ext}}V_i\underset\sigma{\overset\sim\to}\bigoplus_{i\in I}^{\u{int}}V_i.
$$
"外" 是由小空间做笛卡尔积再挑选出的子空间, "内" 是在大空间内选取子空间得到的小空间族.

&emsp;&emsp;例如, $V=V_1\overset{\u{int}}\oplus V_2\Eq V_1\cap V_2=\{0\}\land V=V_1+V_2$. 取 $V$ 的基 $(v_i)_{i\in I}$, 那么 $V=\bigoplus_{i\in I}Fv_i$ (基的选取形似于将空间分解为一维子空间的直和).

&emsp;&emsp;对一般直和 $\bigoplus_{j\in I}V_j$ 和 $i\in I$, 都有嵌入映射 $\iota_i$ 和投影映射 $p_i$:
$$
V_i\overset{\iota_i}\mmap\bigoplus_{j\in I}V_j\overset{p_i}\to V_i,\\
v_i\overset{\iota_i}\mapsto\underset{\text{only when }j=i,~v_j=v_i\neq 0.}{(v_j)_{j\in I}}\overset{p_i}\mapsto v_i.
$$
当 $I$ 有限时, 明显有 $\sum_{i\in I}\iota_ip_i=\opn{id}_{\bigoplus_{i\in I}V_i}$.

&emsp;&emsp;现在来考察线性映射. 设 $T:V\to W$ 是线性映射, 而 $V$ 和 $W$ 带有直和分解:
$$
V=V_1\oplus\cdots\oplus V_n,\quad W=W_1\oplus\cdots\oplus W_m.
$$
令 $T_{ij}=p_iT\iota_j\in\Hom(V_j,W_i)$, 断言:

> **命题 4.10.4**
>
> &emsp;&emsp;作为 $F$-线性空间, 有
>
> $$
> \Hom(V,W)\overset\sim\to\bigoplus_{1\le i\le m,~1\le j\le n}\Hom(V_j,W_i),\quad T\mapsto(T_{ij}).
> $$

&emsp;&emsp;*→ Proof.* 线性性容易. 单性, 考虑
$$
T\iota_j=\l(\sum_i\iota_ip_i\r)T\iota_j=\sum_i\iota_ip_iT\iota_j=\sum_i\iota_iT_{ij}.
$$
由于 $V=\bigoplus_jV_j$, 所以 $(T_{ij})$ 可以唯一决定 $T$.

&emsp;&emsp;满性, 给定 $(T_{ij})$ 时, 定义
$$
T=\sum_{i',j'}\iota_{i'}T_{i'j'}p_{j'}.
$$
此时
$$
p_iT\iota_j=\sum_{i',j'}p_i\iota_i'T_{i',j'}p_{j'}\iota_j\overset{\text{only }(i,j)=(i',j')}=T_{ij}.
$$
&emsp;&emsp;特别地, $W=F$ 时, 这给出 $V^\vee\overset\sim\to V_1^\vee\oplus\cdots\oplus V_n^\vee$.

&emsp;&emsp;接下来, 考虑 $U\overset T\to V\overset  S\to W$ 的映射复合,
$$
(ST)_{ik}:=p_iST\iota_k=p_iS\l(\sum_j\iota_jp_j\r)T\iota_k=\sum_j(p_iS\iota_j)(p_jT\iota_k)=\sum_j S_{ij}T_{jk}.
$$
这样, $T=(T_{ij})$ 也可以写作 "矩阵", 不过每个 $T_{ij}$ 都是一个子线性映射. 如果对每个直和项 $V_j$ 和 $W_i$ 都选定了有序基, 这样我们也得到了 $V,W$ 的有序基. 对 $T=(T_{ij}\in\Hom(V_j,W_i))$, 可以展开作矩阵 $A=(A_{ij}\in\M_{m_i\x n_j}(F))$, 其中 $m_i=\dim W_i$, $n_j=\dim V_j$, 称之为一个分块矩阵. 从一种奇怪的意义上, 这些推导告诉我们分块矩阵乘法便是块与块相乘.

## $\S4.11$ 分块矩阵运算

> **定义 4.11.1**
>
> &emsp;&emsp;分块对角/上三角/下三角矩阵; 同理给出分块对角/上三角/下三角线性映射. (omitted)
>
> &emsp;&emsp;分块对角矩阵也记作 $\diag(A_{11},\cdots,A_{nn})$.

&emsp;&emsp;对分块上三角矩阵, 若 $V=V_1\ops\oplus V_n$, 那么有 $T(V_1)\sub V_1,~T(V_2)\sub V_1\oplus V_2,\cdots$. 也可以说, $T$ 保持了 $T(V_1\ops\oplus V_k)\sub  V_1\ops\oplus V_k$. 分块对角也即是 $T(V_i)\sub V_i$.

&emsp;&emsp;给定 $V_1\ops\oplus V_k$, 那么
$$
\l\{T\in\End(V):T\text{ is block up-triangular}\r\}
$$
是 $\End(V)$ 的一个子环.

> **命题 4.11.2**
>
> &emsp;&emsp;对 $F$-线性空间 $V$ 和子空间 $V_0\sub V$, 那么存在子空间 $V_1\sub V$, 使得 $V=V_0\oplus V_1$.

&emsp;&emsp;*→ Proof.* 仅说明有限维情况. 设 $B_0$ 是 $V_0$ 的一组基, 可以将其扩充为 $B_0\sqcup B_1$ 作为 $V$ 的基, 最后取 $V_1=\lang B_1\rang$ 即可. (不过, $V_1$ 的取法实际上并不唯一.)

> **命题 4.11.3**
>
> &emsp;&emsp;分块上三角矩阵 $A$ 可逆当且仅当一切 $A_{ii}$ 可逆, 且 $A^{-1}$ 有对角线 $A_{11}^{-1}\ops,A_{rr}^{-1}$.

&emsp;&emsp;*→ Proof.* 仅考虑 $r=2$ 的情况, 通过不断取出 $A_{rr}$ 所在行列可以进行归纳法. 设
$$
A=\l(\begin{array}{c|c}
A_{11}&A_{12}\\\hline
&A_{22}
\end{array}\r),
$$
如果 $A^{-1}$ 存在, 考虑其相同规格的分块阵, 验证乘法发现 $A^{-1}$ 给出了 $A_{11}^{-1}$ 和 $A_{22}^{-1}$, 因此对角线上块可逆. 另一方向类似, 验证矩阵乘法即可.

## $\S4.12$ 商空间

> **定义-命题 4.12.1**
>
> &emsp;&emsp;对线性空间 $V$ 和其子空间 $U$, 定义
> $$
> v_1\sim_U v_2\Eq v_1-v_2\in U.
> $$
> 则 $\sim_U$ 是一个等价关系.

&emsp;&emsp;*→ Proof.* 验证反身性, 传递性, 对称性, 容易的.

&emsp;&emsp;这样, $v$ 的等价类就是 $v+U:=\{v+u:u\in U\}$, 称为 $U$ 在 $V$ 中的一个陪集.

&emsp;&emsp;在给出 $T:V\to W$ 和 $U=\ker T$ 时, 自然存在 $\ol T:V/\sim_U\overset{1:1}\to\im T$, 我们希望将 $V/\sim_U$ 配备向量空间结构, 使得 $\ol T$ 是一个向量空间的同构.

> **定义 4.12.2 (商空间)**
>
> &emsp;&emsp;对线性空间 $V$ 和子空间 $U$, 定义
> $$
> V/U=\{v+U:v\in V\}.
> $$
> 同时赋予:
>
> - 加法, $(v_1+U)+(v_2+U):=v_1+v_2+U$.
> - 纯量乘法, $t(v+U):=tv+U$.
> - 零元, $0:=U=0_V+U$.

&emsp;&emsp;容易验证这良定地给出了一个向量空间. 同时能给出商映射
$$
q:V\to V/U,\quad v\mapsto v+U.
$$
这是唯一使得 $q$ 线性的映射.

&emsp;&emsp;一些极端例子: $V/\{0\}=V$ (仅此时 $q$ 是同构), $V/V=\{0\}$ (仅此时 $q$ 是零映射). $\ker(q)=\{v:v+U=U\}=U$.

> **命题 4.12.3**
>
> &emsp;&emsp;若 $\dim V<\oo$, 那么 $\dim V=\dim(V/U)+\dim U$.

&emsp;&emsp;*→ Proof.* $\dim V=\dim\im q+\dim\ker q=\dim(V/U)+\dim U$. 无穷维时事实上也成立.

> **定义 4.12.4**
>
> &emsp;&emsp;对线性映射 $T:V\to W$, 定义其余核 $\coker T:=W/\im T$.

&emsp;&emsp;可以证明, $T$ 是满的当且仅当 $\coker T=\{0\}$.

> **命题 4.12.5**
>
> &emsp;&emsp;设 $U$ 是向量空间 $V$ 的子空间, $T:V\to W$ 是线性映射.
>
> &emsp;&emsp;(i) 若 $U\sub\ker T$, 则存在唯一的线性映射 $\ol T:V/U\to W$, 使得 $V\overset{T}\to W$ 和 $V\overset{q}\to V/U\overset{\ol T}\to W$ 交换.
>
> &emsp;&emsp;(ii) 若 $U=\ker T$ 而 $W=\im T$, 则 $\ol T$ 还是向量空间的同构.

&emsp;&emsp;*→ Proof.* (i) 唯一性. $\ol T:v+U\mapsto Tv$ 明显给出了唯一的一个 $\ol T$.

&emsp;&emsp;存在性. 首先, $v_1+U=v_2+U\Eq v_1-v_2\in U\Ra T(v_1-v_2)=0$, 因此 $\ol T$ 良定. $\ol Tq$ 的线性性不难验证.

&emsp;&emsp;(ii) 注意到 $\im T=\im\ol T$. 还需要验证 $\ol T$ 是单射, 即 $\ker\ol T=\{0\}$. 这是因为 $\ol T(v+U)=0\Eq Tv=0\Eq v\in\ker T=U$.

> **推论 4.12.6**
>
> &emsp;&emsp;对线性映射 $T:V_1\to V_2$ 和两个子空间 $U_1\sub V_1$, $U_2\sub V_2$, 满足 $T(U_1)\sub U_2$, 那么 $\E!\ol T:V_1/U_1\to V_2/U_2\text{ linear}$, 使得下图交换:
> $$
> \begin{array}{ccc}
> 	V_1 & \overset T\longrightarrow &V_2\\
> 	q_1\downarrow&&\downarrow q_2\\
> 	V_1/U_1&\underset{\ol T}\longrightarrow& V_2/U_2
> \end{array}
> $$

&emsp;&emsp;*→ Proof.* 由于 $q_2T(U_1)=q_2(U_2)=\{0\}$, 因此 $U_1\sub\ker(q_2 T)$, 结合 <u>命题 4.12.5.(i)</u> 即可.

&emsp;&emsp;进一步地, 对于
$$
\begin{array}{ccccc}
	V_1 & \overset T\longrightarrow &V_2& \overset S\longrightarrow & V_3\\
	q_1\downarrow&&\downarrow q_2&&\downarrow q_3\\
	V_1/U_1&\underset{\ol T}\longrightarrow& V_2/U_2&\underset{\ol S}\longrightarrow& V_3/U_3
\end{array}
$$
注意 $T(U_1)\sub U_2$, $S(U_2)\sub U_3$, 那么 $ST(U_1)\sub U_3$, 也能定义出 $\ol{ST}$, 这是因为根据交换性, 图上路径 $V_1\texttt{RRD}=V_1\texttt{RDR}=V_1\texttt{DRR}$.

> **命题 4.12.7**
>
> &emsp;&emsp;对 $\Omega$ 的子空间 $V,W$, 存在同构
> $$
> V/(V\cap W)\overset\sim\to(V+W)/W,\quad v+(V\cap W)\mapsto v+W.
> $$

&emsp;&emsp;*→ Proof.* 定义 $T:V\to(V+W)/W,~v\mapsto v+W$, 由于 $v+w+W=v+W$, 所以 $\im T=(V+W)/W$. 同时明显 $\ker T=V\cap W$, 那么命题中的同构能由 <u>命题 4.12.5.(i)</u> 给出.

> **推论 4.12.8**
>
> &emsp;&emsp;设 $V=U\oplus W$, 则相应商映射 $q:V\to V/U$ 限制为同构 $q|_W:W\overset\sim\to V/U$.

&emsp;&emsp;*→ Proof.* $V=U\oplus W\Eq U+W=V\land U\cap W=\{0\}$, 因此 $W=W/(U\cap W)$ 可由 <u>命题 4.12.7</u> 给出到 $(U+W)/U$ 的同构, 这也就是到 $V/U$ 的同构.

&emsp;&emsp;最后, 假设 $\dim V_1,\dim V_2<\oo$, $T(U_1)\sub U_2$ 并且有交换图
$$
\begin{array}{ccc}
	V_1 & \overset T\longrightarrow &V_2\\
	q_1\downarrow&&\downarrow q_2\\
	V_1/U_1&\underset{\ol T}\longrightarrow& V_2/U_2
\end{array}
$$
这时固定 $U_i$ 的有序基并扩充为 $V_i$ 的有序基, 即这些基给出 $V_i=U_i\oplus U_i'$, 那么
$$
T\leftrightarrow
\l(\begin{array}{c|c}
\overset{\overset{U_1}\vdots}A&\overset{\overset{U_1'}\vdots}B_{\cdots U_2}\\\hline &D_{\cdots U_2'}
\end{array}\r)
$$
其中 $A$ 给出 $T|_{U_1}:U_1\to U_2$, 其余同理. 更广泛地, 设一列基扩张形成的
$$
V=V_d\supsetneq V_{d-1}\ops\supsetneq V_0=\{0\},\\
W=W_d\supsetneq W_{d-1}\ops\supsetneq W_0=\{0\}.
$$
那么 $T$ 也给出相似的分块矩阵, 其中 $A_{ii}$ 的 $V_i/V_{i-1}\to W_i/W_{i-1}$ 诱导自 $T|_{V_i}:V_i\to W_i$.

# 第五章 行列式


## $\S5.1$ 置换

> **定义 5.1.1**
>
> &emsp;&emsp;对非空集合 $X$, 定义 $S_X:=\{\text{bijection }X\to X\}$.

&emsp;&emsp;它包含恒等映射 $\id_X$, 自然配有映射合成 $(\sigma,\sigma')\mapsto\sigma\sigma'$ 和逆 $\sigma^{-1}$. 若 $n\ge 1$ 而 $X=\{1,2,\dots,n\}$, 此时记 $S_X=S_n$.

&emsp;&emsp;例如 $S_n$ 里的轮换 $\lambda=\pmat{2&3&\cdots&n&1}$, 对换 $\DS(i\quad j):=\pmat{\cdots&i&\cdots&j&\cdots\\ \cdots&j&\cdots&i&\cdots}$, 单对换 $(i\quad i+1)$.

> **定义 5.1.2**
>
> &emsp;&emsp;设 $\sigma\in S_n$, 定义
> $$
> \opn{inv}\sigma:=\{(i,j)\in\N^2:1\le i<j\le n,~\sigma_i>\sigma_j\}.
> $$
> 为其逆序, 逆序数 $\ell(\sigma):=|\opn{inv}\sigma|$.

&emsp;&emsp;一些结论:

- $\ell(\sigma)=0\Eq\sigma=\id$.
- $\ell(\sigma)=\ell(\sigma^{-1})$, 因为 $\opn{inv}\sigma\ni(i,j)\mapsto (\sigma_j,\sigma_i)\in\opn{inv}\sigma^{-1}$ 是双射.
- $\arg\max\ell(\sigma)=\sigma'\text{ where }\sigma'_k=n-k+1$.

> **命题 5.1.3**
>
> &emsp;&emsp;对 $\sigma\in S_n$, 存在一列单对换 $\tau_1,\tau_2,\cdots,\tau_\ell\in S_n$, 使得 $\sigma=\tau_1\cdots\tau_\ell$, 且 $\ell$ 可能的最小值为 $\ell(\sigma)$.

&emsp;&emsp;*→ Proof.* 一方面, 一个 $\tau$ 变换至多让 $\ell(\sigma)$ 减少 $1$, 所以 $\ell\ge\ell(\sigma)$; 另一方面, 当 $\ell(\sigma)\neq0$, 则总存在 $\sigma_i>\sigma_{i+1}$, 这时 $\tau=(i\quad i+1)$ 能够让 $\ell(\sigma)$ 减少 $1$, 所以 $\ell_{\min}\le\ell(\sigma)$. 最终就有 $\ell_\min=\ell(\sigma)$.

&emsp;&emsp;这样长度为 $\ell(\sigma)$ 的单对换分解称为 $\sigma$ 的既约表法.

> **定义-命题 5.1.4**
>
> &emsp;&emsp;存在唯一的映射 $\sgn:S_n\to\{\pm1\}$, 使得
>
> - $\sgn(\sigma\xi)=\sgn(\sigma)\sgn(\xi)$.
> - $\sgn(\tau)=-1$, $\tau$ 是单对换.

&emsp;&emsp;*→ Proof.* 唯一性: 以上两条规则直接给出 $\sgn(\sigma)=(-1)^{\ell(\sigma)}$, 所以它是唯一确定的.

&emsp;&emsp;存在性: 定义函数 $\Delta:\Z^n\to\Z$, $(x_n)\mapsto\prod_{i<j}(x_i-x_j)$. 此外, 记置换对序列的作用:
$$
\sigma\bs x:=(x_{\sigma^{-1}_1}\ops,x_{\sigma^{-1}_n}).
$$
注意到
$$
\Delta(\sigma\bs x)=(-1)^{\ell(\sigma)}\Delta(\bs x).
$$
也可以据此定义
$$
\sgn(\sigma)=\Delta(\sigma\bs x)/\Delta(\bs x)\quad(\text{for arbitrary }\Delta(\bs x)\neq 0).
$$
&emsp;&emsp;*(不懂讲义这一段在纠结什么, 这些性质似乎是直观且明显的?)*

> **定义 5.1.5**
>
> &emsp;&emsp;设 $\sigma\in S_n$, 若 $\ell(\sigma)$ 为偶数, 则称 $\sigma$ 为偶置换, 否则称 $\sigma$ 为奇置换.

## $\S5.3$ 一类交错形式的刻画

> **定义 5.3.1**
>
> &emsp;&emsp;对映射 $D:V^n\to F$, 若其是多重线性的, 且任何 $D(\cdots,v\ops,v,\cdots)=0$, 则称其是一个交错形式. 所有这样的交错形式构成集合 $\mathcal D_{V,n}$.

&emsp;&emsp;例如取 $V=\R^n$, 所谓的 "有向体积" 就是一个 $(\R^n)^n\to\R$ 的交错形式.

&emsp;&emsp;设 $\dim V=n$, $D\in\mathcal D_{V,m}$, 那么当 $1\le i\neq j\le m$ 时, 容易看出
$$
D(\cdots,v_i\ops,v_j,\cdots)=D(\cdots,v_i+cv_j\ops,v_j,\cdots).
$$
进一步, 若 $\{v_m\}$ 线性相关, 则必有 $D((v_m))=0$, 这也是直接推论; 当 $m>n$ 时, 就有 $\mathcal D_{V,n}=\{0\}$. 方便起见, 设 $n=\dim V<\oo$, 定义
$$
\mathcal D_V=\begin{cases}
\mathcal D_{V,n},&n\ge 1;\\
F,&n=0.
\end{cases}
$$
&emsp;&emsp;还能看出,
$$
D(\cdots,v\ops,w,\cdots)=-D(\cdots,w\ops,v,\cdots),
$$
这时因为二者之和 $D(\cdots,v+w\ops,w+v,\cdots)=0$. 进一步就有
$$
D(\sigma(v_n))=\sgn(\sigma)D((v_n)).
$$
其中 $(v_n)\sub V^n$ 表示序列; 考虑 $\sigma$ 的既约分解即可.

&emsp;&emsp;任取 $V$ 的有序基 $\ul e=(e_1,\cdots,e_n)$, 那么 $v_i=\sum_{j=1}^na_{ij}e_j$, 这时
$$
\begin{aligned}
	D((v_n)) &= \sum_{\{j_n\}\in[1:n]^n}\prod_{i=1}^na_{i,j_i}D((e_{j_n}))\\
	&= \sum_{\sigma\in S_n}\prod_{i=1}^na_{i,\sigma_i}D((e_{\sigma_n}))\\
	&= \sum_{\sigma\in S_n}\sgn(\sigma)\prod_{i=1}^na_{i,\sigma_i}\cdot D((e_n)).
\end{aligned}
$$
因此有一个线性的嵌入: $\mathcal D_V\mmap F,~D\mapsto D((e_n))$. 那么 $\dim\mathcal D_V\le 1$.

> **定理 5.3.2**
>
> &emsp;&emsp;对有限维的 $F$-向量空间 $V$, 设 $n=\dim V$, 那么 $\dim\mathcal D_V=1$. 且 $n\ge 1$ 时, 若选定 $V$ 的有序基 $\ul e$, 那么唯一存在 $D_{\ul e}\in\mathcal D_V$, 使得 $D_{\ul e}((e_n))=1$.

&emsp;&emsp;*→ Proof.* 若 $n\ge 1$, 固定 $\ul e$, 根据上述讨论, 给出 $D((v_n))=\sum_{\sigma\in S_n}\sgn(\sigma)\prod_{i=1}^na_{i,\sigma_i}$, 利用 $\sgn((i\quad j))=-1$ 且 $(i\quad j)$ 可以将 $S_n$ 两两配对的性质, 不难说明 $D\in\mathcal D_V$, 同时明显 $D((e_n))=1$.

## $\S5.4$ 行列式的定义和基本性质

&emsp;&emsp;对 $F$-向量空间 $V$, $W$ 和线性映射 $T:V\to W$, 定义
$$
T^*:\mathcal D_{W,m}\to\mathcal D_{V,m},\quad D\mapsto (T^*D:(v_m)\mapsto D((Tv_m))).
$$
现令 $V=W$, $n=\dim V<\oo$, 则 $T\in\End(V)$, $T^*\in\End(\mathcal D_V)\simeq F$.

> **定义 5.4.1**
>
> &emsp;&emsp;定义 $\det T$ 为 $T^*\mapsto F$ 所对应的纯量, 即唯一地满足 $T^*=\det T\cdot\id_{\mathcal D_V}$.

&emsp;&emsp;也就是说, 定义满足
$$
\A D\in\mathcal D_V,~\A(v_n),~D(T(v_n))=\det T\cdot D((v_n)).
$$
当 $V=\{0\}$ 时给出 $\det T=1$.

> **定理 5.4.2**
>
> &emsp;&emsp;(i) $\det\id_V=1$;
>
> &emsp;&emsp;(ii) $\det(ST)=\det(S)\det(T)$;
>
> &emsp;&emsp;(iii) $T$ 可逆时 $\det T\in F$ 可逆, 且 $\det T^{-1}=(\det T)^{-1}$.

&emsp;&emsp;证明不难.

&emsp;&emsp;例如, $V=\R^n$ 中的有向体积可以用行列式刻画.

> **命题 5.4.3**
>
> &emsp;&emsp;若 $S:V\overset\sim\to W$, $T\in\End(V)$, 记 $T'=STS^{-1}\in\End(W)$. 那么 $\det T=\det T'$.

&emsp;&emsp;*→ Proof.* 考虑 $S^*:\mathcal D_W\to\mathcal D_V,~D'\mapsto D$, 对 $(w_n)\sub W$, 令 $v_i=S^{-1}w_i$, 那么
$$
D'((STS^{-1}w_n))=D((TS^{-1}w_n))=D((Tv_n))=\det T\cdot D((v_n))=\det T\cdot D'((w_n)).
$$

> **命题 5.4.4**
>
> &emsp;&emsp;选定 $V$ 上的基 $\ul e$, 这时
> $$
> \det T=D_{\ul e}((Te_n)).
> $$

&emsp;&emsp;而 $\ul e$ 取定时, 有 $\End(F^n)=\M_{n\x n}(F)$, 进而可以给出矩阵的行列式.

> **定义-命题 5.4.5**
>
> &emsp;&emsp;对 $A\in\M_{n\x n}(F)$, 作为一个 $F^n\to F^n$, 定义
> $$
> \begin{aligned}
>  \l|\begin{array}{ccc}
>      a_{11} & \cdots & a_{1n}\\
>      \vdots & \ddots & \vdots\\
>      a_{n1} & \cdots & a_{nn}
>  \end{array}\r|
>  & :=\det(A:F^n\to F^n)\\
>  &= D_{\ul e}((Ae_n))\\
>  &= \sum_{\sigma\in S_n}\sgn(\sigma)\prod_{i=1}^na_{\sigma_i,i}\\
> 	&= \sum_{\sigma\in S_n}\sgn(\sigma)\prod_{i=1}^na_{i,\sigma_i}.
> \end{aligned}
> $$

> **定义 5.4.6**
>
> &emsp;&emsp;对 $A\in\M_{n\x n}(F)$ 和 $1\le i,j\le n$, 定义其余子式 $\mathcal M_{ij}\in\M_{(n-1)\x(n-1)}(F)$ 为在 $A$ 删除第 $i$ 行第 $j$ 列的结果; 定义 $M_{ij}:=\det\mathcal M_{ij}$.

> **定理 5.4.7**
>
> &emsp;&emsp;$n\x n$ 矩阵的行列式具有以下性质:
>
> - $\det\bs1=1$.
> - $\det A=\det A^\T$.
> - 给定行号 $i$ 或列号 $j$, $\det A=\sum_{k=1}^n(-1)^{i+k}a_{ik}M_{ik}=\sum_{k=1}^n(-1)^{k+j}a_{kj}M_{kj}$.

&emsp;&emsp;*→ Proof.* 只证明按列展开的结论. 只需要研究 $\det$ 展开式中固定 $\sigma_k=j$ 时的行为, 断言 $\sgn(\sigma)=\sgn(\sigma[k])\cdot(-1)^{k+j}$, 其中 $\sigma[k]$ 表示剔除 $\sigma_k$ 后重编号得的 $n-1$ 阶排列. $(-1)^{k+j}$ 源自: 假定一切 $(\cdot,k)$ 都是逆序对, 再研究 $1,2,\dots,j-1$ 在排列中的位置, 发现它们不论在 $k$ 之前还是之后都贡献 $(-1)$, 因此剔除 $\sigma_k$ 附带有 $(-1)^{k-1+j-1}=(-1)^{k+j}$. 讲义上的东西是什么呢...

&emsp;&emsp;据此, 有推论:

> **推论 5.4.8**
> $$
> \sum_{k=1}^n(-1)^{k+j}a_{ki}M_{kj}=0.
> $$

&emsp;&emsp;*→ Proof.* 这等价于求第 $j$ 列 copy 自第 $i$ 列的矩阵的行列式.

## $\S5.5$ 一些特殊行列式

&emsp;&emsp;对置换 $\sigma\in S_n$, 可以给出置换矩阵 $A=([i=\sigma_j])_{ij}$, 记之为 $P_\sigma$. 它对基向量的作用效果为 $P_\sigma:e_j\mapsto e_{\sigma_j}$. 注意有 $P_\sigma^\T=P_{\sigma^{-1}}$, $P_\sigma P_\tau=P_{\sigma\tau}$, 以上能给出 $P_\sigma^\T=P_\sigma^{-1}$, 这些结论比较平凡.

> **命题 5.5.1**
>
> &emsp;&emsp;设 $\sigma\in S_n$, 则 $\det P_\sigma=\sgn(\sigma)\cdot 1_F$.

&emsp;&emsp;*→ Proof.* 按照 <u>定义-命题 5.4.5</u>, $\det P_\sigma=D_e((P_\sigma e_i))=D_e((e_{\sigma_i}))=\sgn(\sigma^{-1})D_e((e_i))=\sgn(\sigma)$. 当然也可以用 $\det$ 的其他展开方式证明.

> **命题 5.5.2**
>
> &emsp;&emsp;设 $A$ 是上三角或下三角矩阵, 则 $\det A=\prod a_{ii}$.

&emsp;&emsp;*→ Proof.* 转置不改变 $\det$, 只考虑上三角的情况. 按第一列展开有 $\det A=a_{11}M_{11}$, $\mathcal M_{11}$ 也是上三角的, 如此可以归纳. 或者, 说明仅有 $\sigma=\id$ 时才会对 $\det$ 有贡献.

&emsp;&emsp;根据上述两个命题, 我们可以给出 Gauss-Jordan 消元法中三种初等行变换对应矩阵的行列式. $\det A(i,k,c)=1$, $\det B(i,k)=-1$, $\det C(i,c)=c$. 因此, 可以通过 G-J 消元法在 $\mathcal O(n^3)$ 的时间内计算行列式.

> **命题 5.5.3**
>
> &emsp;&emsp;设 $\{x_n\}\sub F$, 则 $\det(x_j^i)_{ij}=\prod_{1\le j<i\le n}(x_i-x_j)$.

&emsp;&emsp;*→ Proof.* $n=1$ 显然, 对后续的 $n$ 归纳. 依次用 $k=n-1\ops,1$ 行消去第 $k+1$ 行的第一列, 得到
$$
\det X:=\l|\begin{array}{cccc}
1 & 1 & \cdots & 1\\
x_1 & x_2 & \cdots & x_n\\
\vdots & \vdots & \ddots & \vdots\\
x_1^{n-1} & x_2^{n-1} & \cdots & x_n^{n-1}
\end{array}\r|=
\l|\begin{array}{cccc}
1 & 1 & \cdots & 1\\
  & x_2-x_1 & \cdots & x_n-x_1\\
  & \vdots & \ddots & \vdots\\
  & x_2^{n-1}-x_1x_2^{n-2} & \cdots & x_n^{n-1}-x_1x_n^{n-2}
\end{array}\r|.
$$
按第一列展开,
$$
\det X=\l|\begin{array}{ccc}
x_2-x_1 & \cdots & x_n-x_1\\
\vdots & \ddots & \vdots\\
x_2^{n-1}-x_1x_2^{n-2} & \cdots & x_n^{n-1}-x_1x_n^{n-2}
\end{array}\r|.
$$
在此时的第 $k$ 列提出公因式 $x_{k+1}-x_1$, 得到
$$
\det X=\prod_{k=1}^{n-1}(x_{k+1}-x_1)\cdot\l|\begin{array}{ccc}
1 & \cdots & 1\\
\vdots & \ddots & \vdots\\
x_2^{n-2} & \cdots & x_n^{n-2}
\end{array}\r|.
$$
归纳可知原命题成立.

## $\S5.6$ 分块行列式

> **命题 5.6.1**
>
> &emsp;&emsp;设 $V$ 是配有直和分解 $V=V_1\ops\oplus V_n$ 的有限维线性空间, $T\in\End(V)$ 在此分解下有分块 $T=(T_{ij})$. 则若 $T$ 在此分解下是上 (下) 三角矩阵, 则
> $$
> \det T=\prod_{i=1}^n\det T_{ii}.
> $$

&emsp;&emsp;*→ Proof.* 只需要说明 $A=\pary{c|c}{A_{11} & A_{12} \\ \hline & A_{22}}$ 的情况. 设 $A_{11}\in\M_{n\x n}(F)$, $A_{22}\in\M_{m\x m}(F)$, 按定义有
$$
\det A=\sum_{\sigma\in S_{n+m}}\sgn(\sigma)\prod_{k=1}^{n+m}a_{k,\sigma_k}.
$$
为了使某个 $\sigma$ 对和式有贡献, 要求 $i>n\Ra \sigma_i>n$, 而 $\#\{i:i>n\}=\#\{\sigma_i:\sigma_i>n\}$, 因此 $i>n\Eq \sigma_i>n$. 一方面, $A_{12}$ 不可能被 $(k,\sigma_k)$ 遍历到, 另一方面, $i\le n$ 和 $i>n$ 的贡献相独立, 且无交错的逆序对. 所以
$$
\det A=\sum_{\sigma\in S_n}\sgn(\sigma)\prod_{k=1}^na_{k,\sigma_k}\cdot\sum_{\tau\in S_m}\sgn(\tau)\prod_{k=1}^m a_{k+n,\sigma_k+n}=\det A_{11}\cdot\det A_{22}.
$$
&emsp;&emsp;例如, 有以下命题:

> **命题 5.6.2** 
>
> &emsp;&emsp;对 $A\in\M_{m\x n}(F)$ 和 $B\in\M_{n\x m}(F)$, 有
>
> $$
> \det\pary{c|c}{\bs 1 & B\\\hline A&\bs 1}=\det(\bs 1-AB).
> $$

&emsp;&emsp;*→ Proof.* 这是因为
$$
\pblk{\bs 1}{}{-A}{\bs 1}\pblk{\bs 1}{B}{A}{\bs 1}=\pblk{\bs 1}{B}{}{\bs 1-AB}.
$$

结合 <u>命题 5.6.1</u> 即证. 我们实际上在做矩阵消元.

&emsp;&emsp;由此进一步地,

> **推论 5.6.3**
>
> &emsp;&emsp;对 $A\in\M_{m\x n}(F)$ 和 $B\in\M_{n\x m}(F)$, 有
> $$
> \det(\bs 1-AB)=\det(\bs 1-BA).
> $$
> (我们总是略去 $\bs 1$ 的规格, 毕竟语境充分.)

&emsp;&emsp;这相当于在 <u>命题 5.6.2</u> 进行了一些基变换, 但这并不改变行列式.

## $\S5.7$ Cramer 法则

> **命题 5.7.1**
>
> &emsp;&emsp;设 $V$ 为有限维 $F$-向量空间, 则 $T\in\End(V)$ 可逆当且仅当 $\det T\in F^\x$.

&emsp;*→ Proof.* 必要性显然, 只证明充分性, 也即说明 $T$ 不可逆时必有 $\det T=0$. 由于 $T$ 不可逆, 有 $\rank T<\dim V=:n$, 任取 $n$ 个向量 $v_{1..n}$, 则 $\{Tv_i\}$ 线性相关, $D((Tv_i))=0$, 进一步就有 $\det T=0$.

> **定义 5.7.2**
>
> &emsp;&emsp;对 $A=(a_{ij})\in\M_{n\x n}(F)$, 定义其经典伴随矩阵为
> $$
> A^\vee=(A_{ji})_{i,j}\quad\text{where } A_{ij}:=(-1)^{i+j}M_{ij}.
> $$

> **定理 5.7.3**
>
> &emsp;&emsp;对任意 $A\in\M_{n\x n}(F)$, 都有
> $$
> AA^\vee=\det A\cdot\bs 1=A^\vee A.
> $$

&emsp;&emsp;*→ Proof.* 以左侧为例. 直接考察
$$
\begin{aligned}
	(AA^\vee)_{ij} &= \sum_{k=1}^n a_{ik}A_{jk}\\
	&= \sum_{k=1}^n (-1)^{j+k}a_{ik}M_{jk}.
\end{aligned}
$$
当 $i=j$ 时, 这给出一个按行展开的行列式:
$$
(AA^\vee)_{ii}=\sum_{k=1}^n(-1)^{i+k}a_{ik}M_{ik}=\det A.
$$
当 $i\neq j$ 时, <u>推论 5.4.8</u> 告诉我们 $(AA^\vee)_{ij}=0$.

> **推论 5.7.4**
>
> &emsp;&emsp;若矩阵 $A$ 可逆, 则
> $$
> A^{-1}=(\det A)^{-1}A^\vee.
> $$

&emsp;&emsp;明显成立. 不过这个论断本身看上去挺厉害的.

> **推论 5.7.5 (Cramer)**
>
> &emsp;&emsp;若 $n$ 元线性方程组 $A\bs x=\bs b$ 中的 $A$ 可逆, 那么
> $$
> x_i=\frac{\det\pary{c|c|c|c|c|c|c}{A_{\cdot 1}&\cdots&A_{\cdot(i-1)}&\bs b&A_{\cdot(i+1)}&\cdots& A_{\cdot n}}}{\det A}.
> $$

&emsp;&emsp;*→ Proof.* 因为 $\bs x=A^{-1}\bs b$ 而 $A^{-1}=(\det A)^{-1}A^\vee$, 所以
$$
\begin{aligned}
	\det A\cdot\bs x_i &= (A^\vee b)_i\\
	&= \sum_{k=1}^n A_{ki}b_k\\
	&= \sum_{k=1}^n (-1)^{i+k}M_{ki}b_k.
\end{aligned}
$$
这就是用 $\bs b$ 替代 $A_{\cdot i}$ 后 $A'$ 的行列式展开.

## $\S5.8$ 特征多项式和 Cayley-Hamilton 定理

> **命题 5.8.1**
>
> &emsp;&emsp;若 $V$ 是 $n\in\Z$ 维 $F$-向量空间, $T\in\End(V)$, 那么
> $$
> \E f\in F[X]\setminus\{0\},~f(T)=0_V.
> $$

&emsp;&emsp;*→ Proof.* $\dim\End(V)=n^2$, 因此 $\{\id,T,\cdots,T^{n^2}\}$ 必然线性相关, 这样就能给出一个 $f$.

> **命题 5.8.2**
>
> &emsp;&emsp;$T\in\End(V)$ 可逆等价于存在上述一个 $f$ 使得 $f(0)\neq0$; 且此时存在 $g\in F[X]\setminus\{0\}$ 使得 $T^{-1}=g(T)$.

&emsp;&emsp;*→ Proof.* 前半句左推右显然, 因为可以不断除以 $T$ 降次; 右推左, $f(T)=c_0\id+TP=0$, 这已然给出 $T\cdot\frac{P}{c_0}=\id$, 这也顺便给出 $g(T)$ 的形式.

> **定义 5.8.3 (特征多项式)**
>
> &emsp;&emsp;设 $A\in\M_{n\x n}(F)$, 我们认为 $F\mmap F(X)$, 从而构造矩阵 $X\bs1-A\in\M_{n\x n}(F(X))$, 定义
> $$
> \opn{Char}_A:=\det(X\bs 1-A).
> $$

&emsp;&emsp;这给出
$$
\begin{aligned}
	\opn{Char}_A=\sum_{\sigma\in S_n}\sgn(\sigma)\prod_{i=1}^n([i=\sigma_i]X-a_{i,\sigma_i}).
\end{aligned}
$$
故 $\deg\opn{Char}_A=n$ 且特征多项式是首一多项式. 此外 $[X^0]\opn{Char}_A=\opn{Char}_A(0)=(-1)^n\det A$.

> **命题 5.8.4**
>
> &emsp;&emsp;设 $P\in\M_{n\x n}(F)$ 可逆, 则 $\opn{Char}_{P^{-1}AP}=\opn{Char}_A$.

&emsp;&emsp;*→ Proof.* 在 $\M_{n\x n}(F(X))$ 中, $X\bs 1-P^{-1}AP=P^{-1}(X\bs 1-A)P$, 因而两侧行列式相等.

&emsp;&emsp;因此, 特征多项式不依赖于基的选取.

> **命题 5.8.5**
>
> &emsp;&emsp;(a) $\opn{Char}_A=\opn{Char}_{A^\T}$.
>
> &emsp;&emsp;(b) 对分块上三角矩阵 $A=(A_{ij})$, 有 $\opn{Char}_A=\prod_{i=1}^n\opn{Char}_{A_{ii}}$.
>
> &emsp;&emsp;(c) 对任意 $A\in\M_{m\x n}(F)$ 和 $B\in\M_{n\x m}(F)$, 都有 $X^n\opn{Char}_{AB}=X^m\opn{Char}_{BA}$.

&emsp;&emsp;*→ Proof.* (a) $\det(X\bs1-A^\T)=\det((X\bs 1-A)^\T)=\det(X\bs 1-A)$.

&emsp;&emsp;(b) 结合分块矩阵的加减法和行列式求法即可.

&emsp;&emsp;(c) 在 $F(X)$ 中考察 ($\overset{*}=$ 来自 <u>推论 5.6.3</u>):
$$
\begin{aligned}
	X^{-m}\opn{Char}_{AB}
	&=X^{-m}\det(X-AB)\\
	&=\det(\bs 1-X^{-1}AB)\\
	&\overset{*}=\det(\bs 1-X^{-1}BA)\\
	&=X^{-n}\det(X-BA).
\end{aligned}
$$

> **定理 5.8.6 (Cayley-Hamilton)**
>
> &emsp;&emsp;对 $A\in\M_{n\x n}(F)$, 有 $\opn{Char}_A(A)=\bs 0_{n\x n}$. 也可以  说, 对 $F$-向量空间 $V$ 和 $T\in\End(V)$, 有 $\opn{Char}_T(T)=\bs 0_V$.

> **定理 5.8.7**
>
> &emsp;&emsp;设 $\opn{Char}_A=X^n+c_{n-1}X^{n-1}+\cdots+c_0$, 那么 $(-1)^{n-1}A^\vee=c_1\bs 1\ops+c_{n-1}A^{n-2}+A^{n-1}$.

&emsp;&emsp;这能给出 $(A^\T)^\vee=(A^\vee)^\T$

&emsp;&emsp;*→ Proof @ 5.8.6* 根据 <u>定理 5.8.7</u>, 有
$$
\begin{aligned}
	\opn{Char}_A(A) &= A^n+c_{n-1}A^{n-1}\ops+c_0\bs 1\\
	&= A(A^{n-1}+c_{n-1}A^{n-2}\ops+c_1\bs1)+(-1)^n\det A\cdot\bs 1\\
	&= (-1)^n(\det A\cdot\bs 1-AA^\vee)\\
	&= 0.
\end{aligned}
$$
&emsp;&emsp;*→ Proof @ 5.8.7* $n=1$ 时, 右侧为 $\bs1$, 左侧根据定义有 $A^\vee=\bs 1$. 当 $n\ge 2$ 时, 在 $F(X)\supset F[X]$ 上, $(X\bs 1-A)^\vee$ 的项的度数不超过 $n-1$, 则其可以写为
$$
(X\bs 1-A)^\vee=\sum_{k=0}^{n-1}X^kD_k,\quad (D_k\in\M_{n\x n}(F))
$$
注意有
$$
(c_0\ops+c_{n-1}X^{n-1}+X^n)\bs 1=(X\bs 1-A)(X\bs1-A)^\vee=(X\bs 1-A)\sum_{k=0}^{n-1}X^kD_k.
$$
对比左右系数, 得到
$$
D_{n-1}=\bs 1,\\
-AD_{n-1}+D_{n-2}=c_{n-1}\bs 1,\\
\vdots\\
-AD_1+D_0=c_1\bs 1,\\
-AD_0=c_0\bs 1.
$$
依次左乘 $A^{n-1}\ops,A^0$, 左右相加, 得到
$$
D_0=c_1\bs1\ops+c_{n-1}A^{n-2}+A^{n-1}.
$$
而按照定义有 $(-A)^\vee=(-1)^{n-1}A^\vee$.

## $\S5.9$ 矩阵的迹

> **引理 5.9.1**
>
> &emsp;&emsp;矩阵 $A$ 的特征多项式 $\opn{Char}_A=X^n+c_{n-1}X^{-1}\ops+c_0$, 则 $\tr A:=\sum a_{ii}=-c_{n-1}$.

&emsp;&emsp;*→ Proof.* 由于
$$
\opn{Char}_A=\sum_{\sigma}\sgn(\sigma)\prod_{k=1}^n\alpha_{k,\sigma_k},\quad \alpha_{ij}=[i=j]X-a_{ij},
$$
要求 $\deg \prod \alpha_{k,\sigma_k}\ge n-1$, 因此至少有 $n-1$ 个 $\sigma_k=k$, 也就只有 $\sigma=\id$. 所以 $c_{n-1}=[X^{n-1}]\prod\alpha_{kk}$, 容易看出 $\tr A=-c_{n-1}$.

> **性质 5.9.2**
>
> &emsp;&emsp;(a) $\tr:\M_{n\x n}(F)\to F$ 是线性映射.
>
> &emsp;&emsp;(b) $\tr(AB)=\tr(BA)$, 其中 $A\in\M_{n\x m}(F)$, $B\in\M_{m\x n}(F)$.
>
> &emsp;&emsp;(c) $\tr(A_1\cdots A_n)$ 具有轮换不变性.

&emsp;&emsp;我们在 <u>作业七 6</u> 中证明过这些命题.



## $\S5.10$ 不变子空间

> **定义 5.10.1**
>
> &emsp;&emsp;对线性映射 $T\in\End(V)$, 若 $U\sub V$ 满足 $T(U)\sub U$ (i.e. $T|_U\in\End(U)$), 则 $U$ 称为 $V$ 的 $T$-不变子空间.

&emsp;&emsp;若为 $U$ 和 $V/U$ 分别取基, 为 $V/U$ 的基在 $V$ 中任意选原像. 回忆 $\ol T:V/U\to V/U$ 是由 $T$ 诱导出的线性映射, 那么就有
$$
T=\pary{c|c}{
	T|_U & *\\
	\hline&\ol T
}.
$$
这进一步给出, $\opn{Char}_{T|_U}\cdot\opn{Char}_{\ol T}=\opn{Char}_T$, $\det(T|_U)\det\ol T=\det T$, $\tr(T|_U)+\tr \ol T=\tr T$.

## $\S5.12$ 交换环上的行列式

> **定义 5.12.1**
>
> &emsp;&emsp;设 $R$ 为交换环, $A\in\M_{n\x n}(R)$, 定义
> $$
> \det A=\sum_\sigma\sgn(\sigma)\prod_k a_{k,\sigma_k}.
> $$

&emsp;&emsp;我们可以说明它对 $F$ 上行列式性质的良好保持. 例如, 仍有 $AA^\vee=\det A\cdot\bs 1=A^\vee A$ 以及 $\opn{Char}_A(A)=\bs 0$.

# 第六章 重访环和多项式

## $\S6.1$ 理想和商环

> **定义 6.1.1**
>
> &emsp;&emsp;对非零环 $R$ 的任意非空子集 $S$ 和 $r\in R$, 定义 $Sr:=\{sr:s\in S\}$, 类似有 $rS$. 设 $I$ 为 $R$ 的非空子集, 当以下条件成立时, $I$ 为 $R$ 的理想:
>
> - 加法封闭性. $x,y\in I\Ra x+y\in I$.
> - 乘法双边封闭性. $r\in R\Ra rI\sub I\land Ir\sub I$.

&emsp;&emsp;在交换环中, 对 $a\in R$, $(a):=Ra$ 是理想, 称为主理想. 例如, $\Z$ 的所有理想都是主理想.

> **命题 6.1.2**
>
> &emsp;&emsp;对 $R$ 的理想 $I$, $I=R\Eq 1\in I$.

&emsp;&emsp;*→ Proof.* 左推右显然. 右推左, $1\in I\Ra r=1\cdot r\in I$.

&emsp;&emsp;在交换环 $R$ 上, 我们记 $x\mid y\Eq(\E d\in R,~y=dx)$, 以及 $x\sim y\Eq(\E u\in R^\x,~y=ux)$ (这的确是等价关系).

> **定义 6.1.3**
>
> &emsp;&emsp;定义 $x\sim_I y\Eq x-y\in I$, 这是一个等价关系. $x$ 的等价类 $x+I$ 称为 $I$ 的一个陪集.

&emsp;&emsp;这能进一步给出商空间 $R/\sim_I=\{x+I:x\in R\}$. 为它配备环运算:

- $(x+I)+(y+I)=x+y+I$;
- $(x+I)(y+I)=xy+I$.

良定性不难验证. 配以 $0=0_R+I$ 和 $1=1_R+I$, 可以验证这是一个环, 记为商环 $R/I$. 商映射 $q:R\to R/I$ 是一个环同态, 称为商同态, 同时 $\ker q=I$.

> **性质 6.1.4**
>
> &emsp;&emsp;(a) 若 $R$ 交换, 则 $R/I$ 交换.
>
> &emsp;&emsp;(b) $R/I=\{0\}\Eq I=R$.
>
> &emsp;&emsp;(c) 对任意环同态 $f:R\to R'$, 若 $I\in\ker f$,   存在唯一环同态 $\ol f:R/I\to R'$, 使得 $\ol fq=f$.
>
> &emsp;&emsp;(d) 在 (c) 中若 $I=\ker f$ 而 $R'=\im f$, 则 $\ol f$ 是环同构.

&emsp;&emsp;与向量空间上的讨论类似.

> **推论 6.1.5**
>
> &emsp;&emsp;设环同态 $f:R_1\to R_2$, 理想 $I_1\sub R_1$, $I_2\sub R_2$, 且 $f(I_1)\sub I_2$, 则存在唯一环同态 $\ol f$, 使得 $q_2f=\ol fq_1$.

## $\S6.2$ 多项式的唯一分解性质

> **引理 6.2.1**
>
> &emsp;&emsp;设 $R$ 为交换环, $x,y\in R$, 那么
>
> &emsp;&emsp;(i) $x\mid y\Eq(x)\supset (y)$.
>
> &emsp;&emsp;(ii) 若 $R$ 是整环, 那么 $x\sim y\Eq(x\mid y\land y\mid x)\Eq(x)=(y)$.

&emsp;&emsp;*→ Proof.* (i) $x\mid y\Eq(\E d\in R,~y=dx)\Ra (y)=yR=xdR\sub xR$. 反向类似.

&emsp;&emsp;(ii) $x\sim y\Ra y=ux\Ra x\mid y$, 同时 $x\sim y\Eq y\sim x\Ra y\mid x$. 根据 (i), 后两个命题等价. $x=dy\land y=d'x\Ra (1-dd')x=0$. 若 $x=0$, 利用最右命题知 $y=0$. 否则 $dd'=1$, 二者皆可逆, $x\sim y$.

> **定义-命题 6.2.2**
>
> &emsp;&emsp;对环同态 $f:R\to R'$, $\ker f:=f^{-1}(0)$ 是理想.

&emsp;&emsp;按定义验证即可.

> **定义 6.2.3**
>
> &emsp;&emsp;在整环 $R$ 上, 若 $p\in R\setminus(\{0\}\cup R^\x)$, 且
>
> - $p\mid ab\Ra p\mid a\lor p\mid b$, 则称 $p$ 是素的.
> - $a\mid p\Ra a\sim1\lor a\sim p$, 则称 $p$ 是不可约的.

> **引理 6.2.4**
>
> &emsp;&emsp;$p$ 是素的则 $p$ 是不可约的.

&emsp;&emsp;*→ Proof.* 若 $a\mid p$, 则有 $p=ab\Ra p\mid ab$. 则如果 $p\mid a$, 则有 $a\sim p$. 若 $p\mid b$, 设 $up=b$, 代回等式就有 $p=aup$, 整环性质给出 $au=1$, j即 $a\in R^\x$, 那么 $a\sim 1$.

> **定义 6.2.5**
>
> &emsp;&emsp;称整环 $R$ 是一个唯一分解环,当且仅当
> $$
> \A r\in R\setminus\{0\},~\E n\ge 0,~\E\text{ irreducible }p_1\ops,p_n\in R,\\
> r\sim p_1\cdots p_n\land\{p_n\}\text{ is unique up to permutations}.
> $$

&emsp;&emsp;在唯一分解环中, $\gcd$, $\lcm$, 互素, $\opn{Frac}(R)$ 中的既约分数等都在 up to $\sim$ 意义下唯一给出.

&emsp;&emsp;*试验证 UFD 中的不可约推出素性.*

&emsp;&emsp;口胡: 分别说明 (i) $ab$ 的唯一分解含有不可约的 $p$, 当且仅当其中至少一者的唯一分解含 $p$; (ii) 不可约的 $p\mid a$ 当且仅当 $a$ 的唯一分解含 $p$. (貌似前者可以推出后者, 但这不重要, 毕竟是口胡.)

## $\S6.3$ 主理想环的唯一分解性

> **定义 6.3.1**
>
> &emsp;&emsp;称 $R$ 是一个主理想环, 当且仅当其所有理想都是主理想.

&emsp;&emsp;例如 $\Z$, $F[X]$ 都是主理想环.

> **引理 6.3.2**
>
> &emsp;&emsp;对主理想环 $R$ 以及 $a_1\ops,a_n\in R$, 若这列 $a$ 不存在${}\nsim 1$ 的公约数, 那么
> $$
> \lang a_1,\cdots,a_n\rang:=\l\{\sum_{i=1}^nr_ia_i:r_i\in R\r\}=R.
> $$

&emsp;&emsp;*→ Proof.* $\lang a_1,\cdots,a_n\rang$ 一定是理想, 则一定是某个 $(h)$, 此时 $h$ 是它们的公约数, 所以只能 $h=1$.

> **引理 6.3.3**
>
> &emsp;&emsp;对主理想环 $R$, 所有不可约元都是素元.

&emsp;&emsp;*→ Proof.* 对不可约的 $p$, 若 $p\mid ab$, 不妨 $p\nmid a$, 那么 $p,a$ 无${}\nsim1$ 的公因子. 因此存在 $x,y\in R$, 使得 $px+ay=1$, 则 $pxb+aby=b\in(p)$, 即 $p\mid b$.

> **引理 6.3.4**
>
> &emsp;&emsp;设 $R$ 为主理想环, 有一列理想 $I_1\sub I_2\sub\cdots$, 则对充分大的 $n$, 必有 $I_n=I_{n+1}=\cdots$.

&emsp;&emsp;*→ Proof.* 令 $I=\bigcup I_k$, 可以验证 $I$ 仍然是理想, 所以有 $I=(h)$, 则必然存在 $h\in I_k$, 这样 $I\sub I_k\sub I_{k+1}\sub\cdots\sub I\Ra I_k=I_{k+1}=\cdots=I$.

> **定理 6.3.5**
>
> &emsp;&emsp;一切主理想环都是唯一分解环.

&emsp;&emsp;*→ Proof.* 对 $a\in R\setminus\{0\}$, 如果 $a$ 没有不可约分解, 那么必然有 $a\notin R^\x$ 且 $a$ 本身是可约的. 设 $a=a'b'$ 且 $a\nsim a'\land a\nsim b'$, 则 $a',b'$ 至少一者没有不可约分解, 不妨取为 $a'$, 由此得 $a'',\cdots$, 给出 $(a)\subsetneq (a')\subseteq(a'')\subsetneq\cdots$, 这与上一引理矛盾.

&emsp;&emsp;唯一性套用 $\Z$ 上的证明即可.

&emsp;&emsp;可以证明, $R$ 是唯一分解环当且仅当 \[不可约元为素元\] 且 \[不存在无穷且真包含的理想列\].

> **命题 6.3.6**
>
> &emsp;&emsp;设 $R$ 为主理想环, $t\in R\setminus\{0\}$ 且 $t\notin R^\x$, 则以下等价:
>
> &emsp;&emsp;(i) $R/(t)$ 是域.
>
> &emsp;&emsp;(ii) $R/(t)$ 是整环.
>
> &emsp;&emsp;(iii) $t$ 是素元.

&emsp;&emsp;*→ Proof.* $\u{(i)}\Ra\u{(ii)}$ 平凡.

&emsp;&emsp;$\u{(ii)}\Ra\u{(iii)}$ 设 $t\mid ab$, 即 $ab\in(t)$, 在 $R/(t)$ 中, $(a+(t))(b+(t))=ab+(t)=0$, 所以根据整环性质有 $a+(t)=0\lor b+(t)=0$. 则 $t\mid a\lor t\mid b$, 可知 $t$ 是素的.

&emsp;&emsp;$\u{(iii)}\Ra\u{(i)}$ 对 $R/(t)$ 中的非零元 $x+(t)$, 有 $t\nmid x$, 因此 $t,x$ 互素, 存在 $a,b\in R$ 使得 $at+bx=1$, 也就是 $(b+(t))(x+(t))=1-at+(t)=1+(t)$, 这就给出了 $x+(t)$ 的逆元.

> **定理 6.3.7 (中国剩余定理)**
>
> &emsp;&emsp;在主理想环 $R$ 上, 对一列两两互素的 $a_1,\cdots,a_n\in R\setminus\{0\}$, 存在环同构
> $$
> \varphi:R/(a_1\cdots a_n)\to\prod_{i=1}^n R/(a_i),\quad x+(a_1\cdots a_n)\mapsto (x+(a_i))_{i=1}^n.
> $$

&emsp;&emsp;*→ Proof.* 容易验证 $\varphi$ 是环同态, 只需要证明它是双射. 单性, 只需验证 $\ker\varphi=\{0\}$. 若 $x+(a_1\cdots a_n)\overset{\varphi}\mapsto (0)_i$, 那么 $\A i,~a_i\mid x\Ra a_1\cdots a_n=\lcm(a_i)\mid x$, 因此 $x+(a_1\cdots a_n)=0$.

&emsp;&emsp;满性, 只需要研究 $n=2$ 的情况. $\E x_1,x_2\in R,~a_1x_1+a_2x_2=1$, 那么对所有 $r\in R$, 可以看出 $\varphi(ra_1x_1+(a_1a_2))=(0,r+(a_2))$, $\varphi(ra_2x_2+(a_1a_2))=(r+(a_1),0)$ (这里就是 CRT 构造的部分).

## $\S6.6$ 根和重因式

> **定义 6.6.1**
>
> &emsp;&emsp;对 $f\in F[X]\setminus F$ 我们称 $f$ 是分裂的,当且仅当存在 $\lambda_1,\cdots,\lambda_n\in F$, 使得 $f=\prod_{k=1}^n(X-\lambda_k)$, 其中 $n=\deg f$.

&emsp;&emsp;由于 $F[X]$ 是唯一分解环, 因此对给定的 $\lambda\in F$, 一定有唯一的 $m\in\Z_{\ge 0}$ 使得 $f=(X-\lambda)^mg$, 其中 $g$ 与 $X-\lambda$ 互素, 这时 $m$ 称为 $\lambda$ (作为 $f$ 的根的) 重数.

> **推论 6.6.2**
>
> &emsp;&emsp;对 $f\in F[X]/F$, 存在扩域 $F\mmap E_F$, 使得 $f$ 在 $E_F$ 上分裂且 $[E_F:F]<\oo$.

&emsp;&emsp;*→ Proof.* 对 $n:=\deg f$ 归纳. $n=1$ 时直接取 $E_F=F$ 即可. 当 $n>1$, <u>命题 6.10.2 (i)</u> 给出存在扩域 $F\mmap E_1$ 使得存在 $\alpha\in E_1$ 满足 $f(\alpha)=0$. 同时 $E_1=F[X]/(f)$ 且 $[E_1:F]=n<\oo$. 令 $f_1=f/(X-\alpha)$ with $\deg f_1=n-1$, 归纳可知存在扩域 $F\mmap E_1\mmap E$ 使得 $f_1$ 在 $E$ 上分且 $[E:E_1]<\oo$. 那么 $f=(X-\alpha)f_1$ 就在 $E$ 上分裂. $[E:F]=[E:E_1][E_1:F]<\oo$.

> **定义 6.6.3**
>
> &emsp;&emsp;如果域 $F$ 上的每个非常数多项式皆分裂, 则称 $F$ 是代数闭域.

&nbsp;

&emsp;&emsp;One more step, 设 $V$ 是 $F$-向量空间, $T\in\End(V)$, 对 $f\in F[X]$ 定义 $f(T)=\sum a_kT^k\in\End(V)$, 明显 "代值" 是一个环同态 $\opn{ev}:F[X]\to\End(V)$. $\ker\opn{ev}=\{f:f(T)=0_V\}$ 是一个理想, 那么存在且 up to $F^\x$ 唯一的 $h$, 使得 $\ker\opn{ev}=(h)$ (且非零空间), 即 $\A f,~f(T)=0\Eq h\mid f$, 我们将 (唯一一个) 首一的 $h$ 记为 $\opn{Min}_T$, 这大概会通向第七章的内容.

## $\S6.10$ 从不可约多项式构造扩域

&emsp;对域 $F$ 和多项式 $f\in F[X]\setminus F$, 希望将 $F$ 扩域使得 $f$ 的所有根都在 $F$ 中. 这相当于找到一个环同态 $\xi:F\mmap L$, 其中 $L$ 是一个 "更大" 的域. $L$ 若满足环性质, 则可视为一个 $F$-向量空间, 其中纯量乘法定义为 $t_{\in F}\cdot x:=\xi(t)\cdot_L x$, 典型如 $F\mmap F[X]$.

&emsp;&emsp;(以下可参考 <u>作业三 ex.</u>) 对 $f\in F[X]$, 考虑合成映射 $i:F\mmap F[X]\mmap F[X]/(f)$, 也就是
$$
i:F\mmap F[X]/(f),\quad a\mapsto a+(f).
$$
根据已有讨论, $F[X]/(f)$ 也是 $F$-向量空间.

> **引理 6.10.1**
>
> &emsp;&emsp;设 $n=\deg f$, 则 $F[X]/(f)$ 有基 $\{1,X,\cdots,X^{n-1}\}$.

&emsp;&emsp;*→ Proof.* 即带余除法.

&nbsp;

&emsp;&emsp;对环同态 $\xi: F\to L$, 其中 $L$ 是交换环, 记
$$
g^\xi:=\sum_k\xi(a_k)X^k\in L[X],\quad\text{where }g=\sum_{k}a_kX^k\in F[X].
$$

> **命题 6.10.2**
>
> &emsp;&emsp;若 $f\in F[X]\setminus F$ 是不可约多项式, $E:=F[X]/(f)$, $i:F\mmap E$, 那么
>
> &emsp;&emsp;(i) 固定 $\alpha=X+(f)$, 那么 $f^i\in E[X]$ 满足 $f^i(\alpha)=0$.
>
> &emsp;&emsp;(ii) 若 $L$ 是交换环, $\xi:F\to L$ 是环同态, 且 $\beta\in L$ 满足 $f^\xi(\beta)=0$, 则存在唯一环同态 $\psi:E\to L$, 使得 $\psi(\alpha)=\beta$, 并且 $\psi i=\xi$. (旨在说明, $E$ 是最 "精简" 的扩域手段.)

&emsp;&emsp;*→ Proof.* (i) 设 $f=\sum a_kX^k$, 则 $f^i=\sum (a_k+(f))X^k$, 因此
$$
f^i(\alpha)=\sum_k(a_k+(f))(X+(f))^k=\sum_k (a_kX^k+(f))=\br{\sum_k a_kX^k}+(f)=0.
$$
&emsp;&emsp;(ii) 唯一性. 根据 $i$ 的定义, 记 $\eta:F\mmap F[X]$, 商映射 $q:F[X]\to F[X]/(f)$, 由交换性质, $\xi=\psi q\eta$. 设 $\Psi=\psi q$, 这里有 $\Psi(X)=\psi(\alpha)=\beta$, 同时对 $g=\sum b_kX^k$,
$$
\env{aligned}{
	\psi\br{\sum_k b_kX^k+(f)} &= \psi\br{\sum_k i(b_k)\cdot_E(X+(f))^n}\\
	&= \sum_k\psi(i(b_k))\cdot\psi((X+(f))^k)\\
	&= \sum_k\xi(b_k)\beta^k\\
	&= g^\xi(\beta).
}
$$
因此 $\psi$ 至多唯一.

&emsp;&emsp;存在性. 只需要验证 $g+(f)\mapsto g^\xi(\beta)$ 是环同态. 由于 $F[X]\to L,~g\mapsto g^\xi(\beta)$ 是一个环同态, $(f)$ 在其 $\ker$ 中, 这就能说明前者是一个良好的环同态.

&emsp;&emsp;例如取 $F=\R$, $f=x^2+1$, 可以令 $L=\C$, 这时 $\beta=\pm i$, 给出 $\psi^\pm:\R[X]/(x^2+1)\to\C$, 这从代数上给出了 $\C$ 的商环结构.


# 第七章 对角化

&emsp;&emsp;对 $A$ 的对角化相当于找到一组基 $P$, 使得 $A$ 在 $P$ 上的行为 ($P^{-1}AP$) 是对坐标轴的简单伸缩. 其使用意义不言而喻.

## $\S7.1$ 特征值与特征向量

> **定义 7.1.1**
>
> &emsp;&emsp;对 $F$-向量空间 $V$ 和 $T\in\End(V)$ 以及 $\lambda\in F$, 定义 $T$ 的 $\lambda$-特征空间为
> $$
> V_\lambda:=\ker(T-\lambda\id_V)=\{v\in V:Tv=\lambda v\}.
> $$
> 若 $V_\lambda\neq\{0\}$, 则称 $\lambda$ 为一个特征值, $v\in V_\lambda\setminus\{0\}$ 称为特征向量.

&emsp;&emsp;这样, 设 $\dim V=n<\oo$, 若存在一组特征向量 $\{v_1,\ops,v_n\}\sub V$ 构成基, 则称 $T$ 在 $F$ 上是可对角化的. 因为此时取 $P=\pmat{v_1&v_2&\cdots&v_n}$, 就有 $P^{-1}AP$ 对角.

&emsp;&emsp;注意到 $\lambda$ 为特征值 $\Eq\ker(T-\lambda\id)\neq\{0\}\Eq\det(T-\lambda\id)=\opn{Char}_T(\lambda)=0$.

> **命题 7.1.2**
>
> &emsp;&emsp;若 $T$ 可对角化, 那么 $\opn{Char}_T$ 在 $F$ 上分裂, 且 $\dim V_\lambda$ 即 $\lambda$ 对 $\opn{Char}_T$ 的重数.

&emsp;&emsp;*→ Proof.* 取定特征向量构成的基 $\{v_n\}$ 和对应的 $\{\lambda_n\}$, 明显 $\opn{Char}_T=\prod_{i=1}^n(X-\lambda_i)$. 对于重数的讨论, 选定 $\lambda\in F$, 不妨认为 $\lambda_{n-d+1}\ops=\lambda_n=\lambda$. 容易看出 $\dim\ker(T-\lambda\bs 1)=d$, 而 $d$ 就是 $\lambda$ 作为根的重数.

> **引理  7.1.3**
>
> &emsp;&emsp;设 $\lambda_1\ops,\lambda_m\in F$ 互不相同, 取 $v_i\in V_{\lambda_i}$, 则 $\sum_{i=1}^m v_i=0\Eq (\A i,~v_i=0)$.
>
> &emsp;&emsp;(c.f. $V_{\lambda_i}$ 的内直和条件.) (这指出, 对应特征值不同的特征向量线性无关.)

&emsp;&emsp;*→ Proof.* $m=1$ 时平凡. 若 $m>1$, 等式左右施加 $T$ 可知 $\sum_{i=1}^m\lambda_iv_i=0$, 同时 $\sum_{i=1}^m\lambda_1v_i=0$, 所以 $\sum_{i=2}^m(\lambda_i-\lambda_1)v_i=0$. 它们还是特征向量, 归纳知它们都只能为 $0$, 所以 $v_1=0$.

> **定理 7.1.4**
>
> &emsp;&emsp;对 $T\in\End(V)$, T.F.A.E.
>
> &emsp;&emsp;(i) $T$ 可对角化;
>
> &emsp;&emsp;(ii) $\sum_\lambda\dim V_\lambda=\dim V$;
>
> &emsp;&emsp;(iii) $V=\bigoplus_{\lambda}^{\u{int}}V_\lambda$.

&emsp;&emsp;*→ Proof.* $\u{(i)}\Ra\u{(ii)}$ 由于 $\dim V_\lambda$ 是 $\lambda$ 对 $\opn{Char}_T$ 的重数, 那么 $\opn{Char}_T$ 分裂给出 $\sum_{\lambda}(\text{mult of }\lambda)=\deg\opn{Char}_T=\dim V$.

&emsp;&emsp;$\u{(ii)}\Ra\u{(iii)}$ 根据引理, $\bigoplus_\lambda V_\lambda\sub V$, 而二者维数相同.

&emsp;&emsp;$\u{(iii)}\Ra\u{(i)}$ 对特征值 $\lambda$, 选定 $V_\lambda$ 的有序基, 合并之则得到 $V$ 的基, 所有基向量都是特征向量, $T$ 自然对角.

> **推论 7.1.5**
>
> &emsp;&emsp;若 $T$ 有 $n$ 个互异的特征值, 那么 $T$ 可对角化.

> **算法 7.1.6**
>
> &emsp;&emsp;为对角化 $T$:
>
> 1.  找到 $\opn{Char}_T$ 的所有根. *(把大象塞进冰箱?)*
> 2.  对所有根 $\lambda$, 计算 $V_\lambda=\ker(T-\lambda\bs 1)$, 找到一组基.
> 3.  检查所有基是否张成 $V$.

## $\S7.2$ 极小多项式

&emsp;&emsp;我们在 6.6 的 "one more step" 中给出了相关定义.

> **引理 7.2.1**
>
> &emsp;&emsp;$\opn{Char}_T(\lambda)=0\Eq\opn{Min}_T(\lambda)=0$.

&emsp;&emsp;*→ Proof.* 左推右, 取 $v\neq 0$ 满足 $Tv=\lambda v$, 观察有 $f(T)(v)=f(\lambda)v$, 那么
$$
0_V=0_{\End(V)}(v)=\opn{Min}_T(T)(v)=\opn{Min}_T(\lambda)v.
$$
所以 $\opn{Min}_T(\lambda)=0$. 右推左, 若 $\opn{Char}_T(\lambda)\neq 0$, 那么 $T-\lambda\bs 1$ 可逆, 断言 $(X-\lambda)\nmid\opn{Min}_T$, 否则 $\l(\l(X-\lambda\r)^{-1}\opn{Min}_T\r)(T)=0$ (求逆验证), 这与 $\opn{Min}_T$ 的极小性矛盾.

> **定理 7.2.2**
>
> &emsp;&emsp;$T$ 在 $F$ 上可对角化当且仅当 $\opn{Min}_T$ 在 $F$ 上分裂且无重根.

&emsp;&emsp;*→ Proof.* 左推右, 取定所有特征值 (忽略重根) $\lambda_1\ops,\lambda_m$, <u>定理 7.1.4</u> 给出 $V=V_{\lambda_1}\ops\oplus V_{\lambda_m}$. 在 $V_{\lambda_i}$ 上, $T$ 的行为等同于 $\lambda_i\bs 1$. 因此
$$
(\A f\in F[X],~f(T)=0)\Eq(\A i,~f(T)|_{V_{\lambda_i}}=0)\Eq(\A i,~(X-\lambda_i)\mid f).
$$
所以 $\opn{Min}_T=(X-\lambda_1)\cdots(X-\lambda_m)$.

&emsp;&emsp;右推左, 设 $\opn{Min}_T=(X-\lambda_1)\cdots(X-\lambda_m)$, 根据 <u>引理 7.2.3</u>, 有
$$
V=V[\opn{Min}_T]=\bigoplus_{i=1}^m V[X-\lambda_i]=\bigoplus_{i=1}^m V_{\lambda_i}.
$$

> **引理 7.2.3**
>
> &emsp;&emsp;给定 $T\in\End(V)$ 和 $f\in F[X]$, 定义 $V[f]:=\ker(f(T)\in\End(V))$. (例如 $V[X-\lambda]=V_\lambda$.) 那么若 $f,g$ 互素, 就有 $V[fg]=V[f]\oplus V[g]$.

&emsp;&emsp;*→ Proof.* 可以取出 $af+bg=1$. 设 $v\in V[fg]$, 那么 $v=\id(v)=(af+bg)(v)=\underbrace{a(T)f(T)v}_{\in V[g]}+\underbrace{b(T)g(T)v}_{\in V[f]}$; 此外, $V[f]$ 和 $V[g]$ 都是 $T$-不变子空间, 这告诉我们 $v\in V[f]\Ra g(T)v\in V[f]$, 二者结合可以得到 $V[fg]=V[f]+V[g]$. 另一方面, 若 $v\in V[f]\cap V[g]$, 此时 $v=a(T)f(T)v+b(T)g(T)v=0$. 所以 $V[f]\cap V[g]=\{0\}$, 原命题成立.

> **推论 7.2.4**
>
> &emsp;&emsp;设 $T$ 是可对角化的, $V_0\sub V$ 满足 $T(V_0)\sub V_0$, 那么 $T|_{V_0}\in\End(V)$ 也是可对角化的; 诱导映射 $\ol T\in\End(V/V_0)$ 也是可对角化的.

&emsp;&emsp;*→ Proof.* 明显 $\opn{Min}_{T|_{V_0}}\mid \opn{Min}_T$, 类似地 $\opn{Min}_{\ol T}\mid \opn{Min}_T$.

&nbsp;

&emsp;&emsp;例如, 考虑 $V=F^2$, $A=\pmat{\lambda&x\\&\lambda}~(\lambda,x\in F)$. 当 $x=0$, $A$ 明显可对角化. 否则
$$
A-\lambda\bs 1=\pmat{&x\\&}\neq\bs 0,\quad (A-\lambda\bs 1)^2=\bs 0.
$$
所以 $\opn{Min}_A=(X-\lambda)^2$ 有重根 ($\opn{Min}_T$ 是首一的, 且已验证次数至少为 $2$), $A$ 不可对角化. 但如果取 $V_0=Fe_1$, 其中 $e_1=\pmat{1\\\\}$, 那么 $Ae_1=\lambda e_1$, $A|_{V_0}$ 是可对角化的, $\ol A=\lambda\id$ 也可对角化. 上述推论的逆命题并不成立.

## $\S7.3$ 上三角化

> **定义 7.3.1**
>
> &emsp;&emsp;对 $F$-向量空间 $V$, $V$ 的旗 (flag) 定义为一列
> $$
> \{0\}=V_0\subsetneq V_1\ops\subsetneq V_m=V.
> $$
> 其中 $m\ge 0$. 如果 $m=\dim V$, 那么此旗称为完备旗. *我们试图将 "上三角" 这个矩阵特点描述到线性映射上.*

> **定义 7.3.2**
>
> &emsp;&emsp;设 $\dim V=n$, $T\in\End(V)$, 称 $T$ 稳定化一面旗 $(V_i)_{i=1}^m$, 当且仅当 $T(V_i)\sub V_i$; 称 $T$ 是可上三角化的, 当且仅当 $T$ 可稳定化某面完备旗.
>
> &emsp;&emsp;从矩阵角度, 这等价于 $A$ 可上三角化当且仅当存在可逆的 $P$ 使得 $P^{-1}AP$ 是上三角矩阵.

&emsp;&emsp;具体地, 如果有序基 $v_1\ops,v_n$ 给出完备旗 $Q$, $T$ 稳定化了 $Q$ 意味着 $T(\lang v_1\ops,v_i\rang)\sub\lang v_1\ops,v_i\rang$, 也就是
$$
\E(a_{ij}),~Tv_j=\sum_{i=1}^ja_{ij}v_i.
$$
即 $T$ 在这组有序基下是上三角矩阵.

> **定理 7.3.3**
>
> &emsp;&emsp;$T$ 可上三角化当且仅当 $\opn{Char}_T$ 在 $F$ 分裂. (Always true if $F$ is algebraically closed.)

&emsp;&emsp;*→ Proof.* 在 $V=F^n$ 上讨论, $T$ 等同于 $A\in\M_{n\x n}(F)$. 左推右显然. 右推左, 考虑对 $n$ 归纳. $n=1$ 时平凡. $n\ge 2$ 时, 令 $\lambda_1\in F$ 为 $A$ 的一个特征值, $v_1$ 为一个对应的特征向量. 从 $v_1$ 扩张出 $V$ 的一组基 $\{v_1,v_2',\cdots,v_n'\}$, 设 $R=\pmat{v_1&v_2'&\cdots&v_n'}$, 那么 $R^{1}AR$ 的第一列为 $\pmat{\lambda_1&0&\cdots}^\T$. 设其 $\mathcal M_{11}=B$, 那么 $\opn{Char}_A=\opn{Char}_{R^{-1}AR}=(X-\lambda_1)\opn{Char}_B$, 所以 $\opn{Char}_B$ 也分裂, 存在 $Q^{-1}BQ$ 上三角. 最终令
$$
P=R\pmat{1\\&Q},
$$
就给出了 $P^{-1}AP$ 上三角.

&nbsp;

&emsp;&emsp;这一结论可以证明 Cayley-Hamilton 定理. 对 $A\in\M_{n\x n}(F)$, 将 $F$ 扩域使得 $\opn{Char}_A$ 分裂. 这样能够假设 $A$ 上三角, 对角线上为 $\lambda_1\ops,\lambda_n$, 同时 $\opn{Char}_A=\prod_{i=1}^n(X-\lambda_i)$.

&emsp;&emsp;注意有 $(A-\lambda_n\bs 1):\lang e_1\ops,e_n\rang\to\lang e_1\ops,e_{n-1}\rang$, 同理就有 $(A-\lambda_n\bs 1)\cdots(A-\lambda_1\bs 1)=\bs 0$.

## $\S7.4$ 广义特征子空间

> **定义 7.4.1**
>
> &emsp;&emsp;设 $T\in\End(V)$, $\lambda\in F$, 定义
> $$
> V_{[\lambda],N}:=V[(X-\lambda)^N]=\ker(T-\lambda)^N,\quad V_{[\lambda]}:=\bigcup_{N\ge 1}V_{[\lambda],N}.
> $$
> 称 $V_{[\lambda]}$ 是 $T$ 相对于 $\lambda$ 的广义特征子空间.

> **引理 7.4.2**
>
> &emsp;&emsp;$V_{[\lambda]}\neq\{0\}\Eq V_\lambda\neq\{0\}$.

&emsp;&emsp;*→ Proof.* 右推左: $V_\lambda\sub V_{[\lambda]}$. 左推右: 令 $0\neq v\in V_{[\lambda]}$, 那么存在 $N$, 使得 $(T-\lambda)^Nv=0$, 其中最小的 $N$ 一定满足 $(T-\lambda)^{N-1}v=:v'\neq 0$, 这里明显 $v'\in V_\lambda$.

&nbsp;

&emsp;&emsp;下假设 $\dim V=n<\oo$ 且 $\opn{Char}_T$ 在 $F$ 分裂, 回忆有 $\opn{Min}_T\mid\opn{Char}_T$ 且二者根集相同, 不妨设
$$
\opn{Char}_T=\prod_{i=1}^m(X-\lambda_i)^{a_i},\quad \opn{Min}_T=\prod_{i=1}^m(X-\lambda_i)^{b_i}~(1\le b_i\le a_i).
$$

> **引理 7.4.3**
>
> &emsp;&emsp;$\A 1\le i\le m,~V_{[\lambda_i]}=V_{[\lambda_i],b_i}$.

&emsp;&emsp;*→ Proof.* 只需证左侧含于右侧. 设 $v\in V_{[\lambda_i]}$, 取 $N\ge1$ 使得 $(T-\lambda_i)^Nv=0$. 令 $h:=\gcd((X-\lambda_i)^N,\opn{Min}_T)\mid (X-\lambda_i)^{b_i}$. 根据 Bezout 定理, 存在 $a,b\in F[X]$ 使得 $h=(X-\lambda_i)^N a+\opn{Min}_Tb$, 这里验证有
$$
h(T)v=a(T)(T-\lambda_i)^Nv+b(T)\opn{Min}_T(T)v=0\Ra (T-\lambda_i)^{b_i}v=0\Ra v\in V_{[\lambda_i],b_i}.
$$
&emsp;&emsp;回忆有 $f\perp g\in F[X]\Ra V[fg]=V[f]\oplus V[g]$, 所以 $V=V[\opn{Min}_T]=\bigoplus_{i=1}^m V_{[\lambda_i]}$. 令 $T_i:=T|_{V_{[\lambda_i]}}\in\End(V_{[\lambda_i]})$, 可以证明 $\opn{Min}_{T_i}=(X-\lambda_i)^{b_i}$ (这给出 <u>引理 7.4.3</u> 中的 $b_i$ 不可改进), 以及 $\opn{Char}_{T_i}=(X-\lambda_i)^{a_i}$, $\dim V_{[\lambda_i]}=\deg\opn{Char}_{T_i}=a_i$.

> **定义 7.4.5**
>
> &emsp;&emsp;定义 $\lambda$ 的几何重数为 $\dim V_\lambda$, 代数重数为 $\lambda$ 作为 $\opn{Char}_T$ 的根的重数.

&emsp;&emsp;当且仅当 $\lambda$ 为 $T$ 的特征值时, 二者非零.

> **定理 7.4.6**
>
> &emsp;&emsp;任意 $\lambda$ 的代数重数皆大于等于其几何重数, 且当且仅当 $V_{[\lambda]}=V_\lambda$ 时取等.

&emsp;&emsp;*→ Proof.* $V_{[\lambda]}\supset V_\lambda$, $\opn{geo}\opn{mult}\lambda=\dim V_\lambda\le\dim V_{[\lambda]}=\opn{alg}\opn{mult}\lambda$.

> **推论 7.4.7**
>
> &emsp;&emsp;(在前文公有假设下,) $T$ 可对角化当且仅当一切 $\lambda$ 的代数重数和几何重数相等.

&emsp;&emsp;*→ Proof.* 已知 $V=\bigoplus_{\lambda}V_{[\lambda]}$, $V_\lambda\sub V_{[\lambda]}$, 根据 <u>定理 7.1.4 (iii)</u> 可知要求 $V=\bigoplus_{\lambda}V_\lambda$.

&nbsp;

&emsp;&emsp;例如, 对 Fibonacci 数列, 有 $\pmat{f_n&f_{n+1}}=\pmat{f_0&f_1}\pmat{&1\\1&1}^n$, 记递推矩阵为 $C$, 那么
$$
\opn{Char}_C=\dary{cc}{X&-1\\-1&X-1}=X^2-X-1,\quad \lambda_{1,2}=\frac{1\pm\sqrt 5}{2}.
$$
设特征向量 $v=\pmat{x\\y}$, 有
$$
\pmat{\frac{1\pm\sqrt 5}{2}&-1\\-1&\frac{-1\pm\sqrt 5}{2}}\pmat{x\\y}=\pmat{0\\0}\Ra v_{\pm}=\pmat{1\\\frac{1\pm\sqrt 5}{2}}.
$$
设 $P=\pary{c|c}{v_+&v_-}$, 就有
$$
P^{-1}CP=\pmat{\frac{1+\sqrt 5}{2}\\&\frac{1-\sqrt 5}{2}}.
$$
最后求逆或者在原序列上待定系数即可.

# 第八章 双线性形式

## $\S8.1$ 双线性形式

&emsp;&emsp;下设 $F$ 为域, 有一列 $F$-向量空间 $W,V_1,\cdots,V_n$.

> **定义 8.1.1**
>
> &emsp;&emsp;称映射 $C:V_1\ops\x V_n\to W$ 是多重线性的, 当且仅当 $C$ 对每个变量都是线性也映射. 若 $W=F$, 则也将其称为多重形式.

&emsp;&emsp;容易验证 $\opn{Mul}(V_1,\cdots,V_n;W):=\{\text{multilinear maps }V_1\ops\x V_n\to W\}$ 是 $F$-线性空间.

&emsp;&emsp;当 $n=2$ 时, 则有所谓双线性映射和双线性形式, 此时的 $\opn{Mul}(V_1,V_2;W)$ 也记为 $\opn{Bil}(V_1,V_2;W)$.

&emsp;&emsp;例如, 矩阵乘法是双线性的; 典范配对 $\lang\cdot,\cdot\rang:V^\vee\x V\to F,~(\lambda,v)\mapsto\lang \lambda ,v\rang:=\lambda(v)$ 是双线性的.

&emsp;&emsp;在 Curry 化的视角下, 对任意集合 $A,B,C$, 明显
$$
(C^A)^B\overset{1:1}\to C^{A\x B}\overset{1:1}\to (C^B)^A.
$$
据此, 双线性映射和典范配对就有:

> **命题 8.1.5**
> $$
> \Hom(W,V^\vee)\overset\sim\longleftarrow \opn{Bil}(V,W;F)\overset\sim\longrightarrow \Hom(V,W^\vee)\quad\text{where}\\
> B\mapsto[w\mapsto B(\cdot, w)]\in\Hom(W,V^\vee),\\
> B\mapsto [v\mapsto B(v,\cdot)]\in\Hom(V,W^\vee);\\
> \Hom(W,V^\vee)\ni\varphi\mapsto[B(v,w):=\lang\varphi(w),v\rang],\\
> \Hom(V,W^\vee)\ni\psi\mapsto[B(v,w):=\lang\psi(v),w\rang].
> $$

&emsp;&emsp;大力验证线性性和复合为 $\id$ 即可.

> **命题 8.1.6**
>
> &emsp;&emsp;将 $F^n$ 的元素视为列向量, 则有向量空间的同构
> $$
> \M_{m\x n}(F)\overset\sim\to\opn{Bil}(F^m,F^n;F),\quad A\mapsto [B(v,w):=v^\T Aw].
> $$

&emsp;&emsp;进一步地, 发现 $B$ 可由 $(B(e_i,e_j))_{ij}$ 唯一确定, 因而存在线性嵌入 $\opn{Bil}(F^m,F^n;W)\mmap F^{mn}$.

&emsp;&emsp;这样还会给出 $C(v,w):=B(w,v)$ 将被映为 $A^\T$.

> **定义 8.1.7**
>
> &emsp;&emsp;对双线性形式 $B_1:V_1\x W_1\to F$ 和 $B_2:V_2\x W_2\to F$, 定义
> $$
> B_1\oplus B_2=:B:(V_1\oplus W_1)\x(V_2\oplus W_2)\to F,\\
> ((v_1,w_1),(v_2,w_2))\mapsto B_1(v_1,w_1)+B_2(v_2,w_2).
> $$
> 称为 $B_1$ 和 $B_2$ 的直和.

&emsp;&emsp;结合 <u>命题 8.1.6</u>, 如果 $B_1\mapsto A_1\in\M_{m_1\x  n_1}(F)$, $B_2\mapsto A_2\in\M_{m_2\x n_2}(F)$, 那么就有
$$
B\mapsto A=\pblk{A_1}{}{}{A_2}\in\M_{(m_1+m_2)\x(n_1+n_2)}(F).
$$
这给出
$$
B_1(v_1,w_1)+B_2(v_2,w_2)=\pary{c|c}{v_1^\T&v_2^\T}\pblk{A_1}{}{}{A_2}\pary{c}{w_1\\\hline w_2}.
$$

> **定义 8.1.8**
>
> &emsp;&emsp;对双线性形式 $B:V\x V\to F$, 定义
>
> - 若 $\A v_1,v_2\in V,~B(v_1,v_2)=B(v_2,v_1)$, 则称 $B$ 为对称的;
> - 若 $\A v_1,v_2\in V,~B(v_1,v_2)=-B(v_2,v_1)$, 则称 $B$ 为反对称的;
> - 若 $\A v\in V,~B(v,v)=0$, 则称 $B$ 为交错的.

&emsp;&emsp;若 $B_1$, $B_2$ 皆 (反) 对称, 则 $B_1\oplus B_2$ 也 (反) 对称. 对应在方阵上, 对称性即 $A=A^\T$, 给出对称矩阵; 反对称性即 $-A=A^\T$, 给出反对称矩阵.


## $\S8.2$ 非退化形式与伴随映射

> **定义 8.2.1**
>
> &emsp;&emsp;对双线性形式 $B:V\x W\to F$, 定义 $B$ 的左根为 $V$ 的子空间
> $$
> \{v\in V:B(v,\cdot)=0\};
> $$
> 定义 $B$ 的右根为 $W$ 的子空间
> $$
> \{w\in W:B(\cdot,w)=0\}.
> $$
> 特别地, 当 $V=W$ 且 $B$ (反) 对称时, 左根自动等于右根, 此时称之为 $B$ 的根基.

> **定义 8.2.2**
>
> &emsp;&emsp;设 $\dim V,\dim W<\oo$, 若 $B$ 的左根和右根都是零空间, 则称 $B$ 是非退化的.

&emsp;&emsp;例如, 典范配对 $\lang\cdot,\cdot\rang:V^\vee\x V\to F$ 是非退化的. 检验有:
$$
\A\lambda\in V^\vee,~(\A v\in V,~\lambda(v)=0\Ra \lambda=0).
$$
对右根, 若 $v\neq 0$, 总能由其扩充出 $V$ 的有序基 $\{v_1,\cdots,v_n\}$, 进而给出 $V^\vee$ 的对偶基 $\{\check v_1,\cdots,\check v_n\}$, 这已经有 $\check v_1(v_1)=1\neq 0$.

&emsp;&emsp;可以证明迹形式 $\opn{Tr}:\End (V)\x\End(V)\to F,~(S,T)\mapsto\tr(ST)$ 也是非退化的双线性形式, 在矩阵环上考虑即可, 这里略去.

&emsp;&emsp;回忆在 Curry 化视角下 $B:V\x W\to F$ 给出的无非是 $\varphi\in\Hom(W,V^\vee)$ 或者 $\psi\in\Hom(V,W^\vee)$, 这时左右根就分别对应了 $\ker\psi$ 和 $\ker\varphi$. 有观察:

> **命题 8.2.3**
>
> &emsp;&emsp;若 $\dim V,\dim W<\oo$, 则存在非退化的 $B\in\opn{Bil}(V,W;F)$ 当且仅当 $\dim V=\dim W$.

&emsp;&emsp;*→ Proof.* 左推右容易. 右推左, 考虑反证. 不妨 $\dim V>\dim W$, 则
$$
\dim\ker\psi=\dim V-\rank\psi\ge \dim V-\dim W^\vee=\dim V-\dim W>0,
$$
已然给出矛盾.

&emsp;&emsp;进一步地:

> **命题 8.2.4**
>
> &emsp;&emsp;对 $\dim V=\dim W$ 以及 $B\in\opn{Bil}(V,W;F)$, T.F.A.E:
>
> &emsp;&emsp;(i) $B$ 非退化;
>
> &emsp;&emsp;(ii) $B$ 的左根为 $\{0\}$;
>
> &emsp;&emsp;(iii) $B$ 的右根为 $\{0\}$.

&emsp;&emsp;*→ Proof.* $\u{(i)}\Ra\u{(ii)(iii)}$ 是定义, 不妨再证明 $\u{(ii)}\Ra\u{(i)}$. 对 $w\in W$, 若 $\A v\in V,~B(v,w)=\lang \psi(v),w\rang=0$, 从而
$$
\im\psi\sub\{\lambda\sub W^\vee:\lang \lambda,w\rang=0\}
$$
是 $W^\vee$ 的子空间. 反证, 如果 $w\neq 0$, 由此扩展出有序基 $\{w=w_1\ops,w_n\}\sub W$, 以及对偶基 $\{\check w_1\ops,\check w_n\}$, 由于 $\lang \check w_1,w\rang=1$, 所以
$$
\im\psi\sub\{\lambda\in W^\vee:\lang\lambda,v\rang=0\}\subsetneq W^\vee
$$
然而 $\dim\im\psi=\dim V=\dim W=\dim W^\vee$ 矛盾. 因此必然 $w=0$.

&nbsp;

&emsp;&emsp;在矩阵层面, 取 $V=W=F^n$, $B(v,w)=v^\T Aw$, 那么
$$
(\text{left radical of }B)=\{v\in F^n:\A w,~v^\T Aw=0\}=\{v\in F^n:A^\T v=0\}=\ker A^\T.
$$
类似地,
$$
(\text{right radical of }B)=\{w\in F^n:\A v,~v^\T(Aw)=0\}=\ker A.
$$
自然有推论,
$$
\ker A=\{0\}\Eq A\text{ is invertible}\Eq\ker A^\T=\{0\}\Eq B\text{ is nondegenerate}.
$$

&nbsp;

&emsp;&emsp;接下来讨论伴随映射.

> **定义-命题 8.2.5**
>
> &emsp;&emsp;指定域 $F$ 和两个双线性形式 $B_i:V_i\x V_i'\to F$, 对给定的线性映射 $T:V_1\to V_2$, 假设 $B_1$ 非退化, 则
> $$
> \E! (T^*:V_2'\to V_2),~B_2(Tv_1,v_2)=B_1(v_1,T^* v_2).
> $$
> 进一步, 存在唯一线性映射 $\Hom(V_1,V_2)\to\Hom(V_2',V_1),~T\mapsto T^*$. 称此时的 $T^*$ 为 $T$ 的右伴随. 同理可以定义 $T$ 的左伴随 $^*T$.

&emsp;&emsp;*→ Proof.* 选定有序基, $B_i$ 和 $T$ 都可视同矩阵. 那么
$$
B_2(Tv_1,v_2')=v_1^\T T^\T A_2v_2'=v_1^\T A_1(A_1^{-1}T^\T A_2)v_2'.\quad (\A v_1,v_2')
$$
因此
$$
v_1^\T A_1T^*v_2'=B_1(v_1,T^*v_2'),
$$
也即是
$$
T^*=A_1^{-1}T^\T A_2.
$$
&emsp;&emsp;自然, 在 $B_1$ 和 $B_2$ 都非退化时, 有 $^*(T^*)=T=(^*T)^*$; 此外 $(ST)^*=T^*S^*$ 等复合性质也不难验证. 利用矩阵的表达, 还能给出, 当 $B_1$ 和 $B_2$ 都非退化时, $\rank T=\rank T^*=\rank{}^*T$.

> **命题 8.2.6**
>
> &emsp;&emsp;当 $V_1=V_1'=V_2=V_2'=V$, $T\in\End(V)$, $B_1=B_2=B$ 非退化且有对称或反对称性, 则 $^*T=T^*$.

&emsp;&emsp;*→ Proof.* 条件给出 $A$ 可逆且 $A^\T=\pm A$, 直接代入 $T^*=A^{-1}T^\T A$ 以及 $^*T=(A^\T)^{-1}T^\T A^\T$ 即可证明.

&emsp;&emsp;这时, 给定 $T$ 的左右伴随一定是相同的, 我们统一称之为 $T$ 的伴随, 仍写作 $T^*$.

> **定义 8.2.7**
>
> &emsp;&emsp;对非退化双线性形式 $B:V\x V\to F$, $T\in\End(V)$, 若
>
> - $T^*=T$, 则称 $T$ 是自伴的;
> - $T^*=-T$, 则称 $T$ 是反自伴的.

&emsp;&emsp;如果将 $B$ 所对应的矩阵 $A$ 取为 $\bs 1$, 将 $T\in\M_{n\x n}(F)$ 视同 $\End(F^n)$ 的元素, 则自伴和反自伴性实际上给出 $T$ 作为矩阵的对称和反对称性.

> **命题 8.2.8**
>
> &emsp;&emsp;设 $B:V\x W\to F$ 非退化, 则
> $$
> \dim V_0^\perp+\dim V_0=\dim V,\quad \dim{}^\perp W_0+\dim W_0=\dim W.
> $$
> 其中
> $$
> V_0^\perp:=\{w\in W:\A v\in V_0,~B(v,w)=0\},\\
> ^\perp W_0:=\{v\in V:\A w\in W_0,~B(v,w)=0\}.
> $$

&emsp;&emsp;*→ Proof.* 不妨证明前式. $B$ 相当于给出 $\varphi\in\Hom(V,W^\vee)$, 形成典范配对 $B=\lang\varphi(\cdot),\cdot\rang$. 选定子空间 $\varphi(V_0)$ 的一组有序基 $\check w_1\ops,\check w_d$. 我们实际上只需要证明 <u>引理 8.2.9</u>.

> **引理 8.2.9**
>
> &emsp;&emsp;设 $\dim W<\oo$, 线性无关的 $\check w_1\ops,\check w_d\in W^\vee$, 则
> $$
> ^\perp\lang\check w_1\ops,\check w_d\rang:=\{w\in W:\A i\in[1:d],~\lang\check w_i,w\rang=0\}\sub W\\
> \text{has }\dim=\dim W-d.
> $$

&emsp;&emsp;*→ Proof.* 当 $d=n$, 由于 $\lang\cdot,\cdot\rang_W:W^\vee\x W\to F$ 非退化, 所以 $^\perp\lang\check w_1\ops,\check w_d\rang=\{0\}$, 满足条件. 当 $d=1$ 时, 由于 $\check w_1\neq 0$, 自然有 $^\perp\lang\check w_1\rang=\ker(\check w_1:W\emap F)$, 所以 $\dim{}^\T\lang\check w_1\rang=\dim W-\dim F=\dim W-1$.

&emsp;&emsp;对一般的 $d$, 将 $\{\check w_d\}$ 扩充为 $W^\vee$ 的有序基 $\check w_1\ops,\check w_n~(n:=\dim W^\vee=\dim W)$, 考虑一列
$$
^\perp\lang\check w_1\rang\ops\supset{}^\perp\lang\check w_1\ops,\check w_n\rang,\quad(*)
$$
注意到
$$
^\perp\lang\check w_1\ops,\check w_{k+1}\rang={}^\perp\lang\check w_1\ops,\check w_k\rang\cap{}^\perp\lang\check w_{k+1}\rang,
$$
此外, 由于
$$
\dim(M\cap N)=\dim M+\dim N-\dim(M+N)\ge \dim M+\dim N-\dim V
$$
所以
$$
\dim{}^\perp\lang\check w_1\ops,\check w_{k+1}\rang\ge\dim{}^\perp\lang\check w_1\ops,\check w_k\rang+(n-1)-n.
$$
在 $(*)$ 的下降列中, 自然需要处处取等.

> **定理 8.2.10**
>
> &emsp;&emsp;对非退化的 $B:V\x W\to F$ 和子空间 $V_0\sub V$, $W_0\sub W$, 有
> $$
> ^\perp(V_0^\perp)=V_0,\quad(^\perp W_0)^\perp=W_0.
> $$

&emsp;&emsp;*→ Proof.* 先说明 $V_0\sub{}^\perp(V_0^\perp)$, 再根据 <u>命题 8.2.8</u> 比较维度即可.



## $\S8.3$ 分类问题的提出

> **定义 8.3.1**
>
> &emsp;&emsp;对 $(V_1,B_1:V_1\x V_1\to F)$ 和 $(V_2,B_2)$, 从 $(V_1,B_1)$ 到 $(V_2,B_2)$ 的同构为
> $$
> \varphi:(V_1,B_1)\overset\sim\to (V_2,B_2),\quad\text{where}\\
> \varphi:V_1\to V_2\text{ is homormophism over vector spaces, and}\\
> \A v,w\in  V_1,~B_2(\varphi(v),\varphi(w))=B_1(v,w).
> $$
> 若这样的 $\varphi$ 存在, 则记 $(V_1,B_1)\simeq (V_2,B_2)$.

&emsp;&emsp;不难验证 $\simeq$ 是等价关系. 也就是说
$$
(\underbrace{\{(V,B):\dim V=n\}}_{\text{a class}}/\simeq)=(\{(F^n,B)\}/\simeq).
$$

> **定义-命题 8.3.2**
>
> &emsp;&emsp;对 $A,A'\in\M_{n\x n}(F)$, 若存在可逆的 $C\in\M_{n\x n}(F)$ 使得 $A=C^\T A'C$, 则称 $A$ 与 $A'$ 合同. 合同给出等价关系.

&emsp;&emsp;*→ Proof.* 自然 $A\sim A'$. $A\overset C\sim A'\Ra A'\overset{C^{-1}}\sim A$, 这是由于 $(C^{-1})^\T=(C^\T)^{-1}$. $A\overset{C_1}\sim A'\overset{C_2}\sim A''\Ra A\overset{C_1C_2}\sim A''$, 这是由于 $(C_1C_2)^\T=C_2^\T C_1^\T$. (合同等价还保持对称性和反对称性.)

> **命题 8.3.3**
>
> &emsp;&emsp;设 $B,B':F^n\x F^n\to F$ 是双线性映射, 且分别同构到 $A,A'\in\M_{n\x n}(F)$, 则
> $$
> \{C\in\text{invertible }\M_{n\x n}(F):A=C^\T A'C\}\overset{1:1}\leftrightarrow \{\text{isomorphism }(F^n,B)\overset\sim\to (F^n,B')\},\\
> C\mapsto(\text{linear map }F^n\overset\sim\to F^n).
> $$

&emsp;&emsp;*→ Proof.* 注意有
$$
B'(Cv_1,Cv_2)=(Cv_1)^\T A'(C v_2)=v_1^\T C^\T A'Cv_2=B(v_1,v_2)\Eq C^\T A' C=A.
$$
由此证明给出一个可逆的 $C$ 相当于给出一个右侧的同构.

## $\S8.4$ 二次型的基本概念

&emsp;&emsp;下设 $\char F\neq 2$, 此时 $\frac{1}{2}:=(1+1)^{-1}$ 存在.

> **定义 8.4.1 (二次型)**
>
> &emsp;&emsp;域 $F$ 上的 $n$ 元齐次二次多项式称为二次型, 即所有的
> $$
> f=\sum_{i=1}^na_{ii}X_i^2+\sum_{1\le i<j\le n}2a_{ij}X_iX_j.
> $$

&emsp;&emsp;命 $a_{ji}=a_{ij}$, 也就有
$$
f=\sum_{1\le i,j\le n}a_{ij}X_iX_j\overset{1:1}\leftrightarrow (a_{ij})\in\M_{n\x n}(F).
$$
结合 <u>命题 8.1.6</u>, 同规格的二次型, 对称矩阵以及对称双线性形式两两存在双射.

&emsp;&emsp;考虑 $f$ 在 $F^n$ 上的求值. 一个 $v\in F^n$ 相当于给出 $\{X_n\}$ 的赋值, 若 $v=\pmat{x_1&\cdots&x_n}^\T$, 则
$$
f(v)=\sum_{1\le i,j\le n}a_{ij}x_ix_j=B(v,v),
$$
(回忆有 $B(v,w)=v^\T Aw$.) 进而
$$
B(v_1,v_2)=\frac{1}{2}(f(v_1+v_2)-f(v_1)-f(v_2)).
$$
&emsp;&emsp;回忆有 $(F^n,B)\simeq (F^n,B')$ 当且仅当它们对应的矩阵 $A$ 与 $A'$ 合同, 即有可逆的 $C$ 使得 $A=C^\T A'C$. 将 $C^\T$ 和 $C$ 分别作用在 $v^\T$ 和 $v$ 上, 我们实际上对二次型在 $\{x_n\}$ 上的求值做了一个线性且可逆的换元.

## $\S8.5$ 配方法

> **命题 8.5.1**
>
> &emsp;&emsp;任何 $n$ 元二次型都同构于形如 $a_1X_1^2\ops+a_nX_n^2$ 的对角二次型.

&emsp;&emsp;*→ Proof.* 对 $n$ 归纳. 设 $n>1$ 且 $f\neq 0$. 若存在某个 $a_{ii}\neq 0$, 可以重排得 $a_{11}\neq 0$. 那么
$$
f=a_{11}\br{\underbrace{X_1+\frac{1}{a_{11}}\sum_{j=2}^na_{1j}X_j}_{Y_1}}^2-\frac{1}{a_{11}}\br{\sum_{j=2}^na_{1j}\underbrace{X_j}_{Y_j}}^2+\sum_{2\le i,j\le n}a_{ij}X_iX_j.
$$
这样的 $\{Y_n\}$ 换元就允许在 $\{Y_{2..n}\}$ 上归纳了.

&emsp;&emsp;第二种情形, 若所有的 $a_{ii}=0$, 则必然存在 $1\le i<j\le n$ 使得 $a_{ij}\neq 0$. 这时构造
$$
Y_k=\env{cases}{
	X_i-X_j,&k=i;\\
	X_k,&k\neq i.
}
$$
这里 $X_i=Y_i+Y_j$. 进而
$$
\frac{1}{2}f=\sum_{k<h}a_{kh}X_kX_h=\sum_{k<h,~k,h\neq i} a_{kh}Y_kY_h+\sum_{i<h\le n} a_{ih}(Y_i+Y_j)Y_h+\sum_{1\le k<i}a_{ki}Y_k(Y_i+Y_j).
$$
市中 $Y_j^2$ 系数非零, 约化到前一种情况.

&emsp;&emsp;在 <u>命题 8.5.1</u> 的证明中, 相当于给出了一列初等矩阵 $U_1\ops,U_k$, 使得
$$
U_k^\T\cdots U_1^\T AU_1\cdots U_k
$$
对角.

&emsp;&emsp;不难得出, $f$ 非退化当且仅当它对角化之后的对角线全非零. 如果 $F$ 中所有元素都有平方根 (例如一个代数闭域), $f$ 将进一步同构为 $X_1^2+\cdots+X_r^2$, 也就是说这时存在 $[f]\leftrightarrow r$ (同构类 $\leftrightarrow$ 秩) 的双射.

## $\S8.6$ 实二次型的分类

&emsp;&emsp;对 $F=\R$, 类似上一节末尾, 我们能够将二次型 $f$ 在同构意义下变化到
$$
f\simeq X_1^2\ops+X_p^2-X_{p+1}^2\ops-X_r^2.
$$

> **定义 8.6.1**
>
> &emsp;&emsp;设 $V$ 是 $\R$-向量空间, $B:V\x V\to\R$ 是对称双线性形式.
>
> - 若 $\A v\in V,~B(v,v)\ge 0$, 则称 $B$ 是半正定的;
> - 若 $B$ 半正定且 $v\neq 0\Ra B(v,v)>0$, 则称 $B$ 是正定的.
> - 若 $-B$ 是 (半) 正定的, 则称 $B$ 是 (半) 负定的.
> - 若以上皆非, 则称 $B$ 是不定的.

&emsp;&emsp;注意正定或负定的二次型 $B$ 一定非退化, 否则 $B$ 的根基 $v$ 会使 $B(v,v)=0$.

> **命题 8.6.2**
>
> &emsp;&emsp;设实二次型 $f\simeq X_1^2\ops+X_p^2-X_{p+1}^2\ops-X_r^2$, 则
>
> - $f$ 半正定当且仅当 $p=r$;
> - $f$ 正定当且仅当 $p=n$.

&emsp;&emsp;这不过是实数性质的简单演绎.

> **定理 8.6.3 (惯性定理)**
> $$
> \{n\text{-ary quad. form over }\R\}/_\simeq\overset{1:1}\leftrightarrow \{(p,r)\in\Z^2:0\le p\le r\le n\}.
> $$

> **引理 8.6.4**
>
> &emsp;&emsp;设 $(V,B)\simeq (\R^n,X_1^2+\cdots+X_p^2-\cdots)$, 那么
>
> &emsp;&emsp;(i) 存在 $\dim=p$ 的正定子空间.
>
> &emsp;&emsp;(ii) 任何 $\dim>p$ 的子空间非正定.

&emsp;&emsp;*→ Proof.* (i) 不妨 $V=\R^n$, $X_1\ops+X_p^2-X_{p+1}^2\ops-X_r^2\mmap B$. 取 $V_n=\lang e_1\ops,e_p\rang$ 即可.

&emsp;&emsp;(ii) 取出 $V_1\sub V$. $N:=\lang e_{p+1}\ops,e_n\rang$. 这样:
$$
\dim(V_1\cap N)=-\dim(V_1+N)+\dim V_1+\dim N>-n+p+n-p=0.
$$
因此存在 $0\neq v\in V_1\cap N$, 它给出 $f(v)=B(v,v)=0$.

&emsp;&emsp;*→ Proof @ 8.6.3* 考虑二次型 $(V,B)$, $(V',B')$ 以及同构 $\varphi:(V,B)\overset\sim\to(V',B')$, 记 $n$ 为它们共有的维数, $r$ 为它们共有的秩, 分别选定基 $\lang v_1\ops,v_n\rang =V$ 和 $\lang v_1'\ops,v_n'\rang=V'$, 使得 $B$ 和 $B'$ 分别对应对角元, 接下来只需要说明 $p$ 和 $p'$ 相同.

&emsp;&emsp;考虑反证, 设 $p'>p$, 对 $(V',B')$ 运用 <u>引理 8.6.4 (i)</u> 可得 $p'$ 维正定子空间 $V_+'\sub V'$, 同构搬运得 $V$ 的正定子空间 $\varphi^{-1}(V_+')$, 然而对 $(V,B)$ 运用 <u>引理 8.6.4 (ii)</u> 可知这样的子空间不存在, 矛盾.

## $\S8.7$ 反对称双线性形式: 辛空间

&emsp;&emsp;设 $R(V):=\{v\in V\mid B(v,\cdot)\equiv 0\}$ 为 $B$ 的根基, 它是 $V$ 的子空间. 则存在子空间 $V'$ 使得 $V=R(V)\oplus V'$, 这时一个正交的分解. 同时, $(V',B|_{V'\x V'})$ 也是非退化的, 因为若 $v'\in V'$ 使得 $\A v_1'\in V',~B(v',v_1')=0$, 那么 $\A v_1\in V,~B(v',v_1)=0$, 这要求 $v'\in R(V)\cap V'=\{0\}$.

> **定义 8.7.1**
>
> &emsp;&emsp;对 $\char F\neq 2$ 的域和其上的有限维向量空间 $V$, 其上非退化反对称双线性形式 $B:V\x V\to F$ 称为辛形式, $(V,B)$ 被成为辛空间.

&emsp;&emsp;例如一个 $\br{F^2,\pmat{&1\\-1}}$.

> **定义 8.7.2**
>
> &emsp;&emsp;对辛空间 $(V,B)$, 设 $V_0$ 为 $V$ 的子空间, 若 $B|_{V_0\x V_0}$ 恒为 $0$, 则称 $V_0$ 是全迷向的; 极大的全迷向子空间 $L$ 称为 $V$ 的 Lagrange 子空间.

> **引理 8.7.3**
>
> &emsp;&emsp;设 $(V,B)$ 为辛空间, $L$ 为 Lagrange 子空间, 则 $L^\perp=L$, 且 $\dim V=2\dim L$.

&emsp;&emsp;*→ Proof.* 根据定义有 $L\sub L^\perp$. 对于 $v\in L^\perp\setminus L$, 那么 $L+Fv\supsetneq L$, 但这时 $L+Fv$ 也是全迷向的, 与 $L$ 的极大性矛盾. 此后, 注意 $\dim L^\perp=\dim V-\dim L$ 即可.

> **定理 8.7.4 (Darboux)**
>
> &emsp;&emsp;设 $(V,B)$ 为辛空间, $L$ 为 Lagrange 子空间, 则 $L$ 的任何有序基 $\seq p1n$ 都能扩充为 $V$ 的基 $\seq p1n,\seq q1n$, 使得对所有 $1\le i,j\le n$:
> $$
> B(p_i,p_j)=B(q_i,q_j)=0,\\
> B(p_i,q_j)=-B(q_j,p_i)=[i=j].
> $$
> (这样的 $V$ 的基也被称为辛基.)

&emsp;&emsp;*→ Proof.* 限制关于 $q$ 的指标范围在 $1\le i,j\le k$, 对 $k$ 归纳. 当 $k=1$ 时, 取 $q_1\in L_1^\perp\setminus L=L_1^\perp\setminus L^\perp$, 对 $i\in[1:n]$, 令
$$
L_i:=\lang p_1,\cdots,\hat{p_i},\cdots,p_n\rang,\quad \dim L_i=n-1;
$$
则 $\dim L_i^\perp=\dim V-(n-1)=n+1$, 又有 $L_i\sub L$, 所以 $L_i^\perp\supsetneq L^\perp=L$. 令 $i=1$, 我们知道 $q_1$ 总能取出, 同时有 $B(p_1,q_1)\neq 0$, $B(p_{2..n},q_1)=0$, 做一些伸缩可以让 $B(p_1,q_1)=1$.

&emsp;&emsp;然后将 $1\le k<n$ 归纳向 $k+1$.  由于 $L_{k+1}^\perp\supsetneq L$, 所以也存在 $q_{k+1}'$ 使得 $B(p_i,q_{k+1}')=[i=k+1]$. 设
$$
q_{k+1}:=q_{k+1}'+\sum_{i=1}^ka_ip_i,
$$
则 $B(p_i,q_{k+1})$ 性质同上, $B(q_j,q_{k+1})=B(q_j,q_{k+1}')+\sum_{i=1}^k a_iB(q_j,p_i)=B(q_j,q_{k+1}')-a_j$. 所以可以取 $a_j:=B(q_j,q_{k+1}')$, 这样 $\seq q1{k+1}$ 就满足了所期待的性质.

&emsp;&emsp;最后, 只需要验证这样的 $\seq p1n,\seq q1n$ 确实是一组基. 如果
$$
\sum_{i=1}^na_ip_i+\sum_{i=1}^nb_iq_i=0,
$$
左右分别施加 $B(\cdot,q_j)$ 可知 $a_j=0$; 分别施加 $B(p_i,\cdot)$ 可知 $b_i=0$, 所以只存在平凡的线性关系. 综上得证.

> **推论 8.7.5**
>
> &emsp;&emsp;对辛空间 $(V,B)$, $\dim V=2n$, 则
> $$
> (V,B)\simeq\br{F^2,\pmat{&1\\-1}}^{\oplus n}.
> $$
> 其中直和为正交直和

&emsp;&emsp;*→ Proof.* 取 Lagrange 子空间 $L$, 由此生成辛基 $\seq p1n,\seq q1n$, 考虑
$$
V=\bigoplus_{i=1}^n(Fp_i\oplus Fq_i)
$$
其中 $F^2\overset\sim\to Fp_i\oplus Fq_i,~(a,b)\mapsto ap_i+bq_i$.


# 第九章 实内积结构

## $\S9.2$ 内积空间

> **定义 9.2.1**
>
> &emsp;&emsp;对 $\R$-线性空间 $V$ 和双线性形式 $(\cdot\mid\cdot):V\x V\to\R$, 如果 $(\cdot\mid\cdot)$ 正定且对称, 则称 $(\cdot\mid\cdot)$ 是 $V$ 上的内积, $(V,(\cdot\mid\cdot))$ 称为一个内积空间.

&emsp;&emsp;可以看出, 若 $\dim V<\oo$, 那么 $(\cdot\mid\cdot)$ 总是非退化的.

> **定义 9.2.2**
>
> &emsp;&emsp;在内积空间中, 定义
>
> - $v\perp v'\Eq (v\mid v')=0$;
> - $\|v\|:=\sqrt{(v\mid v)}$;
> - $v$ 是单位向量等价于 $\|v\|=1$;
> - $V_0^\perp:=\{v\in V:\A v_0\in V_0,~v\perp v_0\}$.

&emsp;&emsp;根据 <u>8.4</u> 的讨论,
$$
(v_1\mid v_2)=\frac{1}{2}\br{\|v_1+v_2\|^2-\|v_1\|^2-\|v_2\|^2}.
$$
$v_1\perp v_2$ 时, 这相当于给出了勾股定理.

> **定理 9.2.3 (Cauchy-Bunyakovsky-Schwarz 不等式)**
>
> &emsp;&emsp;在内积空间中, 对任意 $v,w\in V$,
> $$
> (v\mid w)^2\le(v\mid v)(w\mid w),
> $$
> 取等当且仅当 $v$ 与 $w$ 线性相关. *lww: 作为第三方, 我们要采取超然的态度, 把三个人的名字都写上.*

&emsp;&emsp;*→ Proof.* 线性相关时, 设 $v=tw$, 这时根据双线性性容易验证取等.

&emsp;&emsp;线性无关时, $w\neq 0$ 且一切 $v+tw\neq 0$, 由正定性,
$$
0<(v+tw\mid v+tw)=t^2(w\mid w)+2t(v\mid w)+(v\mid v).
$$
即右侧关于 $t\in\R$  的二次函数无实根, 因此
$$
4(v\mid w)^2-4(v\mid v)(w\mid w)<0.
$$
整理即得.

> **推论 9.2.4 (内积空间的三角不等式)**
>
> &emsp;&emsp;在内积空间中, 对任意 $v,w\in V$,
> $$
> \|v+w\|\le\|v\|+\|w\|,
> $$
> 取等当且仅当二者线性相关.

&emsp;&emsp;*→ Proof.* 左右平方得
$$
\env{aligned}{
	\|v+w\|^2 &= \|v\|^2+\|w\|^2+2(v\mid w)\\
	&\le\|v\|^2+\|w\|^2+2|(v\mid w)|\\
	&\overset{\u{Cauchy}}{\le}\|v\|^2+\|w\|^2+2\|v\|\|w\|\\
	&=(\|v\|+\|w\|)^2.
}
$$
取等不难验证.

&emsp;&emsp;据此, 若定义距离函数 $d:V\x V\to\R_{\ge 0},~(v,w)\mapsto\|w-v\|$, 可验证 $(V,d)$ 是度量空间.

&emsp;&emsp;Cauchy 不等式还能帮助定义出向量夹角.

> **定义 9.2.5**
>
> &emsp;&emsp;$0\le\angle(v,w)<\pi$, 由以下给出:
> $$
> \cos\angle(v,w)=\frac{(v\mid w)}{\|v\|\|w\|}.
> $$

&emsp;&emsp;在 $(\R^2,\cdot)$ 中, 这适配于余弦定理.

> **定义 9.2.6**
>
> &emsp;&emsp;对内积空间 $V$ 和 $W$, 若 $T\in\Hom(V,W)$ 满足 $(Tv_1\mid Tv_2)_W=(v_1\mid v_2)_V\Eq\|Tv\|_W=\|v\|_V$, 则称 $T$ 是保距 (isometry) 的.

&emsp;&emsp;保距可以给出单射, 保距的线性同构则给出内积空间的同构, 这时 $T^{-1}$ 自然也是同构.

## $\S9.3$ Gram-Schmidt 正交化

> **定义 9.3.1**
>
> &emsp;&emsp;在内积空间中, 若集合 $S$ 中的向量两两正交, 则称之为正交向量族; 若进一步要求各向量皆为单位向量, 则称之为单位正交向量族; 对有限维向量空间, 由单位正交向量族给出的基称为单位正交基.

> **引理 9.3.2**
>
> &emsp;&emsp;正交向量族必然线性无关.

&emsp;&emsp;*→ Proof.* 若有 $\sum_{s\in S}a_ss=0$, 任取一个 $t\in S$, 两侧同时取内积,
$$
\br{\sum_{s\in S}a_ss\mid t}=\sum_{s\in S}a_s(s\mid t)=a_t(t\mid t)=0.
$$
$(t\mid t)>0$, 则 $a_t=0$.

> **命题 9.3.3**
>
> &emsp;&emsp;对 $(V,(\cdot\mid\cdot))$ 的单位正交基 $\{\seq v1n\}$, 它给出 $(\R,\text{standard inner product})$ 到 $(V,(\cdot\mid\cdot))$ 的同构 :
> $$
> \R^n\to V,\quad (\seq a1n)\mapsto \sum_{i=1}^na_iv_i.
> $$

&emsp;&emsp;*→ Proof.* 利用正交性, 验证 $V$ 上的内积即可.

&emsp;&emsp;事实上任意 $\R^n$ 上的内积都可以写作 $(v\mid w)=v^\T Aw$, 其中 $A$ 是正定对称矩阵. 这里有 $(v\mid w)=v\cdot Aw=Av\cdot w$, 其中 $\cdot$ 为标准内积.

> **定义 9.3.4 (正交直和分解)**
>
> &emsp;&emsp;一个内积空间 $V$ 的正交直和分解指给出其直和分解 $V=V_1\ops\oplus V_m$, 使得 $i\neq j\Ra V_i\perp V_j$.

> **命题 9.3.5**
>
> &emsp;&emsp;对内积空间 $V\supset V_0$, $\dim V_0<\oo$, 有正交直和分解 $V=V_0\oplus V_0^\perp$, 其中 
> $$
> \A v\in V,~v=\sum_{i=1}^n(v_i\mid v)v_i+\br{v-\sum_{i=1}^n(v_i\mid v)v_i}.
> $$

&emsp;&emsp;*→ Proof.* 不难验证左项在 $V_0$ 中, 右项在 $V_0^\perp$ 中 (验证每个 $v_i$ 与其内积为 $0$), 所以至少有 $V=V_0+V_0^\perp$. 而如果 $v\in V_0\cap V_0^\perp$, 则 $(v\mid v)=(v_{\in V_0}\mid v_{\in V_0^\perp})=0$, 即 $v=0$, 由此得证.

> **定理 9.3.6 (Gram-Schmidt 正交化)**
>
> &emsp;&emsp;给定内积空间 $V$ 和其中一列至多可数的线性无关向量 $v_1,v_2,\cdots$, 递归地定义
> $$
> w_1:=v_1,\\
> w_k:=v_k-\sum_{i=1}^{k-1}\frac{(w_i\mid v_k)}{(w_i\mid w_i)}\cdot w_i\quad(k\ge 2).
> $$
> 那么 $w_1,w_2,\cdots$ 是一列单位正交族. 进一步令 $u_k:=w_k/\|w_k\|$, 则得到单位正交向量族. 且
> $$
> \lang\seq v1k\rang=\lang\seq w1k\rang=\lang\seq u1k\rang.
> $$
>

&emsp;&emsp;*→ Proof.* 对 $k\ge 2$ 归纳. 明显有 $w_k\in v_k+\lang\seq w1{k-1}\rang$, 进一步就有 $\lang\seq w1k\rang=\lang\seq w1{k-1}\rang+\lang w_k\rang$, 根据归纳假设就是 $\lang\seq w1k\rang=\lang\seq v1k\rang$. 对正交性, 左右内积 $w_k$ 即可, 这和 <u>命题 9.3.5</u> 的证明如出一辙.

> **推论 9.3.7**
>
> &emsp;&emsp;(i) 所有有限内积空间都有单位正交基.
>
> &emsp;&emsp;(ii) 任何有限维内积空间的单位正交向量族可以扩充为单位正交基.

&emsp;&emsp;*→ Proof.* (i) 任取基 $\seq v1k$, 用 Gram-Schmidt 正交化出 $\seq u1k$.

&emsp;&emsp;(ii) 对给定的 $\seq v1m$, 先扩充为任意基 $\seq v1n$, 用 Gram-Schmidt 正交化出 $\seq w1n$, 此时已经有: $\A i\in[1:m],~v_i=w_i$ (根据定义显然).

&emsp;&emsp;(i) 还说明了 <u>命题 9.3.3</u> 的同构总是存在的, 这相当于给出对实正定二次型的同构.

&nbsp;

&emsp;&emsp;例如, 考虑 $V=\R[X]=\{\text{poly functions on }[-1,1]\}$, $(f_1\mid f_2)=\int_{-1}^1f_1f_2\d x$, 则对 $1,X,X^2,\cdots$ 的 Gram-Schmidt 正交化将给出所谓的 Lagrange 多项式.

&nbsp;

> **命题 9.3.8**
>
> &emsp;&emsp;设 $V_0\sub V$, $\dim V_0<\oo$, $V=V_0\oplus V_0^\perp$, $P:V\overset{\text{proj.}}\emap V_0$, 那么
> $$
> \A u\in V_0,~\arg\min_{v\in V}\|u-v\|=\{v\in V:Pv=u\}.
> $$

&emsp;&emsp;*→ Proof.* 考虑直和分解, $\|u-v\|^2=\|(u-v_0)-v_1\|^2=\|u-v_0\|^2+\|v_1\|^2\ge\|v_1^2\|$, 取等时便要求 $u=v_0$.

## $\S9.4$ 内积空间上的伴随映射和正交变换

> **命题 9.4.1**
>
> &emsp;&emsp;线性映射 $T$ 是内积空间 (皆非退化) $(V,(\cdot\mid\cdot)_V)$ 和 $(W,(\cdot\mid\cdot)_W)$ 的同构, 当且仅当 $T^*=T^{-1}$.

&emsp;&emsp;*→ Proof.* 左推右, 直接验证:
$$
(Tv\mid w)_W=(Tv\mid TT^{-1}w)_W=(v\mid T^{-1}w)_V=(v\mid T^*w)_V
$$
由 $v,w$ 任意性, $T^*=T^{-1}$. 右推左, 注意
$$
(Tv\mid Tw)_W=(v_1\mid T^*Tw)_V=(v\mid w)_V
$$
保距, 所以它自然是同构.

>  **定义 9.4.2**
>
>  &emsp;&emsp;有限维内积空间 $V$ 的自同构称为 $V$ 的正交变换, 根据 <u>命题 9.4.1</u>, 它由 $\{T\in\End(V):T^*=T^{-1}\}$ 给出.

> **命题 9.4.3**
>
> &emsp;&emsp;对两个内积空间 $V,W$, 线性映射 $T$ 是二者间的同构, 等价于
> $$
> \E\text{ONB }\{\seq v1n\}\sub V,~\{\seq{Tv}1n\}\sub W\text{ is ONB}.
> $$

&emsp;&emsp;*→ Proof.* 左推右根据定义. 右推左, 取出这样的 $\seq v1n$, 验证
$$
\br{T\sum_ia_iv_i\mid T\sum_ib_iv_i}_W=\sum_{i,j}a_ib_i(Tv_i\mid Tv_j)_W=\cdots
$$
不难看出了. *ONB 这个缩写实在是丑得没边喵.*

> **定义-命题 9.4.5 (正交变换)**
>
> &emsp;&emsp;现取定 $V=\R^n$, $(\cdot\mid\cdot)=\cdot$ (标准内积), 则对 $A\in\M_{n\x n}(\R)\simeq\End(\R^n)$, T.F.A.E.
>
> &emsp;&emsp;(i) $A^\T A=\bs 1$;
>
> &emsp;&emsp;(ii) $AA^\T=\bs 1$;
>
> &emsp;&emsp;(iii) $A$ 是正交变换.

&emsp;&emsp;*→ Proof.* $\dedu{i}{ii}$ 和 $\dedu{ii}{i}$ 是明显的. $\u{(iii)}$ 与前两者的等价性由 <u>命题 9.4.1</u> 给出.

&nbsp;

&emsp;&emsp;注意以下事实:

> **命题 9.4.6**
>
> &emsp;&emsp;对 $\M_{n\x n}(\R)$ 内的矩阵:
>
> &emsp;&emsp;(i) $\bs 1_{n\x n}$ 是单位正交的;
>
> &emsp;&emsp;(ii) 正交的 $A,B$ 满足 $AB$ 也正交;
>
> &emsp;&emsp;(iii) 正交的 $A$ 满足 $A^{-1}$ 也正交;
>
> &emsp;&emsp;(iv) 正交的 $A$ 满足 $\det A=\pm 1$ ($\det A^\T A=(\det A)^2=1$);
>
> &emsp;&emsp;(v) 若 $A=\pary{c|c|c|c}{v_1&v_2&\cdots&v_n}$, 则 $A$ 正交当且仅当 $\{\seq v1n\}$ 是单位正交基;
>
> &emsp;&emsp;(vi) 正交的 $A$ 满足 $A^\T$ 也正交 ($A^\T A=A^\T(A^\T)^\T=\bs 1$).

&nbsp;

&emsp;&emsp;一个有趣的例子: 设 $P$ 是投影, 则 "镜射" $2P-\id$ 既是自伴的也是正交的. 即:

- $(2P-\id)^*=2P^*-\id^*=2P-\id$;
- $(2P-\id)^*(2P-\id)=4P^2-4P+\id=\id$.

## $\S9.5$ 自伴算子的正交对角化

> **引理 9.5.1**
>
> &emsp;&emsp;对内积空间 $V$ 和 $T\in\End(V)$, 设 $V_0$ 为一个 $T$-不变子空间, 则 $V_0^\perp$ 是 $T^*$-不变子空间.

> **定理 9.5.2**
>
> &emsp;&emsp;对有限维内积空间 $V$, 自伴的 $T\in\End(V)$ 满足: 存在 ONB $\seq v1n$, 使得每个 $v_i$ 都是 $T$ 的特征向量.
>
> &emsp;&emsp;(Equally, 存在正交的 $P$ 使得 $P^{-1}AP$ 对角, 称 $T$ 可正交对角化; 它又因 $P^\T=P^{-1}$ 而被合同地化到对角矩阵.)

&emsp;&emsp;*→ Proof.* 对 $n\ge 2$ 归纳. 根据 <u>引理 9.5.5</u>, 取相应的单位特征向量 $v_1$, 那么
$$
V=\lang v_1\rang\oplus\lang v_1\rang^\perp,
$$
结合 <u>引理 9.5.1</u>, 两个子空间均 $T$-不变且 $T$ 在子空间上仍然自伴. 根据归纳假设, 能够取出 $\lang v_1\rang^\perp$ 的单位正交基 $\seq v2n$ 连同 $\seq\lambda 2n$, 这样 $\{\seq v1n\}$ 就给出了 $V$ 的单位正交基.

> **推论 9.5.3**
>
> &emsp;&emsp;若自伴的 $T$ 有两个特征值 $\lambda\neq\mu$, 那么 $V_\lambda\perp V_\mu$.

&emsp;&emsp;*→ Proof.* 根据定理显然. 或者, 考虑 $v\in V_\lambda$ 和 $w\in V_\mu$, 则
$$
\lambda(v\mid w)=(Tv\mid w)=(v\mid Tw)=\mu(v\mid w)\Ra (v\mid w)=0.
$$
&emsp;&emsp;由于特征子空间间两两正交, 所以可以通过对每个子空间的任意基做 Gram-Schmidt 正交化, 然后合并这些基就能得到 $V$ 的单位正交基.

&emsp;&emsp;上文所使用的 <u>引理 9.5.5</u> 更容易在 $\C$ 上证明. 定义 $\ol A:=(\ol{a_{ij}})$, $A^\dagger:=\ol A^\T$. *lww: $\dagger$ 这个东西应该用毛笔写, 是悬针的笔法.* 明显 $(A+B)^\dagger=A^\dagger+B^\dagger$, $(AB)^\dagger=B^\dagger A^\dagger$, $A^{\dagger\dagger}=A$, 向量 $v^\dagger v=\sum|z_i|^2\ge 0$.

> **引理 9.5.4**
>
> &emsp;&emsp;设 $A\in\M_{n\x n}(\C)$ 满足 $A^\dagger=\epsilon A$, 则 $A$ 的所有特征值满足 $\ol\lambda =\epsilon\lambda$.

&emsp;&emsp;*→ Proof.* 设 $v$ 是 $\lambda$ 对应的特征向量, 考虑
$$
v^\dagger(A v)=\lambda(v^\dagger v),
$$
两侧取共轭转置, 左侧给出
$$
(v^\dagger(A v))^\dagger=v^\dagger A^\dagger v=\epsilon v^\dagger Av=\epsilon\lambda (v^\dagger v);
$$
右侧给出
$$
(\lambda(v^\dagger v))^\dagger=\ol\lambda v^\dagger v.
$$
(注意 $v\neq 0$, $v^\dagger v\in\R^+$.) 两侧消去 $v^\dagger v$ 即得 $\epsilon\lambda=\ol\lambda$.

> **引理 9.5.5**
>
> &emsp;&emsp;自伴的 $T\in\End(V)$ 有实特征值.

&emsp;&emsp;*→ Proof.* $T$ 作为矩阵 $A$ 满足 $A^\T=A$, 运用代数基本定理取出 $A$ 的任意特征值 $\lambda_1\in\C$, <u>引理 9.5.4</u> 立即给出实际上 $\lambda_1\in\R$.

> **定理 9.5.6 (主轴定理)**
>
> &emsp;&emsp;对有限维实内积空间 $V$, $(V,B)$ 是二次型, 则存在 $V$ 的 ONB 使得 $B$ 对应的矩阵是对角矩阵.

&emsp;&emsp;*→ Proof.* 不妨  $V=\R^n$, 内积为标准内积. 设 $B(v,w)=v^\T Aw$, <u>定理 9.5.2</u> 给出存在 $P=\pary{c|c|c|c}{v_1&v_2&\cdots&v_n}$, 使得 $P^{-1}AP=\diag(\seq\lambda 1n)$. 因此
$$
B(v_i,v_j)=v_i^\T Av_j=e_i^\T P^\T APe_j=e_i^\T\diag(\seq\lambda 1n)e_j=[i=j]\lambda_i.
$$
这就是我们所求的 ONB.

## $\S9.6$ 应用: 最小二乘解

> **定义 9.6.1**
>
> &emsp;&emsp;对有限维向量空间间的线性映射 $T:V\to W$, 给定 $w\in W$, 使得 $\| Tv-w\|_W$ 最小的 $v\in V$ 称为方程 $Tv=w$ 的最小二乘解.

> **引理 9.6.2**
>
> &emsp;&emsp;给定如上的 $w\in W$, 考虑以 $\im T$ 上的投影分解: $w=w'+w''$, 其中 $w'\in\im T$, $w''\in(\im T)^\perp$, 则 $v$ 是最小二乘解当且仅当 $Tv=w'$ (也即是 $Tv-w'\in(\im T)^\perp$).

&emsp;&emsp;*→ Proof.* $\min_{v\in V}\|Tv-w\|=\min_{u\in\im T}\|u-w\|=\min_{u\in\im T}\|(u-w')+w''\|$. 而 $u-w'\perp w''$, 自然当且仅当 $u=w'$ 时取极小值.

&emsp;&emsp;最小二乘解明显不一定唯一, 但 $v+\ker T$ 是唯一的. 若记 $v$ 在 $(\ker T)^\perp$ 上的投影记作 $S(w)$, 则可以验证 $S:W\to V$ 是一个线性映射, 被称为 $T$ 的 Moore-Penrose 广义逆.

> **定理 9.6.3**
>
> &emsp;&emsp;$w\in W$ 给定, 则其最小二乘解集:
> $$
> \l\{v\in V:\text{least square solutions to }Tv=w\r\}=\l\{v\in V:T^*Tv=T^*w\r\}.
> $$

&emsp;&emsp;*→ Proof.* 若 $v\in\opn{LHS}$, 则根据引理, 这等价于 $Tv$ 为 $w$ 在 $\im T$ 的投影, 即 $(Tv-w)\in(\im T)^\perp$, 也等价于 $\A v'\in V,~(Tv-w\mid Tv')_W=0$. 移动 $T$ 便可知 $T^*Tv=T^*w$ (左侧与任何向量内积为 $0$).

> **推论 9.6.4**
>
> &emsp;&emsp;对如上的 $T:V\to W$, 有性质:
>
> - $\im(T^*T)=\im T^*$, $\im(TT^*)=\im T$;
> - $\ker(T^*T)=\ker T$, $\ker(TT^*)=\ker T^*$;
> - $\rank(T^*T)=\rank T$, $\rank(TT^*)=\rank(T^*)$.

&emsp;&emsp;*→ Proof.* (i) 明显 $\im(T^*T)\sub\im T^*$, 只需验证反方向成立. 给定 $T^*w\in\im T^*$, 取方程 $Tv=w$ 的最小二乘解 $v\in V$, 这给出 $T^*w=T^*Tv\in\im(T^*T)$.

&emsp;&emsp;(ii) 明显 $\ker(T^*T)\supset\ker T$. 反方向, 若 $T^*Tv=0$, 则 $(Tv\mid Tv)_W=(T^*Tv\mid v)_W=0$, 所以 $Tv=0$.

&emsp;&emsp;(iii) $\rank(T^*T)=\dim V-\dim\ker(T^*T)=\dim V-\dim\ker T=\rank T$.

> **命题 9.6.5**
>
> &emsp;&emsp;前文语境下, $\ker(T^*)=(\im T)^\perp$.

&emsp;&emsp;*→ Proof.* $T^*w=0$ 给出 $\A v\in V,~(Tv\mid w)_W=0$, 这就是 $w\in(\im T)^\perp$. (均为等价关系.)

> **命题 9.6.6**
>
> &emsp;&emsp;前文语境下, $\rank T^*=\rank T$.

&emsp;&emsp;*→ Proof.* 取定有序基, $T$ 等同于矩阵 $A$, 那么 $T^*=PA^\T Q$, 其中 $P,Q$ 可逆, 再利用 $\rank A=\rank A^\T$ 即得.

&emsp;&emsp;或者, 考虑 $\rank T=\dim V-\dim\ker T=\dim(\ker T)^\perp=\dim(\im T^*)=\rank T^*$.

## $\S9.7$ 对于正定二次型的应用

> **定理 9.7.1**
>
> &emsp;&emsp;实对称矩阵 $A\in\M_{n\x n}(\R)$ 正定 (或半正定) 当且仅当 $A$ 的所有特征值皆为正 (或皆非负).
>
> &emsp;&emsp;(实对称矩阵正定指: 其对应的 $n$ 元实二次型 $f$ 正定.)

&emsp;&emsp;*→ Proof.* <u>定理 9.5.2</u> 给出 $P^{-1}AP=P^\T AP=\diag(\seq\lambda 1n)$, 在合同意义下, 能进一步令 $\lambda_i\in\{-1,0,1\}$ (保持正负性), 在共轭意义下就给出所期待的特征值正负性了.

> **定理 9.7.2 (Sylvester 判准)**
>
> &emsp;&emsp;实对称矩阵 $A\in\M_{n\x n}(\R)$ 正定当且仅当 $A$ 的所有顺序主子式都为正数.
>
> &emsp;&emsp;(顺序 $A$ 的主子式: $|a_{ij}|_{1\le i,j\le m\le n}~(\A m)$).

&emsp;&emsp;*→ Proof.* 左推右, $A$ 正定, 则 <u>定理 9.7.1</u> 给出其特征值皆正, 这至少给出 $\det A>0$. 对 $1\le k\le n$,  $A_k$ 无非对应二次型
$$
f_k=f(\seq X1k,0,\cdots,0),
$$
其中 $f$ 由 $A$ 给出正定, $f_k$ 自然也正定, 反过来就给出 $\det A_k>0$.

&emsp;&emsp;右推左, 对 $n\ge 2$ 归纳. 由于 $\det A>0$, 这至少给出所有特征值非零, 且负数成对出现. 若取出 $\lambda_1,\lambda_2<0$, 分别对应单位特征值 $v_1,v_2$, 那么
$$
\env{aligned}{
	f(\alpha v_1+\beta v_2) &= (\alpha v_1+\beta v_2)^\T A(\alpha v_1+\beta v_2)\\
	&= \alpha^2v_1^\T Av_1+2\alpha\beta v_1^\T Av_2+\beta^2v_2^\T A v_2\\
	&= \alpha^2\lambda_1+\beta^2\lambda_2\le 0.
}
$$
(取等当且仅当 $\alpha=\beta=0$.) 然而, 当 $(\alpha,\beta)\neq(0,0)$ 时, 总是存在某对 $(\alpha,\beta)$ 使得 $\alpha v_1+\beta v_2=\pary{c|c}{w^\T&0}^\T$, 其中 $w\in\R^{n-1}$, 于是 $f(\alpha v_1+\beta v_2)=f(w)<0$, 与归纳假设矛盾.

&nbsp;

&emsp;&emsp;对正定矩阵的构造: 对任意 $A\in\M_{m\x n}(\R)$, $A^\T A$ 是对称的, 且是半正定的, 这时因为 $v^\T A^\T Av=(Av)^\T(Av)\ge 0$ (取等当且仅当 $Av=0$). 所以 $\ker A=\{0\}$ (generally "invertible") 时它还是正定的.

> **定义-命题 9.7.3**
>
> &emsp;&emsp;对有限维实内积空间 $V$ 以及自伴的 $T\in\End(V)$, 若 $T$ 正定 (半正定), 则存在唯一的自伴矩阵 $S$, 使得 $S$ 也正定 (半正定), 且 $S^2=T$, 合理地定义为 $\sqrt{T}:=S$.

&emsp;&emsp;*→ Proof.* 存在性: 取单位正交基 $\seq v1n$, 令 $Sv_i=\sqrt{\lambda_i}v_i$ 则给出一个合法的 $S$.

&emsp;&emsp;唯一性: 对符合条件的 $S$, 不计重数地降序列出其特征值 $\mu_1\ops>\mu_m\ge 0$, 则 $V$ 相应分解为
$$
V=\bigoplus_{i=1}^m V_{\mu_i}.
$$
由于 $T=S^2$, 所以 $T$ 的特征值就是 $\mu_1^2\ops>\mu_m^2\ge 0$, 且 $T$ 的 $\mu_i^2$ 对应的特征子空间就是 $V_{\mu_i}$. 反过来, 对 $T$ 的特征值 $\lambda_1\ops>\lambda_m$, $S$ 限制在 $T$ 的 $\lambda_i$-特征子空间上必然就是 $\sqrt{\lambda_i}\id$.

> **定理 9.7.4 (极分解)**
>
> &emsp;&emsp;对内积空间 $V$ 和可逆的 $T\in\End(V)$, 存在唯一的 $R,U\in\End(V)$, 使得 $R$ 正定, $U$ 是正交变换, 且 $T=RU$.

&emsp;&emsp;*→ Proof.* 唯一性: 若 $T=RU$, 则 $TT^*=RUU^*R=RR^*=R^2$, 所以根据 <u>定义-命题 9.7.3</u>, $R=\sqrt{TT^*}$ 唯一且可逆, $U=R^{-1}T$ 唯一.

&emsp;&emsp;存在性: 取 $R=\sqrt{TT^*}$, $U=R^{-1}T$, 只需证明 $U$ 是正交的. 注意 $(R^{-1})^*=(R^*)^{-1}=R^{-1}$, 所以
$$
U^*=T^*(R^{-1})^*=T^*R^{-1}=T^{-1}\underbrace{TT^*(R^2)^{-1}}_{\id}R=T^{-1}R=U^{-1}.
$$