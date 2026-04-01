&emsp;&emsp;**欢迎勘误.**

&emsp;&emsp;下周还有两节课, 会把张量代数的部分内容补上. 不过反正都在复习了就趁着儿童节发了 www, 标题来自《小孩的歌》！

&emsp;&emsp;仍然可以搜索 lww 笑话 (雾); 注意 *remark* 部分大多是我自己编的, 必然有局限性, 烦请批判看待.

&emsp;&emsp;**\[UPD 25/6/6\]** 补上了. 两节课已经冲刺到范畴论了吗? lww 是个人物.

&emsp;&emsp;**\[UPD 25/11/2\]** 谢罪, 第十一章关于群的变种定义中, 我曾断言 "每个元素各自存在左逆或者存在右逆" 与双边逆元存在性不等价, 然而反例是错误的. 事实上, 这个公理与双边逆元存在性公理等价. 证明已补充在原位.

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

% symbols with parameters
\newcommand{\der}[1]{\frac{\d}{\d #1}}
\newcommand{\ul}[1]{\underline{#1}}
\newcommand{\ol}[1]{\overline{#1}}
\newcommand{\wt}[1]{\widetilde{#1}}
\newcommand{\br}[1]{\l(#1\r)}
\newcommand{\bk}[1]{\l[#1\r]}
\newcommand{\ev}[1]{\l.#1\r|}
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
\newcommand{\lix}[1]{\lim_{x\to #1}}
\newcommand{\ops}[1]{#1\cdots #1}
\newcommand{\seq}[3]{{#1}_{#2}\ops,{#1}_{#3}}
\newcommand{\dedu}[2]{\u{(#1)}\Ra\u{(#2)}}
\newcommand{\prv}[3]{\DS{{\DS #1} \over {\DS #2}}~(#3)}
$$

# 第九章 实内积结构

&emsp;&emsp;(上接上学期笔记 [Note -「A. Algebra 24 Aut.」“还有一束日光正在为你送达” ](https://www.cnblogs.com/rainybunny/p/18637482).)

## $\S9.9$ 奇异值分解

> **定理 9.9.1 (奇异值分解, SVD)**
>
> &emsp;&emsp;对有限维实内积空间间的线性映射 $T:V\to W$, 记 $m=\dim V$, $n=\dim W$, $p=\min\{m,n\}$, 则存在
>
> - $V$ 的单位正交基 $\seq v1m$, $W$ 的单位正交基 $\seq w1n$; 以及
> - 非负实数 $\sigma_1\ops\ge \sigma_p\ge 0$,
>
> 使得
> $$
> Tv_i=\env{cases}{
> 	\sigma_iw_i,&1\le i\le p;\\
> 	0, & i>p.
> }
> $$
> 并且 $\{\seq \sigma 1p\}$ 由 $T$ 唯一确定, 称为 $T$ 的奇异值.

&emsp;&emsp;*→ Proof.* 先证明 $\{\seq\sigma 1p\}$ 的唯一性. 明显 $T^*w_i=[i\le p]\cdot\sigma_iv_i$, 因此
$$
(v_i\mid T^*w_j)=\env{cases}{
	[i=j]\sigma_j,&j\le p;\\
	0,&j>p
}=(Tv_i\mid w_j).
$$
可知 $T^*Tv_i=\sigma_i^2v_i$, 因此 $\{\sigma_1^2\ops,\sigma_p^2,0\cdots,0\}$ 给出了 $T^*T$ 的特征值 (算重数), 是唯一的.

&emsp;&emsp;接下来说明存在性. 由于 $T^*T$ 自伴且半正定, 它总能被正交对角化, 对角化给出 $T^*Tv_i=\lambda_iv_i$. 令 $r=\rank(T^*T)=\rank T$, 则 $r\le p$. 只需要令 $\sigma_i=\sqrt{\lambda_i}$, 直接取 $w_i=\frac{1}{\sigma_i}Tv_i~(1\le i\le r)$. 验证
$$
\env{aligned}{
	(w_i\mid w_j) &= \frac{1}{\sigma_i\sigma_j}(Tv_i\mid Tv_j)\\
	&= \frac{\lambda_j}{\sigma_i\sigma_j}(v_i\mid v_j)\\
	&= [i=j].
}
$$
再将 $\{w_r\}$ 扩充为 $W$ 的单位正交基即可. 其他相关性质不难验证.

&emsp;&emsp;从矩阵的视角, 设 $V=\R^m$, $W=\R^n$, 则 $T$ 可对应 $A\in\M_{n\x m}(\R)$. <u>定理 9.9.1</u> 给出了两个单位正交矩阵 $P=\pmat{v_1&\cdots &v_m}$ 和 $Q=\pmat{w_1&\cdots&w_n}$, 使得存在由 $A$ 唯一确定的 $\{\seq\sigma 1p\}$ 满足:
$$
Q^{-1}AP=\diag(\seq \sigma 1p,0,\cdots).
$$

## $\S9.10$ Moore-Penrose 广义逆

> **定义 9.10.1**
>
> &emsp;&emsp;设 $V,W$ 是 $\R$ 上的有限维内积空间, 给定 $T:V\to W$, 满足以下条件的线性映射 $S:W\to V$ 称为 $T$ 的 Moore-Penrose 广义逆:
>
> - $TST=T$;
> - $STS=S$;
> - $TS=(TS)^*$;
> - $ST=(ST)^*$.

> **定理 9.10.2**
>
> &emsp;&emsp;对任意 $T:V\to W$, 存在唯一 $S:W\to V$ 作为 $T$ 的 M-P 逆.

&emsp;&emsp;*→ Proof.* 先证明存在性. 对给定的 $T$ 和 $v\in V$, 可以唯一地记 $v=v'+v''~(v'\in\ker T,~v''\in(\ker T)^\perp)$, 同理 $w=w'+w''~(w'\in\im T,~w''\in(\im T)^\perp)$. 对任意 $w\in W$, 取 $v\in T^{-1}(w')$, 令 $S:w\mapsto v''$, 由于 $v''$ 只依赖于 $v+\ker T=T^{-1}(w')$, 所以这是良定义的. 可以验证 $S$ 是线性映射, 验证所需性质:

- $STv=Sw'=v''~(\E w)$, 则 $ST$ 是正交投影, 它是自伴的; 由此也容易验证 $TST=T$.
- $TSw=Tv''=Tv=w'~(\E v)$, 所以 $TS$ 也是自伴的; 由此也容易验证 $STS=S$.

这样就构造出了 $T$ 的一个 M-P 逆 $S$.

&emsp;&emsp;唯一性, 设 $S,R$ 都是 $T$ 的 M-P 逆, 欲证 $S=R$.
$$
\env{aligned}{
	S &= STS=S(TS)^*=SS^*T^*=SS^*(TRT)^*\\
	&=SS^*T^*R^*T^*=S(TS)^*(TR)^*=STSTR\\
	&= STR.
}
$$
再有
$$
\env{aligned}{
	R &= RTR=(RT)^*R=T^*R^*R=(TST)^*R^*R\\
	&= T^*S^*T^*R^*R=(ST)^*(RT)^*R=STRTR\\
	&= STR.
}
$$
所以 $S=R$.

> **命题 9.10.3**
>
> &emsp;&emsp;对线性映射 $T:V\to W$, $\dim V,\dim W<\oo$, 设 $r=\rank T$, 奇异值分解给出 $\{v_m\},\{w_n\},\{\sigma\}$, 定义
> $$
> S:W\to V,\quad w_j\mapsto\env{cases}{
> 	\sigma_j^{-1}v_j,&1\le j\le r;\\
> 	0,&r<j\le n.
> }
> $$
> 则 $S$ 是 $T$ 的 M-P 广义逆.

&emsp;&emsp;*→ Proof.* 对任意 $w\in W$, 在 ONB $\{w_n\}$ 下展开得 $w=\sum_{j=1}^na_jw_j$, 同时有 $\im T=\lang \seq w1r\rang$, 所以 $w$ 在 $\im T$ 上的投影即 $w'=\sum_{j=1}^ra_jw_j=:Tv$. 在 $V$ 内, 要求 $v\in\lang\seq v{r+1}m\rang^\perp=(\ker T)^\perp$, 令 $w\overset S\to v$ 即可.

&emsp;&emsp;在矩阵视角下, 对 $T$ 对应的 $Q^\T AP=\diag(\sigma_1\ops,\sigma_r,0,\cdots)$, 我们取了 $S$ 对应的 $P^\T BQ=\diag(\sigma_1^{-1}\ops,\sigma_r^{-1},0,\cdots)$.

## $\S9.11$ 极小化极大原理

&emsp;&emsp;对 $n$ 维实内积空间 $V$, 设 $B:V\x V\to\R$ 为一对称双线性形式, 在上一章讨论过: 唯一存在 $S$ 使得 $B(v_1,v_2)=(v_1\mid Sv_2)$, 明显 $S$ 是自伴的. 正交对角化 $S$, 得到 ONB $\{\seq v1n\}$ 以及对应特征值 $\{\lambda_1\ops\ge\lambda_n\}$.

> **命题 9.11.1**
>
> &emsp;&emsp;上段语境下, $\lambda_1=\max_{\|v\|=1}B(v,v)$, $\lambda_n=\min_{\|v\|=1}B(v,v)$.

&emsp;&emsp;*→ Proof.* 对 $\|v\|=1$, 在 ONB 上 $v=\sum_{i=1}^na_iv_i$, 则有
$$
\lambda_n=\lambda_n\sum_{i=1}^na_i^2\le B(v,v)=\sum_{i=1}^na_i^2\lambda_i\le\lambda_1\sum_{i=1}^na_i^2=\lambda_1.
$$

> **定理 9.11.2 (Courant-Fischer)**
>
> &emsp;&emsp;对上述 $(V,B)$ 和所有 $1\le k\le n$, 都有
> $$
> \lambda_k=\min_{U\sub V,~\dim U=n-k+1}~\max_{v\in U,~\|v\|=1}B(v,v),
> $$
> 以及
> $$
> \lambda_k=\max_{U\sub V,~\dim U=k}~\min_{v\in U,~\|v\|=1}B(v,v).
> $$

&emsp;&emsp;*→ Proof.* 仍然设 $B=(\cdot\mid S(\cdot))$, 将 $S$ 替换为 $-S$ 可在两式互推, 不妨只证明上一式. 对 $U\sub V$, $\dim U=n-k+1$, 有
$$
\dim(U\cap\lang\seq v1k\rang)=n-k+1+k-\dim(U+\lang\seq v1k\rang)\ge 1.
$$
所以能取出 $v=\sum_{i=1}^k a_iv_i\in U$, 同时 $\|v\|=1$. 验证
$$
B(v,v)=(v\mid Sv)=\sum_{i=1}^k\lambda_ia_i^2\ge\lambda_k\sum_{i=1}^ka_i^2=\lambda_k,
$$
所以 
$$
\max_{v\in U,~\|v\|=1}B(v,v)\ge\lambda_k.
$$
现在至少有
$$
\inf_U\max_{v\in U,~\|v\|=1}B(v,v)\ge\lambda_k.
$$
直接取 $U=\lang\seq vkn\rang$ 则能取等.

> *Remark.*
>
> &emsp;&emsp;其实这个定理在几何上非常直观. 如果你很遗憾地只是三维生物, 可以想象 $T\in\End(\R^3)$ 的 $\lambda_2$.

> **命题 9.11.3**
>
> &emsp;&emsp;对有限维实内积空间 $V,W$ 间的线性映射 $T$, 设 $p=\min\{\dim V,\dim W\}$, 取其奇异值分解 $\{\seq\sigma 1p,0,\cdots\}$, 则 $\sigma_1=\max_{v\neq 0}\frac{\| Tv\|}{\|v\|}$, $\sigma_{\dim V}=\min_{v\neq 0}\frac{\|Tv\|}{\|v\|}$.

&emsp;&emsp;*→ Proof.* 在 <u>定理 9.11.2</u> 中取 $S=T^*T$, 则 $\frac{B(v,v)}{(v\mid v)}=\frac{\|Tv\|^2}{\|v\|^2}$, 代入定理的结论即可验证.

## $\S9.12$ Perron-Frobenius 定理

&emsp;&emsp;对 $A,B\in\M_{m\x n}(\R)$, 记 $A\ge B\Eq a_{ij}\ge b_{ij}$, $A>B$ 同理.

> **引理 9.12.1**
>
> &emsp;&emsp;对 $A\in\M_{m\x m}(\R)$ 和向量 $x\in\R^n$, 则:
>
> - 若 $A>0$, $x\ge 0\land x\neq 0$, 则 $Ax>0$;
> - 若 $A\ge 0$, $x\ge 0$, 则 $Ax\ge 0$.

&emsp;&emsp;这是显然的.

> **定义 9.12.2**
>
> &emsp;&emsp;对 $A\in\M_{n\x n}(\C)$, 定义
> $$
> \rho(A)=\max\{|\lambda|:\lambda\in\C\text{ is an eigenvalue of }A\}.
> $$
> 称为 $A$ 的谱半径.

> **定理 9.12.3 (Perron)**
>
> &emsp;&emsp;设 $A\in\M_{n\x n}(\R)$, $A>0$, 那么以下成立:
>
> &emsp;&emsp;(i) $\rho(A)>0$, 同时存在 $v\in\R^n$ 使得 $v>0$ 且 $Av=\rho(A)v$.
>
> &emsp;&emsp;(ii) 若 $\mu\in\C$ 是 $A$ 的特征值, $\mu\neq\rho(A)\Ra|\mu|<\rho(A)$;
>
> &emsp;&emsp;(iii) $\dim V_{\rho(A)}=1$ (即 $\rho(A)$ 对应的特征子空间是一维的).
>
> &emsp;&emsp;(iv) $\rho(A)$ 是 $\Char_A$ 的单根.

&emsp;&emsp;*→ Proof.* (i) 令 $S=\{x\in\R^n:\|x\|=1,x>0\}$. 定义
$$
\mathcal L:S\to\R_{\ge 0},\quad x\mapsto\min\l\{\frac{(Ax)_i}{x_i}:1\le i\le n,x_i\neq 0\r\}.
$$
由于 $S$ 是紧的, $\mathcal L$ 连续, 极值存在. 设极大值 $\rho\in\R_{>0}$ 由 $v\in S$ 取到, 断言有 $Av=\rho v$ 且 $v>0$.

&emsp;&emsp;由于 $\mathcal L(v)=\rho\Ra Av\ge \rho v$. 如果不能取等, 就有 $A(Av-\rho v)>0$. 对足够小的 $\eps>0$, 也有 $A(Av-\rho v)>\eps Av$, 整理得 $A(Av)>(\rho+\eps)Av$. 存在 $t$ 使得 $w:=tAv\in S$, 那么 $Aw>(\rho+\eps)w\Ra\mathcal L(w)\ge\rho+\eps$, 矛盾. 所以已经证明了 $Av=\rho v$. 于是 $v=\rho^{-1}Av>0$.

&emsp;&emsp;(ii) 明显有 $\rho\le\rho(A)$ 和 $\rho(A)>0$, 接下来证明 $\rho=\rho(A)$. 对 $\mu\in\C$ 和 $w\in\C^n\setminus\{0\}$, 若 $Aw=\mu w$, 则有 $\A i,~|(\mu w)_i|=|\mu||w_i|$. 此外明显有 $\abs{\sum_ja_{ij}w_j}\le\sum_ja_{ij}|w_j|$. 令 $w'=\pmat{|w_1|&\cdots&|w_n|}^\T$, 伸缩地取 $\|w'\|=1$. 则 $w'\ge 0$ 且 $Aw'\ge|\mu|w'$, 也就是 $\mathcal L(w')\ge|\mu|$ ($\mu\in\C$ 是任意特征值). 所以 $\rho(A)\ge\rho$, 综上有 $\rho=\rho(A)$.

&emsp;&emsp;另一方面, 如果 $|\mu|=\rho(A)$, 应当有 $|\mu|=\rho(A)\Ra\mathcal L(w')=\max\mathcal L(w)=\rho(A)$, 则 $Aw'=\rho(A)w'=|\mu|w'$, 即上述不等式取等:
$$
\abs{\sum_ja_{ij}w_j}=\sum_ja_{ij}|w_j|.
$$
所以 $\seq w1n$ 在 $\C\simeq\R^2$ 的同一条射线上且不全为 $0$. 因此存在 $c\in\C^\x$, 使得 $c^{-1}w\ge 0$. 那么 $Aw=\mu w\Ra A(c^{-1}w)=\mu(c^{-1}w)$, 推知 $\mu\in\R_{\ge 0}$, 这就有 $\mu=\rho(A)$.

&emsp;&emsp;(iii) 设有 $v,v'\in\R^n$ 都有 $Av=\rho(A)v$, $Av'=\rho(A)v'$, 且 $v,v'>0$, 尝试证明 $v'\in\R v$. 反证, 若非, 总存在 $\eps>0$. 使得 $v-\eps v'\ge 0$ 且存在某一维为 $0$. 于是 $(v-\eps v')=\rho(A)^{-1}A(v-\eps v')$. 但是根据 <u>引理 9.12.1</u>, 这一等式给出 $v-\eps v'>0$, 矛盾.

&emsp;&emsp;(iv) 不妨 $n\ge 2$, 固定 $v>0$, 有 $Av=\rho(A)v$. 由于 $\rho(A)=\rho(A^\T)$, 所以存在 $u\in\R^n$, $u>0$ 且 $A^\T u=\rho(A)u$. 对这样的 $u$, 注意到 $\lang u\rang^\perp$ 是 $A$-不变子空间 ($u^\T x=0\Ra u^\T Ax=(A^\T u)^\T x=\rho(A)u^\T x=0$). 由于 $u\neq 0$, 所以 $\dim\lang u\rang^\perp=n-1$, 且 $v>0\land u>0\Ra u^\T v\neq 0$, 所以 $v\notin\lang u\rang^\perp$, 这给出 $\R^n=\lang v\rang\oplus\lang u\rang^\perp$, 二者都是 $A$-不变子空间. 因此
$$
\Char_A=\Char_{A|_{\lang v\rang}}\Char _{A|_{\lang u\rang^\perp}}.
$$
如果 $(X-\rho(A))^2\mid \Char_A$, 则必须有 $\Char_{A|_{\lang u\rang^\perp}}(\rho(A))=0$,  这就取出了一个 $\rho(A)$ 的特征向量 $v'\in\lang u\rang^\perp$, 然而 $v'\notin\R v$ 与 (iii) 矛盾.

# 第十章 复内积结构

## $\S10.1$ 半双线性形式

> **定义 10.1.1**
>
> &emsp;&emsp;对复向量空间间的映射 $T:V\to W$, 若满足 $T(v_1+v_2)=T(v_1)+T(v_2)$ 且 $T(tv)=\ol tT(v)$, 则称 $T$ 为半线性映射.

> **定义 10.1.2**
>
> &emsp;&emsp;对配备有 $(\cdot\mid\cdot):V\to V\to\C$ 的复向量空间 $V$, 若 $(\cdot\mid\cdot)$ 对第一个参数半线性, 对第二个参数线性; 且满足 $\ol{(v_2\mid v_1)}=(v_1\mid v_2)$, $(v\mid v)\ge 0$, 取等当且仅当 $v=0$, 则称 $(V,(\cdot\mid\cdot))$ 为复内积空间.

&emsp;&emsp;我们希望通过构造使得线性映射的结论能够方便地搬运到半线性映射上.

> **定义 10.1.3**
>
> &emsp;&emsp;对复向量空间 $V$, 其复共轭 $\ol V=(V,+,\odot)$ 由以下给出:
> $$
> \odot:\C\to V\to V,\quad t\odot v:=\ol tv.
> $$

&emsp;&emsp;容易发现:

- $\ol{\ol V}=V$.
- 对复向量空间 $V_1,V_2$, $\ol{V_1\overset{\text{ext}}\oplus V_2}=\ol{V_1}\overset{\text{ext}}\oplus\ol{V_2}$.
- $\varphi:\ol\C\overset\sim\to\C,~z\mapsto\ol z$ 是同构 ($\Ra\ol{\C^n}\simeq\C^n$).
- 半线性映射 $T:V\to W$ 在上述同构下给出线性映射 $\ol V\to W$ 或 $V\to\ol W$, 则 $\Hom(V_1,V_2)=\Hom(\ol{V_1},\ol{V_2})$ (作为集合).
- 将 $\Hom(V_1,V_2)$ 作为 $\C$-向量空间, 则 $\ol{\Hom(V_1,V_2)}=\Hom(\ol{V_1},\ol{V_2})$ (作为向量空间).

&emsp;&emsp;回忆有 $V^\vee=\Hom(V,\C)$, 那么 $\ol V^\vee=\Hom(\ol V,\C)=\ol{\Hom(V,\ol C)}\overset{\ol C\simeq\C}\longleftrightarrow\ol{\Hom(V,\C)}=\ol{V^\vee}$.

> **定义 10.1.4**
>
> &emsp;&emsp;对复向量空间 $V,W,X$, 称映射 $B:V\x W\to X$ 是半双线性 (sesquilinear) 的, 当且仅当 $B$ 在 $V$ 中半线性, 在 $W$ 中线性.

&emsp;&emsp;半双线性映射构成复向量空间. 若取 $X=\C$, 相应地得到半双线性形式.

&emsp;&emsp;仿照对双线性形式的研究, 可以定义半双线性形式 $B$ 的左根和右根. 在 $V,W$ 是有限维的情形, 如果 $B$ 的左右根都是 $\{0\}$, 则称 $B$ 是非退化的. 可推知此时必须 $\dim V=\dim W$. 相关论证见双线性形式的情形, 或者先将 $B$ 转换成双线性形式再套用已有结论.

> **命题 10.1.5**
>
> &emsp;&emsp;设 $m,n\in\Z_{\ge 1}$, 将 $\C^m$ 和 $\C^n$ 的元素视同列向量, 则有向量空间的同构
> $$
> \M_{m\x n}(\C)\overset\sim\to\opn{Sesq_{\C\mid\R}}(\C^m,\C^n),\quad A\mapsto (B(v,w):=v\mapsto w\mapsto v^\dagger Aw).
> $$
> 进一步有
> $$
> B(x^ie_i,y^je_j)=\ol x^ia_i^jy_j,
> $$
> 且 $B$ 非退化当且仅当 $A$ 可逆.

&emsp;&emsp;*→ Proof.* 在同构中, 右侧等同于双线性形式 $\ol{\C^m}\x\C^n\to\C$ 构成的空间, 则也同构于 $\C^m\x\C^n\to\C$ 的空间, 上学期讨论过 (吧) 这也同构于 $\M_{m\x n}(\C)$.

> **定义 10.1.6**
>
> &emsp;&emsp;设 $V$ 是复向量空间, $\epsilon\in\{\pm 1\}$, 若半双线性形式 $B:V\x V\to\C$ 满足
> $$
> B(v,w)=\epsilon\ol{B(w,v)},
> $$
> 则称 $B$ 是 $\epsilon$-Hermite 形式. $\epsilon$ 取 $\pm 1$ 时分别可称为 Hermite 形式和反 Hermite 形式.

&emsp;&emsp;在矩阵上, 若 $B$ 对应矩阵 $A$, 容易验证 $\ol{B(w,v)}$ 对应 $A^\dagger$, 因此条件就要求 $A=\epsilon A^\dagger$, 这样的矩阵也称为 Hermite 矩阵. $\epsilon$-Hermite 的半双线性形式 $B$ 明显具有相同的左根和右根.

> **定义-命题 10.1.7**
>
> &emsp;&emsp;对有限维空间间的两个半双线性形式 $B_1:V_1\x V_1'\to\C$ 和 $B_2:V_2\x V_2'\to\C$, 且 $B_1$ 非退化, 则:
>
> &emsp;&emsp;(i) 存在唯一的半线性映射 $\Hom(V_1,V_2)\to\Hom(V_2',V_1'),~T\mapsto T^*$ 使得 $B_2(T(\cdot),\cdot)=B_1(\cdot,T^*(\cdot))$.
>
> &emsp;&emsp;(ii) 存在唯一的半线性映射 $\Hom(V_1',V_2')\to\Hom(V_2,V_1),~T\mapsto{}^*T$ 使得 $B_2(\cdot,T(\cdot))=B_1(^*T(\cdot),\cdot)$.

&emsp;&emsp;*→ Proof.* 可以照搬双线性形式的证明或者先取共轭将 $B_1,B_2$ 转成双线性形式. 此外, up to 同构, 可以令 $V_i=\C^{m_i}$, 则 $B_i$ 对应矩阵 $A_i\in\M_{m_i\x m_i'}(\C)$. 对于 (i), $B_2(Tv_1,v_2')=(Tv_1)^\dagger A_2v_2'=v_1^\dagger(T^\dagger A_2)v_2$, 要求其等于 $v_1^\dagger A_1T^*v_2'$, 所以直接取
$$
T^*=A_1^{-1}T^\dagger A_2
$$
便能确定唯一存在的 $T^*$. (ii) 中类似地, $B_2(v_2,Tv_1')=v_2^\dagger A_2Tv_1'=v_2^\dagger(^*T)^\dagger A_1v_1'$ 也能给出
$$
^*T=(A_2TA_1^{-1})^\dagger=(A_1^{-1})^\dagger T^\dagger A_2^\dagger.
$$
&emsp;&emsp;注意到以下性质:

- $(ST)^*=T^*S^*$, $^*(ST)=^*T^*S$.

- 若 $B_1,B_2$ 皆非退化, $^*(T^*)=T=(^*T)^*$.

- 对 $\epsilon=\pm1$, 若 $B_1,B_2$ 都是 $\epsilon$-Hermite 形式, 那么 $^*T=T^*$. 这是因为
    $$
    B_1(v,Tw)=\epsilon\ol{B_1(Tw,v)}=\epsilon\ol{B_2(w,T^*v)}=\epsilon\ol{\epsilon\ol{B_2(T^*v,w)}}=B_2(T^*v,w).
    $$

> **定义 10.1.8**
>
> &emsp;&emsp;取定非退化的 $\epsilon$-Hermite 形式 $B:V\x V\to\C$ 和 $T\in\End(V)$. 若 $T=T^*$, 则称 $T$ 是自伴的; 若 $T=-T^*$, 则称 $T$ 是反自伴的.

&emsp;&emsp;矩阵意义下, 对给定的 $\epsilon$-Hermite 矩阵 $A$, 相当于有 $A^{-1}T^\dagger A=\pm T$.

&emsp;&emsp;事实上, Hermite 和反 Hermite 性质只差了一个纯虚数的伸缩. 例如矩阵 $A$ 是 Hermite 的当且仅当存在 $c\in i\R\setminus\{0\}$ 使得 $cA$ 是反 Hermite 的.

> **定义 10.1.9**
>
> &emsp;&emsp;对非退化的 $\epsilon$-Hermite 形式 $B:V\x V\to\C$, 称 $T\in\End(V)$ 是正规的, 当且仅当 $TT^*=T^*T$.

## $\S10.2$ Hermite 形式的分类

&emsp;&emsp;自二次型的分类问题推广, 考虑 $n$ 维复向量空间下的 Hermite 形式. 定义资料 $(V,B)$ 与 $(V',B')$ 同构, 当且仅当存在向量空间间的同构保持 $B$ 的结构, 这自然地给出了相应的矩阵定义. 在函数视角下, 考虑函数 $f:\C^n\to\C$, 其中
$$
f(\seq x1n)=\sum_{1\le i,j\le n}a_{ij}\ol{x_i}x_j
$$
使得 $a_{ij}=\ol{a_{ji}}$. 等价关系即变元间存在的可逆 $\C$-线性映射 (换元行为). 以上三种描述原则上两两同构, 也可以互相刻画.

> **命题 10.2.1**
>
> &emsp;&emsp;任何 $n$ 元 $\epsilon$-Hermite 型 $f$ 都同构于形如
> $$
> (\seq x1n)\mapsto\sum_{i=1}^na_{ii}|x_i|^2
> $$
> 的对角型, 其中 $a_{ii}$ 在 $\epsilon=1$ 时为实数, 在 $\epsilon=-1$ 时为纯虚数.

&emsp;&emsp;证明形同 <u>命题 8.5.1</u>.

&emsp;&emsp;对 Hermite 二次型, 进一步取 $y_i=\sqrt{|a_i|}x_i$, 则 $f$ 同构于
$$
|y_1|^2\ops+|y_p|^2-|y_{p+1}|^2\ops-|y_r|^2.
$$
因此也有相同形式的惯性定理 (参考 <u>定理 8.6.3</u>).

## $\S10.3$ 复内积空间和酉变换

> **定义 10.3.1**
>
> &emsp;&emsp;复向量空间 $V$ 上的 Hermite 内积 (复内积) 是 $(\cdot\mid\cdot):V\x V\to\C$, 满足
>
> - $(\cdot\mid\cdot)$ 是 $V$ 上的 Hermite 形式;
> - $(\cdot\mid\cdot)$ 正定.
>
> 此时称 $(V,(\cdot\mid\cdot))$ 为复内积空间, Hermite 空间或酉空间.

&emsp;&emsp;由此可以自然地定义向量长度
$$
\|v\|:=\sqrt{(v\mid v)}.
$$
它满足:

- $\|v\|=0\Eq v=0$;
- $t\in\C\Ra\| tv\|=|t|\sqrt{(v\mid v)}$;
- $\|v+w\|^2=\|v\|^2+\|w\|^2+2\Re(v\mid w)$, 这给出勾股定理.

&emsp;&emsp;如果 $(v\mid w)=0$, 我们仍称他们正交, 记作 $v\perp w$; 如果 $\|v\|=1$, 我们称 $v$ 为单位向量; 类似地定义正交子集和单位正交子集.

&emsp;&emsp;若取定正交基 $\seq v1n\in V$, 则
$$
v=\sum_{i=1}^n a_iv_i\Ra a_i=\frac{(v_i\mid v)}{(v_i\mid v_i)}.
$$
(注意分子上的内积顺序.)

> **定义 10.3.2**
>
> &emsp;&emsp;给定复内积空间 $V$ 和一族子空间 $(V_i)_{i\in I}$, 若:
>
> - $V=\bigoplus_{i\in I}^{\opn{int}}V_i$;
> - $i\neq j\Ra V_i\perp V_j$. ($V\perp W\Eq \A v\in V,~\A w\in W,~v\perp w$.)
>
> 则称 $V=\bigoplus_{i\in I}V_i$ 为 $V$ 的正交直和分解.

> **定理 10.3.3 (Cauchy-Bunyakovsky-Schwarz)**
>
> &emsp;&emsp;对复内积空间 $V$ 和 $v,w\in V$,
> $$
> |(v\mid w)|^2\le(v\mid v)(w\mid w),
> $$
> 且取等当且仅当 $v,w$ 线性相关.

&emsp;&emsp;*→ Proof.* 不妨 $w\neq 0$, 仍然取 $t\in\C$ 并研究线性组合
$$
0\le\|v+tw\|^2=\|v\|^2+2\Re(v\mid tw)+\|tw\|^2,
$$
取 $t=-\frac{(w\mid v)}{(w\mid w)}$, 就有
$$
0\le\|v\|^2-\frac{|(v\mid w)|^2}{(w\mid w)}.
$$
取等不难验证.

> **推论 10.3.4 (三角不等式)**
>
> &emsp;&emsp;对复内积空间 $V$ 和 $v,w\in V$,
> $$
> \|v+w\|\le\|v\|+\|w\|.
> $$
> 且取等当且仅当 $\E t\in\R_{\ge 0},~v=tw\lor w=tv$.

&emsp;&emsp;*→ Proof.* 注意到
$$
\env{aligned}{
	\|v+w\|^2 &= \|v\|^2+\|w\|^2+2\Re(v\mid w)\\
	&\le \|v\|^2+\|w\|^2+2|(v\mid w)|\\
	&\overset{\text{Cauchy}}{\le}\|v\|^2+\|w\|^2+2\|v\|\|w\|\\
	&= (\|v\|+\|w\|)^2.
}
$$

> **定理 10.3.5 (Gram-Schmidt 正交化)**
>
> &emsp;&emsp;对一组线性无关的 $\seq v1n\in V$, 归纳定义
> $$
> w_1=v_1,\quad w_k=v_k-\sum_{i=1}^{k-1}\frac{(w_i\mid v_k)}{(w_i\mid w_i)}w_i.
> $$
> 由此便可给出正交向量组 $\seq w1n$, 且总是有 $\lang\seq v1k\rang=\lang\seq w1k\rang$.

&emsp;&emsp;和实数的情形别无二致. 稍微注意一下内积顺序.

> *Remark.*
>
> &emsp;&emsp;以工具性的视角, Gram-Schmidt 正交化给出了对任意可逆 $A\in\M_{n\x n}(\C)$ 的分解:
> $$
> A=QR,
> $$
> 其中 $Q$ 是酉矩阵, $R$ 是上三角矩阵.

&nbsp;

&emsp;&emsp;不那么平凡的例子: 函数空间. 给定 $a<b$, 则 $[a,b]$ 上的连续复值函数 $C[a,b;\C]$ 是一个 $\C$-向量空间, 进而可以定义内积
$$
(f\mid g)=\int_a^b \ol f(x)g(x)\d x.
$$
容易验证它是 Hermite 形式且正定, 是一个内积. 它也可以用作 $\C[X]$ 上的内积.

> **定义 10.3.6**
>
> &emsp;&emsp;对复内积空间 $V,W$:
>
> - 若线性映射 $T:V\to W$ 满足 $\A v\in V,~\|Tv\|_W=\|v\|_V$, 则称 $T$ 是保距的;
> - 若 $T:V\to W$, $S:W\to V$ 是一对保距映射, 且 $TS=\id_W$, $ST=\id_V$, 则称 $S$ 和 $T$ 是复内积空间互逆的同构.

&emsp;&emsp;注意保距映射必然保持距离, 即 $(Tv_1\mid Tv_2)_W=(v_1\mid v_2)_V$; 可逆的保距映射 $T$ 自然是同构.

> **定义 10.3.7**
>
> &emsp;&emsp;从复内积空间 $V$ 都自身的同构称为 $V$ 上的酉变换 (酉算子).

> **命题 10.3.8**
>
> &emsp;&emsp;$T\in\End(V)$ 是复内积空间 $V$ 上的酉变换, 当且仅当 $T^*=T^{-1}$. 同理定义矩阵语言下的酉矩阵.

&emsp;&emsp;&emsp;这与先前的讨论无异. 对酉矩阵 $P=\pmat{v_1&\cdots&v_n}$, 由于
$$
P^\dagger P=(v_i\mid v_j)_{ij}=\bs 1,
$$
因此 $\{\seq v1n\}$ 构成 $\C^n$ 的一组标准正交基.

## $\S10.4$ 正规算子的酉对角化

&emsp;&emsp;回忆正规算子 $T\in\End(V)$ 即满足 $TT^*=T^*T$ 的算子. 我们希望证明的是:

> **定理 10.4.1 (正规算子的谱分解)**
>
> &emsp;&emsp;设 $T\in\End(V)$, 则 $T$ 是正规算子, 当且仅当 $T$ 能被单位正交基对角化. 

&emsp;&emsp;联系上一节, 在矩阵语言中, 这相当于是说 $T$ 对应的矩阵 $A$ 能被一个酉矩阵 $P$ 对角化.

&emsp;&emsp;*→ Proof.* 右推左是容易的. 不妨在 $\C^n$ 上考察, 可以直接用 $P\diag(\seq\lambda 1n)P^\dagger$ 的对角形式验证矩阵乘法. 或者验证 $T^*v_i=\ol{\lambda_i}v_i$, 进而 $TT^*=T^*T:v_i\mapsto|\lambda_i|^2v_i$. 另一方向的证明我们稍后提及, 大致思路是分别讨论自伴和反自伴算子的对角化, 然后将任意正规算子分解为二者, 同时正规性保证二者乘积交换, 可以同步对角化.

> **命题 10.4.2**
>
> &emsp;&emsp;任何 $T\in\End(V)$ 都能唯一分解为 $T=T'+T''$, 使得 $(T')^*=T'$, $(T'')^*=-T''$.

&emsp;&emsp;*→ Proof.* 我们在某次作业中应该证明过类似结论. 这里只给出
$$
T=\frac{T+T^*}{2}+\frac{T-T^*}{2}.
$$
注意 $T$ 正规时 $T'T''=T''T'$.

> **命题 10.4.3**
>
> &emsp;&emsp;对 $T$-不变子空间 $V_0\sub V$, 一定有 $T^*(V_0^\perp)\sub V_0^\perp$.

&emsp;&emsp;*→ Proof.* 对 $v\in V_0^\perp$ 和任意 $v_0\in V_0$, 注意到
$$
(T^*v\mid v_0)=(v\mid Tv_0)=0,
$$
所以 $T^*v\in V_0^\perp$.

&emsp;&emsp;*→ Proof @ 10.4.1 Cont.* 左推右, 先讨论 $T=T^*$ 的情况. 由于 $(Tv\mid v)=\ol{(v\mid Tv)}=(v\mid Tv)\in\R$, 所以 $T$ 的所有特征值都是实数. 基于此, 取 $\lambda_1\in\R$ 和对应的 $v_1$, 设 $V=\lang v_1\rang\oplus\lang v_1\rang^\perp$, 这两个子空间都是 $T$-不变子空间, 则 $T$ 在这两个子空间上的限制都是自伴的. 现在对维数 $n=\dim V$ 归纳. 假设已经存在 $T|_{\lang v_1\rang^\perp}$ 的酉对角化 $\seq v2n$ 以及 $\seq\lambda 2n$, 在其中加入 $v_1$ 和 $\lambda_1$ 即可.

&emsp;&emsp;再讨论 $T^*=-T$ 的情况, 构造 $(\sqrt{-1}T)^*=\sqrt{-1}T$, 上述讨论给出了 $\sqrt{-1}Tv_i=\mu_iv_i$, 取 $\lambda_i=-\sqrt{-1}\mu_i$ 即可 (这也给出 $\lambda_i\in\R\sqrt{-1}$).

&emsp;&emsp;最后讨论一般的情况, 利用 <u>命题 10.4.2</u> 分解为 $T=T'+T''$, 则 $T'T''=T''T'$. 利用 <u>高代 I 作业十一 9.(ii)</u>, 它们能被同步对角化, 同样的手法能够取出将它们同步正交对角化的基, 这样就给出了 $T$ 的酉正交化.

&emsp;&emsp;总结一下自伴性与特征值的关系:

- $T^*=T\Ra \lambda_i\in\R$;
- $T^*=-T\Ra\lambda_i\in\R\sqrt{-1}$;
- $T^*=T^{-1}\Ra|\lambda_i|=1$.

仍然用酉正交化的手法即可证明上述结论.

## $\S10.5$ 实定理的复推广

> **定理 10.5.1**
>
> &emsp;&emsp;对 $n$ 元 Hermite 型 $f:\C^n\to\C$, 对应 Hermite 矩阵 $A$, 则 $f$ 正定 (半正定) 当且仅当 $A$ 的所有特征值为正 (非负).

&emsp;&emsp;*→ Proof.* 谱分解给出, 存在酉矩阵 $C$ 使得 $C^\dagger AC=\diag(\seq\lambda 1n)$, 其中 $\lambda_i\in\R$. 因此
$$
f\simeq\sum_{i=1}^n\lambda_i|x_i|^2.
$$
最后将 $|x_i|$ 伸缩到 $\{-1,0,1\}$ 内即可.

&emsp;&emsp;(此后谈论 $T\in\End(V)$ 的正定性时, 总默认 $T$ 是自伴的.)

&emsp;&emsp;<u>作业二 2.(iii)</u> 给出, $T^*T$ 总是半正定的, 因为它的所有特征值是非负实数. 进一步, $T^*T$ 正定当且仅当 $\ker T=\{0\}$; $TT^*$ 正定当且仅当 $\ker T^*=\{0\}$, 事实上这里有 $\ker T^*=(\im T)^\perp$.

> **定义-命题 10.5.2**
>
> &emsp;&emsp;若 $T\in\End(V)$ 正定, 则存在唯一的 $S\in\End(V)$ 正定, 使得 $S^2=T$, 记作 $\sqrt T:=S$.

&emsp;&emsp;*→ Proof.* 由于 $T$ 的特征值总是正实数, 可以直接照搬 $\R$ 上的证明.

> **定理 10.5.3 (极分解)**
>
> &emsp;&emsp;对可逆的 $T\in\End(V)$, 存在唯一的 $(R,U)$, 使得 $T=RU$, 其中 $R=R^*$ 正定, $U$ 酉.

&emsp;&emsp;取 $V=\C$, 总能写出 $z=re^{i\theta}$, 这其实是极分解的一个特例.

&emsp;&emsp;*→ Proof.* 取 $R=\sqrt{TT^*}$ 即可, 仍然可见 $\R$ 上的证明.

> *Bonus.*
>
> &emsp;&emsp;一个比较常用 *(指 lww 经常写作提示)* 的结论是, $R$ 总能被 $R^2$ 的多项式表出. 具体地, 上文语境下, 存在 (不超过 $n$ 次的) 多项式 $f\in F[X]$, 使得 $f(R^2)=R$.
>
> &emsp;&emsp;证明如下. 不妨在对角化 $R$ 的基下考虑, 这时 $R=\diag(\seq\lambda1n)~(\lambda_i>0)$, 则只需要指定 $f(\lambda_i^2)=\lambda_i$, Lagrange 插值就能取出目标的 $f$. 正定性是必要的, 因为我们需要保证插值时 $x$ 不同 $\Ra$ $y$ 不同. 例如 $R=\pmat{1\\&-1}$ 会给出反例.

> **定理 10.5.4 (奇异值分解)**
>
> &emsp;&emsp;设复内积空间 $V,W$ 的维数分别为 $m,n$, $T\in\Hom(V,W)$, 令 $p=\min\{m,n\}$, 则存在单位正交基 $\{\seq v1m\}$, $\{\seq w1n\}$ 和一列实数 $\{\sigma_1\ops\ge\sigma_p\ge 0\}$, 使得 $Tv_i=[i\le p]\sigma_iw_i$. 且其中 $\{\seq\sigma 1p\}$ 被 $T$ 唯一确定, 称为 $T$ 的奇异值.

&emsp;&emsp;证明和实数的情况是一样的. 矩阵语言: 存在酉矩阵 $P\in\M_{m\x m}(\C)$, $Q\in\M_{n\x n}(\C)$, 使得 $Q^\dagger AP=\diag(\seq\sigma 1p)_{n\x m}$.

> **定义-命题 10.5.5 (Moore-Penrose 广义逆)**
>
> &emsp;&emsp;对 $T\in\Hom(V,W)$ ($V,W$ 性质同上), 存在唯一 $S\in\Hom(W,V)$, 称为 $T$ 的 MP 逆, 使得
>
> - $TST=T$;
> - $STS=S$;
> - $(TS)^*=TS$;
> - $(ST)^*=ST$.

&emsp;&emsp;$S$ 的构造方式仍是: 取 $T$ 的奇异值分解 $\{\seq v1m\}$, $\{\seq w1n\}$, $\{\sigma_1\ops\ge\sigma_p\}$, 则 $Sw_j=[j\le\rank(T)]\sigma_j^{-1}v_j$.

## $\S10.6$ 实正交变换的标准形

> **引理 10.6.1**
>
> &emsp;&emsp;对实内积空间上的正规算子 $T$, 则若存在 $k\ge 0$ 使得 $T^k=0_V$, 就必有 $T=0_V$.

&emsp;&emsp;*→ Proof.* 考虑 $T$ 对应的矩阵 $A\in\M_{n\x n}(\R)$, 谱定理给出 $P^\dagger AP=\diag(\seq\lambda 1n)$, 检查 $k$ 次幂后的对角元可知, 满足条件当且仅当所有特征值为 $0$.

&emsp;&emsp;接下来关注对实内积空间上的正交算子的分类. 对 $n=2$, 设其一单位向量为 $(\cos\theta,\sin\theta)$, 则与之正交的单位向量无非 $\pm(-\sin\theta,\cos\theta)$, 正负号决定了行列式的正负号

> **定义 10.6.2**
>
> &emsp;&emsp;当上述行列式为 $1$, 定义
> $$
> R(\theta)=\pmat{\cos\theta&-\sin\theta\\\sin\theta&\cos\theta}.
> $$
> 它给出逆时针旋转 $\theta$ 的线性变换.

&emsp;&emsp;容易看出
$$
R(\theta_1+\theta_2)=R(\theta_1)R(\theta_2),\quad R(0)=R(2\pi)=\bs 1,\quad R(\pi)=-\bs 1.
$$

> **引理 10.6.3**
>
> &emsp;&emsp;对 $2\x 2$ 的正交矩阵 $P$, $\det P=\eps\in\{\pm 1\}$, 则
> $$
> P^\T R(\theta)P=R(\eps\theta).
> $$

&emsp;&emsp; *→ Proof.* $\eps=1$ 时, $P=R(\psi)$, $P^\T=R(-\psi)$, 直接验证; $\eps=-1$ 时, $P=R(\psi)\diag(1,-1)$, 同样验证即可.

> **定理 10.6.4**
>
> &emsp;&emsp;对 $n$ 维实内积空间 $V$ 和其上的正交算子 $T$, 则存在单位正交基使得 $T$ 有分块:
> $$
> T=\pary{c|c|c|c|c}{
> \bs1_{a\x a}\\ \hline
> &\bs-1_{b\x b}\\ \hline
> &&R(\theta_1)\\ \hline
> &&&\ddots\\ \hline
> &&&&R(\theta_m)
> }.
> $$
> 其中 $a+b+2m=n$, $\theta_i\notin\pi\Z$.

&emsp;&emsp;*→ Proof.* 设 $S=T+T^{-1}$, 由 <u>引理 10.6.5</u>, $S$ 的特征空间给出 $V$ 的直和分解 $V=\bigoplus V_\lambda$. 注意 $TS=T^2+1=ST$, 则对所有 $\lambda$, $V_\lambda$ 都是 $T$-不变子空间, $T|_{V_\lambda}$ 仍然是正交变换. 现在, 只需要处理 $V=V_\lambda~(\lambda\in[-2,2])$ 的情况.

&emsp;&emsp;现在有 $T+T^{-1}=\lambda\id_V$, 即 $T^2-\lambda T+\id_V=0_V$. 如果 $\lambda=\pm 2$, 有 $(T\mp\id_V)^2=0$, 满足要求; 否则 $|\lambda|<2$, $X^2-\lambda X+1=0$ 无实根, 在 $\R[X]$ 上不可约, 这相当于 $\Min_T=X^2-\lambda X+1$, 因此 $T$ 无实特征值.

&emsp;&emsp;固定 $0\neq v\in V$, 则 $v,Tv$ 必然线性无关, 令 $W=\lang v,Tv\rang$, $\dim W=2$. 注意到
$$
(T^2-\lambda T+\id_V)v=T(Tv)-\lambda(Tv)+v=0,
$$
可知 $W$ 是 $T$-不变子空间. 所以 $W^\perp$ 同时是 $T^{-1}=T^*$-不变子空间. 比较维数可知 $T^{-1}(W^\perp)=W^\perp$, $T(W^\perp)=W^\perp$. 那么 $T$ 在 $V=W\oplus W^\perp$ 上分块对角, 可以归纳.

&emsp;&emsp;最后只剩下 $\dim V=2$ 的情况, 这时 $\Char_T=X^2-\lambda X+1$, $\det T=1$, 因此 $T=R(\theta)$. $|\lambda|<2$ 保证了 $\theta\notin\pi\Z$.

> **引理 10.6.5**
>
> &emsp;&emsp;对实内积空间上的正交算子 $T$, $T+T^{-1}$ 是自伴的, 且特征值 $\in[-2,2]$.

&emsp;&emsp;*→ Proof.* $(T+T^{-1})^*=T^*+T^{**}=T^{-1}+T$ 自伴. 不妨 $V=\R^n$, 设 $T$ 对应矩阵 $A$, 则存在酉矩阵 $P$ 使得
$$
P^{-1}AP=\diag(\seq\lambda 1n),\quad |\lambda_i|=1,~\lambda_i\in\C.
$$
这样
$$
P^{-1}(T+T^{-1})P=\diag(\lambda_1+\lambda_1^{-1},\cdots,\lambda_n+\lambda_n^{-1}).
$$
注意 $\lambda_i^{-1}=\ol{\lambda_i}$, 所以 $\lambda_i+\lambda_i^{-1}=2\Re\lambda_i\in[-2,2]$.

## $\S10.7$ 三维空间中的旋转与 Euler 角

&emsp;&emsp;根据 <u>定理 10.6.4</u>, 三维旋转 (单位正交且 $\det=1$ 的算子) 的形式可以在适当的基下统一写作
$$
T=\pmat{1\\&& R(\theta)},
$$
此时转轴为 $v_1$, $T$ 的行为即绕 $v_1$ 正方向旋转 $\theta$.

> **定义 10.7.1**
>
> &emsp;&emsp;称两个三维标架 $(\seq u1n)$, $(\seq e1n)$ 同向, 当且仅当存在 $\det T>0$, 使得 $(\seq{Te}1n)=(\seq u1n)$.

&emsp;&emsp;对给定的单位正交标架 $(\seq e1n)$, 所有与之同向的单位正交标架称为正向的标架.

&emsp;&emsp;根据上述讨论, 可以将三维旋转记作 $R_u(\theta)$, 其中 $u\in\R^3$, $\|u\|=1$.

> **定义-定理 10.7.2**
>
> &emsp;&emsp;设旋转 $T$ 对应正向标架 $(u_1,u_2,u_3)$, 则
> $$
> T=R_{u_3}(\varphi)R_{f_2}(\theta)R_{e_3}(\psi).
> $$
> 其中
> $$
> (e_1,e_2,e_3)\overset{R_{e_3}(\psi)}\mapsto(f_1,f_2,e_3)\overset{R_{f_2}(\theta)}\mapsto(g_1,f_2,u_3)\overset{R_{u_3}(\varphi)}\mapsto(u_1,u_2,u_3),
> $$
> 满足
> $$
> f_2=\env{cases}{
> 	e_3\x u_3,&e_3\nparallel u_3;\\
> 	e_2,&e_3\parallel u_3.
> }
> $$
> 并称 $(\varphi,\theta,\psi)$ 为 $T$ 的 Euler 角表示.

&emsp;&emsp;讨论中途涉及向量的存在唯一性即可. 这个 $f_2$ 的选取可以参考几何直观: 我们需要保证接下来以 $f_2$ 为轴旋转时 $e_3$ 能与 $u_3$ 重合.

> **引理 10.7.3**
>
> &emsp;&emsp;设正交变换 $P$ 满足 $\eps:=\det P\in\{\pm 1\}$, 则对任意 $u\in\R^3$ 和 $\theta\in\R$, 都有
> $$
> PR_u(\theta)P^{-1}=R_{Pu}(\theta).
> $$

&emsp;&emsp;*→ Proof.* 取定单位正交标架 $(u,v,w)$, 则 $(Pu,Pv,\eps Pw)$ 也是正交标架. 验证 $R_{Pu}(\theta)P$ 和 $PR_u(\theta)$ 在标架上的作用效果即可.

> **定理 10.7.4**
>
> &emsp;&emsp;设旋转 $T$ 由 Euler 角 $(\varphi,\theta,\psi)$ 给出, 则
> $$
> T=R_{u_3}(\varphi)R_{f_2}(\theta)R_{e_3}(\psi)=R_{e_3}(\psi)R_{e_2}(\theta)R_{e_3}(\varphi).
> $$

&emsp;&emsp;*→ Proof.* 根据引理, $R_{f_2}(\theta)=R_{e_3}(\psi)R_{e_2}(\theta)R_{e_3}(\psi)^{-1}$, 同时 $R_{f_2}(\theta)R_{e_3}(\psi)=R_{e_3}(\psi)R_{e_2}(\theta)$, 而且 $u_3=R_{f_2}(\theta)e_3=R_{f_2}(\theta)R_{e_3}(\psi)e_3=R_{e_3}(\psi)R_{e_2}(\theta)e_3$. 所以
$$
R_{u_3}(\varphi)=R_{e_3}(\psi)R_{e_2}(\theta)R_{e_3}(\varphi)R_{e_2}(\theta)^{-1}R_{e_3}(\psi)^{-1}.
$$
将它们代入表达式展开即证.

## $\S10.8$ 四元数与旋转

> **定义-命题 10.8.1 (Hamilton)**
>
> &emsp;&emsp;定义 $\H$ 为一个 $4$ 维 $\R$-向量空间 with 基 $\lang 1,\i,\j,\k\rang$, 为其配备作为双线性映射的乘法
> $$
> \cdot:\H\x\H\to\H,\quad x\cdot y\mapsto xy,
> $$
> 满足
> $$
> 1\cdot x=x\cdot 1=x,\quad \i^2=\j^2=\k^2=-1,\quad \i\j=-\j\i=\k,\quad \j\k=-\k\j=\i,\quad \k\i=-\i\k=\j.
> $$
> 此时 $(\H,+,\cdot,0,1)$ 是环.

&emsp;&emsp;*→ Proof.* 群性质来自向量空间, 分配律来自双线性性, 基底间的结合律硬算.

&emsp;&emsp;注意 $\H$ 与已有的数域有明显的包含关系, 例如:

- $\R\mmap\H,~a\mapsto a1_\H$;
- $\C\mmap\H,~a+bi\mapsto a+b\mathrm x$, 其中 $\mathrm x\in\{\i,\j,\k\}$, 此后不加说明时认为 $\mathrm x=\i$.

&emsp;&emsp;基于第二点可以定义 $\cdot:\C\x\H\to\H$, 进而将 $\H$ 作为 $\C$-向量空间, 则此时 $\dim\H=2$, 可以写作 $\H\ni q=z+w\j$, 这是因为恰好有
$$
(a+b\i)+(c+d\i)\j=a+b\i+c\j+d\k.
$$
&emsp;&emsp;遗憾 $\H$ 上的乘法并不交换, 我们来研究其中心 $Z(\H)$.

> **命题 10.8.2**
>
> &emsp;&emsp;$Z(\H)=\R$.

&emsp;&emsp;*→ Proof.* 由 $\cdot_\H$ 的 $\R$-双线性性, 显然 $\R\sub Z(\H)$. 研究 $q\in\{\i,\j,\k\}$ 时, 若 $qz=zq$, 则
$$
z\i=-b+a\i+d\j-c\k=-b+a\i-d\j+c\k=\i z\Ra c=d=0.
$$
同理就有 $b=c=d=0$.

&emsp;&emsp;接下来讨论 $\H$ 的除环性质.

> **定义 10.8.3**
>
> &emsp;&emsp;对 $\H\ni q=a+b\i+c\j+d\k$, 定义其:
>
> - 共轭 $\ol q=a-b\i-c\j-d\k$;
> - 迹 $\tr q=q+\ol q=2a$;
> - 范数 $N(q)=q\ol q$.

&emsp;&emsp;有性质:

- $q\mapsto\ol q$ 是 $\R$-线性映射, $\ol{\ol q}=q$;
- $\ol{q_1q_2}=\ol{q_2}\cdot\ol{q_1}$;
- $N(q_1q_2)=N(q_1)N(q_2)$, 这是因为 $q_1q_2\ol{q_1q_2}=q_1(q_2\ol{q_2})\ol{q_1}$, 括号内的值在 $\R=Z(\H)$ 中.
- $N(q)=a^2+b^2+c^2+d^2\in\R$, 可以先说明 $\ol{q\ol{q}}=\ol{\ol q}\cdot\ol q=q\ol q$, 这样只能 $N(q)\in\R$, 再展开实数项.

> **定理 10.8.4**
>
> &emsp;&emsp;$\H$ 是除环, 即 $\H^\x=\H\setminus\{0\}$. 进一步地, 对 $q\neq 0$, 有 $q^{-1}=\frac{\ol q}{N(q)}$.

&emsp;&emsp;*→ Proof.* 根据上述性质直接验证即可.

&emsp;&emsp;Frobenius 给出, 若 $D$ 是除环, 且是有限维 $\R$-向量空间, $\cdot_D$ 是 $\R$-双线性的, 那么一定存在同时作为 $\R$-向量空间和环的同构, 使得 $D\simeq D'\in\{\R,\C,\H\}$.

> **命题 10.8.7**
>
> &emsp;&emsp;从 $\H$ 到 $\M_{2\x 2}(\C)$ 的映射
> $$
> \Phi:z+\j w\mapsto\pmat{z&-\ol w\\w&\ol z}
> $$
> 给出环的嵌入 $\Phi:\H\mmap\M_{2\x 2}(\C)$. 同时 $\tr\mapsto\tr$, $N\mapsto\det$, $\ol{\cdot}\mapsto\cdot^\dagger$.

&emsp;&emsp;验证上也算只是 dirty work, 不提. 在此嵌入下,
$$
\i\mapsto\pmat{i\\&-i},\quad \j\mapsto\pmat{&-1\\1},\quad \k\mapsto\pmat{&-i\\-i}.
$$
这恰好对应了三个 Pauli 矩阵 (up to 复相位差).

&emsp;&emsp;注意明显存在向量空间的同构 $\R^3\simeq\H_0:=\{q\in\H:\ol q=-q\}$, 因此 $\R^3$ 上的旋转也可以尝试用四元数刻画:

> **引理 10.8.8**
>
> &emsp;&emsp;对任意 $x\in\H^\x$:
>
> &emsp;&emsp;(i) $N(xqx^{-1})=N(q)$;
>
> &emsp;&emsp;(ii) $R_x:\H_0\to\H_0,~q\mapsto xqx^{-1}$ 良定且是正交变换;
>
> &emsp;&emsp;(iii) $\det R_x=1$.

&emsp;&emsp;*→ Proof.* (i) 是显然的.

&emsp;&emsp;(ii), 对 $q\in\H_0$, $\ol{xqx^{-1}}=\ol{x^{-1}}\cdot\ol q\cdot\ol x$, 不妨 $\| x\|=1$, 这时 $x^{-1}=\ol x$, 就有 $\ol{xqx^{-1}}=-xqx^{-1}$, 给出良定性. $\R$-线性性不难验证, 根据 (i), $R_x$ 是保距, 那么 $N(x)=1$ 时结论是成立的; 否则取 $x=\sqrt{N(x)}y$, $xqx^{-1}=yqy^{-1}$, 也给出正交性.

&emsp;&emsp;(iii) (由于缺乏严格的数分知识这里会比较口胡.) $\H^\x\simeq\R^4\setminus\{0\}$ 是连通的, 而 $R_x$ 作为正交变换有 $\det R_x\in\{\pm1\}$ 是离散的. 对 $x=1$, $\det R_1=\det\bs 1_{3\x 3}=1$ 和任意 $y$, 考虑它们之间的路径 $\gamma$, 则 $\det R_{\gamma(t)}$ 是连续函数, 则它只能是常数. 这就给出 $\det R_y=\det R_x=1$.

&emsp;&emsp;依赖四元数, 我们可以验证:

- $R_{xy}=R_xR_y$;
- $R_1=\id_{\H_0}$;
- $\A t\in\R^\x,~R_{tx}=R_x$;

因此 $\R_x$ 能够给出 $\H_0\simeq\R^3$ 中的旋转.

> **定理 10.8.9**
>
> &emsp;&emsp;对任意 $\H_0$ 中的旋转 $T$, 存在 $x\in\H$, $N(x)=1$, 使得 $T=R_x$, 且 $x$ 唯一 up to $\pm$.

&emsp;&emsp;*→ Proof.* 取欧拉角使得 $T=R_{e_3}(\psi)R_{e_2}(\theta)R_{e_3}(\varphi)$, 这样可以将问题归约到处理 $T=R_{e_\ell}(\psi)~(\ell\in\{1,2,3\})$ 的情景. 存在性: 对 $\ell=1$, 取 $x=\cos\theta+\sin\theta\cdot\i$, 大力展开 $x\i x^{-1}$ 等等的结果验证, 最终给出 $\{\i,\j,\k\}$ 基下的 $\pmat{1\\&R(2\theta)}$.  类似地, 取 $x=\cos\theta+\sin\theta\cdot\j$ 或者 $x=\cos\theta+\sin\theta\cdot\k$ 就能取出另外两种情况.

&emsp;&emsp;唯一性: 如果 $R_x=R_y$, 那么 $R_xR_y^{-1}=\id=R_{xy^{-1}}$, 所以只需要说明 $\|x\|=1$ 且 $R_x=\id$ 时必有 $x=\pm 1$. 由于这时的 $x$ 满足 $xqx^{-1}=q~(q\in\H)$, 那么 $x\in Z(\H)\cap\{x:N(x)=1\}=\{\pm 1\}$.

> **推论 10.8.10**
>
> &emsp;&emsp;对 $u\in\H_0$, $\|u\|=1$ 和 $\theta\in \R$, 则旋转 $R_u(\theta)=R_x$, 其中 $x=\cos\frac{\theta}{2}+\sin\frac{\theta}{2}\cdot u$.

&emsp;&emsp;*→ Proof.* 容易验证 $\|x\|=1$, 同时能取出旋转 $P$ 使得 $P\i=u$, 那么 <u>引理 10.7.3</u> 给出 $R_u(\theta)=PR_\i(\theta)P^{-1}$. 再由 <u>定理 10.8.9</u>, 设 $P=R_y$, 就有
$$
R_yR_\i(\theta)R_{y^{-1}}=R_x\Ra x=y\br{\cos\frac{\theta}{2}+\sin\frac{\theta}{2}\i}y^{-1},
$$
则
$$
x=\cos\frac{\theta}{2}+\sin\frac{\theta}{2}y\i y^{-1}=\cos\frac{\theta}{2}+\sin\frac{\theta}{2}u.
$$
&emsp;&emsp;当然, 令 $\psi=\frac{\theta}{2}$, 由于 $u^2=-1$, $x$ 也能写作 $x=\e^{u\psi}$.

# 第六章 重访环和多项式 (cont.)

## $\S6.7$ 对称多项式

&emsp;&emsp;取定域 $F$ 和变元数 $n$, 将 $n$ 阶置换群记作 $S_n$, 则对 $f\in F[\seq X1n]$, 定义
$$
\sigma f:=f(X_{\sigma_1},\cdots,X_{\sigma_n}).
$$
将恒等置换记作 $\iota$, 明显
$$
\iota f=f,\quad (\sigma\tau)f=\sigma(\tau(f)).
$$

> **定义 6.7.1**
>
> &emsp;&emsp;若 $f\in F[\seq X1n]$ 满足 $\A\sigma\in S_n,~\sigma f=f$, 则称 $f$ 为 $n$ 元对称多项式. 所有这样的对称多项式记作 $F[\seq X1n]^{S_n}$.

&emsp;&emsp;可以验证 $\sigma(f+g)=\sigma f+\sigma g$, $\sigma(fg)=(\sigma f)(\sigma g)$, 因此 $F[\seq X1n]^{S_n}\sub F[\seq X1n]$ 是一个子环.

&emsp;&emsp;例如, 幂和 $P_k:=\sum_i X_i^k$, 初等对称多项式 $e_k=\sum_{1\le i_1\ops<i_k\le n}X_{i_1}\cdots X_{i_k}$ 都是对称多项式.

> **引理 6.7.2**
>
> &emsp;&emsp;对 $f\in F[\seq X1n]^{S_n}$, $f(\seq X1{n-1},0)=0$ 当且仅当 $e_n\mid f$.

&emsp;&emsp;*→ Proof.* 右推左显然. 左推右, 对 $f\in F[\seq X1n]$, 记 $f=\sum_{d\ge 0} f_d$, 其中 $f_d=\sum_{\sum i=d}c_{\{i_n\}}X_1^{i_1}\cdots X_n^{i_n}$, 则
$$
f(\seq X1{n-1},0)=\sum_{i_n=0}c_{\{i_n\}}X_1^{i_1}\cdots X_{n-1}^{i_{n-1}}=0,
$$
所以 $c_{\{i_n\}}\neq 0$ 给出 $i_n\ge 1$.

> **定理 6.7.2 (对称多项式基本定理)**
> $$
> \A f\in F[\seq X1n]^{S_n},~\E! g\in F[\seq X1n],~f=g(\seq e1n).
> $$

&emsp;&emsp;*→ Proof.* 先证明存在性. 对任何 $d$, $f_d$ 都是对称的, 不妨设 $f=f_d$. 对 $g\in F[\seq X1n]$, 定义其权重
$$
\opn{wt}(g):=\env{cases}{
	\max\l\{\sum_{k=1}^nk\cdot i_{k}:c_{g;\{i_n\}}\neq 0\r\},&g\neq 0;\\
	-\oo,&g=0.
}
$$
我们证明总存在 $\opn{wt}(g)\le d$ 使得 $g$ 满足命题要求. 现对 $n+d$ 归纳. 若 $d=0$, $f\in F$, 取 $g=f$, 则 $\opn{wt}(g)\in\{0,-\oo\}$ 成立. 若 $d\ge 1$, 对 $h\in F[\seq X1n]$, 记 $h^\flat:=h(\seq X1{n-1},0)$, 则存在 $g_1\in F[\seq X1{n-1}]$, 使得 $f^\flat=g_1(e_1^\flat,\cdots,e_{n-1}^\flat)$.

&emsp;&emsp;观察到 $\deg g_1\le\opn{wt}(g_1)\le d$, 因此 $f_1:=f-g_1(\seq e1{n-1})$ 的度数 $\le d$, 也是对称的, 并且 $f_1^\flat=f^\flat-g_1(e_1^\flat,\cdots,e_{n-1}^\flat)=0$. 根据引理, $e_n\mid f_1$, 观察到 $f_2:=f_1/e_n$ 仍然是对称的, $\deg f_2\le d-n$, 于是又能归纳地取出 $f_2=g_2(\seq e1n)$, 满足 $\opn{wt}(g_2)\le d-n$. 最终就有 $f=f_1+g_1(\seq e1{n-1})=e_nf_2+g_1(\seq e1{n-1})$. 取 $g=X_ng_2+g_1$, 那么 $\opn{wt}(g)\le\max\{\opn{wt}(X_ng_2),\opn{wt}(g_1)\}\le d$, 这样就完成了归纳.

&emsp;&emsp;接下来说明唯一性. 只需要证明, 对 $g\in F[\seq X1n]$, 都有 $g(\seq e1n)=0\Ra g=0$. 首先将 $F$ 扩充到无穷域 (例如 $F(t)$), 这时对 $g\neq 0$, 总存在 $(\seq y1n)\in F^n$, 使得 $g(\seq y1n)\neq 0$. 接着构造多项式 $p=X^n+\sum_{k=1}^n(-1)^ky_kX^{n-k}\in F[X]$, 并取 $F\mmap L$ 使得 $p$ 在 $L[X]$ 分裂. 设 $p=\prod_{i=1}^n(X-x_i)$, 注意到有 $e_k(\seq x1n)=y_k$, 然而
$$
\ev{g(\seq e1n)}_{\A i,~X_i=x_i}=g(\seq y1n)\neq 0\Ra g(\seq e1n)\neq 0.
$$
&emsp;&emsp;事实上, 上述证明对整环也成立.

> *Bonus.*
>
> &emsp;&emsp;这个东西作为算法来说还是太反人类了, 有没有更方便计算的存在性证明呢?
>
> &emsp;&emsp;$f$ 总能拆分为若干个齐次对称多项式的和, 不妨只研究 $f$ 齐次的情况. 对齐次的对称多项式 $f$, 以 $f=\sum x^3y+\sum x^3z$ 为例, 先凑出所有对应次数的基本对称多项式乘积, 并展开出乘积里指数字典序最大的一项 (它们的指数会构成一个 Young 表):
>
> $$
> e_3e_1:x^2yz\quad e_2e_2:x^2y^2\quad e_2e_1e_1:x^3y\quad e_1e_1e_1e_1:x^4
> $$
> 同时, 在 $f$ 里也挑出字典序最大的项 $f:x^3y$, 因此 $[e_2e_1e_1]f=1$, 此后对 $f-e_2e_1e_1$ 在字典序上归纳即可.
>
> &emsp;&emsp;More technically, 展开 $e_1^3e_2$ 之类的一大坨东西的时候, 只需要也只需要关注 $X$ 指数非 $0$ 的 Young 表项和它们的系数, 这些 Young 表项相当于按照对称性的分类, 每一类的系数都相同. 还是举个复杂的例子, 计算
> $$
> f:=(XY+Z^2)(YZ+X^2)(ZX+Y^2)=\sum X^4YZ+\sum X^3Y^3+2X^2Y^2Z^2,
> $$
> 构造 $1\x e_1^3e_3$, 其中
> $$
> e_1^3e_3=\sum X^4YZ+3\sum X^3Y^2Z+6X^2Y^2Z^2.
> $$
> 接着是 $1\x e_2^3$, 其中
> $$
> e_2^3=\sum X^3Y^3+3\sum X^3Y^2Z+6X^2Y^2Z^2.
> $$
> 然后是 $-6\x e_1e_2e_3$, 其中
> $$
> 6e_1e_2e_3=6\sum X^3Y^2Z+18X^2Y^2Z^2.
> $$
> 最后再加上 $8\x e_3^2$ 即可. 所以答案为
> $$
> f=e_1^3e_3+e_2^3-6e_1e_2e_3+8e_3^2.
> $$
> 以上 $\sum$ 均表示对所有 up to 交换律下本质不同的变量置换求和.

> **例子 6.7.3 (判别式)**
>
> &emsp;&emsp;对某域上的首一多项式 $f=X^n-c_1X^{n-1}+\cdots+(-1)^nc_n=\prod_{i=1}^n(X-\alpha_i)$, 定义其判别式
> $$
> \opn{disc}(f):=\prod_{i<j}(\alpha_i-\alpha_j)^2.
> $$

&emsp;&emsp;此时, $\opn{disc}(f)$ 是关于 $\seq\alpha 1n$ 的对称多项式, 则它是关于 $e_1(\seq\alpha 1n)\ops,e_n(\seq\alpha 1n)$ 的多项式, 而恰好有
$$
\A k\in[n],~e_k(\seq\alpha1n)=c_k.
$$
根据 <u>定理 6.7.2</u> 给出的存在唯一性, $\opn{disc}(f)$ 可以用 $f$ 的系数表出而不要求 $f$ 在 $F$ 上分裂. 这样, $\opn{disc}(f)$ 就的确具有了判别式的作用: 当且仅当 $\opn{disc}(f)\neq 0$, 在充分大的域扩张下 $f$ 的 $n$ 个根不重.

> **定理 6.7.4 (Newton)**
>
> &emsp;&emsp;对固定的变元数量 $n$, 定义 $p_k=\sum_{i=1}^n X_i^k$, 则对任意 $k\in\Z_{>0}$.
> $$
> \sum_{i=0}^{\min\{n,k\}}(-1)^ie_ip_{k-i}=0,\quad (p_0:=k~\text{for specific}~k)
> $$

&emsp;&emsp;根据这一公式, 我们将 $\{e_n\}$ 和 $\{p_k\}$ 相互表示, 因此所有对称多项式也能唯一地用 $\{p_k\}$ 表示.

&emsp;&emsp;*→ Proof.* 在 $\Z[\seq X1n,Y]$ 上考虑乘积中两项的 GF, 设
$$
P(Y)=\sum_{k\ge 1}p_kY^{k-1}=\sum_{k\ge 1}\sum_{i=1}^n X_k^i Y^{k-1}=\sum_{i=1}^n\frac{X_i}{1-X_iY},\\
E(Y)=\sum_{k=0}^n e_kY^k=\prod_{i=1}^n(1+X_iY).
$$
注意到
$$
P(-Y)=\mathrm{D}_Y\ln E(Y)=\frac{E'(Y)}{E(Y)}.
$$
那么
$$
E(Y)P(-Y)=E'(Y)=\sum_{k=1}^n ke_k Y^{k-1}.
$$
虽然为了方便表达, 单独地令 $p_0=k$ 很怪异, 但这里直接目测左右系数的确就能证明等式.

## $\S6.8$ 结式

&emsp;&emsp;在多项式环上, 我们希望研究 $\gcd(f,g)$ 的等式表达 (而非 Euclid 算法的形式).

> **定义 6.8.1**
>
> &emsp;&emsp;固定 $n,m\in\Z_{\ge 1}$, 设多项式 $f=v_0X^n+\cdots+v_n$, $g=w_0X^m+\cdots+w_m$, 定义二者的结式
> $$
> \Res(f,g):=\abs{
> 	\begin{array}{cccccc}
> 		v_0 & \cdots & \cdots & v_n\\
> 		& \ddots&\ddots&\ddots&\ddots\\
> 		&&v_0&\cdots&\cdots&v_n\\
> 
> 		w_0 & \cdots & \cdots & w_m\\
> 		& \ddots&\ddots&\ddots&\ddots\\
> 		&&w_0&\cdots&\cdots&w_m
> 	\end{array}
> },
> $$
> (其中上半部分重复 $m$ 行, 下半部分重复 $n$ 行, 行列式内是 $(n+m)\x(n+m)$ 的方阵.)

&emsp;&emsp;以下是一些简单的性质:

- 若将 $v_i,w_j$ 等视作变量, 那么 $\Res(f,g)$ 可以视作一个整系数多项式, 与域 $F$ 无关.
- $[v_0^mw_m^n]\Res(f,g)=1$, 唯一地来自对角线.
- $\Res(f,g)=(-1)^{mn}\Res(g,f)$.
- 对任意 $t\in F$, $\Res(tf,g)=t^m\Res(f,g)$, 类似地 $\Res(f,tg)=t^n\Res(f,g)$.

> **引理 6.8.2**
>
> &emsp;&emsp;给定 $n,m$ 和 $f,g$, 则 $\Res(f,g)=0$ 当且仅当存在不同为 $0$ 的 $f_1,g_1\in F[X]$, 满足 $\deg f_1<n$, $\deg g_1<m$, 且使得 $fg_1+gf_1=0$.

&emsp;&emsp;*→ Proof.* 令 $f_1=a_1X^{n-1}\ops+a_n$, $g_1=b_1X^{m-1}\ops+b_m$, 则
$$
fg_1+gf_1=0\Eq\env{cases}{
	b_1v_0+a_1w_0&=0,\\
	b_1v_1+b_2v_0+a_1w_1+a_0w_2&=0,\\
	\vdots&\vdots\\
	b_mv_n+a_nw_m&=0.
}
$$
将变元 $a,b$ 拼接为向量 $\pmat{b_1&\cdots&b_m&a_1&\cdots&a_n}^\T$, 这样系数矩阵就是
$$
\pmat{
	v_0&&&w_0\\
	\vdots&\ddots&&\vdots&\ddots\\
	v_n&&v_0&w_m&&w_0\\
	&\ddots&\vdots&&\ddots&\vdots\\
	&&v_n&&&w_m
}.
$$
因为有 $\bs0$ 的平凡解, 所以根据 Cramer 法则, 当且仅当上述矩阵行列式为 $0$ 时有非平凡解, 这就给出 $\Res(f,g)=0$.

> **定理 6.8.3**
>
> &emsp;&emsp;给定 $n,m$ 和 $f,g$, 则 $\Res(f,g)=0$ 当且仅当 $v_0=w_0=0$ 或者 $\deg\gcd(f,g)>0$.

&emsp;&emsp;*→ Proof.* 右推左, 若 $v_0=w_0=0$, 自然 $\Res(f,g)=0$; 若存在 $\deg h>0$ 使得 $h\mid f\land h\mid g$, 则
$$
f\cdot\frac{g}{h}+g\cdot\frac{-f}{h}=0,
$$
套用 <u>引理 6.8.2</u> 就有 $\Res(f,g)=0$.

&emsp;&emsp;左推右, 已知 $\Res(f,g)=0$. 情形一, $f=0\lor g=0$, 不妨 $f=0$. 这时 $g\in F\Ra w_0=0=v_0$, $\deg g>0$ 时取 $h=g$ 即可. 情形二, $f\neq0\land g\neq0$, 不妨 $w_0\neq0$. <u>引理 6.8.2</u> 给出存在 $f_1,g_1$ 不同为 $0$, 使得 $fg_1+gf_1=0$, 在 $F(X)$ 内有
$$
\frac{f}{g}=\frac{-f_1}{g_1}.
$$
如果 $f\perp g$, 左侧是既约分式, 那么就应该有 $f\mid f_1\land g\mid g_1$, 这与 $\deg g_1<m=\deg g$ 矛盾.

> **定理 6.8.4**
>
> &emsp;&emsp;固定 $n,m\in\Z_{\ge 1}$, 以及
> $$
> f=a\prod_{i=1}^n(X-\alpha_i),\quad g=b\prod_{i=1}^m(X-\beta_i),
> $$
> 那么
> $$
> \Res(f,g)=a^m\prod_{i=1}^ng(\alpha_i)=(-1)^{mn}b^n\prod_{i=1}^mf(\beta_i)=a^mb^n\prod_{i,j}(\alpha_i-\beta_j).
> $$

&emsp;&emsp;*→ Proof.* 只有必要证明第一个等式. 由于 $\Res(tf,g)=t^m\Res(f,g)$, 所以不妨令 $a=1$.

&emsp;&emsp;先考虑一种特殊情况: $g(\alpha_1)\ops,g(\alpha_n)$ 两两相异, 考虑 $\Res(f,g-Y)\in F[Y]\sub F(Y)$ (注意行列式中 $w_m$ 处被替换为 $w_m-Y$). 由于 $f$ 和 $g-g(\alpha_i)$ 有公共根 $\alpha_i$, <u>定理 6.8.3</u> 给出 $\Res(f,g-g(\alpha_i))=0$, 互异性假设就给出
$$
\prod_{i=1}^n(g(\alpha_i)-Y)\mid\Res(f,g-Y).
$$
而考虑行列式的展开, $[Y^n]\Res(f,g-Y)=(-1)^n$, 事实上两侧 $\deg_Y=n$ 且最高次系数相同, 那么二者相等. 取 $Y=0$, 就有
$$
\prod_{i=1}^ng(\alpha_i)=\Res(f,g).
$$
&emsp;&emsp;对一般情况, 固定 $g$, 不妨 $b\neq 0$, 取
$$
\tilde f=\prod_{i=1}^n(X-Z_i),
$$
特例相当于给出 $F(\seq Z1n)$ 上的证明, 即
$$
\Res(\tilde f,g)=\prod_{i=1}^ng(Z_i).
$$
这其实是一个 $F[\seq Z1n]\sub F(\seq Z1n)$ 上的等式, 只需要赋值 $Z_i\gets\alpha_i$ 就得到目标.

&emsp;&emsp;回到对判别式的讨论. 对 $f=a\prod_{i=1}^n(X-\alpha_i)\in F[X]$, 令 $\opn{disc}(f):=a^{2n-2}\prod_{i<j}(\alpha_i-\alpha_j)^2$, 于是有推论:

> **推论 6.8.5**
> $$
> a\opn{disc}(f)=(-1)^{n(n-1)/2}\Res(f,f').
> $$
> 其中
> $$
> f'=\mathrm Df=a\sum_{k=1}^n\prod_{j\neq k}(X-\alpha_j).
> $$

&emsp;&emsp;*→ Proof.* <u>定理 6.8.4</u> 给出 $\Res(f,f')=a^{n-1}\prod_{i=1}^nf'(\alpha_i)$, 其中
$$
f'(\alpha_i)=a\prod_{j\neq i}(\alpha_i-\alpha_j),
$$
这样
$$
\Res(f,f')=a^{2n-1}\prod_{i=1}^n\prod_{j\neq i}(\alpha_i-\alpha_j),
$$
后续就不难验证啦.

## $\S 6.9$ 不可约多项式初探

> **定义 6.9.1**
>
> &emsp;&emsp;对 $f=a_0\ops+a_nX^n\in\Z[X]\setminus\{0\}$, 令
> $$
> c(f):=\gcd(\seq a0n),
> $$
> 当 $c(f)=1$, 我们称 $f$ 为本原多项式.

> **引理 6.9.2 (Gauss)**
>
> &emsp;&emsp;若 $g,h\in\Z[X]$ 是本原多项式, 那么 $gh$ 也是本原多项式.

&emsp;&emsp;*→ Proof.* 对任意素数 $p$, 左右取最低次的不含 $p$ 因子的项 $a_rX^r$ 和 $b_sX^s$, 验证 $[X^{r+s}]gh\not\equiv0\pmod p$ 即可.

> **引理 6.9.3**
>
> &emsp;&emsp;设 $g,h\in\Z[X]\setminus\{0\}$, 则 $c(gh)=c(g)c(h)$.

&emsp;&emsp;*→ Proof.* 利用 Gauss 引理即可. $g=c(g)g_0$, $h=c(h)h_0$, 则 $gh=c(g)c(h)g_0h_0$, 其中 $g_0,h_0,g_0h_0$ 都是本原多项式.

> **定理 6.9.4**
>
> &emsp;&emsp;设 $f\in\Z[X]\setminus\{0\}$ 是本原多项式.
>
> &emsp;&emsp;(i) 若在 $\Q[X]$ 里 $f=gh$, 那么存在 $\alpha\in\Q^\x$, 使得 $g_1:=\alpha g$ 和 $h_1:=\alpha^{-1}h$ 都是 $\Z[X]$ 内的本原多项式.
>
> &emsp;&emsp;(ii) 当 $\deg f>0$, 则 $f$ 在 $\Q[X]$ 不可约, 当且仅当不存在 $g,h\in\Z[X]$ 使得 $f=gh$, 且 $\deg g,\deg h>0$.

&emsp;&emsp;*→ Proof.* (i) $\deg f=0$ 时直接取 $\alpha=g^{-1}$ 即可. 当 $\deg f>0$, 取 $u,v\in\Z_{>0}$ 使得 $ug,vh\in\Z[X]$, 这样
$$
uv=c(uvf)=c(ug\cdot vh)=c(ug)c(vh).
$$
那么
$$
f=\frac{ug}{c(ug)}\cdot\frac{vh}{c(vh)}.
$$
取 $\alpha=\frac{u}{c(ug)}$ 即可.

&emsp;&emsp;(ii) 左推右, 证明逆否命题. 若 $f=gh$, $\deg g,\deg h>0$, 则 $f$ 明显在 $\Q[X]$ 可约. 右推左, 还是证明逆否命题. 若 $\Q[X]$ 内 $f=gh$, $\deg g,\deg h>0$, 则根据 <u>(i)</u>, $\Z[X]$ 内就能取出 $f=g_1h_1$.

> **定理 6.9.5**
>
> &emsp;&emsp;$\Z[X]$ 是唯一分解整环, 且不可约元为 $\Z$ 的不可约元和满足 <u>定理 6.9.4 (ii)</u> 的本原多项式 $f$.

&emsp;&emsp;*→ Proof.* 零次的不可约元明显就是 $\Z$ 的不可约元, 现在只需要在非常数的本原多项式中寻找不可约元. 对这样的 $f$, 若 $f=gh$, 根据本原性, $\deg g,\deg h>0$, 这就是上述定理的要求.

&emsp;&emsp;还需要证明 $\Z[X]$ 是唯一分解环. 存在性: 对 $f\in \Z[X]\setminus\{0\}$, 先令 $f=c(f)f_0$, $c(f)$ 在 $\Z$ 中自然分解. 对 $f_0$, 根据定理, 可以将 $f_0$ 在 $\Q[X]$ 内分解, 并将因式调整为 $\Z[X]$ 上的本原多项式. 唯一性: 若
$$
a_1\cdots a_mp_1\cdots p_n\sim b_1\cdots b_rq_1\cdots q_s,
$$
两侧取 $c$, 就有 $a_1\cdots a_m\sim b_1\cdots b_r$, 这由 $\Z$ 上的唯一分解保证唯一性. 在 $\Q[X]$ 上的唯一分解性告诉我们 $p_1\cdots p_n$ up to $\Q^\x$ 的唯一性, 据此容易讨论出 $\Z^\x$上的唯一性.

> **定理 6.9.6 (Eisenstein)**
>
> &emsp;&emsp;若 $f=a_0+\cdots+a_nX^n\in\Z[X]$, $n\ge 1$, 如果存在素数 $p$ 使得 $p\nmid a_n$ 而 $p\mid a_0\ops,a_{n-1}$, $p^2\nmid a_0$, 则 $f$ 是 $\Q[X]$ 的不可约元.

&emsp;&emsp;*→ Proof.* $p\nmid a_n\Ra p\nmid c(f)$, 所以 $p$ 的性质对 $f/c(f)$ 也成立, 不妨设 $f$ 为本原多项式. 如果 $f$ 在 $\Q[X]$ 可约, 设 $f=gh$, 其中 $g=b_0\ops+b_mX^m$, $h=c_0\ops+c_\ell X^\ell$, 则 $a_n=b_mc_\ell\Ra p\nmid b_m,c_\ell$, $a_0=b_0c_0$, 不妨 $p\mid b_0$, 取最低次的 $p\nmid b_k$, 则 $1\le k\le\min\{m,n-1\}$. 那么
$$
\env{aligned}{
	a_0 &\equiv b_0c_k\ops+b_kc_0\\
	&\equiv b_kc_0\\
	&\equiv 0.&\pmod p
}
$$
然而, $p\nmid b_k\Ra p\mid c_0$, 与 $p^2\nmid a_0$ 矛盾.

&emsp;&emsp;这一定理告诉我们, $\Q[X]$ 中存在任意次的不可约多项式, 例如一切 $p+X^n$. (相比 $\R[X]$ 和 $\C[X]$ 中不可约多项式的次数限制, 这一结论并不算平凡.) 还有一个更经典的例子: 对任意素数 $p$, 以下多项式不可约:
$$
\Phi_p:=1+X\ops+X^{p-1}=\frac{X^p-1}{X-1}.
$$
这是因为
$$
\env{aligned}{
	\Phi_p &= \frac{1}{X-1}\sum_{k=0}^p\binom{p}{k}(X-1)^k-1\\
	&=\sum_{k=1}^p\binom{p}{k}(X-1)^{k-1}.
}
$$
$f(X)\mapsto f(X-1)$ 是 $\Q[X]$ 的自同构, 它保持不可约性. 所以只需取 $\Phi_p(X)=h(X-1)$ 并验证 $h$ 的不可约性, 后续是显然的.

&emsp;&emsp;$\Phi_p$ 也被称为第 $p$ 个分圆多项式. 更广义的, 对 $n>1$, 可以定义
$$
\Phi_n=\prod_{0\le m<n,~m\perp n}(X-\e^{2\pi im/n})\in \Z[X].
$$

关于它的更多性质可见 <u>作业四 3, 4</u>.

> *Remark.*
>
> &emsp;&emsp;以上 $\Z$ 与 $\Q$ 上的理论可以搬到唯一分解整环 $R$ 和 $\opn{Frac}(R)$ 上. 自然 $R$ 是 UFD 能推出 $R[X]$ 也是 UFD, 这就进一步给出 $R[\seq X1n]$ 都是 UFD.
>
> &emsp;&emsp;为判定 $f\in\Z[X]\setminus\Z$ 是否是不可约多项式, 我们有 Kronecker 算法. 为测试是否有 $\deg g\le k$ 使得 $f=gh$, 任取 $\seq x0k\in\Z$, 不妨 $f(x_i)\neq 0$. 这样 $\A i,~g(x_i)\mid f(x_i)$, 所以只有有限多组可能的 $\{g(x_i)\}_{i=0}^k$, 大力枚举并插值取出每种取值下的 $g\in\Q[X]$, 并进一步测试是否 $g\in\Z[X]$  且 $g\mid f$ 即可.

# 第十一章 群的概念

&emsp;&emsp;我们抽取对称关系的特征 (单位存在, 结合, 可逆), 得到一种用于描述广泛的对称性的结构: 群.

##  $\S11.1$ 群的基本定义

> **定义 11.1.1**
>
> &emsp;&emsp;群是资料 $(G,\cdot)$, 其中 $G$ 非空, $\cdot:G\x G\to G$ 满足:
>
> - 结合律. $\A x,y,z\in G,~(x\cdot y)\cdot z=x\cdot(y\cdot z)$.
> - 幺元存在. $\E 1_G\in G,~\A x\in G,~1_G\cdot x=x\cdot 1_G=x$.
> - 逆元存在. $\A x\in G,~\E x^{-1}\in G,~x\cdot x^{-1}=x^{-1}\cdot x=1_G$.
> - *(进一步成为交换群 / Abel 群)* 交换律. $\A x,y\in G,~x\cdot y=y\cdot x$.

&emsp;&emsp;直接的结论 (例如消去律, 幺元唯一, 逆元唯一, ...) 就不写了叭.

&emsp;&emsp;*在逆元唯一性证明中, lww 创新性地引入了 $x^{\text{负一}}$ 作为记号用来与 $x^{-1}$ 区分, 值得研究学习. Rainy7 进一步指出还能使用记号 $\frac{1}{x}$, 此神来之笔也.*

&emsp;&emsp;称 $G=\{1_G\}$ 为平凡群, $|G|$ 为群的阶数. 在公理中, 删去逆元存在性, 可得到幺半群结构, 再删去幺元存在性可以得到半群. 例如, 记号 $x^n$ 在半群, 幺半群, 群里分别能对 $n\in\Z_{>0}$, $n\in\Z_{\ge 0}$, $n\in\Z$ 定义.

> *Bonus.*
>
> &emsp;&emsp;以上定义直接要求了左右幺元 (逆元) 存在且相等, 这个条件似乎很强, 我们不禁怀疑其是否有些冗余. 我尝试枚举了一些情况:
>
> - 逆元存在性改为 "(各自) 存在左逆或右逆", 等价. 下证 $x$ 的左逆元 $y$ 一定也是右逆元:
>     $$
>     (xy)(xy)=xy\Ra\CAS{
>     	s(xy)(xy)=xy=1=s(xy),&\E s=(xy)^{-1}_L;\\
>     	(xy)(xy)t=xy=1=(xy)t,&\E t=(xy)_R^{-1}.
>     }
>     $$
>
> - 逆元存在性改为 "(都) 存在左逆 (或都存在右逆)", 等价:
>     $$
>     x^{-1}x=1\land (x^{-1})^{-1}x^{-1}=1\Ra (x^{-1})^{-1}x^{-1}x=x=(x^{-1})^{-1}.
>     $$
>
> - 逆元存在性改为 "存在左逆和右逆", 等价:
>     $$
>     x^{-1}_Lx=xx_R^{-1}=1\Ra x_L^{-1}xx_R^{-1}=x_L^{-1}=x_R^{-1}.
>     $$
>
> - 幺元存在性改为 "存在右幺元 (或存在左幺元)", 不良定, 反例:
>     $$
>     (G,\opn{const}).
>     $$
>     (回忆 $\opn{const}:x\mapsto y\mapsto x$, $G$ 满足结合律, 但所有元素都是右幺元.)
>
> - 幺元存在性改为 "存在左幺元且存在右幺元 (逆元定义时不妨取左幺元)", 等价:
>     $$
>     1_L\cdot 1_R=1_L=1_R.
>     $$
>
> - 幺元存在性改为 "存在唯一左幺元 (或存在唯一右幺元)", 等价:
>     $$
>     x^{-1}\cdot x=x\cdot x^{-1}=1_L\Ra x\cdot (x^{-1}\cdot x)=x\cdot 1_L=1_L\cdot x=x.
>     $$
>
> &emsp;&emsp;总的来说, 在所有等价描述中, <u>定义 11.1.1</u> 确实是 "字数最少" 的说法之一 (犯愁论选手禁止参赛), 这下放心了. 当然加上交换律后又有一堆情况讨论, 我们确信自己会做!
>
> &emsp;&emsp;喵, 心血来潮给所有等价性写了形式化证明! 代码见 [我的博客](https://www.cnblogs.com/rainybunny/p/18810427).

> **定义 11.1.2**
>
> &emsp;&emsp;对群 $G$ 和其子集 $H\sub G$, 若 $H$ 满足:
>
> - $1_G\in H$;
> - $x,y\in H\Ra xy\in H$;
> - $x\in H\Ra x^{-1}\in H$.
>
> 则称 $H$ 是 $G$ 的子群, $(H,\cdot_G)$ 自然是群.

&emsp;&emsp;容易看出子群的交仍然是子群.

> **定义 11.1.3**
>
> &emsp;&emsp;对群 $G$, 定义其中心
> $$
> Z(G):=\{z\in G:\A g\in G,~zg=gz\}.
> $$

&emsp;&emsp;可以验证 $Z(G)$ 是 $G$ 的子群.

&emsp;&emsp;群的例子:

- 置换群 $\mathfrak S_X:=(\{X\overset{1:1}\to X\},\circ)$, 其中集合 $X\neq\varnothing$.
- 交错群 $\mathfrak A_n:=\{\sigma\in S_n:\sgn(\sigma)=1\}\sub\mathfrak S_n$.
- 一般线性群 $\opn{GL}(V):=\{V\isoto V\}$, 其中 $V$ 是 $F$-向量空间; 矩阵表述为 $\opn{GL}(n,F)$.
- 在上条 $\dim V<\oo$ 时, 特殊线性群 $\opn{SL}(V):=\{T\in\opn{GL}(V):\det T=1\}\sub\opn{GL}(V)$; 矩阵表述为 $\opn{SL}(n,F)$.
- 正交群 $\opn{O}(V):=\{V\isoto V\}$, 其中 $V$ 是有限维实内积空间, 矩阵表述为 $\opn{O}(n)$.
- 特殊正交群 $\opn{SO}(V)=\opn{SL}(V)\cap\opn{O}(V)$; 矩阵表述为 $\opn{SO}(n)=\opn{SL}(n,\R)\cap\opn{O}(n)$.
- 酉群 $\opn{U}(V):=\{V\isoto V\}$, 其中 $V$ 是有限维复内积空间; 矩阵表述为 $\opn{U}(n)$.
- 特殊酉群 $\opn{SU}(V):=\opn{SL}(V)\cap\opn{U}(V)$; 矩阵表述为 $\opn{SU}(n)=\opn{SL}(n,\R)\cap\opn{U}(n)$.
- $(\Z,+)$, $(\Z/n\Z,+)$, 它们是 Abel 群.
- 对环 $R$, $(R^\x,\x)$ 是群.

&emsp;&emsp;对群 $G$ 和其子集 $S\sub G$, 记
$$
\lang S\rang:=\{s_1^{a_1}\cdots s_n^{a_n}:n\ge 0,~s_i\in S,~a_i\in\Z\}\sub G
$$
为 $G$ 的子群, 并且
$$
\lang S\rang=\bigcap_{S\sub H\sub G}H.
$$
称 $S$ 是 $G$ 的生成元, 当且仅当 $\lang S\rang=G$. 例如 $S_n=\lang\pmat{i&i+1}:i\in[1:n-1]\rang$; $\Z/n\Z=\lang 1+n\Z\rang$; 对 $n>1$, $\Z/n\Z=\lang a+n\Z\rang$, 其中 $a\perp n$.

> **定义 11.1.4**
>
> &emsp;&emsp;对一族群 $(G_i)_{i\in I}$, 赋予 $\prod_{i\in I}G_i$ 二元运算:
> $$
> (g_i)_{i\in I}\cdot(g_i')_{i\in I}:=(g_ig_i')_{i\in I}.
> $$
> 则 $\prod_{i\in I}G_i$ 构成群, 成为 $(G_i)_{i\in I}$ 的直积. 若 $\A i,~G_i=G$, 则简记作 $G^I$.

## $\S11.2$ 同态与同构

> **定义 11.2.1**
>
> &emsp;&emsp;对群 $G,G'$, 称 $f:G\to G'$ 是同态, 当且仅当
> $$
> \A x,y\in G,~f(xy)=f(x)f(y).
> $$

&emsp;&emsp;同态有以下自然的性质:

- $f(1_G)=1_{G'}$. 这是因为 $f(1_G)\cdot 1_{G'}=f(1_G)=f(1_G\cdot 1_G)=f(1_G)\cdot f(1_G)$.
- $f(x^{-1})=f(x)^{-1}$. 这是因为 $f(x^{-1})\cdot f(x)=f(1_G)=1_{G'}$.

&emsp;&emsp;对幺半群同态, 我们需要手动指定 $f(1_G)=1_{G'}$.

&emsp;&emsp;一些例子:

- $\id_G:G\to G$, $\text{inclusion}:H\mmap G~(H\sub G)$.
- $\sgn:S_n\to\{\pm 1\}$, $\det:\opn{GL}(n,F)\to F^\x$; 作为幺半群同态, $\det:\M_{n\x n}(F)\to F$.
- $\A j\in I,~p_j:\prod_{i\in I}G_i\to G_j,~(g_i)_{i\in I}\mapsto g_j$.
- 对同态 $G\overset{g}\to G'\overset{f}\to G''$, $fg$ 是同态.

> **定义 11.2.2**
>
> &emsp;&emsp;若 $f:G\to G'$, $g:G'\to G$ 是同态, 且 $gf=\id_G$, 则称 $g$ 是 $f$ 的左逆, $f$ 是 $g$ 的右逆. 若同时还有 $fg=\id_{G'}$, 则称 $f,g$ 是互逆的, 并称 $f$ 是一个同构 $f:G\isoto G'$.

> **命题 11.2.3**
>
> &emsp;&emsp;若同态 $f:G\to G'$ 是双射, 则 $f$ 是同构.

&emsp;&emsp;*→ Proof.* 只需要检查逆映射 $f^{-1}$ 也是同态即可.

&emsp;&emsp;例如上文提到过的  $\opn{GL}(V)\simeq\opn{GL}(n,F)$, $\opn{O}(V)\simeq\opn{O}(n)$, $\opn{U}(W)\simeq\opn{U}(n)$.

&emsp;&emsp;再如 $V:=\{\id,\sigma,\tau,\sigma\tau\}\sub S_4$, 其中
$$
\sigma=\pmat{1&2}\pmat{3&4},\quad \tau=\pmat{1&3}\pmat{2& 4},\quad \sigma\tau=\pmat{1&4}\pmat{2&3}=\tau\sigma.
$$
且 $\sigma^2=\tau^2=(\sigma\tau)^2=\id$. 可以验证这是一个子群, 称为 Klein 四元群. 同时令
$$
V':=\l\{\pmat{1\\&1},\pmat{1\\&-1},\pmat{-1\\&1},\pmat{1\\&1}\r\}\sub\opn{GL}(2,\Q).
$$
它们都同构于 $\Z/2\Z\x\Z/2\Z$.

> **定义 11.2.4 (内自同构)**
>
> &emsp;&emsp;对群 $G$ 和 $g\in G$, 定义 $\opn{Ad}_g:G\to G,~x\mapsto gxg^{-1}$.

&emsp;&emsp;显然它也是同构, 且 $\opn{Ad}_g\opn{Ad}_h=\opn{Ad}_{gh}$.

&emsp;&emsp;进一步地, 如果定义 $\opn{Aut}(G)$ 为 $G$ 上所有自同构构成的集合, 则它配上映射合成, 仍然是一个群. 并且 $\opn{Ad}:G\to\opn{Aut}(G),~g\mapsto\opn{Ad}_g$ 又给出了它与群本身的群同态. 注意到
$$
\opn{Ad}_g=\id_G\Eq(\A x\in G,~gx=xg)\Eq g\in Z_G.
$$

## $\S11.3$ 循环群

> **定义 11.3.1**
>
> &emsp;&emsp;称群 $G$ 是循环群, 当且仅当 $\E\sigma\in G,~G=\lang\sigma\rang$. (即 $\E\sigma\in G,~\A g\in G,~\E k\in\Z,~g=\sigma^k$.)

&emsp;&emsp;典型的例子是 $(\Z/n\Z,+)$, 这里只需要取 $\sigma=1+n\Z$.

&emsp;&emsp;接下来, 我们希望在同构意义下分类所有循环群.

> **命题 11.3.2**
>
> &emsp;&emsp;对循环群 $G=\lang\sigma\rang$, 则:
>
> - 若 $|G|=\oo$, 有同构 $\Z\isoto G,~k\mapsto\sigma^k$;
> - 若 $n:=|G|<\oo$, 有同构 $\Z/n\Z\isoto G,~k+n\Z\mapsto \sigma^k$.

&emsp;&emsp;证明不难. 这样就给出了所有循环群的分类.

## $\S11.4$ 陪集分解

> **定义 11.4.1**
>
> &emsp;&emsp;对群 $G$ 和其子群 $H$, 设 $x,y\in G$, 定义
>
> - $x\sim_Ly\Eq\E h\in H,~x=hy$;
> - $x\sim_Ry\Eq\E h\in H,~x=yh$.

&emsp;&emsp;不难验证二者各自是等价关系.

> **定义 11.4.2**
>
> &emsp;&emsp;对 $g\in G$, 定义 $Hg:=\{hg:h\in H\}$, $gH:=\{gh:h\in H\}$, 分别称为右陪集和左陪集, 它们分别刻画了 $g$ 所属的 $\sim_L$ 等价类和 $\sim_R$ 等价类. 进一步定义 $H\backslash G:=\{Hg:g\in G\}$ 和 $G/H:=\{gH:g\in G\}$.

&emsp;&emsp;这样就有
$$
G=\bigsqcup_{Hg\in H\backslash G}Hg=\bigsqcup_{gH\in G/H}gH.
$$
&emsp;&emsp;*lww: 19 世纪的数学家写这个反向的除号肯定是区分上下的, 你写成 $H\backslash G$ 这样会显得没文化.* 你说得对, 你是不是想这样写: `$_{\Large{H}}\!\backslash\!^{\Large G}$`, 收获效果: $_{\Large{H}}\!\backslash\!^{\Large G}$.

> **引理 11.4.3**
>
> &emsp;&emsp;对子集 $S\sub G$, 记 $S^{-1}:=\{s^{-1}:s\in S\}$, 则 $(Hg)^{-1}=g^{-1}H$, $(gH)^{-1}=Hg^{-1}$.

&emsp;&emsp;*→ Proof.* $(hg)^{-1}=g^{-1}h^{-1}$, $(gh)^{-1}=h^{-1}g^{-1}$, $H^{-1}=H$.

> **命题 11.4.4**
> $$
> H\backslash G\overset{1:1}{\longleftrightarrow} G/H,\quad Hg\mapsto g^{-1}H.
> $$

> **定义 11.4.5**
>
> &emsp;&emsp;定义 $(G:H):=|H\backslash G|=|G/H|$, 称为陪集 $H$ 的指数.

> **定理 11.4.6 (Lagrange)**
> $$
> |G|=|H|\cdot(G:H).
> $$
> 注意 $\cdot$ 为基数的乘法.

&emsp;&emsp;*→ Proof.* 对任意陪集 $C\in H\backslash G$, 取 $x_C\in C$, 即 $Hx_C=C$, 考虑映射 $H\x H\backslash G\to G,~(h,C)\mapsto hx_C$, 我们证明它是双射.

- 满性: $\A g\in G,~\E C\in H\backslash G,~g\in C=H x_C$, 所以 $g$ 在像中;
- 单性: $hx_C=h'x_{C'}\Ra C\cap C'\neq\varnothing\Ra C=C'\Ra x_C=x_{C'}$.

构成双射, 所以左右基数相等.

> **推论 11.4.7**
>
> &emsp;&emsp;对有限群 $G$ 和其子群 $H$, 总有 $|H|~\big|~|G|$.

> **推论 11.4.8**
>
> &emsp;&emsp;若子群 $H,K\sub G$, $G$ 有限, 且 $|H|\perp|K|$, 则 $H\cap K=\{1\}$.

> **定义 11.4.9**
>
> &emsp;&emsp;对群 $G$  和 $\sigma\in G$, 定义其阶数 $\ord(\sigma):=|\lang\sigma\rang|\in\N^*\sqcup\{\aleph_0\}$.

> **推论 11.4.10**
>
> &emsp;&emsp;对有限群 $G$ 和 $\sigma\in G$, $\ord(\sigma)\mid |G|$.

> **推论 11.4.11**
>
> &emsp;&emsp;若 $p:=|G|$ 是素数, 则 $G$ 一定是循环群.

&emsp;&emsp;*→ Proof.* 取 $1\neq\sigma\in G$, 则 $1\neq\ord(\sigma)\mid p\Ra\ord(\sigma)=p\Ra G=\lang\sigma\rang$.

> **性质 11.4.12**
>
> &emsp;&emsp;对群 $K\sub H\sub G$, 则 $(G:K)=(G:H)(H:K)$.

&emsp;&emsp;*→ Proof.* 设 $G=\bigsqcup_{C\in H\backslash G}Hx_C$,  $H=\bigsqcup_{D\in K\backslash H}Ky_D$, 那么
$$
G=\bigsqcup_{C\in H_G}Hx_C=\bigsqcup_{(C,D)}Ky_Dx_C,
$$
即有双射
$$
K\backslash G\overset{1:1}\leftrightarrow\{(C,D):C\in H\backslash G,~D\in K\backslash H\}.
$$
则 $(G:K)=(G:H)(H:K)$.

&emsp;&emsp;不如两边同时乘上 $|K|$.

## $\S11.5$ 群作用

&emsp;&emsp;我们总是在用群来抽象对称行为. 而研究一个对称行为自然在意 "作用于什么对象", "一个对象能被变换到哪些对象", "一个对象在哪些变换下保持不变" 等等. 想象一些形象的例子 (OI 里很经典的: 二面体群之于一串珍珠项链) 大概会有理解上的帮助.

> **定义 11.5.1**
>
> &emsp;&emsp;对群 $G$ 和集合 $X$, $G$ 在 $X$ 上的左作用为映射 $a:G\to X\to X$, 满足 $a(1)=\id_X$, $a(g)\circ a(h)=a(gh)$, 记 $a(g,x)=:gx$. 右作用 $a':X\to G\to X$ 同理. 左作用记作 $G\curvearrowright X$, 右作用同理.

> **定义 11.5.2**
>
> &emsp;&emsp;对群 $G$, 定义其相反群 $G^{\opn{op}}=(G,\odot)$, 其中 $g\odot g'=g'\cdot g$.

&emsp;&emsp;易见 $(G^{\opn{op}})^{\opn{op}}=G$. $G^{\opn{op}}=G$ 当且仅当 $G$ 是 Abel 群. 且 $G\isoto G^{\opn{op}},~g\mapsto g^{-1}$. $G$ 在 $X$ 上的左作用就是 $G^{\opn{op}}$ 在 $X$ 上的右作用.

> **定义 11.5.3**
>
> &emsp;&emsp;令 $G\curvearrowright X$, $x\in X$, 则 $x$ 在 $G$-轨道为 $Gx:=\{gx:g\in G\}$.

&emsp;&emsp;例如向量 $v\in\R^3$ 的 $\opn{SO}(3)$-轨道为 $\{w\in\R^3:\|w\|=\|v\|\}$.

> **定义-命题 11.5.4**
>
> &emsp;&emsp;同上语境下, $x$ 的稳定子 $\opn{Stab}_G(x):=\{g\in G:gx=x\}$, 这是 $G$ 的子群.

&emsp;&emsp;子群性质不难验证.

&emsp;&emsp;例如向量 $0\neq v\in\R^3$ 的稳定子 $\Stab_{\opn{SO}(3)}(v)=\{R_v(\theta):\theta\in\R/2\pi\Z\}$.

> **定义-命题 11.5.5**
>
> &emsp;&emsp;同上语境下, 定义 $X$ 上的二元关系 $\sim_G$, $x\sim_G y\Eq \E g\in G,~y=gx$. 则它是等价关系, 并且 $\sim_G$-等价类就是所有的 $G$-轨道. 顺带, 记 $X^G:=\{x\in X:\A g\in G,~gx=x\}$ 为 $G$-不动点, 它们是所有自成轨道的点的集合.

> **定理 11.5.5 (轨道分解)**
>
> &emsp;&emsp;若 $G\actl X$, 则
> $$
> X=\bigsqcup_{Gx\in G\backslash X}Gx.
> $$

> **定义 11.5.6**
>
> &emsp;&emsp;若 $G\actl X$, 且
>
> - 若 $\bigcap_{x\in X}\Stab_G(x)=\{1\}$, 则称此作用是忠实的 (faithful); (不存在非 $1$ 但保持恒等的作用.)
> - 若 $\A x,y\in X,~\E g\in G,~gx=y$, 则称此作用是传递的 (transitive); (只有一个轨道.)
> - 若 $\A x\in X,~\Stab_G(x)=\{1\}$, 则称此作用是自由的 (free). (非 $1$ 作用一定没有不动点.)

&emsp;&emsp;考虑映射 $G\emap Gx,~g\mapsto gx$, 令 $H=\Stab_G(x)$, 考察某个像, 若 $gx=g'x$, 那么
$$
g^{-1}g'x=x\Ra g^{-1}g'\in H\Ra g'\in gH\Ra g'H\sub gH \Ra g'H=gH.
$$
因此 $G/H\overset{1:1}\to Gx$, 推论有 $|Gx|=(G:H)$. 再根据轨道分解定理 (并接受集合基数的无限求和意义), 那么
$$
|X|=\sum_{Gx\in G\backslash X}(G:\Stab_G(x)).
$$

> **命题 11.5.7**
>
> &emsp;&emsp;对 $G\actl X\neq\varnothing$, 有
> $$
> \{\text{action}~a:G\x X\to X\}\overset{1:1}{\leftrightarrow}\{\text{homomorphism}~A:G\to \mathfrak S_X\}.
> $$

&emsp;&emsp;*→ Proof.* 我们在定义作用时自然地使用了 Curry 化形式, 这样看来这个命题是明显成立的. 注意作用的结合律对应了同态的结合律.

&emsp;&emsp;此外, 如果 $G\actl X$ 是忠实的, 那么 $\A g\in G,~(A(g)=\id_X\Eq g=1)$, 而 $A(g_1)=A(g_2)\Ra A(g^{-1}_1g_2)=\id_X$, 所以此时的 $A$ 一定是单射.

> **定理 11.5.8 (Cayley)**
>
> &emsp;&emsp;所有群 $G$ 都能嵌入 $\mathfrak S_G$.

&emsp;&emsp;*→ Proof.* 直接取 $G\actl G$, 其中 $a(g,x):=gx$. (这说明, 我们可以记录群运算的效果来记录群本身, 虽然这句话比较平凡.)

## $\S11.6$ 轨道分解的几则应用

> **定义 11.6.1**
>
> &emsp;&emsp;对有限群 $G$ 和素数 $p$, 若 $|G|=p^n$, 则称 $G$ 为一个 $p$-群.

> **命题 11.6.2**
>
> &emsp;&emsp;若 $G$ 是 $p$-群, $X$ 是有限集, 则 $|X^G|\equiv|X|\pmod p$, 其中 $X^G$ 为 $X$ 在 $G$ 作用下的不动点集.

&emsp;&emsp;*→ Proof.* (省流: 轨道大小要不是 $1$, 要不是 $p$ 倍数.) 设 $X$ 的轨道分解 $X=Gx_1\ops\sqcup Gx_m$, 记 $H_i=\Stab_G(x_i)$, 则
$$
|X|=\sum_{i=1}^m(G:H_i)=\sum_{i=1}^m|G|/|H_i|
$$
所以
$$
|X|\equiv|\{i:H_i=G\}|=|X^G|\pmod p.
$$

> **命题 11.6.3**
>
> &emsp;&emsp;对 $p$-群 $G\neq\{1\}$, 则其中心子群 $Z_G\neq\{1\}$.

&emsp;&emsp;*→ Proof.* 考虑作用 $G\actl G,~(g,x)\mapsto gxg^{-1}=\Ad_g(x)$, 则此时 $|Z_G|$ 就是 $G$-不动点的个数, 那么
$$
|Z_G|\equiv|G|\pmod p.
$$
而 $|Z_G|\ge 1$, 所以 $|Z_G|>1$.

## $\S11.7$ 应用: 置换的循环分解

&emsp;&emsp;对 $X\neq\varnothing$, $m\ge 1$, 取不同的 $\seq a1m\in X$, 指标约定在 $\Z/m\Z\overset{1:1}\leftrightarrow\{1\ops,m\}$ 中. 则形如下的 $\sigma\in\mathfrak S_X$:
$$
\env{cases}{
	\sigma(a_i)=a_{i+1},&i\in[1:m];\\
	x,&x\in X-\{\seq a1m\}
}
$$
称为 $\mathfrak S_X$ 上的 $m$-循环, 记作 $\sigma=\pmat{a_1&\cdots&a_m}$. 容易看出:

- 在 $\mathfrak S_X$ 中, $\ord\pmat{a_1&\cdots&a_m}=m$.
- 若 $\sigma=\pmat{a_1&\cdots&a_m}$ 和 $\tau=\pmat{b_1&\cdots&b_n}$ 无交, 则 $\sigma\tau=\tau\sigma$.

> **命题 11.7.1**
>
> &emsp;&emsp;任意置换 $\sigma\in S_n$ 可以被分解为两两不交的轮换:
> $$
> \sigma=\pmat{a_{1,1}&\cdots&a_{1,\ell_1}}\cdots\pmat{a_{m,1}&\cdots&a_{m,\ell_m}}.
> $$
> 满足 $\sum_{i=1}^m\ell_i=n$, 且这些轮换 up to 排列顺序地被 $\sigma$ 唯一确定.

&emsp;&emsp;*→ Proof.* 考虑作用 $\lang\sigma\rang\actl\{1\ops,n\}$, 它可以分解为 $\lang\sigma\rang$-轨道 $C_1\ops\sqcup C_m$, 对 $i\in[1:m]$, 取 $a_{i,1}\in C_i$ 和最小的 $\ell_i\ge 1$ 使得 $\sigma^{\ell_i}(a_{i,1})=a_{i,1}$ 即可. 后续比较琐碎, 就略过吧.

&emsp;&emsp;一些观察:

- $\ord(\sigma)=\lcm_{i\in[1:m]}\ell_i$.
- $\sgn(\sigma)=(-1)^{\sum_{i=1}^m(\ell_i-1)}=(-1)^{n-m}$, 其中 $m=\#\text{cycles of }\sigma$.

## $\S11.9$ 正规子群与商群

> **定义 11.9.1**
>
> &emsp;&emsp;称子群 $H\sub G$ 是正规的, 当且仅当 $\A g\in G~,gHg^{-1}=H$, 记作 $H\triangleleft G$. 条件也等价于:
>
> - $\A g\in G,~gHg^{-1}\sub H$;
> - $\A g\in G,~gH=Hg$; 或者
> - $\A g\in G,~gH\sub Hg$.

&emsp;&emsp;一些观察:

- Abel 群的所有子群都正规.
- $\{1\},G\triangleleft G$ 平凡地成立.
- $Z_G\triangleleft G$.
- 若 $N\nsubg G$, 子群 $H\sub G$, 则 $N\cap H\nsubg H$.
- $(G:H)=2\Ra H\nsubg G$, 因为左右陪集都只能是 $H$ 和 $G-H$ 两个. (为与陪集记号区分, 本节集合作差用 $-$ 而非 $\setminus$.)

> **定义 11.9.2**
>
> &emsp;&emsp;对群同态 $f:G\to G'$, 定义其核 $\ker f:=f^{-1}(1_{G'})=\{g\in G:f(g)=1_G\}$.

&emsp;&emsp;注意到 $\ker f\nsubg G$: 首先容易验证 $\ker f\sub G$ 是子群, 正规性直接研究 $f(ghg^{-1})$ 也可验证.

&emsp;&emsp;一些例子:

- 交错群 $\mathfrak A_n:=\ker\sgn\nsubg~\mathfrak S_n$.
- $V\nsubg{}\mathfrak A_4\nsubg{}\mathfrak S_4$, 注意对于循环 $\pmat{a_1&\cdots&a_m}$, 恰有 $\sigma\pmat{a_1&\cdots&a_m}\sigma^{-1}=\pmat{\sigma_{a_1}&\cdots&\sigma_{a_m}}$, 也就是说共轭作用保持各个循环的形状, 这样立即就有 $\sigma V\sigma^{-1}\sub V$. ($V$ 是上面提到过的 Klein 四元群.)
- 对有限维 $F$-向量空间 $W$, $\ker\det=\opn{SL}(W)\nsubg\opn{GL}(W)$.

&emsp;&emsp;类似于对线性映射 $\ker$ 的观察, $f(x)=f(y)\Eq f(xy^{-1})=1_{G'}\Eq xy^{-1}\in\ker f\Eq x\in (\ker f)y$, 因此 $(\ker f)x=(\ker f)y$, 即 $f$ 的纤维总是 $\ker f$ 的陪集, $f$ 是单射则当且仅当 $\ker f=\{1\}$.

&emsp;&emsp;由此, 还能类似地定义商映射. 对 $N\nsubg G$, 我们尝试将 $G/N$ 做成一个群, 使得商映射 $q:G\to G/N,~g\mapsto gN$ 是同态. 其中, 我们必须要求 $N$ 是正规的, 这是因为 $1_{G/N}=q(1_G)=N$ 且 $G\triangleright\ker q=\{g\in G:gN=N\}=N$.

> **定义-命题 11.9.3**
>
> &emsp;&emsp;对 $N\nsubg G$, 在 $G/N:=\{gN:g\in G\}$ 上定义二元运算 $(xN,yN)\mapsto xyN$, 这时
>
> - $G/N$ 连同此二元运算成为群;
> - $q:G\to G/N$ 成为群同态.
>
> 称此群为 $G$ 对 $N$ 的商群.

&emsp;&emsp;*→ Proof.* 首先验证运算的良定性. 若 $x'=xu,~y'=yv$, 其中 $u,v\in N$, 则
$$
x'y'N=xuyvN=xy{\color{cyan}y^{-1}uy}{\color{red}v}N=xyN.
$$
(染色项都是 $N$ 中的元素.) 群性质可以直接搬到 $G$ 上证明, 其中单位元即 $1_{G/N}=N$, 逆元即 $(xN)^{-1}=x^{-1}N$. 而 $q(xy)=xyN{{}\color{red}={}}xN\cdot yN=q(x)q(y)$, 是同态.

&emsp;&emsp;此外, 还能看出, 这样的二元运算是唯一将 $q$ 做成同态的定义. 或者说, 上式的 ${\color{red}=}$ 唯一地定义了这个二元运算.

> *Remark.*
>
> &emsp;&emsp;值得说明的是, 上述要求 $N$ 正规的逻辑是 "$q$ 是同态" $\Ra\ker q\nsubg G\Ra N\nsubg G$, 但如果我们放弃 $q$ 的性质, 对一切子群 $H$, 可以验证上述运算依然将 $G/H$ 配为群. 所以, 我们强调正规性就是为了保证 $q$ 是同态, 在研究商群时则更有必要留意 $q$ 作为同态的性质.

&emsp;&emsp;一些推论:

- 商空间 $V/U$ 其实就能视作商群 $(V,+)/(U,+)$ 再附带上 $F$ 的 $\x$ 运算;
- 商环 $R/I$ 也能视作商群 $(R,+)/(I,+)$ 再附带上 $R$ 上的 $\x$ 运算.

> **命题 11.9.4**
>
> &emsp;&emsp;对 $f:G\to G'$ 和正规子群 $N\nsubg G$, 若 $N\sub\ker f$, 则 $\E!\ol f:G/N\to G',~f=\ol fq$. 称 $\ol f$ 由 $f$ 诱导出.

&emsp;&emsp;*→ Proof.* 唯一性: $\ol fq=f\Eq(\A x\in G,~\ol f(xN)=f(x))$, 这已经决定了 $\ol f$.

&emsp;&emsp;存在性: 若 $xN=x'N$, 则 $x'=xu~(u\in N)$, 同时 $u\in N$, 所以 $f(x')=f(x)f(u)=f(x)$. 因此 $\ol f:xN\mapsto f(x)$ 总是良定, 且 $\ol f(xN,yN)=\ol f(xyN)=f(xy)=f(x)f(y)=\ol f(xN)\ol f(yN)$, 是同态.

> **推论 11.9.5**
>
> &emsp;&emsp;对同态 $f:G\to G'$ 和两个群各自的正规子群 $N,N'$, 若 $f(N)\sub N'$, 则存在唯一同态 $\ol f$, 使得以下交换:
> $$
> \begin{array}{ccc}
> 	G & \overset{f}\longrightarrow & G'\\
> 	q\downarrow&&\downarrow q'\\
> 	G/N & \underset{\ol f}\longrightarrow & G'/N'
> \end{array}
> $$

&emsp;&emsp;*→ Proof.* $f(N)\sub N'=\ker q'$, 即 $N\sub\ker(q'f)$, 对 $q'f:G\to G'/N'$ 和 $q$ 运用命题即可.

> **推论 11.9.6**
>
> &emsp;&emsp;对同态 $f:G\to G'$ (总是有 $\im f\sub G'$ 是子群), 令 $N=\ker f$, 则 $\ol f:G/(\ker f)\isoto\im f$.

&emsp;&emsp;*→ Proof.* $\ol f(xN)=f(x)$, 因而 $\im\ol f=\im f$. 若 $\ol f(xN)=\ol f(yN)$, 则 $f(x)=f(y)$, 所以 $xN=yN$, $\ol f$ 是单射. 最终就有 $\ol f:G/N\isoto\im f$.

> *Remark.*
>
> &emsp;&emsp;以上几个命题很生动: "你可以将核削掉任意正规的部分, 而不损失同态的信息".

&emsp;&emsp;特别地, 当 $f:G\emap G'$, 取 $N=\ker f$, 则 $q:G\emap G/(\ker f)$, 诱导出 $\ol f:G/(\ker f)\isoto G'=\im f$, 这就得到 $(G:\ker f)=|\im f|=|G'|$.

&emsp;&emsp;一些例子: $\sgn:\mathfrak S_n\to\{\pm1\}$ 是满的, 所以 $(\mathfrak S_n:\mathfrak A_n)=2$.

&emsp;&emsp;四元数范数 $N:\H^\x\to\R^\x_{>0}$ 是同态, $\ker N=:\H^1\nsubg \H^\x$, 而 $R:\H^1\to\opn{SO}(3),~q\mapsto(x\mapsto qxq^{-1})$ 也是同态, $\ker R=\{\pm 1\}$. 这样 $R$ 可以诱导出 $\ol R:\H^1/\{\pm 1\}\isoto\opn{SO}(3)$. 回忆有
$$
\H\underset{\text{ring}}{\isoto}\l\{\pmat{z&-\ol w\\w&\ol z}:z,w\in\C\r\},~z+\j w\leftrightarrow(z,w).
$$
它使得 $N\leftrightarrow\det$.
$$
\H^1\underset{\text{group}}\isoto\l\{\pmat{z&-\ol w\\w&\ol z}:|z|^2+|w|^2=1\r\}{\color{cyan}{}={}}\opn{SU}(2).
$$
(青色等号验证: 设出第一个单位向量 $(z,w)$, 算算就行啦.) 最终
$$
\opn{SU}(2)/\{\pm\bs 1_{2\x 2}\}\simeq\H^1/\{\pm 1\}\simeq\opn{SO}(3).
$$
这告诉我们, 三维旋转还可以用二维的酉矩阵表出.

> **命题 11.9.7**
>
> &emsp;&emsp;对满同态 $f:G\to G'$, 令 $N=\ker f$, 则
> $$
> \{H':H'\sub G'\}\overset{1:1}\longleftrightarrow \{H:N\sub H\sub G\},\\
> H'\leftrightarrow f^{-1}(H'),\quad f(H)\leftrightarrow H.
> $$
> 且对 $H,H'$ 都取正规子群的情况仍然是双射. 此双射满足:
>
> - $H_1'\sub H_2'\Ra f^{-1}(H_1')\sub f^{-1}(H_2')$;
> - 若 $G'\nsupg H'\mapsto H\nsubg G$, 则 $G\overset{f}\to G'\overset{q}\to G'/H'$ 诱导出同构 $G/H\isoto G'/H'$; (画交换图很明显.)
> - 若进一步令 $f$ 取为 $G$ 对 $N\nsubg G$ 的商同态 $f:G\to G/N$, 则上述同构进一步给出 $G/H\isoto(G/H)/(H/N)$. (在上一条的交换图上, 诱导出的是 $\id:G/H\isoto(G/N)/H'$, 其中 $H'=H/N$.)

&emsp;&emsp;*→ Proof.* 一方面, 明显 $H\sub f^{-1}f(H)$, 还需要证明 $f^{-1}f(H)\sub H$, 后者是因为 $f(x)=f(h)\Ra xh^{-1}\in N\Ra x\in H$, 所以 $x\in f(H)$. 现在已有 $H=f^{-1}f(H)$, 所以上述映射的确是一个互逆的双射. 其余性质的验证只需要基于 <u>推论 11.9.6</u>.

> *Remark.*
>
> &emsp;&emsp;这件事请告诉我们, 满射 (典型如商映射) 总能一一对应地搬运 (正规) 子群, 注意 $G$ 中的子群需要包含核.

&emsp;&emsp;一些例子: $\Z$ 的任意真子群形如 $a\Z$, 取 $f$ 为商同态 $q:\Z\to\Z/n\Z$, 代入上述命题, 则可知 $\Z/n\Z$ 的子群皆形如 $m\Z/n\Z=q(m\Z)$, 其中 $m\Z\supset\ker q=n\Z$, 即 $m\mid n$, 这就确定了循环群的子群.

> **定义 11.9.8**
>
> &emsp;&emsp;若群 $G\neq\{1\}$ 不含非平凡正规子群, 则称之为单群.

&emsp;&emsp;例如, 一个循环群是单群当且仅当其阶数是素数.

> **命题 11.9.9**
>
> &emsp;&emsp;对 $G$ 的两个子群 $H,K$, $K$ 正规, 则
> $$
> HK:=\{hk:h\in H,k\in K\}\sub G
> $$
> 是子群, 且 $HK=KH$.

&emsp;&emsp;*→ Proof.* 先证明 $HK=KH$. 对一切 $h\in H$ 和 $k\in K$:
$$
hk=(hkh^{-1})h\in KH,\quad kh=h(h^{-1}kh)\in HK.
$$
对子群性质, $1=1\cdot 1\in HK$, $h_1k_1h_2k_2\in h_1KH k_2=h_1 HK k_2=HK$, $(hk)^{-1}=k^{-1}h^{-1}\in KH=HK$.

> **定义 11.9.10**
>
> &emsp;&emsp;对子群 $K\sub G$, 定义
> $$
> Z_G(K):=\{g\in G:\A k\in K,~gkg^{-1}=k\},\quad N_G(K):=\{g\in G:gKg^{-1}=K\},
> $$
> 分别称为中心化子群和正规化子群.

&emsp;&emsp;明显 $K\nsubg N_G(K)\supset Z_G(K)$; $K\nsubg G\Eq N_G(K)=G$. (它们是让 $K$ 确实是中心/正规子群的, $G$ 的极大子群.)

> **推论 11.9.11**
>
> &emsp;&emsp;对 $G$ 的两个子群 $H,K$, $H\sub N_G(K)$, <u>命题 11.9.9</u> 成立.

&emsp;&emsp;*→ Proof.* 只在 $N_G(K)$ 上讨论即可.

> **命题 11.9.12**
>
> &emsp;&emsp;对子群 $H,K\sub G$, 若 $H\sub N_G(K)$, 则 $(H\cap K)\nsubg H$, 且
> $$
> H/(H\cap K)\isoto HK/K,\quad h(H\cap K)\mapsto hK.
> $$

&emsp;&emsp;*→ Proof.* 正规性, 对 $x\in H\cap K$, $h\in H$, 有 $hxh^{-1}\in H$, 正规化子群性质给出 $hxh^{-1}\in K$.

&emsp;&emsp;对同构性质, 考虑 $f:H\overset{\text{include}}{\mmap}HK\overset{q}\emap HK/K$, 有 $f(h)=hK$, 由于 $hkK=f(h)$, 它自然是满的. 此外, 有 $\ker f=H\cap K$, 这是因为 $f(h)=K\Eq hK=K\Eq h\in H\cap K$. 因此 $f$ 可以导出 $\ol f:H/(H\cap K)\isoto HK/K$, 就是题中所期待的同构.

## $\S11.10$ 半直积

> **定义-命题 11.10.1**
>
> &emsp;&emsp;设 $H,N$ 为群, $\varphi:H\to\opn{Aut}(N),~h\mapsto\varphi_h$ 为同态, 则在 $N\x H$ 上定义二元运算:
> $$
> (n,h)(n',h'):=(n\varphi_h(n'),hh')
> $$
> (这是一个 "扭曲" 的直积.) 这构成一个群, 记作 $N\rtimes_\varphi H$.

&emsp;&emsp;*→ Proof.* 验证群性质: $1_{N\rtimes_\varphi H}=(1_N,1_H)$, $(n,h)^{-1}=(\varphi_{h^{-1}}(n^{-1}),h^{-1})$. 结合律:
$$
((n,h)(n',h'))(n'',h'')=(n\varphi_h(n'),hh')(n'',h'')=(n\varphi_h(n')\varphi_{hh'}(n''),hh'h''),\\
(n,h)((n',h')(n'',h''))=(n,h)(n'\varphi_{h'}(n''),h'h'')=(n\varphi_h(n'\varphi_{h'}(n'')),hh'h'').
$$
需要验证 $\varphi_h(n')\varphi_{hh'}(n'')=\varphi_h(n'\varphi_{h'}(n''))$. 利用同态性质: $\varphi_h(n'\varphi_{h'}(n''))=\varphi_h(n')\varphi_h(\varphi_{h'}(n''))=\text{LHS}$.

&emsp;&emsp;还注意到 $N\mmap N\rtimes_\varphi H,~n\mapsto(n,1_H)$ 以及 $H\mmap N\rtimes_\varphi H,~h\mapsto(1_N,h)$, 且 $(n,1_H)(1_N,h)=(n,h)$.

&emsp;&emsp;其实还有 $N\nsubg N\rtimes_\varphi H$, 注意上段性质让我们不必考虑 $(n,h)$ 中的 $(n,1_H)$, 其实只需要验证
$$
(1_N,h)(n,1_N)(1_N,h)^{-1}=(1_N,h)(n,h^{-1})=(\varphi_h(n),1_H).
$$
特别地, 取 $\varphi_h=\id_N$, 就得到 $N\x H$.

> **命题 11.10.2**
>
> &emsp;&emsp;对群 $G$ 和其子群 $N,H$, 若 $N\nsubg G=NH$, $N\cap H=\{1\}$, 考虑 $\Ad_h(n)=hnh^{-1}$ 所定同态 $\Ad:H\to\opn{Aut}(N)$, 则有群同构:
> $$
> \Phi:N\rtimes_{\Ad} H\isoto G,~(n,h)\mapsto nh.
> $$
> 称 $G$ 是子群 $H$ 和正规子群 $N$ 的半直积, 记为 $G=N\rtimes H$.

&emsp;&emsp;*→ Proof.* 同态性质展开验证就行. 满性由 $G=NH$ 给出. 单性, $\Phi((n,h))=1\Eq nh=1\Eq n=h^{-1}\in N\cap H$, 只能 $n=1$.

> *Remark.*
>
> &emsp;&emsp;这个命题说明了定义半直积的初衷: 对 $N,H$, 我们希望找到一个大群 $G$, 它具有典范嵌入 $N\mmap G$ 和 $H\mmap G$, 此后不加说明的将 $N,H$ 的元素在此二者作用下视同 $G$ 的元素; 它的所有元素还都能写成 $g=nh$, 且 $N\nsubg G$. (这对应了上面的 $(n,1)$ 和 $(1,h)$.) 因此, 我们无非需要定义
> $$
> nh\x n'h'\overset{?}{:=}n^*h^*.
> $$
> 其中, $n$ 和 $h'$ 可以自然地吸收到右侧, 所以需要人为给出的只是
> $$
> hn'\overset{?}{:=}\wt n\wt h.
> $$
> 在上个命题中, 我们可以直接计算: 设 $n'=h^{-1}(hn'h^{-1})h$, 就有 $\wt n=hn'h^{-1}$ 而 $\wt h=h$, 这正是 $\varphi=\Ad$ 给出的半直积.
>
> &emsp;&emsp;而对于一般情况, 为了保持 $hNh^{-1}=N\Eq hN=Nh$, 需要 $\wt h=h$, 则乘法定义一定形如
> $$
> hn':=\varphi_h(n')h.
> $$
> 其中 $\varphi_h\in\opn{Aut}(N)$. 而结合律 $hh'n=(hh')n$ 给出 $\varphi_h\varphi_{h'}=\varphi_{hh'}$, 所以 $\varphi:H\to\opn{Aut}(N)$ 必须是同态. 所以, 半直积无非在保证嵌入和正规性质的情况下定义出了最为一般的 $G$.

&emsp;&emsp;一些例子:

&emsp;&emsp;(i) 任意取定单对换 $\tau=\pmat{i&j}\in\mathfrak S_n$, 则 $\mathfrak S_n=\mathfrak A_n\rtimes\lang\tau\rang$. 注意在 $n>2$ 时 $\mathfrak S_n\not\simeq\mathfrak A_n\x\lang\tau\rang$, 例如 $Z(\mathfrak S_n)=\{\id\}$, 但是 $Z(\mathfrak A_n\x\Z/2\Z)\supset\Z/2\Z$.

&emsp;&emsp;(ii) 对 $n\ge 3$, 定义 $\mathrm D_{2n}\sub\opn{O}(2)$ 为所有保持中心在 $(0,0)$ 的正 $n$ 边形不变的正交变换, 则它是 $\opn{O}(2)$ 的子群. 在复平面上考虑, 正 $n$ 边形有顶点 $\{1,\zeta,\cdots,\zeta^{n-1}\}$, 其中 $\zeta=\e^{2\pi\i/n}$. 设 $\sigma=R(2\pi/n)$ (或说 $\sigma:z\mapsto \zeta z$), 显然 $\sigma\in\opn D_{2n}$ 且 $\Z/n\Z\simeq\lang\sigma\rang\sub\opn{D}_{2n}$. 再设 $\tau$ 为延 $x$ 轴的反射 (或说 $\tau:z\mapsto\ol z$), 显然也有 $\tau\in\opn{D}_{2n}$, $\Z/2\Z\simeq\lang\tau\rang\sub\opn{D}_{2n}$.

&emsp;&emsp;断言: $\opn{D}_{2n}=\lang\sigma\rang\rtimes\lang\tau\rang\simeq\Z/n\Z\rtimes_\varphi\Z/2\Z$, 其中 $\varphi_{1+2\Z}:a+n\Z\mapsto -a+n\Z$. 验证:

- $\opn{D}_{2n}\cap\opn{SO}(2)=\lang\sigma\rang$;
- $\opn{SO}(2)\nsubg\opn{O}(2)\Ra\lang\sigma\rang\nsubg\opn{D}_{2n}$;
- $\tau\notin\opn{SO}(2)$ (注意 $\det\tau=-1$), 因而 $\lang\sigma\rang\cap\lang\tau\rang=\{\id\}$;
- $\tau\sigma^a\tau^{-1}=\sigma^{-a}$;
- $\opn{D}_{2n}=\lang\sigma\rang\lang\tau\rang$, 因为对 $g\in\opn{D}_{2n}$, $g(1)=\zeta^k\Ra(\sigma^{-k}g)(1)=1\in\C$. 取 $\C=\lang 1,\sqrt{-1}\rang$, 则 $\sigma^{-k}g$ 对应矩阵 $\pmat{1\\&\pm1}$. 若为 $+1$, 则 $\sigma^{-k}g=\id$, $g=\sigma^k$; 若为 $-1$, $\sigma^{-k}g=\tau$, $g=\sigma^k\tau$.

# 第十二章 模论入门

## $\S12.1$ 模的基本定义

> **定义 12.1.1**
>
> &emsp;&emsp;对环 $R$, 左 $R$-模为以下资料:
>
> - 加法群 (交换群) $(M,+)$;
> - 映射 $\cdot:R\x M\to M$,
>
> 使得:
>
> - $r(x+y)=rx+ry$;
> - $(r_1+r_2)x=r_1x+r_2x$;
> - $(r_1r_2)x=r_1(r_2x)$;
> - $1_Rx=x$.
>
> (右 $R$-模即交换上述乘法的次序.)

&emsp;&emsp;事实上左 $R$-模和右 $R^{\opn{op}}$-模是等价的. 而若 $R$ 是交换环, 则不必区分左右模.

&emsp;&emsp;模有一些直接的性质:

- $0_Rx=0_M$;
- $(-1_R)x=-x$;
- $(n1_R)x=nx~(n\in\Z)$.

&emsp;&emsp;一些例子:

- 对域 $F$, $F$-模即 $F$-向量空间;
- 对环 $R$, $R$ 自身可以作为一个 $R$-模;
- 对加法群 $(A,+)$, 总能定义 $\cdot:\Z\x A\to A,~(n,a)\mapsto na:=\underbrace{a\ops+a}_{n\text{ copies}}$, 这形成一个 $\Z$-模. 因此 $\Z$-模也总能视作加法群.

## $\S12.2$ 模的同态, 同构与商

> **定义 12.2.1**
>
> &emsp;&emsp;对 $R$-模 $M_1,M_2$, 称映射 $f:M_1\to M_2$ 是同态, 当且仅当:
>
> - $f$ 是加法群 $M_1,M_2$ 间的同态;
> - $\A r\in R,~\A x\in M_1,~f(rx)=rf(x)$.
>
> 并记
> $$
> \Hom(M_1,M_2)=\Hom_R(M_1,M_2)=\{\text{homomorphism}~f:M_1\to M_2\}.
> $$

&emsp;&emsp;注意 $\Hom(M_1,M_2)$ 自身还是一个加法群, 这里 $(f_1+f_2)(x):=f_1(x)+f_2(x)$, $0_{\Hom(M_1,M_2)}=(x\mapsto 0)$. 但它一般不能直接作为 $R$-模: 自然地构造 $(rf)(x):=rf(x)$, 它的确保持加法:
$$
(rf)(x+y)=rf(x+y)=(rf)(x)+(rf)(y).
$$
但是
$$
(rf)(r'x)=rf(r'x)=rr'f(x)\overset{?}=r'rf(x)=r'(rf)(x).
$$
只有在 $R$ 是交换环时, 才能确定 $\Hom(M_1,M_2)$  是一个 $R$-模.

&emsp;&emsp;此外, 同态对复合 $\circ$ 自然是封闭的.

> **定义 12.2.2**
>
> &emsp;&emsp;$M\to M'$ 的同构是一个同态 $f:M\to M'$, 使得 $\E\text{homomorphism}~g:M'\to M,~gf=\id_M,~fg=\id_{M}$. (这样的 $g$ 若存在则唯一确定为 $f^{-1}$). 记为 $f:M\isoto M'$.

> **命题 12.2.3**
>
> &emsp;&emsp;对同态 $f:M\to M'$, 若 $f$ 是集合间的双射, 则 $f$ 是同构.

> **定义 12.2.4**
>
> &emsp;&emsp;对子集 $N\sub M$, 若 $N$ 是 $(M,+)$ 的子群且在 $R$ 的乘法下封闭, 则 $N$ 是一个 $R$-模, 称为 $M$ 的子模. 自然地有嵌入同态 $N\mmap M$.

&emsp;&emsp;一些例子:

- $R$ 是域时, 子模即子向量空间;
- $R=\Z$, 子模即子群;
- $R$ 是交换环时, $M=R$, 子模即 $R$ 的理想.
- 子模的交仍然是子模.
- $\DS\sum_{i\in I}M_i:=\l\{\text{finite sum }\sum_{i\in I} x_i:x_i\in M_i\r\}$ 是子模,  它是包含所有 $M_i$ 的最小子模.
- 对 $M$ 的子集 $S$, $\DS\lang S\rang:=\l\{\text{finite sum }\sum_{s\in S}r_ss:r_s\in R\r\}$ 是子模, 它是包含 $S$ 的最小子模.
- 对同态 $f:M\to M'$, $\ker f$ 和 $\im f$ 各自是 $M$ 和 $M'$ 的子模.

&nbsp;

&emsp;&emsp;接下来, 我们希望将作为群的商群 $(M/N,+)$ 升级为一个 $R$-模.

> **定义-命题 12.2.5**
>
> &emsp;&emsp;对 $R$-模 $M$ 和子模 $N$, 在商群 $(M/N,+)$ 上定义乘法
> $$
> \cdot:R\x(M/N)\to M/N,\quad (r,x+N)\mapsto rx+N.
> $$
> 这使得 $M/N$ 成为 $R$-模, 而商映射 $q$ 成为模同态. 称 $M/N$ 为商模.

&emsp;&emsp;*→ Proof.* 良定性: 若 $x+N=x'+N$, 则 $\E  u\in N,~x'=x+u$. 这样
$$
rx'+N=r(x+u)+N=rx+ru+N=rx+N.
$$
其他性质在 $M$ 上验证即可. 最终 $q(rx)=rx+N=r(x+N)=rq(x)$.

> **定义 12.2.6**
>
> &emsp;&emsp;对同态 $f:M\to M'$, 其余核 $\coker f:=M'/(\im f)$.

> **命题 12.2.7**
>
> &emsp;&emsp;对同态 $f:M\to M'$, 子模 $N\sub M$, $N\sub\ker f$, 则存在唯一同态 $\ol f:M/N\to M'$, 使得 $f=\ol fq$.

&emsp;&emsp;*→ Proof.* 在加法群层面是正确的, 还需要验证 $\ol f$ 是一个 $R$-模同态. 这是因为
$$
\ol f(rx+N)=f(rx)=rf(x)=r\ol f(x+N).
$$

> **推论 12.2.8**
>
> &emsp;&emsp;对同态 $f:M\to M'$, $N\sub M$, $N'\sub M'$, $f(N)\sub N'$, 则存在唯一 $\ol f$, 使得以下交换:
> $$
> \begin{array}{ccc}
> 	M & \overset{f}\longrightarrow & M'\\
> 	q\downarrow&&\downarrow q'\\
> 	M/N & \underset{\ol f~(\E!)}\longrightarrow & M'/N'
> \end{array}
> $$

&emsp;&emsp;*→ Proof.* 作为加法群也是正确的, 只需要验证
$$
\ol f(rx+N)=f(rx)+N'=rf(x)+N'=r(f(x)+N')=r\ol f(x+N).
$$

> **命题 12.2.9**
>
> &emsp;&emsp;对同态 $f:M\to M'$, 有 $\ol f:M/(\ker f)\isoto \im f\sub M'$.

&emsp;&emsp;*→ Proof.* 已知 $\ol f:M/(\ker f)\isoto\im f$ 是群同构, 是双射, 且 $\ol f$ 是 $R$-模同态, 所以 $\ol f$ 就是 $R$-模同构.

> **命题 12.2.10**
>
> &emsp;&emsp;对满同态 $f:M\to M'$, 有
> $$
> \{\text{submodule}~N'\sub M'\}\overset{1:1}\longleftrightarrow \{\text{submodule}~\ker f\sub N\sub M\},\\
> N'\mapsto f^{-1}(N'),\quad N\mapsto f(N).
> $$

&emsp;&emsp;*→ Proof.* 仍然可以照搬群上的证明, 然后验证纯量乘法.

## $\S12.3$ 直和分解

> **定义 12.3.1**
>
> &emsp;&emsp;对环 $R$ 和一族 $R$-模 $(M_i)_{i\in I}$, $\prod_{i\in I}M_i$ 自然地给出一个交换群, 在其上配备纯量乘法:
> $$
> R\x\prod_{i\in I}M_i\to\prod_{i\in I}M_i,\quad (r,(x_i)_{i\in I})\mapsto(rx_i)_{i\in I}.
> $$
> 得到的 $\prod_{i\in I}M_i$ 作为 $R$-模, 被称为这一族 $R$-模的直积.
>
> &emsp;&emsp;直和 $\bigoplus_{i\in I}M_i\sub\prod_{i\in I}M_i$, 定义为
> $$
> \bigoplus_{i\in I}M_i:=\l\{(x_i)_{i\in I}\in\prod_{i\in I}M_i:\#\{x_i\neq 0\}<\oo\r\}.
> $$

&emsp;&emsp;典范地有嵌入同态 $\iota_j:M_j\mmap\bigoplus_{i\in I}M_i$ 和投影同态 $p_j:\bigoplus_{i\in I}M_i\to M_j$.

&emsp;&emsp;类似于向量空间, 上面的直和是一种 "外" 的直和, 接下来我们给出内直和.

> **定义-命题 12.3.2**
>
> &emsp;&emsp;对 $R$-模 $M$ 和其一族子模 $(M_i)_{i\in I}$, 定义
> $$
> \sigma:\bigoplus_{i\in I}M_i\to M,\quad (x_i)_{i\in I}\mapsto\sum_{i\in I}x_i.
> $$
> 则以下等价:
>
> &emsp;&emsp;(i) $\sum_i M_i=M$, 且 $\A i\in I,~M_i\cap\sum_{j\neq i}M_j=\{0\}$;
>
> &emsp;&emsp;(ii) $\A x\in M,~\E!(x_i)\in\bigoplus M_i,~x=\sum x_i$;
>
> &emsp;&emsp;(iii) $\sigma$ 是同构.
>
> 满足以上条件则称 $\bigoplus M_i$ 是这些子模的内直和.

## $\S12.4$ 自由模

> **定义 12.4.1**
>
> &emsp;&emsp;对集合 $X$, 其上的自由模定义为 $R^{\oplus X}$, 作为集合有 $X\mmap R^{\oplus X},~x\mapsto([x=y])_{y\in X}$ (类似 one-hot 编码).

&emsp;&emsp;此后我们总认为 $X$ 是如此的 one-hot 形式, 进而 $m\in R^{\oplus X}$ 总能唯一地写为 $m=\sum_{x\in X}r_xx$.

> **命题 12.4.2**
>
> &emsp;&emsp;对任意 $R$-模 $N$, 有双射
> $$
> \Hom(R^{\oplus X},N)\overset{1:1}\longleftrightarrow\{\text{map }f:X\to N\};\\
> \varphi\leftrightarrow\varphi|_X,\quad \br{\sum_{x\in X}r_xx\mapsto\sum_{x\in X}r_xf(x)}\leftrightarrow f.
> $$

&emsp;&emsp;证明不困难.

> **定义-命题 12.4.3**
>
> &emsp;&emsp;对 $X\sub M$, 以下等价:
>
> &emsp;&emsp;(i) $X$ 生成 $M$, 且 $X$ 是 $R$-线性无关的;
>
> &emsp;&emsp;(ii) $\A y\in M,~\E!(r_x)_{x\in X}\in R^{\oplus X},~y=\sum_{x\in X}r_xx$;
>
> &emsp;&emsp;(iii) 设同态 $\varphi:R^{\oplus X}\to M$ 导出嵌入 $X\mmap M$, 则 $\varphi$ 是同构.
>
> 若条件成立, 则称 $M$ 是以 $X$ 为基的自由模. 当这样的 $X\sub M$ 存在时, 称 $M$ 是自由的.

&emsp;&emsp;*→ Proof.* 证明 $\text{(i)}\Eq\text{(ii)}$ 和 $\text{(ii)}\Eq\text{(iii)}$ 即可.

&emsp;&emsp;注意当 $R$ 为域时, 所有 $R$-模都是自由的, 这时基 $X$ 对应了向量空间的基.

> **定义-命题 12.4.4**
>
> &emsp;&emsp;对交换环 $R$, 若 $M$ 可以是以 $X$ 或 $Y$ 为基的自由模, 则 $|X|=|Y|$. 任取这样一个 $X$, 进一步定义 $\rank M:=|X|$.

&emsp;&emsp;*→ Proof.* 这里仅处理 $R$ 是整环, $M$ 有限生成的特例. 对任意基 $X$, 总能写出 $M\simeq R^{\oplus X}$, 由于 $M$ 有限生成, 有 $|X|<\oo$. 不妨只证明 $|Y|\le|X|=:n$, 令 $K:=\opn{Frac}(R)$, 将 $M$ 放入 $K^{\oplus n}=K^n$ 中, 则
$$
\A\seq y1{n+1}\in M,~\E\seq a1{n+1}\in K,~\sum_{i=1}^{n+1}a_iy_i=0\quad(\E a_j\neq 0).
$$
而总能给出 $a_i\in R$ 所以 $\seq y1{n+1}$ 在 $M$ 中线性相关. 因此 $|Y|\le n$.

&emsp;&emsp;事实上, 在右 $R$-模上, 有
$$
\Hom(R^{\oplus n},R^{\oplus m})\overset{1:1}\leftrightarrow \M_{m\x n}(R).
$$
即所有同态都能唯一写作一个矩阵的左乘作用. 为了避免讨论纯量乘法和矩阵的交换性质, 我们采用了右模.

&emsp;&emsp;我们先不加证明地给出结构定理:

> **定理 12.4.5**
>
> &emsp;&emsp;设 $R$ 为 PID, $M$ 是有限生成 $R$-模, 则
> $$
> M\simeq R/I_1\ops\oplus R/I_k\oplus E,
> $$
> 其中 $R\neq I_1\ops\supset I_k\neq\{0\}$ 是理想, $k\in\Z_{\ge 0}$, $E$ 是有限生成的 $R$-自由模. 此外, 若还有
> $$
> M\simeq R/I_1'\ops\oplus R/I_{k'}'\oplus E',
> $$
> 则必有 $k=k'$, $I_i=I_i'$, $E\simeq E'$. 理想列 $I_1\supset\cdots\supset I_k\supset\underbrace{\{0\}\ops\supset\{0\}}_{\rank E}$ 称为 $N$ 的不变因子.

## $\S12.5$ 基于挠子模的分解

> **定义 12.5.1**
>
> &emsp;&emsp;对交换环 $R$ 和其理想 $I$, 设 $M$ 为 $R$-模, 定义
> $$
> M[I]:=\{x\in M:\A a\in I,~ax=0\}\sub M
> $$
> 它是一个子模. 当 $I=(h)$, 简记作 $M[h]$. 可见 $M[I]=\bigcap_{h\in I}M[h]$. 若 $R$ 为整环且 $x$ 存在于某个 $M[h]~(h\neq 0)$ (即 $x$ 可以零化一个非零理想), 则称 $x$ 是 $M$ 的一个挠元, 否则称 $x$ 无挠.

&emsp;&emsp;例如, 在 $R$-自由模中一定无非零挠元. (如果挠元在某个直和项投影非零, 则它在这一维就无法零化任何非零元素.)

> **定义-命题 12.5.2**
>
> &emsp;&emsp;对整环 $R$ 和 $R$-模 $M$, 定义
> $$
> M_{\opn{tor}}:=\{x\in M:\text{torsion element}\}.
> $$
> 则 $M_{\opn{tor}}$ 是 $M$ 的一个子模.

&emsp;&emsp;*→ Proof.* 明显 $0\in M_{\opn{tor}}$; 对 $x,y\in M_{\opn{tor}}$, 有 $rx=sy=0$, 那么 $rs(x+y)=0$, 即 $x+y\in M_{\opn{tor}}$; 对 $x\in M_{\opn{tor}}$, 有 $rx=0$, 则 $\A t\in R,~rtx=trx=0$.

> **定义-命题 12.5.3**
>
> &emsp;&emsp;对同上的 $M$, 定义 $M_{\opn{tf}}:=M/M_{\opn{tor}}$, 称为 $M$ 的无挠商, 它没有非零挠元.

&emsp;&emsp;*→ Proof.* 令 $x+M_{\opn{tor}}=\ol x\in M_{\opn{tf}}$, 如果有 $r\ol x=\ol 0$, 即 $rx\in M_{\opn{tor}}$, 那么存在 $s(rx)=0$, 这不就是 $(sr)x=0\Ra\ol x=\ol 0$.

&emsp;&emsp;显然 $h\mid k\Ra M[h]\sub M[k]$, 现在设 $R$ 为唯一分解整环, $t\in R\setminus\{0\}$, 则 $t\sim p_1^{a_1}\cdots p_m^{a_m}$.

> **引理 12.5.4**
>
> &emsp;&emsp;上述语境下, $M[t]=\bigoplus_{i=1}^m M[p_i^{a_i}]$.

&emsp;&emsp;*→ Proof.* 只需证明, 若 $t=ab$, $a\perp b$, 有 $M[t]=M[a]\oplus M[b]$. 取 $au+bv=1$, 令 $x\in M[t]$, 则
$$
x=1x=\underbrace{aux}_{(b\cdot a)ux=0}+\underbrace{bvx}_{(a\cdot b)vx=0}\in M[b]+M[a],
$$
这给出 $M[t]\sub M[a]+M[b]$. 另一方向, 显然 $x\in M[a]\land y\in M[b]\Ra ab(x+y)=0$. 现在 $M[t]=M[a]+M[b]$. 令 $x\in M[a]\cap M[b]$, 则
$$
x=uax+vbx=0+0=0\in M.
$$
综上得证.

&emsp;&emsp;设 $p$ 为 PID $R$ 的素元, $M$ 为 $R$-模, 明显 $M[p]\sub M[p^2]\sub\cdots$, 记 $M[p^\oo]=\bigcup_{i\ge 1}M[p^i]$, 它也是 $M$ 的子模. 所以, 如果存在 $t$ 使得 $M=M[t]$, 就有 $M=\bigoplus_pM[p^\oo]$, 这是因为
$$
M[p^n]=M[p^n]\cap M[t]=M[\gcd(p^n,t)]=M[p^a]\quad(p^a\parallel t).
$$
这里就有 $M[p^\oo]=M[p^a]$. (我们记 $p^a\parallel t\Eq p^a\mid t\land p^{a+1}\nmid t$.)

&emsp;&emsp;下面的命题可以作为一个例子.

> **命题 12.5.5**
>
> &emsp;&emsp;设 $R$ 为 PID, $M=R/(t)$, $p$ 为素元, 那么:
>
> &emsp;&emsp;(i) $p^a\mid t\Ra M[p^a]\simeq R/(p^a)$;
>
> &emsp;&emsp;(ii) $p^a\parallel t\Ra M[p^\oo]\simeq R/(p^a)$.

&emsp;&emsp;*→ Proof.* (i) 若 $p^a\mid t$, $\ol x=x+(t)\in R/(t)$, 则 $p^a\ol x=\ol 0\Eq \E y,~p^ax=ty\in R$, 设 $s=t/p^a\in R$, 则前式也等价于 $x\in(s)$. 因此, $R\emap (R/(t))[p^a]=(s)/(t),~y\mapsto sy+(t)$ 是满的, $\ker=\{y\in R:t\mid sy\}=(p^a)$, 所以 $(R/(t))[p^a]\simeq R/(p^a)$.
&emsp;&emsp;(ii) 注意 $M=R/(t)=M[t]$ (任何元素${}\cdot t$ 均在理想中), 那么 $M[p^\oo]=M[p^a]\simeq R/(p^a)$.

## $\S12.6$ 主理想环上的有限生成模

> **定理 12.6.1 (结构定理)**
>
> &emsp;&emsp;对 PID $R$ 和有限生成的 $R$-模 $M$, 有
> $$
> M\simeq \underbrace{R/(f_1)\ops\oplus R/(f_k)}_{=M_{\opn{tor}}=M[f_k]}\oplus E,
> $$
> 其中 $f_1\mid\cdots\mid f_k$, $f_i\in R-R^\x$.

&emsp;&emsp;我们可以对任意素元 $p\mid f_k$, 取 $b_i(p)$ 使得 $p^{b_i(p)}\parallel f_i$, 这样
$$
R/(f_i)=\bigoplus_{p\mid f_k~\text{prime}}(R/(f_i))[p^\oo]\simeq\bigoplus_{p\mid f_k}R/(p^{b_i(p)}).
$$
所以
$$
M_{\opn{tor}}\simeq\bigoplus_{p\mid f_k}\bigoplus_{i=1}^kR/(p^{b_i}(p)).
$$
其中 $0\le b_1(p)\ops\le b_k(p)$ 称为初等因子, 一切 $p$ 的初等因子一起确定了不变因子 $f_1\mid\cdots\mid f_k$.

> **引理 12.6.2**
>
> &emsp;&emsp;设 $R$ 为 PID, $E$ 是 $R$-自由模, $\rank E=n\in\Z_{\ge 0}$, $N$ 是其子模, 则存在基 $\seq f1n\in E$, $\seq d1n\in R$, 使得 $d_1\mid\cdots\mid d_n$ 且 $d_1f_1\ops,d_rf_r$ 构成 $N$ 的一组基, $r:=\max\{i:d_i\neq 0\}$.

&emsp;&emsp;*→ Proof @ 12.6.1 (存在性)* 设 $M$ 由 $\seq x1n$ 生成, $E:=R^{\oplus n}\emap M,~(r_i)\mapsto\sum_{i=1}^n r_ix_i$, 记 $N$ 为其核, 则 $M\simeq E/N$. 根据上述引理, 取 $\seq f1n$ 和 $\seq d1n$, 有
$$
M\simeq\frac{Rf_1\ops\oplus Rf_n}{Rd_1f_1\ops\oplus Rd_rf_r}.
$$
回忆 $(M_1\oplus M_2)/(N_1\oplus N_2)=(M_1/N_1)\oplus(M_2/N_2)$, 那么
$$
M\simeq\bigoplus_{i=1}^r R/(d_i)\oplus R^{\oplus (n-r)}.
$$

&emsp;&emsp;*→ Proof @ 12.6.1 (唯一性)* 若 $M\simeq R/I_1\ops\oplus R/I_k\oplus E$, $M'\simeq R/I_1'\ops\oplus R/I_{k'}'\oplus E'$, 且 $M\simeq M'$, 我们希望证明这些 $I$ 和 $E$ 各自对应相等. 由于 $M\isoto M'$, 它能限制为 $M_{\opn{tor}}\isoto M'_{\opn{tor}}$ 以及 $M_{\opn{tf}}\isoto M'_{\opn{tf}}$, 后者已经给出 $E\simeq E'$. 对于 $I$ 的部分, 我们将不变因子转为初等因子, 则需要证明对一切素元 $p\in R$, 有
$$
M:=R/(p^{b_1})\ops\oplus R/(p^{b_k})\simeq R/(p_1^{b_1'})\ops\oplus R/(p^{b_{k'}'})=:M'.
$$
且各幂次对应相等. 使用 <u>命题 12.5.5</u> (或者直接在这个特殊情况目测) 得:
$$
M[p]=\bigoplus_i(R/(p^{b_i}))[p]\simeq\bigoplus_i R/(p),
$$
自然等同于 $R/(p)$-模, 而它是一个域, 所以这就是一个向量空间的直和分解, 则 $\dim_{R/p}M[p]=k$, 同构地给出 $k=k'$. 更一般地, 我们通过研究 $p^jM$ 来分指数大小地处理每个 $p^{b_i}$ 和 $p^{b_i'}$. 考虑
$$
p^jM\simeq\bigoplus_{i~(j<b_i)}p^jR/p^{b_i}R\simeq\bigoplus_{i~(j<b_i)}R/p^{b_i-j}R.
$$
所以
$$
\dim_{R/p}(p^jM)[p]=\#\{i:j<b_i\}=:\nu_j.
$$
同理得到 $\nu_j'$. 同构地有 $\nu=\nu'$, 明显 $\nu$ 可以唯一确定 $b$, 所以各个 $b_i$ 也都相等. 

&emsp;&emsp;现在我们只差 <u>引理 12.6.2</u> 尚未证明.

## $\S12.7$ 矩阵的 Smith 标准形

&emsp;&emsp;设有交换环 $R$ 和 $n,m\ge 1$, $R$-模 $M$, 则对 $M$ 上的两列 $\seq e1n$, $\seq x1m$ 以及 $R$ 上的矩阵 $A\in\M_{n\x m}(R)$, 形式地记
$$
\newcommand{pvmat}[2]{\br{\begin{array}{c|c|c}#1&\cdots&#2\end{array}}}
\pvmat{x_1}{x_m}=\pvmat{e_1}{e_n}A\Eq \A j\in[1:m],~x_j=\sum_{i=1}^na_{ij}e_i.
$$
相当于将 $M$ 上的元素在某种程度上视作 $R$-向量. 再定义
$$
\opn{GL}(n,R):=\{A\in\M_{n\x n}(R):\E B\in\M_{n\x n}(R),~AB=BA=\bs 1\}\overset{\text{Cramer's rule}}=\{A:\det A\in R^\x\}.
$$

> **引理 12.7.1**
>
> &emsp;&emsp;若 $\pvmat{y_1'}{y_n'}=\pvmat{y_1}{y_n}P$, $P\in\opn{GL}(n,R)$, 则
> $$
> \sum_{i=1}^n Ry_i=\sum_{i=1}^n Ry_i'.
> $$

&emsp;&emsp;*→ Proof.* 左侧含于右侧,根据条件显然. $\pvmat{y_1'}{y_n'}P^{-1}=\pvmat{y_1}{y_n}$, 则右侧含于左侧.

> **引理 12.7.2**
>
> &emsp;&emsp;若 $M$ 自由, $\seq e1n$ 是其基, 且
> $$
> \pvmat{e_1'}{e_n'}=\pvmat{e_1}{e_n}A,
> $$
> $A$ 唯一, 那么 $e_1'\ops,e_n'$ 是 $M$ 的基当且仅当 $A\in\opn{GL}(n,R)$.

&emsp;&emsp;*→ Proof.* 左推右, 存在唯一的 $B$ 使得
$$
\pvmat{e_1}{e_n}=\pvmat{e_1'}{e_n'}B\\
\Ra \pvmat{e_1}{e_n}=\pvmat{e_1}{e_n}AB\\
\Ra AB=\bs 1.
$$
上一条引理给出 $\sum_i Re_i'=\sum_i Re_i=M$. 反之若 $Q\in\opn{GL}(n,R)$, 上一条引理给出 $e_1'\ops,e_n'$ 生成 $E$, 而
$$
\pvmat{e_1'}{e_n'}\pmat{a_1\\\vdots\\a_n}=\pvmat{e_1}{e_n}Q\pmat{a_1\\\vdots\\a_n}=0,
$$
则 $Q$ 左乘线性组合系数 $\seq a1n$ 为 $0$, 必然 $a_1\ops=a_n=0$.

&emsp;&emsp;设 $E$ 为秩 $n$ 的 $R$-自由模, $N$ 是其有限生成子模, 由 $\seq x1m$ 生成. 再选定 $E$ 的基 $\seq e1n$, 那么唯一存在 $A\in\M_{n\x m}(R)$, 使得
$$
\pvmat{x_1}{x_m}=\pvmat{e_1}{e_n}A.
$$
任意地将 $A$ 替换为 $AP$ 或 $QA$ ($P,Q\in\opn{GL}(n,R)$), 无非是对 $x$ 或 $e$ 进行了更换.

> **定理 12.7.3 (Smith)**
>
> &emsp;&emsp;设 $R$ 为 PID, $A\in\M_{n\x m}(R)$, 则存在 $P\in\opn{GL}(m,R)$ 和 $Q\in\opn{GL}(n,R)$, 使得
> $$
> A=Q\pmat{d_1\\&d_2\\&&\ddots}P,
> $$
> 其中 $d_1\mid d_2\mid\cdots$ 在对角线上, 其余部分为 $0$.

&emsp;&emsp;*→ Proof @ 12.6.2* 在 <u>引理 12.6.2</u> 的语境下, 取 $E$ 的基 $\seq e1n$, 可以证明 $N$ 是有限生成的, 取其生成元 $\seq x1m$, 取 $A$ 使得
$$
\pvmat{x_1}{x_m}=\pvmat{e_1}{e_n}A,\quad A\overset{\text{Smith's}}=Q\pmat{d_1\\&d_2\\&&\ddots}P,
$$
那么
$$
\underbrace{\pvmat{x_1}{x_m}P^{-1}}_{\text{generates }N}=\underbrace{\pvmat{e_1}{e_n}Q}_{\text{base of }E}\pmat{d_1\\&d_2\\&&\ddots}_{n\x m}.
$$
所以 $N$ 由 $x_i'=d_if_i$ 生成, $d_1\mid d_2\mid\cdots$.

&emsp;&emsp;*→ Proof @ 12.7.3* (省流: 行列变换消成对角阵, 更相减损术得到目标.) 设 $R$ 为 $\Z$ 或 $F[X]$. 从 $\Z$ 开始. 枚举 $Q,P\in\opn{GL}(n,R)$, 在 $QAP$ 中取绝对值最小的非零项, 不妨取在 $(1,1)$, 断言对所有合理的 $j$ 都有 $a_{11}\mid a_{1j}$ 和 $a_{11}\mid a_{j1}$. 否则, 设 $a_{1j}=a_{11}d+r$, $0<r<|a_{11}|$, 通过初等列变换可将 $(1,j)$ 变为 $r$, 这与枚举 $Q,P$ 时 $a_{11}$ 的最小性矛盾. 这样可以通过消元使得 $A$ 的第一行和第一列只剩下 $a_{11}$. 这样, 已经可以归纳出形如
$$
A=Q\pmat{d_1\\&d_2\\&&\ddots}P,
$$
如果 $d_1\nmid d_2$, 设 $d_2=d_1q+r$, 通过初等行列变换能使 $d_2\gets r$, 这也矛盾. 所以 $R=\Z$ 时结论无误. 对 $R=F[X]$, 取 $|\cdot|=\deg\cdot$, 证明同理.

&emsp;&emsp;对一般的 PID $R$, 我们需要确定某种形式的 "大小顺序" 来进行辗转相除. 还算走运, 直觉的构造是成立的: 设
$$
N(a=p_1^{\alpha_1}\cdots p_m^{\alpha_m})=\alpha_1\ops+\alpha_m,
$$
替换上述讨论中的绝对值即可.

&nbsp;

&emsp;&emsp;以下是关于诺特环和诺特模的补充. (由于没找到 lww 讲义里的对应内容就放在这里了.)

> **定义 12.7.4**
>
> &emsp;&emsp;对交换环 $R$, 我们称其是诺特环, 当且仅当所有理想链 $I_1\sub I_2\sub\cdots$ 稳定化, 即在 $i$ 足够大时 $I_i=I_{i+1}$.
>
> &emsp;&emsp;对 $R$-模 $M$ 是诺特模, 当且仅当所有子模链 $M_1\sub M_2\sub\cdots$ 稳定化.

&emsp;&emsp;注意 PID 总是诺特环. 诺特模 $M$ 总是有限生成的, 否则 $Rx_1\subsetneq Rx_1+Rx_2\subsetneq Rx_1+Rx_2+Rx_3\subsetneq\cdots$ 将给出矛盾. (事实上. 诺特模的等价定义就是所有子模有限生成.)

> **命题 12.7.5**
>
> &emsp;&emsp;设 $R$ 是交换环, $M$ 是 $R$-模, $M'\sub M$ 是子模, $M''=M/M'$, 则 $M$ 是诺特模当且仅当 $M'$ 和 $M''$ 都是诺特模.

&emsp;&emsp;*→ Proof.* 左推右是容易的, 因为子模的子模链也是原来模的子模链. 右推左, 设 $M$ 中有子模链 $M_1\sub M_2\sub\cdots$, 令 $M_i'=M_i\cap M'$, $M_i''=(M_i+M')/M'$, 则存在 $i_0$, $i\ge i_0\Ra M_i'=M_{i+1}'\land M_i''=M_{i+1}''$, 尝试说明这也推出 $M_i\supset M_{i+1}$. 对任意 $x\in M_{i+1}$, 总是存在 $y\in M_i$, 使得 $\underbrace{x+M'}_{\in M_i''}=\underbrace{y+M'}_{\in M_{i+1}''}$, 于是
$$
x-y\in M'\cap M_{i+1}=M_{i+1}'=M_i'\sub M_i\Ra x\in M_i.
$$

> **推论 12.7.6**
>
> - 若 $M_1,M_2$ 都是诺特模, 则 $M_1\oplus M_2$ 也是诺特模;
> - 若 $R$ 是 PID, $E$ 是自由 $R$-模, $\rank=n\in\Z_{\ge 0}$, 则 $E$ 是诺特模;

# 第十三章 标准形

## $\S13.1$ 线性映射和模结构

> **引理 13.1.1**
>
> &emsp;&emsp;给定一个 $F$-向量空间 $V$, 可以将 $V$ 配备为 $F[X]$-模: 指定一个 $T\in\End(V)$, 定义 "纯量" 乘法为 $f\cdot v=f(T)v$. 更进一步地, 给定 $(V,T)$ 和 $(V',T')$, 有
> $$
> \Hom_{F[X]}(V,V')=\{\varphi\in\Hom_F(V,V'):\varphi T=T'\varphi\}.
> $$

&emsp;&emsp;*→ Proof.* 只说明后半部分结论. 对 $\varphi\in\Hom_F(V,V')$, 考虑对纯量乘法的保持: $\varphi f(T)v=f(T')\varphi v$ 对一切 $f\in F[X]$ 成立, 所以  $\varphi\in\Hom_{F[X]}(V,V')\Eq \varphi f(T)=f(T')\varphi~(\A f)$, 这就只需要由 $\varphi T=T'\varphi$ 保证.

&emsp;&emsp;于是有推论: 给定 $(V,T)$ 和 $(V',T')$, 则
$$
\{\text{isomorphism over}~F[X]\text{-modules}~\varphi:V\to V'\}=\{F\text{-linear}~\varphi:V\isoto V':\varphi T=T'\varphi\}.
$$
> *Remark.*
>
> &emsp;&emsp;我认为这是一种构造性的 "巧合": 本章的主旨是对 (有限维) 向量空间上的线性映射进行精确到共轭的分类, 所论 "标准形" 无非是为每个等价类指派了一个具有某种特征的形式. 通过 <u>引理 13.1.1</u> 和上述推论, 我们成功地将共轭关系 $T'=\varphi T\varphi^{-1}$ 对应为了 $F[X]$-模的同构, 对于后者, 模结构定理无疑是一种强大的已知工具, 本章无非是把结构定理在线性映射和矩阵上操练一遍.

&emsp;&emsp;接下来, 我们希望分类所有 $F[X]$-模 $V$, 其中 $\dim_F V=:n\in\Z_{\ge 0}$.

&emsp;&emsp;定义 $(V,T)\approx(V',T')$, 当且仅当存在 $F$-线性的 $\varphi:V\isoto V'$ 满足 $\varphi T=T'\varphi$. 这样:
$$
\{V\}/_\simeq\overset{1:1}\leftrightarrow\{(V,T)\}/_\approx\overset{1:1}{\underset{V=F^n}\leftrightarrow}\M_{n\x m}(F)/_{\text{conjugation}}.
$$

&emsp;&emsp;一个例子: 令 $R=F[X]$, $M=F[X]/(f)$ 是 $F[X]$-模, $f=c_0\ops+c_{n-1}X^{n-1}+X^n$, 取 $M$ 的基 $1+(f)\ops,X^{n-1}+(f)$, 则 "乘 $X$" 所对应的矩阵 $T$ 为
$$
T=\pmat{&&&-c_0\\1&&&-c_1\\&\ddots&&\vdots\\&&1&-c_{n-1}},
$$
这是所谓友矩阵, 记为 $C_f$.

> *Remark.*
>
> &emsp;&emsp;由于从向量空间升级到的 $F[X]/(f)$-模的纯量乘法由 $X$ 的纯量乘法唯一刻画, 所以写出 $X\x(\cdot)$ 所对应的矩阵是一个很理想的共轭类代表元. 在确认 $f$ 首一的前提下, $f$ 自然是唯一确定的.

## $\S13.3$ 有理标准形

> **定理 13.3.1**
>
> &emsp;&emsp;固定 $n\in\Z_{\ge 1}$, 令 $A\in\M_{n\x n}(F)$, 则存在唯一一列首一的多项式 $f_1\mid f_2\mid\cdots\mid f_k\in F[X]-F$, 使得 $\sum_{i=1}^k \deg f_i=n$ 且 $A\sim_{\text{conj}}\diag(C_{f_1},\cdots,C_{f_k})$.

&emsp;&emsp;这种形式称为 $A/_{\text{conj}}$ 的有理标准形. 这列 $f$ 称为其不变因子.

&emsp;&emsp;*→ Proof.* 令 $M$ 为 $A/_{\text{conj}}$ 所对应的 $F[X]$-模, 结构定理给出
$$
M\simeq F[X]/(f_1)\ops\oplus F[X]/(f_k)\oplus E.
$$
而 $\dim_F M=n$ 且 $\dim_FF[X]=\oo$, 所以 $E=\{0\}$, 且
$$
\sum_{i=1}^k\dim_F(F[X]/(f_i))=\sum_{i=1}^k\deg f_i=n.
$$
已知 $F[X]/(f_i)\leftrightarrow C_{f_i}$, 则 $M\leftrightarrow\diag(C_{f_1}\ops,C_{f_k})$.

> **推论 13.3.2**
>
> &emsp;&emsp;(i) 极小多项式 $\Min_A=f_k$.
>
> &emsp;&emsp;(ii) 特征多项式 $\Char_A=\prod_{i=1}^k f_i$.

&emsp;&emsp;*→ Proof.* (i) 对任意 $h\in F[X]$, 如果 $h(A)=\bs 0$, 根据前文讨论, "在 $M=F[X]/(f_1)\ops\oplus F[X]/(f_k)$ 上乘 $X$" 等价于 "$A$ 作为 $F^n\to F^n$" 这个线性映射, 则 $h(A)=\bs 0$ (作为 $F^n$ 上的线性映射相等) 给出 $h(X)=\bs 0$ (作为 $M$ 上的映射相等), 也即在每个 $F[X]/(f_i)$ 上相等, 所以 $f_i\mid h~(\A i)$. 所以 $f_k\mid h$, $\Min_A=f_k$.

&emsp;&emsp;(ii) 已知 $\Char_{C_{f_i}}=f_i$, 乘起来就行. 此外, 这里容易看出 $\Min_A\mid\Char_A\Ra\Char_A(A)=\bs 0$, 给出 Cayley-Hamilton 定理.

&emsp;&emsp;另一个关于结构定理的例子: 取 $R=\Z$, 则所有有限生成的交换群 $A$ (也即 $\Z$-模) 有
$$
A\simeq\Z/d_1\Z\ops\oplus\Z/d_k\Z\oplus\Z^r,
$$
且 $d_1\mid\cdots\mid d_k$ 和 $r\ge 0$ 唯一.

&emsp;&emsp;而对于 $A\in\M_{n\x n}(F)$, $\Min_A=p_1^{a_1}\cdots p_m^{a_m}$, 其中 $p_i$ 是 $F[X]$ 内的素元, $a_i\ge 1$, 运用 <u>定理 12.5.6</u> 的形式:
$$
A\sim_{\text{conj}}\diag(\seq A1m),
$$
其中
$$
A_j=\diag\br{C_{p_j^{b_{1,j}}},\cdots C_{p_j^{b_{r_j},j}}}.
$$
并且 up to $p$ 的排列, 以上资料被 $A$ 的共轭类唯一确定.

## $\S13.4$ 有理标准形的计算

> *Remark.*
>
> &emsp;&emsp;兔子兔子, 直接目测结构定理的直和项还是太吃操作了, 有没有简单又好算 (并不) 的算法推荐一下?
>
> &emsp;&emsp;本节尝试利用 Smith 标准形的结论来推导有理标准形. 虽然多项式矩阵消元还是令人畏惧, 但至少是多项式 (双关) 算法!

&emsp;&emsp;对 $F$-向量空间 $V$, $\dim_F V=n\in\Z_{\ge 1}$, 取 $T\in\End(V)$ 将 $V$ 升级为 $F[X]$-模, 我们现在希望找到一个 $F[X]$-模的同态
$$
\varphi:F[X]^{\oplus n}\emap V,
$$
使得存在 $F[X]^{\oplus n}$ 的基 $\{\seq f1n\}$ 和首一的 $d_1\mid \cdots\mid d_n\in F[X]-\{0\}$, 满足
$$
\ker\varphi=\bigoplus_iF[X]d_if_i.
$$
$d_i\neq 1$ 的部分则给出 $T$ 的不变因子, 这是因为 $V\simeq F[X]^{\oplus n}/\ker\varphi\simeq\bigoplus_iF[X]/(d_i)$.

&emsp;&emsp;固定 $V$ 的 $F$-基 $\seq v1n$, 取 $F[X]^{\oplus n}$ 的标准基 $\seq e1n$, 将 $\varphi$ 定义作 $\varphi(e_i):=v_i$, 则
$$
\varphi\br{\sum_i r_ie_i}=\sum_ir_i(T)v_i.
$$
将 $T$ 视同矩阵 $A=(a_{ij})$, 再定义
$$
x_j:=Xe_j-\sum_{i=1}^n a_{ij}e_i\in F[X]^{\oplus n}.
$$

> **引理 13.4.1**
> $$
> \ker\varphi=N:=\sum_{j=1}^nF[X]x_j.
> $$

&emsp;&emsp;*→ Proof.* 右含于左, $\varphi(x_j)=Tv_j-\sum_{i}a_{ij}v_i=0$.

&emsp;&emsp;左含于右, 对任意 $j$,
$$
Xe_j=\sum_ia_{ij}e_i+x_j\in \sum_ia_{ij}e_i+N.
$$
所以 $\A x\in F[X]^{\oplus n},~x+N=\sum_ic_ie_i+N$. 一般地, 对 $x=\sum_jg_je_j$, 只需要考虑 $x=X^ke_j$ 的情况.

&emsp;&emsp;到此, $\varphi(x)=0\Ra\sum_ic_i\varphi(e_i)=0\Eq c_1\ops=c_n=0$. $\varphi$ 诱导出 $\ol\varphi:F[X]^{\oplus n}/N\isoto V$ (作为 $F[X]$-模的同构). 观察到
$$
\pvmat{x_1}{x_n}=\pvmat{e_1}{e_n}(X\bs1_{n\x n}-A)\in\M_{n\x n}(F[X]).
$$
利用 Smith 标准形, 给出
$$
\pvmat{x_1}{x_n}=\pvmat{e_1}{e_n}Q\pmat{d_1\\&\ddots\\&&d_n}P,
$$
其中 $d_1\mid\cdots\mid d_n\in F[X]$, $P,Q\in\opn{GL}(n,F[X])$. 到此就有 $V\simeq\bigoplus_{i=1}^nF[X]/(d_i)$. 假定 $d_i$ 首一, 则非 $1$ 的 $d$ 给出不变因子.

> *Remark & Supplementary.*
>
> &emsp;&emsp;你说得对, 但 $Q\diag(\cdots)P$ 不是只能给出相抵吗? 我不是关心共轭吗?
>
> &emsp;&emsp;原来 lww 消极怠工 (或者我睡着了), <u>讲义命题 13.4.5</u> 说明了 "$A,B\in\M_{n\x n}(F)$ 共轭" 与 "$X\bs 1-A$, $\bs X1-B$ 相抵" 的等价性. 其核心来源于 Smith 标准形给出的不变因子 $d_1\mid\cdots\mid d_n$ up to $R^\x$ 是唯一的. 细节略了.

## $\S13.5$ Jordan 标准形

&emsp;&emsp;*lww: 为什么没有人把它翻译作乔丹标准形???*

> **定义 13.5.1**
>
> &emsp;&emsp;对环 $R$ 和 $r\in R$, 若存在 $d\ge 1$ 使得 $r^d=0$, 则称 $r$ 是幂零的, 最小的这样的 $d$ 称为 $r$ 的幂零指数.

&emsp;&emsp;后续讨论 $R=\M_{n\x n}(F)$ 或者 $\End(V)$ 的情况. 回忆广义特征子空间 $V[\lambda]:=\ker(T-\lambda)^n$

> **命题 13.5.2**
>
> &emsp;&emsp;对 $T\in\End(V)$, 以下等价:
>
> &emsp;&emsp;(i) $T$ 是幂零的;
>
> &emsp;&emsp;(ii) $\E k\ge 1,~\Min_T=X^k$;
>
> &emsp;&emsp;(iii) $\Char_T=X^n$;
>
> &emsp;&emsp;(iv) $V=V[0]$.

&emsp;&emsp;*→ Proof.* $\dedu{i}{ii}$, 若 $T^d=0_V$, 则 $\Min_T\mid X^d$, 所以 $\Min_T=X^k$. 由于 $\dim V=n\ge 1$, 自然 $k\ge1$.

&emsp;&emsp;$\dedu{ii}{iii}$, 令 $T$ 的不变因子为 $f_1\mid\cdots\mid f_k=\Min_T$, 则 $f_i=X^{c_i}$, $c_1\le\cdots\le c_k$, $\Char_T=X^{\sum_i c_i}=X^n$.

&emsp;&emsp;$\dedu{iii}{iv}$, 由 Caylay-Hamilton 定理, $T^n=0\Ra V[0]=V$.

&emsp;&emsp;$\dedu{iv}{i}$, 对任意 $\lambda\in F$, $(T-\lambda)|_{V[\lambda]}$ 总是幂零的. 令 $\lambda=0$ 即可.

> **定义 13.5.3**
>
> &emsp;&emsp;对 $\lambda\in F$, $d\in\Z_{\ge 1}$, 定义 Jordan 块
> $$
> J_d(\lambda)=\pmat{\lambda & 1\\&\ddots&\ddots\\&&\ddots&1\\&&&\lambda}.
> $$
> 顺便记 $J_d^{\text{down}}(\lambda)=J_d(\lambda)^\T$.

> **引理 13.5.4**
>
> &emsp;&emsp;令 $A\in\M_{n\x n}(F)$ 幂零, 则存在唯一 $b_1\ops\le b_r\in\Z_{\ge 1}$, 使得
> $$
> A\sim\diag(J_{b_1}(0)\ops,J_{b_r}(0)).
> $$
> 且 $b_r$ 为 $A$ 的幂零指数. 对 $J_{b_i}^{\text{down}}(0)$ 同理.

&emsp;&emsp;*→ Proof.* 令 $d$ 为 $A$ 的幂零指数, 则 $X^d=\Min_A$. 令 $f_1\mid\cdots\mid f_r$ 为 $A$ 的不变因子, 则 $f_i=X^{b_i}$,
$$
A\sim\diag(C_{f_1}\ops,C_{f_r}),\quad C_{f_i}=C_{X^{b_i}}=J_{b_i}^{\text{down}}(0).
$$
转置一下得到对 $J_{b_i}(0)$ 的证明.

> **定理 13.5.5 (Jordan 标准形)**
>
> &emsp;&emsp;设 $A\in\M_{n\x n}(F)$, $\Char_A$ 在 $F[X]$ 分裂, 有根 $\seq\lambda 1m$ (不计重数), 则
> $$
> A\sim\diag(\seq A1m);\quad A_j=\diag(J_{b_{1,j}}(\lambda_j)\ops,J_{b_{r_j,j}}(\lambda_j)),\quad 1\le b_{1,j}\ops\le b_{r_j,j}.
> $$
> 且以上资料由 $A$ 的共轭类唯一确定 up to 对根的重排. 对下三角的版本同样成立.

&emsp;&emsp;*→ Proof.* 考虑 $T\in\End(V)$, $\dim_F V=n$, 则
$$
V=\bigoplus_{i=1}^m V[\lambda_i],\quad\dim_FV[\lambda_i]:=d_i\in\Z_{\ge 1}.
$$
设 $T_i=T|_{V[\lambda_i]}$, 对所有 $j$, $T_j-\lambda_j$ 幂零. 引理给出
$$
T_j-\lambda_j\sim\diag(J_{b_{1,j}}(0)\ops,J_{b_{r_j,j}}(0)),
$$
移项即可 (纯量与矩阵交换, 不放心自己验算). 选取适当的基即可证明存在性.

&emsp;&emsp;对唯一性, 设已有如上形式的 $T$, 则它对应于 $T$ 不变子空间的分解 $V=\bigoplus_jV_j$, 且 $T|_{V_j}-\lambda_j$ 幂零, 即
$$
V_j\sub V[(X-\lambda_j)^\oo]=V[\lambda_j]\Ra V_j=V[\lambda_j].
$$
由于这样的分解唯一, 只需证明限制在每个 $V_j$ 上的结果唯一. 利用模论上初等因子的结论即可.

## $\S13.6$ Jordan 标准形的计算

&emsp;&emsp;设 $\dim V=n$, $T\in\End(V)$, $\Char_T$ 分裂.

&emsp;&emsp;方法一: 按定义地先分解 $\Char_T$, 在每个子空间上算 Smith 标准形.

> *Remark.*
>
> &emsp;&emsp;不得不提到, 有理标准形的计算仍然很烦人, 能不能用 Jordan 算有理标准形呢? 二者的联系究竟是什么呢?
>
> &emsp;&emsp;设 $A\sim\diag(\seq A1m)$, $A_i=\diag(J_{r_{i,1}}(\lambda_i),\cdots,J_{r_{i,b_i}}(\lambda_i))$, 根据幂零情况的论证过程, 这个 $A_i$ 实际上给出了 $p=X-\lambda_i$ 时 $A$ 的初等因子 $\{0\ops,0,r_{i,1},\cdots,r_{i,b_i}\}$, 所有初等因子可以还原不变因子: 我们将这些初等因子按照高指数对齐, 就已然给出了 $A$ 的每个不变因子, 进而就求出有理标准形了.
>
> &emsp;&emsp;至于 Jordan 分解怎么求, 当然不能用方法一踢皮球, 方法二是个还算好算的做法!

&emsp;&emsp;方法二: 先考虑幂零的情况.

- 容易证明这时 $T$ 有 $n-\rank T$ 个 Jordan 块.

- 对 $d\ge 1$, 考虑 $d\x d$ Jordan 块的数量, 断言 $N(d)=\rank T^{d+1}+\rank T^{d-1}-2\rank T^d$.

    注意 $\rank J_{b_i}(0)^{k_i}=\max\{0,b_i-k_i\}$, 所以幂次 $\rank$ 的差分值能够反映现在 $b_i\ge k_i$ 的数量, 上式是自然的.

对一般的情况, 设 $\Char_T$ 有根 $\seq\lambda 1m$:

- 特征值为 $\lambda_j$ 的 Jordan 块有 $n-\rank(T-\lambda_j)$ 个;
- $N_j(d):=\rank((T-\lambda_j)^{d+1})+\rank((T-\lambda_j)^{d-1})-2\rank((T-\lambda_j)^d)$.

&emsp;&emsp;对第一步, 设 $V=\bigoplus_{j=1}^m V[\lambda_j]$, $T_j:=T|_{V[\lambda_j]}$, 则
$$
n-\rank(T-\lambda_j)=\sum_{i=1}^m(n_i-\rank(T_i-\lambda_j))=n_j-\rank(T_j-\lambda_j).
$$
(注意 $T_i$ 只有 $\lambda_i$ 这个特征值.) 第二步的证明同上.

> **定理 13.6.1 (Jordan-Chevalley 分解)**
>
> &emsp;&emsp;对 $\dim V=n\in\Z_{\ge 1}$, $T\in\End(V)$, $\Char_T$ 在 $F[X]$ 分裂, 则存在唯一 $S,N\in\End(V)$, 使得 $S$ 在 $F$ 可对角化, $N$ 幂零, $SN=NS$, 且 $T=S+N$.

&emsp;&emsp;*→ Proof.* 存在性, 利用 Jordan 分解, 不妨 $V=F^n$, $T$ 对应 $J_n(\lambda)\in\M_{n\x n}(F)$, 直接取 $S=\lambda\bs 1$, $N=J_n(0)$ 即可.

&emsp;&emsp;唯一性, 设 $T=S+N$ 满足相应条件. 设 $\seq\mu1\ell\in F$ 为 $S$ 的不同特征值, $V=V_1\ops\oplus V_\ell$ 为相应特征子空间, 则对 $1\le j\le\ell$, $V_j$ 总是 $T$-不变的, 设 $T_j:=T|_{V_j}=\mu_j+N|_{V_j}$, 注意 $T_j-\mu_j$ 仍然是幂零的. 也就是说, $V_j$ 含于 $T$ 的 $\mu_j$-广义特征子空间, 即 $V[\mu_j]$. 因此现在有
$$
V=V_1\ops\oplus V_\ell=V[\mu_1]\ops\oplus V[\mu_\ell].
$$
所以 $V_j=V[\mu_j]$, 且 $\seq\mu1\ell$ 就是 $T$ 的所有特征值. 因此 $S|_{V[\lambda]}=\lambda$, $N=T-S$, 唯一确定.

&emsp;&emsp;事实上, 存在 $f,g\in F[X]$, 使得 $f(T)=S$, $g(T)=N$. 令 $f\equiv\mu_i\pmod{(X-\mu_i)^n}$, 则
$$
(T-\mu_j)^n|_{V_j}=0\Ra f(T)|_{V_j}=\mu_j\Ra f(T)=S.
$$
然后 $g=X-f$ 即可.

&emsp;&emsp;注意也有类似的乘法形式的分解: $T=SU=US$, 满足 $S$ 可对角化, $U-\id$ 幂零. 见 <u>第八次作业 1</u>.

# 第十五章 张量积

&emsp;&emsp;对于 $F$-向量空间 $V$ 和 $W$, 我们希望对 $v\in V$ 和 $w\in W$ 找到一种具有所谓 "泛性质" 的对象 $v\otimes w$, 使得我们有能力单从 $v\otimes w$ 这个向量来 "恢复" 所有双线性映射 $B(v,w)$ 的结果.

## $\S15.1$ 以泛性质定义张量积

> **定义-命题 15.1.1**
>
> &emsp;&emsp;给定 $F$-向量空间 $V,W$, 考虑资料 $(L,B)$, 其中 $L$ 是 $F$-向量空间, $B:V\x W\to L$ 双线性, 则
>
> &emsp;&emsp;(i) 存在 $L_{\u{univ}}$, $B_{\u{univ}}$, 使得 $\A(L,B),~\E!\varphi\in\Hom_F(L_{\u{univ}},L),~B=\varphi B_{\u{univ}}$.
>
> &emsp;&emsp;(ii) 若 $(L_{\u{univ}},B_{\u{univ}})$, $(L'_{\u{univ}},B'_{\u{univ}})$ 均满足 (i), 则 $\E!\varphi:L_{\u{univ}}\isoto L'_{\u{univ}},~B'_{\u{univ}}=\varphi B_{\u{univ}}$.
>
> 此后记 $L_{\u{univ}}=:V\otimes W$, $B_{\u{univ}}(v,w)=:v\otimes w$.

&emsp;&emsp;*→ Proof.* (i) 构造 $E=F^{\oplus(V\x W)}$, $\mathcal N$ 是其中由以下元素生成的子空间:
$$
(v+v',w)-(v,w)-(v',w),\\
(v,w+w')-(v,w)-(v,w'),\\
(tv,w)-t(v,w),\\
(v,tw)-t(v,w).
$$
进而定义 $L_{\u{univ}}:=F^{\oplus(V\x W)}/\mathcal N$, $B_{\u{univ}}(v,w):=(v,w)+\mathcal N$, 容易验证这的确是双线性映射.

> *Remark.*
>
> &emsp;&emsp;商掉这些元素生成的子空间相当于规定空间中的它们为 $0$, 目的是在已知双线性性的前提下尽量减少空间的冗余信息. (因为我们希望打造 $\varphi\in\Hom_F(L_{\u{univ}},L)$ 的存在唯一性.)
>
> &emsp;&emsp;在一些地方, 张量空间是直接由 (i) 的构造定义的, 我觉得这是坏的. 我们关心的是泛性质本身, 不加分析地写这个商空间定义会显得 unmotivated.

&emsp;&emsp;现在对任意双线性映射 $B:V\x W\to L$, 考虑唯一的 $\wt\varphi:E\to L$, 使得 $\wt\varphi((v,w))=B(v,w)$. 双线性形可以给出 $\wt\varphi(\mathcal N)=0$. 所以也存在唯一 $\varphi:L_{\u{univ}}=E/\mathcal N\to L$, 使得 $\A e\in E,~\varphi(e+\mathcal N)=\wt\varphi(e)$.

&emsp;&emsp;唯一性, 考虑在每个基 $(v,w)+\mathcal N$ 的行为即可.

&emsp;&emsp;(ii) 对于 $(L_{\u{univ}},B_{\u{univ}})$, $(L'_{\u{univ}},B'_{\u{univ}})$, 将 $L=L_{\u{univ}}'$ 代入前者的 (i), 得到唯一的 $\varphi\in\Hom(L_{\u{univ}},L'_{\u{univ}})$, 同理得到唯一的 $\psi\in\Hom(L_{\u{univ}}',L_{\u{univ}})$, 但是 $L=L_{\u{univ}}$ 代入前者的 (i) 有唯一的 $\varphi'=\id$, 即 $\varphi\psi=\id$. 同理 $\psi\varphi=\id$, 这给出了同构.

&nbsp;

&emsp;&emsp;简要地说, 对一切 $F$-向量空间 $L$ 都有 $\Hom(V\otimes W,L)\simeq\opn{Bil}(V,W;L)$.

&emsp;&emsp;对多重线性映射也有同样的定理. 有多重线性的张量积 $V_1\ops\otimes V_n$, 向量 $v_1\ops\otimes v_n$, 也即有
$$
\Hom(V_1\ops\otimes V_n,M)\isoto\opn{Mul}(\seq V1n;M).
$$

> **定义-命题 15.1.2**
>
> &emsp;&emsp;给定线性映射 $f_i:V_i\to W_i$, 则存在唯一线性映射 $f_1\ops\otimes f_n$, 使得以下交换:
> $$
> \begin{array}{ccc}
> 	V_1\ops\x V_n & \overset{(\seq f1n)}\longrightarrow & W_1\ops\x W_n\\
> 	\downarrow & & \downarrow\\
> 	V_1\ops\otimes V_n & \underset{f_1\ops\otimes f_n}\longrightarrow & W_1\ops\otimes W_n
> \end{array}
> $$

&emsp;&emsp;*→ Proof.* 对已知的一侧, 合成映射效果为 $(\seq v1n)\mapsto f_1(v_1)\ops\otimes f_n(v_n)$, 这是一个多重线性映射, 根据泛性质就得到所求的线性映射. 我们也进一步写出
$$
(f_1\ops\otimes f_n)(v_1\ops\otimes v_n)=f_1(v_1)\ops\otimes f_n(v_n).
$$
&emsp;&emsp;有以下推论:

- $\id_{V_1}\ops\otimes \id_{V_n}=\id_{V_1\ops\otimes V_n}$;

- $U_i\overset{g_i}\to V_i\overset{f_i}\to W_i$, 则 (省略复合记号):
    $$
    (f_1\ops\otimes f_n)(g_1\ops\otimes g_n)=f_1g_1\ops\otimes f_ng_n.
    $$

- $\cdots\otimes(\alpha f_i+\beta f_i')\otimes\cdots=\alpha(\cdots\otimes f_i\otimes\cdots)+\beta(\cdots\otimes f_i'\otimes\cdots)$.

- 如果某个 $V_i=\{0\}$, 则 $V_1\ops\otimes V_n=\{0\}$.

## $\S15.2$ 张量积的基本性质

> **引理 15.2.1**
>
> &emsp;&emsp;若 $\varphi,\psi\in\Hom(V_1\ops\otimes V_n,M)$, 如果 $\varphi(v_1\ops\otimes v_n)=\psi(v_1\ops\otimes v_n)$ 恒成立, 则 $\varphi=\psi$.

&emsp;&emsp;*→ Proof.* 它们对应了同一个 $\phi\in\opn{Mul}(\seq V1n;M)$.

&emsp;&emsp;利用泛性质, 我们也能验证 $\{v_1\ops\otimes v_n\}$ 生成了 $V_1\ops\otimes V_n$. 取
$$
M:=V_1\ops\otimes V_n/\lang v_1\ops\otimes v_n:v_i\in V_i\rang,
$$
引理直接给出 $\varphi=0$.

> **命题 15.2.2**
>
> &emsp;&emsp;有典范同构
> $$
> \begin{array}{ccccc}
> 	V_1\otimes(V_2\otimes V_3) & \overset{\sim}\longleftrightarrow & V_1\otimes V_2\otimes V_3 & \overset{\sim}\longleftrightarrow & (V_1\otimes V_2)\otimes V_3,\\
> 	v_1\otimes(v_2\otimes v_3) & \leftrightarrow & v_1\otimes v_2\otimes v_3 & \leftrightarrow & (v_1\otimes v_2)\otimes v_3;
> \end{array}
> $$
>
> $$
> \begin{array}{ccccc}
> 	F\otimes V & \overset{\sim}\longleftrightarrow & V & \overset{\sim}\longleftrightarrow & V\otimes F,\\
> 	t\otimes v & \leftrightarrow & tv & \leftrightarrow & v\otimes t;
> \end{array}
> $$
>
> $$
> \begin{array}{ccc}
> 	V\otimes W & \overset{\sim}\longleftrightarrow & W\otimes V,\\
> 	v\otimes w & \leftrightarrow & w\otimes v.
> \end{array}
> $$

&emsp;&emsp;*→ Proof.* 大都是泛性质的操练. 例如, 对于映射
$$
V_1\x(V_2\x V_3)\to V_1\otimes V_2\otimes V_3,\quad (v_1,(v_2,v_3))\mapsto v_1\otimes v_2\otimes v_3.
$$
(注意 $V_2\x V_3$ 不一定是向量空间.) 我们固定 $v_1$, 剩下的东西双线性, 诱导出
$$
\varphi_{v_1}:V_2\otimes V_3\to V_1\otimes V_2\otimes V_3,~v_2\otimes v_3\mapsto v_1\otimes v_2\otimes v_3.
$$
而显然 $V_1\x(V_2\ox V_3)\to V_1\ox V_2\ox V_3$ 是双线性的, 因此诱导出
$$
V_1\ox (V_2\ox V_3)\to V_1\ox V_2\ox V_3,\quad v_1\ox(v_2\ox v_3)\mapsto \varphi_{v_1}(v_2\ox v_3)=v_1\ox v_2\ox v_3.
$$
反向可以直接从 $V_1\x V_2\x V_3\to V_1\ox(V_2\ox V_3)$ 诱导出, 最后根据映射行为验证左右复合为 $\id$ 即可.

> **命题 15.2.3**
>
> &emsp;&emsp;槽 (tensor 项) 中的直和可以分配. 即
> $$
> \begin{array}{ccc}
> 	\cdots\ox\bigoplus_{i\in I}V_i\ox\cdots & \iso\llra & \bigoplus_{i\in I}(\cdots\ox V_i\ox\cdots),\\
> \cdots\ox(v_i)_{i\in I}\ox\cdots & \lra & (\cdots\ox v_i\ox\cdots)_{i\in I}.
> \end{array}
> $$

&emsp;&emsp;*→ Proof.* 默认考虑外直和. 若 $V=\bigoplus_{i\in I}V_i$, 只需证明 $V\ox W\simeq \bigoplus_{i\in I}(V_i\ox W)$, 为此, 我们检查后者也具有泛性质. 任意取定 $F$-向量空间 $L$, 显然 $\opn{Bil}(V,W;L)\simeq\prod_{i\in I}\opn{Bil}(V_i,W;L)\simeq\prod_{i\in I}\Hom(V_i\ox W,L)\simeq\Hom\br{\bigoplus_{i\in I}(V_i\ox W),L}$ (最后一个等号需要一点点证明, 不过与张量无关.)

> **推论 15.2.4**
>
> &emsp;&emsp;(i) 若 $V,W$ 分别有基 $\{v_i\}_{i\in I}$, $\{w_j\}_{j\in J}$, 则 $V\ox W$ 有基 $\{v_i\ox w_j\}_{(i,j)\in I\x J}$.
>
> &emsp;&emsp;(ii) $\dim(V_1\ops\ox V_n)=\prod_{i=1}^n\dim V_i$.

&nbsp;

&emsp;&emsp;例: **Kronecker 积.**

> **定义 15.2.5**
>
> &emsp;&emsp;在上述推论的语境下, 设 $f:V\to V'$, $g:W\to W'$, 取出 $e_{ij}:=v_i\ox w_j$ 和 $e_{ij}'=v_i'\ox w_j'$, $f$ 对应 $A\in\M_{n'\x n}(F)$, $g$ 对应 $B\in\M_{m'\x m}(F)$, 则
> $$
> (f\ox g)(e_{ij})=f(v_i)\ox g(w_j)=\sum_{k=1}^{n'}\sum_{\ell=1}^{m'}a_{ki}b_{\ell j}(v_k'\ox w_\ell').
> $$
> 在 $e_{ij}$ 和 $e_{ij}'$ 这对基 (按字典序排开) 下展开矩阵 $f\ox g$, 得到
> $$
> A\ox B:=\pmat{
> 	a_{11}B & \cdots & a_{1n}B\\
> 	\vdots & \ddots & \vdots\\
> 	a_{n'1}B & \cdots & a_{n'n}B
> }\in\M_{n'm'\x nm}(F).
> $$
> 称为矩阵的 Kronecker 积.

&emsp;&emsp;照搬 $f\ox g$ 的性质, 不难有:

- $(A\ox B)(C\ox D)=AC\ox BD$;
- $A\ox(P+Q)=A\ox P+A\ox Q$;
- $(P+Q)\ox B=P\ox B+Q\ox B$.

> *Remark.*
>
> &emsp;&emsp;注意 $V\ox W$ 中的元素并不只有纯张量 $v\ox w$ 一种形式, 纯张量的线性组合不一定能写成纯张量. 例如取定 $V=\lang e_1,e_2\rang$, $W=\lang f_1,f_2\rang$, $e_1\ox f_1+e_2\ox f_2\in V\ox W$ 就写不成纯张量. 这一点用 Kronecker 积可以口算验证.
>
> &emsp;&emsp;上面几条性质可以大大简化对 Kronecker 积性质的研究. 例如, 若 $A\in\M_{n\x n}(\C)$, $B\in\M_{m\x m}(\C)$, 则
> $$
> \det(A\ox B)=(\det A)^m(\det B)^n.
> $$
> 利用性质, $A\ox B=(A\ox\bs 1_{m\x m})(\bs 1_{n\x n}\ox B)$, 后者直接是分块对角矩阵, $\det=(\det B)^n$, 前者通过交换基的顺序也是分块对角的, 这样就完成了证明.

&nbsp;

> **命题 15.2.6**
>
> &emsp;&emsp;给定一组线性映射 $f_i:V_i\to W_i$, 则
>
> - 若每个 $f_i$ 都满, 则 $f_1\ops\ox f_n$ 满;
> - 若每个 $f_i$ 都单, 则 $f_1\ops\ox f_n$ 单.

&emsp;&emsp;*→ Proof.* 满性: $\{w_1\ops\ox w_n\}$ 生成 $W_1\ops\ox W_n$, 而满性给出 $\{w_1\ops\ox w_n\}\sub (f_1\ops\ox f_n)(V_1\ops\ox V_n)$.

&emsp;&emsp;单性: 考虑 $W_i=V_i\oplus V_i'$, $f_i$ 是典范嵌入的特例, 这时
$$
W_1\ops\ox W_n=(V_1\ops\ox V_n)\oplus\cdots.
$$
那么 $f_1\ops\ox f_n$ 也是典范的嵌入, 它是单的. 对一般情况, 总有 $W_i=\im f_i\oplus \coker f_i$, 而 $f_i$ 是单的, 容易化到前一种情况.

> *Remark.*
>
> &emsp;&emsp;上文除了 <u>命题 15.2.6</u> 的单性外, 所有定义和结论都对 $F$ 取交换环, $F$-向量空间取模的情况成立.

## $\S15.3$ 张量积与对偶空间

&emsp;&emsp;(本节将无前摇地使用 Curry 化的映射记号.)

&emsp;&emsp;回忆 $V^\vee:=\Hom(V,F)$, 有典范配对 $\lang\cdot,\cdot\rang:V^\vee\x V\to F,~(\lambda,v)\mapsto\lambda(v)$, 这是双线性的, 所以能以泛性质给出
$$
V^\vee\ox V\to F,\quad\lambda\ox v\mapsto\lambda(v).
$$
称为张量积的缩并.

> **命题 15.3.1**
>
> &emsp;&emsp;设 $V,W$ 为 $F$-向量空间, 则存在线性映射 $\Theta_{V,W}$, 使得
> $$
> \Theta_{V,W}:V^\vee\ox W\to\Hom(V,W),\quad \lambda\ox w\mapsto(v\mapsto \lambda(v)w).
> $$
> 且它是单的, $\im\Theta_{V,W}=\{T:V\to W\mid\rank T<\oo\}$. 特别地, 若 $\dim V<\oo$ 或者 $\dim W<\oo$, 则
> $$
> V^\vee\ox W\underset{\Theta_{V,W}}{\isoto} \Hom(V,W).
> $$

&emsp;&emsp;*→ Proof.* 由于 $V^\vee\x W\to\Hom(V,W),~(\lambda,w)\mapsto(v\mapsto\lambda(v)w)$ 是双线性的, 所以存在唯一 $\Theta_{V,W}$, 使得此映射穿过 $V^\vee\ox W$. 接下来证明 $\ker\Theta_{V,W}=\{0\}$. 考虑 $\sum_{i=1}^k\lambda_i\ox w_i$, 可以假设 $\seq w1k\in W$ 线性无关, 那么
$$
\br{\A v\in V,~\sum_{i=1}^k\lambda_i(v)w_i=0}\Ra\br{\A v\in V,\lambda_i(v)=0}.
$$
所以必须有 $\lambda_1\ops=\lambda_n=0$, 才有 $\sum_{i=1}^k\lambda_i\ox w_i=0$.

&emsp;&emsp;接着研究像空间. 考虑 $V^\vee\ox W\ni\sum_{i=1}^k\lambda_i\ox w_i\mapsto\sum_{i=1}^k\lambda_i(v)w_i\in\lang\seq w1n\rang$, 所以它给出 $T\in\Hom(V,W)$, $\rank T<\oo$. 接下来不妨设 $\seq w1k$ 是 $\im T$ 的基, 这样 $T(v)=\sum_{i=1}^k c_iw_i$ 中 $c_i\in F$ 被 $v$ 唯一确定, 因此总能写作 $\lambda_i(v)$. $T$ 的线性性给出 $\lambda_i\in V^\vee$, 这样就有
$$
\A v\in V,~T(v)=\sum_{i=1}^k\lambda_i(v)w_i=\Theta_{V,W}\br{\sum_{i=1}^k\lambda_i\ox w_i}(v).
$$
&emsp;&emsp;例如, 取 $V=W$, $\dim V=\dim W=:n<\oo$, 则 $\Theta_{V,V}\br{\sum_{i=1}^n\check v_i\ox v_i}=\id_V$. 且 $\tr\circ\Theta_{V,V}$ 就是缩并映射.

&emsp;&emsp;前者是显然的. 对于后者, 由线性性, 只需检查 $\lambda\ox v\in V^\vee\ox V$ 的行为. 设 $v=\sum_ic_iv_i$, $\lambda=\sum_id_i\check v_i$, 则
$$
\lang\lambda,v\rang=\sum_ic_id_i,\quad\Theta_{V,V}(\lambda\ox v)=v\mapsto \sum_{i,j}c_jd_i\check v_i(v)v_j.
$$
已经能看出 $\tr$ 作用在左侧就是右侧.

&emsp;&emsp;放到矩阵上, 设 $V=F^n$, $W=F^m$, 则 $\lambda$ 视同 $\M_{1\x n}(F)$, $w$ 视作 $\M_{m\x 1}(F)$, 就有 $\Theta_{V,W}(\lambda\ox w)=w\x\lambda$ (右侧作为矩阵相乘).

> **命题 15.3.2**
>
> &emsp;&emsp;设 $\seq V1n$ 为 $F$-向量空间, 则有典范的线性映射
> $$
> \Psi:V_1^\vee\ops\ox V_n^\vee\to(V_1\ops\ox V_n)^\vee,
> $$
> 在穿过 $V_1^\vee\ops\ox V_n^\vee$ 之前, 它作为多重线性映射的行为是
> $$
> \Psi_0:(\seq{\check v}1n)\mapsto\br{v_1\ops\ox v_n\mapsto\prod_{i=1}^n\lang \check v_i,v_i\rang}.
> $$
> 若所有空间维度有限, $\Psi$ 还是同构.

&emsp;&emsp;*→ Proof.* 容易验证 $\Psi_0$ 是多重线性的. 假定所有空间有限维, 则
$$
\dim(V_1^\vee\ops\ox V_n^\vee)=\prod_i\dim V_i^\vee=\prod_i\dim V_i=\dim(V_1\ops\ox V_n)=\dim(V_1\ops\ox V_n)^\vee.
$$
所以只需要验证 $\Psi$ 是单射. 对每个 $i$, 取定 $V_i$ 的基 $v_{i,1},v_{i,2},\cdots$, 则枚举所有
$$
\{\check v_{1,i_1}\ops,\check v_{n,i_n}\}\sub V_1^\vee\ops\ox V_n^\vee,
$$
构成了一组基. 所以, 对 $\lambda\in V_1^\vee\ops\ox V_n^\vee$, $\Psi(\lambda)(v_{1,i_1}\ops\ox v_{n,i_n})$ 就是提取了 $\lambda$ 在这个基向量上的系数, 这是单射.

> **定义 15.3.3**
>
> &emsp;&emsp;对 $F$-向量空间 $V$, 定义
> $$
> V^{\ox n}:=\underbrace{V\ops\ox V}_{n\text{ copies}},
> $$
> 特别地 $V^{\ox 0}:=F$.

&emsp;&emsp;运用已有结论, 可以说明, 当 $\dim V<\oo$ 时, 从 $V$ 出发, 应用若干次 $(\cdot)^\vee$, $\Hom(\cdot,\cdot)$, $\ox$ 操作得到的产物都典范地同构于
$$
V^{\ox p}\ox(V^\vee)^{\ox q}\quad(p,q\ge 0).
$$
这个空间的元素也称为 $V$ 上的 $(p,q)$-型张量.

&emsp;&emsp;例如, $V$ 中的向量是 $(1,0)$-型的, $V$ 上的线性形式是 $(0,1)$-型的, 线性映射 $V\to V$ 是 $(1,1)$-型的, 双线性形式是 $(0,2)$-型的.

## $\S15.4$ 应用: 域的变换

&emsp;&emsp;设 $E$ 为域, $F\sub E$, 给定 $F$-向量空间 $V$, 我们希望典范地进行 "扩域": 给出 $E$-向量空间 $V_E$.

&emsp;&emsp;将 $E$ 视同 $F$-向量空间, 则 $E$ 上的乘法 $E\x E\to E$ 是 $F$-双线性的, 设它诱导出 $\mu:E\ox_F E\to E$, 则有
$$
E\x(E\ox_F V)\to E\ox_F(E\ox_F V)\simeq(E\ox_F E)\ox_F V\overset{\mu\ox\id_{V}}{\to} E\ox_F V,\\
x\ox(y\ox v)\mapsto(x\ox y)\ox v\mapsto xy\ox v.
$$
这就让 $V_E:=E\ox_F V$ 具有了 $E$ 的纯量乘法!

> *Remark.*
>
> &emsp;&emsp;直观上就是在 $E$ 里抓一个壮丁来保存 $E$ 的纯量乘.

&emsp;&emsp;进一步, 设 $f:V\to W$ 是 $F$-线性映射, 则 $\id_E\ox f:V_E\to W_E$ 是 $E$-线性映射.

&emsp;&emsp;如果 $V$ 有基 $\{v_i\}_{i\in I}$, 则
$$
V_E=E\ox_F\br{\bigoplus_{i\in I}Fv_i}\simeq\bigoplus_{i\in I}(E\ox_FFv_i)\simeq\bigoplus_{i\in I}E.
$$
那么 $V_E$ 有基 $\{\wt v_i:=1_E\ox v_i\}_{i\in I}$, $\dim_F V=\dim_E V_E$.

&emsp;&emsp;例如, $V=F^n\Ra V_E\isoto E^n$, 对 $A\in\Hom_F(F^n,F^m)$, $A_E=\id_E\ox A$, 这相当于是将 $A$ 视作 $\M_{m\x n}(E)$ 的元素. 这是因为
$$
\ALI{
	A_E(\wt e_i) &= (\id_E\ox A)(1_E\ox e_i)\\
	&= 1_E\ox Ae_i\\
	&= 1_E\ox\sum_{k=1}^ma_{ki}e_k\\
	&= \sum_{k=1}^ma_{ki}(1_E\ox e_k)\\
	&= \sum_{k=1}^ma_{ki}\wt e_k.
}
$$
到此, 可以写出典范的 "嵌入" $i:V\to V_E,~v\mapsto 1_E\ox v$, 这显然是单射.

> **命题 15.4.1**
>
> &emsp;&emsp;设 $V$ 是 $F$-向量空间, $\wt V$ 是 $E$-向量空间, 则存在双射
> $$
> \Hom_E(V_E,\wt V)\overset{1:1}{\to}\Hom_F(V,\wt V),\quad \wt f\mapsto \wt fi.
> $$

&emsp;&emsp;*→ Proof.* 单性: $\wt f(t\ox v)=\wt f(ti(v))=t\wt f(i(v))$.

&emsp;&emsp;满性: 给定 $f\in \Hom_F(V,\wt V)$, $E\x V\to\wt V,~(t,v)\mapsto tf(v)$ 是 $F$-双线性的, 诱导出 $\wt f:E \ox_F V\to\wt V$, 容易验证 $\wt fi(v)=f(v)$.

## $\S15.5$ 张量代数

> **定义 15.5.1**
>
> &emsp;&emsp;$F$-代数是一个环 $A$ 同时具有 $F$-向量空间的结构, 即环加法同时是 $F$-向量空间的加法, 环乘法 $A\x A\to A$ 是 $F$-双线性的.

&emsp;&emsp;例如 $\M_{n\x n}(F)$, $F[X]$ 都是 $F$-代数. 一些概念可以自然导出, 例如

- 子代数: 同时是子环和子空间的子集.
- 同态: $F$-线性的环同态.
- 理想: 不用附加条件. 因为 $t\in F$ 时 $tI=(t1_A)I\sub I$, 所以 $I$ 是 $A$ 的子空间.

> **定义-命题 15.5.2**
>
> &emsp;&emsp;对 $F$-向量空间 $V$, 取定 $T(V):=\bigoplus_{n\ge 0}V^{\ox n}$, 由于 $(V^{\ox a})\ox(V^{\ox b})\isoto V^{\ox(a+b)}$, 则
> $$
> T(V)\ox T(V)\simeq\bigoplus_{a,b\ge 0}(V^{\ox a}\ox V^{\ox b})\to T(V)
> $$
> 将 $T(V)$ 做成 $F$-代数, 其中 $1_{T(V)}=1_F\in V^{\ox 0}=F$, 而
> $$
> (v_1\ops\ox v_a)(v_1'\ops\ox v_b')=v_1\ops\ox v_a\ox v_1'\ops\ox v_b'.
> $$

## $\S15.6$ 对称代数与外代数

&emsp;&emsp;设 $V,M$ 是 $F$-向量空间, $m$ 重线性映射 $C\in\opn{Mul}(V\ops,V;M)$.

> **定义 15.6.1**
>
> &emsp;&emsp;若上述 $C$ 满足 $C(\cdots,x,y,\cdots)=C(\cdots,y,x,\cdots)$, 则称 $C$ 是对称的;
>
> &emsp;&emsp;若 $C$ 满足 $C(\cdots,x,x,\cdots)=0$, 则称 $C$ 是交错的.

&emsp;&emsp;注意对称性给出 $C\sigma=C$, 交错性给出 $C\sigma=\sgn(\sigma)\cdot C$.

> **定义 15.6.2**
>
> &emsp;&emsp;对称代数 $\opn{Sym}(V)$ 作为 $F$-代数, 定义为
> $$
> \opn{Sym}(V):=T(V)/I_{\opn{Sym}},
> $$
> 其中 $I_{\opn{Sym}}$ 由所有 $x\ox y-y\ox x$ 生成的理想.
>
> &emsp;&emsp;外代数 $\bigwedge(V)$ 定义为 *(lww: 这个符号叫 wedge, 就是那种象形文字, "楔")*
> $$
> \bigwedge(V):=T(V)/I_{\wedge},
> $$
> 其中 $I_\wedge$ 由所有 $x\ox x$ 生成的理想.

&emsp;&emsp;依照定义, 它们可以写成
$$
\opn{Sym}(V)=\bigoplus_{n\ge 0}\opn{Sym}^n(V)=\bigoplus_{n\ge 0}V^{\ox n}/I_{\opn{Sym}},\\
\bigwedge(V)=\bigoplus_{n\ge 0}{\bigwedge}^n(V)=\bigoplus_{n\ge 0}V^{\ox n}/I_{\wedge}.
$$
其中 $I_{\opn{Sym}}^0=I_{\opn{Sym}}^1=I_{\wedge}^0=I_{\wedge}^1=\{0\}$, 所以前两项就是 $F$ 和 $V$. 注意二者还是由 $V$ 生成.

&emsp;&emsp;此后, 将 $\Sym(V)$ 上的乘法仍写作 $\cdot$ (或省略), 将 $\Wg(V)$ 上的乘法写作 $\wg$. 则

- $xy=yx\in\Sym^2(V)$, 则 $\Sym(V)$ 是交换的;
- $x\wg y=-y\wg x\in\Wg^2(V)$, 这是因为 $(x+y)\wg(x+y)=0$.
-  $\omega\in\Wg^p(V)$ 而 $\eta\in\Wg^q(V)$, 则 $\omega\wg\eta=(-1)^{pq}\eta\wg\omega$.

&emsp;&emsp;函子性质: 给定线性映射 $f:V\to W$, 则有 $F$-代数的同态 $T(f):T(V)\to T(W)$, 满足 $T(f)|_{V^{\ox n}}=f^{\ox n}$. 这自然也同时诱导出 $\Sym(V)\to\Sym(W)$ 和 $\Wg(V)\to\Wg(W)$.

> **命题 15.6.3**
>
> &emsp;&emsp;设 $M$ 为 $F$-向量空间, $m\in\Z_{n\ge 1}$, 则
> $$
> \Hom(V^{\ox n},M)\simeq\opn{Mul}(V\ops,V;M)
> $$
> 诱导出
> $$
> \Hom(\Sym^nV,M)\simeq\{C\in\cdots:\text{symmetric}\},\\
> \Hom\br{{\Wg}^n V,M}\simeq\{C\in\cdots:\text{alternating}\}.
> $$

&emsp;&emsp;*→ Proof.* 根据 $\Sym(V)$ 的商定义, 典范地有
$$
\Hom(\Sym^m V,M)\simeq \{\varphi\in\Hom(V^{\ox n},M):\varphi(\cdots\ox(x\ox y)\ox\cdots)=\varphi(\cdots\ox(y\ox x)\ox\cdots)\}.
$$
剩下的就更为明显了.

&emsp;&emsp;接下来, 我们继续分析 $\Sym(V)$ 和 $\Wg(V)$ 的结构.

&emsp;&emsp;例如, 对 $\Sym(V)$, 设 $n=\dim V\in\Z_{\ge 1}$, 取定基 $\seq v1n$, 则能写出 $F[\seq X1n]\isoto\Sym(V)$, 非常直观.

> **定理 15.6.4**
>
> &emsp;&emsp;设 $n=\dim V\in\Z_{\ge 0}$, 取定基 $\seq v1n$, 则
>
> - $m>n$ 时 $\Wg^m V=\{0\}$;
> - $0\le m\le n$ 时 $\dim\Wg^m(V)=\binom{n}{m}$;
> - $\dim\Wg(V)=2^n$.

&emsp;&emsp;*→ Proof.* 不妨 $n\ge 1$, 由于 $\Wg^m(V)$ 生成自 $\{v_{i_1}\ops\wg v_{i_m}\}$, 且可以要求 $\{i_m\}$ 作为集合互不相同, 则典范地规定 $1\le i_1\ops<i_m\le n$ 即可.

&emsp;&emsp;现在只说明第二条结论, $m=n$ 时, $\Hom(\Wg^n(V),F)$ 同构于 $n$ 重交错形式, <u>定理 5.2.3</u> 给出它的维数是 $1$, 则 $\dim\Wg^n(V)=\dim\br{\Wg^n(V)}^\vee=1$. $m\le n$ 时, 只需证明
$$
\sum_{1\le j_1\ops<j_m\le n}c_{\seq j1m}v_{j_1}\ops\wg v_{j_m}=0\Eq c_{\seq j1m}\equiv 0\qquad{(*)}
$$
取定 $\seq i1m$, $V'=\lang\seq i1m\rang$, $\dim V'=m$. 构造线性映射
$$
\psi:V\emap V',\quad v_j=[v_j\in\{\seq v1m\}]v_j.
$$
根据上文提到的函子性, 它这诱导出 $\Wg^m(\psi):\Wg^m(V)\to\Wg^m(V)$. 在基的纯张量中明显只有 $v_{i_1}\ops\wg w_{i_m}$ 的像非零 (是自身), 将此映射作用于 $(*)$ 左式即可.

&emsp;&emsp;例如, 若 $W\sub V$, $\dim W=m$, $\dim V=n$, 考虑伸缩作用 $F^\x\actl\Wg^m(V)-\{0\}$, 则 $w_1\ops\wg w_m$ 的 $F^\x$-轨道由 $W$ 唯一确定, 不依赖基 $\seq w1m$ 的选取. 因此就有嵌入
$$
\{W\sub V:\text{subspace of dim}=m\}\mmap\br{{\Wg}^m(V)-\{0\}}/F^\x.
$$
> **推论 15.6.5**
>
> &emsp;&emsp;设 $\dim V=n\in\Z_{\ge 1}$, $\psi\in\End(V)$, 则 $\Wg^n(\psi)\in\End(\Wg^n(V))$ 等同于 $(\det\psi)\x(\cdot)$.

&emsp;&emsp;*→ Proof.* 证法一. $\det\psi$ 可由交错形式的比例常数刻画: $C(\psi(x_1)\ops,\psi(x_n))=(\det\psi)C(\seq x1n)$, 其中 $C$ 是任意交错形式. 设 $C$ 对应于 $\varphi:\Wg^n(V)\to F$, 即 $C(\seq x1n)=\varphi(x_1\ops\wg x_n)$, 这样就有
$$
C(\psi(x_1)\ops,\psi(x_n))=\varphi\circ{\Wg}^n(\psi)(x_1\ops\wg x_n),
$$
而右侧即 $(\det\psi)\varphi$. 由于 $\dim\Wg^n(V)=1$, 存在 $\mu\in F$ 使得 $\Wg^n(\psi)=\mu\id_{\Wg^n(V)}$, 现在有
$$
\varphi\circ\mu\id_{\Wg^n(V)}=(\det\psi)\varphi.
$$
任取一个不恒为 $0$ 的 $\varphi$ 就可知 $\Wg^n(\psi)=(\det\psi)\id_{\Wg^n(V)}$.

&emsp;&emsp;证法二. 取基 $\seq v1n\in V$, $\psi(v_j)=\sum_{i=1}^na_{ij}v_i$, 则
$$
\ALI{
	{\Wg}^n(\psi)(v_1\ops\wg v_n) &= \sum_{1\le\seq i1n\le n}a_{i_11}\cdots a_{i_nn}(v_{i_1}\ops\wg v_{i_m})\\
	&= \sum_{\sigma\in\mathfrak S_n} a_{\sigma_11}\cdots a_{\sigma_nn}\sgn(\sigma)v_1\ops\wg v_n\\
	&= (\det A)v_1\ops\wg v_n.
}
$$
当 $m\le n$, $\Wg^m(\psi)\in\End(\Wg^m(V))$ 也可以导出子行列式的系数.

&emsp;&emsp;*lww: 网上有很多仇视行列式的学生, 可能是他们还没有学到这一步. 如果学到这一步他们应该就放下了.*

&emsp;&emsp;进一步, 对 $V=F^n$, 双线性形式对应 $\M_{n\x n}(F)$, 则交错形式对应了交错矩阵 ($A^\T=-A$, $a_{ii}=0$, 注意 $\char F=2$ 时后一条不可省略).

&nbsp;

&emsp;&emsp;作为在三万英尺高空飞行的小憩, 我们在本节末尾指出一个同构, 它或许会让你感到回家般的亲切.

> **命题 15.6.6**
>
> &emsp;&emsp;设 $V$ 为 $n\in\Z_{\ge 0}$ 维 $F$-向量空间, 选定基 $\seq v1n$, 则有 $F$-代数的同构:
> $$
> \Sym(V)\isoto F[\seq X1n],
> $$
> 诱导自 $\A i\in[1:n],~v_i\mapsto X_i$.

&emsp;&emsp;这是不言自明的. 一开始, $T(V)$ 中的 $\seq X1n$ 作为字符任意排列为字符串, 我们仅仅枚举了字符串的长度; 而对 $I_{\Sym}$ 取商相当于限制 $X_iX_j=X_jX_i$, 这给出形式变元的乘法交换性.

## $\S15.9$ 特征零的情形

&emsp;&emsp;设 $F$ 是域, $V$ 为 $F$-向量空间, $n\in\Z_{\ge 1}$, 考虑利用泛性质诱导出的
$$
\mathfrak S_n\actl V^{\ox n},\quad \sigma:(\seq v1n)\mapsto v_{\sigma^{-1}_1}\ops\ox v_{\sigma_n^{-1}}.
$$
这给出了线性的 $\sigma:V^{\ox n}\to V^{\ox n}$. 群作用的验证就略去了.

> **定义 15.9.1**
>
> &emsp;&emsp;定义
> $$
> V_{\Sym}^{\ox n}:=\{x\in V^{\ox n}:\A\sigma\in\mathfrak S_n,~\sigma x=x\},\\
> V_{\wg}^{\ox n}:=\{x\in V^{\ox n}:\A\sigma\in\mathfrak S_n,~\sigma x=\sgn(\sigma)x\}.
> $$
> 对所有 $n$ 取直和这给出 $T_{\Sym}(V)$ 和 $T_{\wg}(V)$, 它们是 $T(V)$ 的子空间.

&emsp;&emsp;在 $\char F=0$ 时, 这可以用于定义 $\Sym(V)$ 和 $\Wg(V)$. 具体地, 考虑商映射 $q_{\Sym}^n:V^{\ox n}\emap\Sym^n(V)$, $q_\wg^n$ 同理. 有定理:

> **定理 15.9.2**
>
> &emsp;&emsp;当 $n!\in F^\x$, 上述两个商映射限制为 $V_{\Sym}^{\ox n}\isoto\Sym^n(V)$ 以及 $V_{\wg}^{\ox n}\isoto\Wg^n(V)$.

&emsp;&emsp;*→ Proof.* 对前者, 构造
$$
\opn{Avg}:V^{\ox n}\emap V_{\Sym}^{\ox n},\quad x\mapsto\sum_{\sigma\in\mathfrak S_n}\frac{\sigma x}{n!}.
$$
则
$$
V^{\ox n}=V_{\Sym}^{\ox n}\oplus\ker\opn{Avg}.
$$
由于 $q_{\Sym}^n(\sigma x)=q_{\Sym}^n(x)$, 所以 $q_{\Sym}^n\circ\opn{Avg}=q_{\Sym}^n$, $\ker\opn{Avg}\sub\ker q_{\Sym}^n$. 考虑商映射在上式的作用, 已然限制出
$$
q_{\Sym}^n:V_{\Sym}^{\ox n}\emap\Sym^n(V).
$$
还需要证明单性. 若 $x\in V_{\Sym}^{\ox n}\cap\ker q_{\Sym}^n$, 则 $x$ 形如 $\sum\cdots\ox(x\ox y-y\ox x)\ox\cdots$, 但显然 $\opn{Avg}(\cdots\ox x\ox y\ox\cdots)=\opn{Avg}(\cdots\ox y\ox x\ox\cdots)$, 所以只能 $x\in\ker\opn{Avg}\overset{q_{\Sym}^n}\to\{0\}$.

&emsp;&emsp;作为同构, 我们自然也能写出二者的逆映射. 记
$$
p_{\Sym}^n:\Sym^n(V)\isoto V_{\Sym}^{\ox n}\sub V^{\ox n},\quad p_{\wg}^n:{\Wg}^n(V)\isoto V_{\wg}^{\ox n}\sub V^{\ox n}.
$$

> **命题 15.9.3**
>
> &emsp;&emsp;若 $x\in V_{\Sym}^{\ox a}$, $y\in V_{\Sym}^{\ox b}$, 且 $\char F\nmid(a+b)!$, 有
> $$
> p_{\Sym}^{a+b}\br{q_{\Sym}^a(x)q_{\Sym}^b(y)}=\frac{a!b!}{(a+b)!}\sum_{\sigma\in\mathfrak S_{a+b}/(\mathfrak S_a\x\mathfrak S_b)}\sigma(x\ox y).
> $$
>
> $$
> p_{\wg}^{a+b}\br{q_{\wg}^a(x)\wg q_{\wg}^b(y)}=\frac{a!b!}{(a+b)!}\sum_{\sigma\in\mathfrak S_{a+b}/(\mathfrak S_a\x\mathfrak S_b)}\sgn(\sigma)\sigma(x\ox y).
> $$

&emsp;&emsp;证明见 <u>讲义命题 15.9.5</u>.

&emsp;&emsp;*lww: 这种定义一般人看了都会挺挫折的, 但其实也不用挫折.*

> **命题 15.9.4**
>
> &emsp;&emsp;若 $\dim V<\oo$, $n\in\Z_{\ge 0}$, $n!\in F^\x$, 则有向量空间间的典范同构:
> $$
> \Sym^n(V^\vee)\simeq \Sym^n(V)^\vee,\quad {\Wg}^n(V^\vee)\simeq{\Wg}^n(V)^\vee.
> $$

&emsp;&emsp;*→ Proof.* 不妨 $n\ge 2$. 由于有
$$
(V^\vee)^{\ox n}\underset{\Psi}{\isoto}(V^{\ox n})^\vee\underset{\Phi}{\isoto}\opn{Mul}(V\ops,V;F),\\
\lambda_1\ops\ox\lambda_n\mapsto \br{(\seq x1n)\mapsto \prod_{i=1}^n\lang\lambda_i,x_i\rang}.
$$
考虑 $\mathfrak S_n$ 在 $\opn{Mul}(V\ops,V;F)$ 的左作用 $(\sigma C)(\seq x1n):=C(x_{\sigma_1}\ops,x_{\sigma_n})$. 因此 $\mathfrak S_n$ 在左右的轨道可以被 $\Phi\Psi$ 搬运, 这就立即给出
$$
(V^\vee)_{\Sym}^{\ox n}\isoto\{C:\text{symmetric}\}\simeq(\Sym^n V)^\vee,\\
(V^\vee)_{\wg}^{\ox n}\isoto\{C:\text{anti-symmetric}~(2\in F^\x)\}\simeq\br{{\Wg}^n V}^\vee.
$$
&nbsp;

&emsp;&emsp;一个简单的例子: $V=\R^3$, 基 $e_1,e_2,e_3$ *(lww: e one, e two, e 三)*, 这样 $\Wg^2(V)$ 基 $e_1\wg e_2$, $e_2\wg e_3$, $e_3\wg e_1$. 计算
$$
(xe_1+ye_2+ze_3)(x'e_1+y'e_2+z'e_3)=(xy'-yx')e_1\wg e_2+(yz'-zy')e_2\wg e_3-(xz'-zx')e_3\wg e_1.
$$
这种基的选取恰好使得 (式子太长了不得不换行 qwq)
$$
\abs{
    \begin{array}{ccc}
		e_2\wg e_3 & e_3\wg e_1 & e_1\wg e_2\\
		x & y & z\\
		x' & y' & z'
    \end{array}
}\\=(xy'-yx')e_1\wg e_2+(yz'-zy')e_2\wg e_3-(xz'-zx')e_3\wg e_1.
$$
所以外代数的 "外" 与外积确有联系.

# 第 ? 章 范畴引论

## $\S?.1$ 范畴

> **定义 ?.1.1**
>
> &emsp;&emsp;范畴 $\mathcal C$ 有以下资料.
>
> - 类 $\opn{Ob}(\mathcal C)$, 称为 $\mathcal C$ 的对象;
> - 对一切 $X,Y\in\opn{Ob}(\mathcal C)$, 指定 $\Hom_{\mathcal C}(X,Y)$, 称为从 $X$ 到 $Y$ 的 $\Hom$-集, 其元素称为从 $X$ 到 $Y$ 的态射;
> - 对一切 $X,Y,Z\in\opn{Ob}(\mathcal C)$, 指定合成映射 $\circ:\Hom(Y,Z)\x\Hom(X,Y)\to\Hom(X,Z)$, 使得
>     - $\circ$ 是结合的;
>     - $\A X\in\opn{Ob}(\mathcal C),~\E\id_X\in\End(X),~\id_Y\circ f=f=f\circ\id_X$ (这句略有省略但意义应当明确了).

&emsp;&emsp;典型如集合范畴, 给定域 $F$ 时的向量空间范畴, 环范畴, 交换环范畴, 群范畴等等.

&emsp;&emsp;对一般的范畴, 我们能定义交换图 (懒得画了). 还能定义同构: 称 $f\in\Hom_{\mathcal C}(X,Y)$ 是同构, 当且仅当
$$
\E f^{-1}\in\Hom_{\mathcal C}(Y,X),~f^{-1}f=\id_X\land ff^{-1}=\id_Y.
$$
容易验证 $f^{-1}$ 若存在则唯一; 且 $(fg)^{-1}=g^{-1}f^{-1}$.

> **定义 ?.1.2**
>
> &emsp;&emsp;设 $\mathcal C$ 是范畴, $X\in\opn{Ob}(\mathcal C)$, 我们称 $X$ 是始对象, 当且仅当 $\A Y\in\opn{Ob}(\mathcal C),~|\Hom_{\mathcal C}(X,Y)|=1$; 是终对象, 当且仅当 $\A Y,~|\Hom_{\mathcal C}(Y,X)|=1$.

> **引理 ?.1.3**
>
> &emsp;&emsp;(1) 如果 $X$ 和 $X'$ 都是始对象, 则存在同构 $a:X\isoto X'$;
>
> &emsp;&emsp;(2) 如果 $X$ 和 $X'$ 都是终对象, 则存在同构 $X\isoto X'$.

&emsp;&emsp;*→ Proof.* (1) 设 $\E! b:X'\to X$, 则 $ab:X'\to X'$, 由于 $X'$ 是始对象, 必须 $ab=\id_{X'}$, 那么 $a$ 是同构. (2) 完全同理.

&emsp;&emsp;例子: 设 $F$ 是域, $V,W$ 是 $F$-向量空间, 定义范畴 $\mathcal C$, 其中 $\opn{Ob}(\mathcal C)=\{B:V\x W\to L\mid B~\text{bilinear}\}$, 对 $B_1:V\x W\to L_1$ 和 $B_2:V\x W\to L_2$, 定义态射为 $F$-线性映射 $\varphi:L_1\to L_2$ 使得 $\varphi B_1=B_2$, $\circ$ 即映射合成. 那么
$$
V\x W\overset{B_{\u{univ}}}{\to}V\ox W
$$
是 $\mathcal C$ 的始对象 (唯一 up to 同构).

&nbsp;

&emsp;&emsp;蓦然课终, 尚未离地三万英尺. 没关系, 没看够范畴的可以左转 zw 的美味 Haskell 课堂.
