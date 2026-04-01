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

## $\S7.6$ 定积分在几何学中的应用

> **例子 7.6.1**
>
> &emsp;&emsp;设 $p,q>0$, $\frac{1}{p}+\frac{1}{q}=1$, 求证
> $$
> ab\le \frac{a^p}{p}+\frac{b^q}{q}.
> $$

&emsp;&emsp;*→ Proof.* 考察 $y=x^{p-1}$ 分别与 $x=a$ 轴和 $y=b$ 轴围成的面积, 下侧  $S_1=\frac{a^p}{p}$, 左侧 $S_2=\frac{b^q}{q}$, 集合上自然看出 $\le$ 关系.

&nbsp;

**参数方程**

&emsp;&emsp;设 $y=f(x)\in C[a,b]$ 由参数方程 $x=x(t),~y=y(t)~(t\in[\alpha,\beta])$ 给出, 其中 $x(t)$ 单增且 $x'(t)$ 在除有限个点外存在, $x'(t)\in C[\alpha,\beta]$, 则
$$
\env{aligned}{
	\int_a^b f(x)\d x &= \int_\alpha^\beta f(x(t))x'(t)\d t\\
	&= \int_\alpha^\beta y(t)x'(t)\d t.
}
$$

&emsp;&emsp;事实上, 即使 $x(t)$ 不单增, 最后一个积分式仍有其几何意义. 例如对简单封闭曲线 $x(\alpha)=x(\beta)\land y(\alpha)=y(\beta)$, 积分式给出了封闭曲线围成的面积 (逆时针给出的曲线会带上符号). 在此讨论中,
$$
\int_a^\beta yx'\d t=\l.(yx)\r|_\alpha^\beta-\int_\alpha^\beta xy'\d t=-\int xy'\d t.
$$
因此简单封闭曲线的面积可以写为
$$
S=\frac{1}{2}\abs{\int_\alpha^\beta (x'y-y'x)\d t}.
$$
&emsp;&emsp;例如对椭圆 $x=a\cos t,~y=b\sin t,~(a,b>0;~t\in[0,2\pi])$,则
$$
S=\frac{ab}{2}\abs{\int_0^{2\pi}(\sin^2 t+\cos^2 t)\d t}=ab\pi.
$$
规避了求 $\int\sin^2 t\d t$ 形式的问题. 再如对 $x=a\cos^3t,~y=a\sin^3t~(t\in[0,2\pi])$, 就有
$$
S=\frac{1}{2}\int_0^{2\pi}\abs{\cdots}=\frac{3}{8}\pi a^2.
$$
&nbsp;

**极坐标**

&emsp;&emsp;设 $r=f(\theta)\in C[a,b]$, 考虑划分 $\Delta:\alpha=\theta_0\ops<\theta_n=\beta$, 设 $M_i,m_i$ 为各区间 $f$ 的上下确界, 则根据规则的扇形面积公式:
$$
\frac{1}{2}m_i^2\Delta\theta_i\le \Delta S_i\le \frac{1}{2}M_i^2\Delta\theta_i\\
\Ra \frac{1}{2}\sum_i m_i^2\Delta\theta_i\le S\le\frac{1}{2}\sum_i M_i^2\Delta\theta_i.
$$
当 $|\Delta|\to 0$ 时,
$$
S=\frac{1}{2}\int_\alpha^\beta f(\theta)^2\d\theta.
$$
&nbsp;

**曲线弧长**

&emsp;&emsp;仍然采用参数方程的形式, $x=x(t),~y=y(t),~t\in[\alpha,\beta]$ 且 $x(t),y(t)\in C[\alpha,\beta]$. 考虑描述集合上的一条 "内接" 直线, 取分划 $\Delta:\alpha=t_0\ops<t_n=\beta$, 记 $M_i=(x(t_i),y(t_i))$, 定义折线 $L=\bigcup\ol{M_{i-1}M_i}$, 折线长 $|L|=\sum_i|M_{i-1}M_i|$, 则称曲线可求长, 当且仅当 $\sup_\Delta\{|L|\}<\oo$, 并将此折线长的上确界定义为曲线弧长 $|\gamma|$.

> **定理 7.6.1**
>
> &emsp;&emsp;上述曲线可求长, 当且仅当 $x(t)$ 和 $y(t)$ 都是有界变差的.

&emsp;&emsp;*→ Proof.* 左推右, $V_\Delta(x(t))=\sum\abs{x(t_i)-x(t_{i-1})}\le\sum|M_{i-1}M_i|\le|\gamma|$.

&emsp;&emsp;右推左, $\sum|M_{i-1}M_i|\le\sum\abs{x(t_i)-x(t_{i-1})}+\sum\abs{y(t_i)-y(t_{i-1})}\le V(x(t))+V(y(t))<\oo$.

&emsp;&emsp;高维曲线有相同形式的结论: 可求长当且仅当每维分量有界变差.

> *Remark.*
>
> &emsp;&emsp;或许更自然的表述: 高维空间曲线可求长当且仅当其任意低维空间投影可求长. "一维空间曲线长" 恰好就是变差.

>  **命题 7.6.2**
>
>   &emsp;&emsp;若 $x(t),y(t)$ 可导, $x'(t),y'(t)\in R[a,b]$ (明显 $x(t),y(t)$ 是李氏连续的, 则是有界变差的, 曲线可求长), 此时
> $$
>  |\gamma|=\int_\alpha^\beta\sqrt{x'(t)^2+y'(t)^2}\d t.
> $$

&emsp;&emsp;*→ Proof.* 对 $\Delta:\alpha=t_0\ops<t_n=\beta$, 设 $x_i=x(t_i)$, $y_i=y(t_i)$, 点 $M_i=(x_i,y_i)$, 那么
$$
\env{aligned}{
	|M_{i-1}M_i| &= \sqrt{(x(t_i)-x(t_{i-1}))^2+(y(t_i)-y(t_{i-1}))^2}\\
	&= \sqrt{x'(\xi_i)^2\Delta t_i^2+y'(\eta_i)^2\Delta t_i^2}\\
	&= \sqrt{x'(\xi_i)^2+y'(\eta_i)^2}\Delta t_i\\
	&= \sqrt{x'(\xi_i)^2+y'(\xi_i)^2}\Delta t_i+\br{\sqrt{x'(\xi_i)^2+y'(\eta_i)^2}-\sqrt{x'(\xi_i)^2+y'(\xi_i)^2}}\Delta t_i.
}
$$
前者形成 Riemann 和, 后者有
$$
\sqrt{x'(\xi_i)^2+y'(\eta_i)^2}-\sqrt{x'(\xi_i)^2+y'(\xi_i)^2}=\frac{(y'(\xi_i)-y'(\eta_i))(y'(\xi_i)+y'(\eta_i))}{\sqrt{x'(\xi_i)^2+y'(\eta_i)^2}+\sqrt{x'(\xi_i)^2+y'(\xi_i)^2}},
$$

被 $y'(\xi_i)-y'(\eta_i)$ 这一小量控制.

&nbsp;

&emsp;&emsp;在极坐标下, 若 $r=r(\theta),~x=r(\theta)\cos\theta,~y=r(\theta)\sin\theta$, 则
$$
x'=r'\cos\theta-r\sin\theta,\quad y'=r'\sin\theta+r\cos\theta;\\
x'^2+y'^2=r^2+r'^2.
$$
因此
$$
L=\int_\alpha^\beta \sqrt{r^2+r'^2}\d \theta.
$$
&emsp;&emsp;空间中, 类似地有
$$
|\gamma|=\int_\alpha^\beta\sqrt{x'(t)^2+y'(t)^2+z'(t)^2}\d t.
$$

> **定理 7.6.3 (等周不等式)**
>
> &emsp;&emsp;设 $\Gamma$ 是周长为 $L$ 的简单可求长闭曲线, $A$ 是其所围面积, 则 $L^2\ge 4\pi A$.

&emsp;&emsp;*→ Proof.* 先考虑 $\Gamma$ 为光滑曲线的情况. 设
$$
\Gamma:\env{cases}{x=x(t),\\y=y(t),}\quad t\in[\alpha,\beta].
$$
那么
$$
L=\int_\alpha^\beta\sqrt{x'^2+y'^2}\d t,\quad A=\int_\alpha^\beta xy'\d t.
$$
不妨设 $t=\alpha$ 时 $x$ 最小, $t=\ol\alpha$ 时 $x$ 最大且 $x(\alpha)+x(\ol\alpha)=0$, 并令 $r=x(\ol\alpha)$. 作一以原点为圆心的圆
$$
C:(x(t),\ol y(t)),\quad \ol y(t)=\env{cases}{
	-\sqrt{r^2-x(t)^2},& t\in[\alpha,\ol\alpha];\\
	\sqrt{r^2-x(t)^2},&t\in(\ol\alpha,\beta].
}
$$
则圆面积:
$$
\pi r^2=\int_\alpha^\beta \ol y(t)x'(t)\d t.
$$
此时,
$$
\env{aligned}{
	2\sqrt{A\pi r^2} &\le A+\pi r^2\\
	&=\int_\alpha^\beta (xy'+\ol yx')\d t\\
	&\le \int_\alpha^\beta\br{\sqrt{x^2+\ol y^2}\cdot\sqrt{x'^2+y'^2}}\d t\\
   &= \int_\alpha^\beta r\sqrt{x'^2+y'^2}\d t\\
   &= rL.
}
$$
最终就有 $L^2\ge 4\pi A$.

&emsp;&emsp;上述证明对分段光滑的 $\Gamma$ 自然成立, 因此它对多边形也成立. 对一般的 $\Gamma$, 因为它可求长, 所以能够用多边形同时逼近其周长和面积. 因此上述结论对一切满足条件的 $\Gamma$ 成立.



**有界变差函数**

&emsp;&emsp;对函数 $f:[a,b]\to\R$ 和分划 $\Delta:a=x_0\ops<x_n=b$, 则关于 $\Delta$ 的变差 $V_\Delta$ 定义为
$$
V_\Delta=\sum_{i=1}^n\abs{f(x_i)-f(x_{i-1})},
$$
区间 $[a,b]$ 上的全变差 $V_{[a,b]}$ 定义为
$$
V_{[a,b]}=\sup_\Delta\{V_\Delta\}.
$$
若 $V_{[a,b]}<\oo$, 则 $f$ 称为有界变差函数.

&emsp;&emsp;例如, 单调函数式有界变差的, 因为此时 $V_\Delta=|f(a)-f(b)|<\oo$. 有界变差函数的和, 差, 绝对值都是有界变差的, 这是因为 $V_{|f|}\le V_f$ 以及 $V_{f+g}\le V_f+V_g$.

> **定理 7.6.4**
>
> &emsp;&emsp;$f:[a,b]\to\R$ 是有界变差的, 当且仅当 $f$ 是两个单调函数的差.

&emsp;&emsp;*→ Proof.* 右推左, 根据上述讨论明显. 左推右, 设 $f$ 是有界变差的, 定义 $V_f(x)=V_{f;[a,x]}<\oo$, 它是单增的. 再令 $g(x)=V_f(x)-f(x)$, 断言 $g$ 也单增. 对 $x_1<x_2$, 由于在 $\Delta$ 中引入新的分点不会让 $V_\Delta$ 减小, 所以有 $V_f(x_2)-V_f(x_1)=V_{[x_1,x_2]}$, 在此基础上考察:
$$
\env{aligned}{
	g(x_2)-g(x_1) &= V_f(x_2)-V_f(x_1)-f(x_2)+f(x_1)\\
	&\ge V_{[x_1,x_2]}-\abs{f(x_2)-f(x_1)}\\
	&\ge 0.
}
$$
&emsp;&emsp;定理的直接推论是: 有界变差函数几乎处处可导, 只有至多可数个间断点, 且只有第一类间断点 (都是来自单调函数的结论).

&emsp;&emsp;连续函数不一定有界变差. 例如 $f(x)=[x\neq 0]x\sin x^{-1}$ 不是 $[0,1]$ 上的有界变差函数, 若取 $x_i=\frac{1}{(i+1/2)\pi}$, 则
$$
\abs{f(x_i)-f(x_{i-1})}=\frac{1}{(i+1/2)\pi}+\frac{1}{(i-1/2)\pi}=\frac{2i}{\pi(i^2-1/4)},
$$
和式不存在上确界. 不过李氏连续函数 (有有界导函数的函数) 一定有界变差.

&nbsp;

**体积**

&emsp;&emsp;设 $\mathfrak X$ 是 $\R^3$ 全体多面体组成的集合, 体积是一个映射 $V:\mathfrak X\to[0,+\oo)$, 满足

- 单位正方体被映为 $1$;
- 若 $V_1$ 与 $V_2$ 全等, 则 $V(V_1)=V(V_2)$;
- 若 $V_1$ 与 $V_2$ 相邻, 则 $V(V_1\cup V_2)=V(V_1)+V(V_2)$.

> **定理**
>
> &emsp;&emsp;对 $\Omega\in\mathfrak X$, 若其 $x$ 坐标在 $[a,b]$ 内, 定义截面 $\Omega_x=\Omega\cap\{x\}$, 投影在 $yz$ 平面上得到 $\Omega_x'$; 若 $\Omega_x$ 总是可求面积的, 设 $S(x)$ 为 $\Omega_x$ 的面积, (为方便证明, 设对 $x\neq y$ 总有 $\Omega_x'\sub \Omega_y'$ 或者 $\Omega_x'\supset\Omega_y'$; 且设 $S(x)$ 连续,) 则
> $$
> V=\int_a^b S(x)\d x.
> $$

&emsp;&emsp;*→ Proof.* 对 $[a,b]$ 的任意分割 $\Delta:a=x_0\ops<x_n=b$, 设 $\xi_i,\eta_i$ 分别是 $[x_{i-1},x_i]$ 中 $S(x)$ 的 $\arg\max$ 和 $\arg\min$, 根据条件有 $\A x\in[x_{i-1},x_i],~\Omega_{\eta_i}'\sub\Omega_x'\sub\Omega_{\xi_i}'$, 因此 $\Omega_{\eta_i}'\x[x_{i-1},x_i]\sub\bigcup_{x\in[x_{i-1},x_i]}\Omega_x\sub\Omega_{\xi_i}'\x[x_{i-1},x_i]$. 记 $V^-,V^+$ 分别为内外体积映射 (定义容易脑补), 则
$$
S(\eta_i)(x_i-x_{i-1})\le V^-\br{\bigcup_{x\in[x_{i-1},x_i]}\Omega_x}\le V^+\br{\bigcup_{x\in[x_{i-1},x_i]}\Omega_x}\le S(\xi_i)(x_i-x_{i-1}).
$$
左右项即给出 Darboux 上下和, 给出体积结果.

&nbsp;

&emsp;&emsp;例如对椭球面
$$
\frac{x^2}{a^2}+\frac{y^2}{b^2}+\frac{z^2}{c^2}=1,
$$
则其所围体积可以通过
$$
\Omega_x':\frac{y^2}{b^2}+\frac{z^2}{c^2}=1-\frac{x^2}{a^2},\quad S(x)=\pi bc\br{1-\frac{x^2}{a^2}}
$$
刻画. 即有:
$$
\env{aligned}{
	V &= \int_{-a}^a S(x)\d x\\
	&= 2\pi bc\int_0^a\br{1-\frac{x^2}{a^2}}\\
	&= \frac{4}{3}\pi abc.
}
$$
&emsp;&emsp;再如, 对曲线 $y=f(x)\in C([a,b];\R_{\ge 0})$, 在三维中绕 $x$ 旋转一周可以给出旋转体. 其体积明显就是
$$
V=\pi\int_a^b f(x)^2\d x.
$$
例如 $y=kx~(x\in[0,h])$, 有
$$
V=\pi\int_0^h k^2x^2\d x=\frac{\pi}{3}k^2h^3=\frac{1}{3}h(\pi k^2h^2)=\frac{1}{3}Sh.
$$
若曲线由参数方程 $x=\varphi(t),~y=\psi(t),~(t\in[\alpha,\beta])$ 给出, 要求 $\varphi(\alpha)=a$, $\varphi(\beta)=b$, 且 $\varphi'>0$, $\varphi'$ 可积, 类似地
$$
V=\pi\int_a^b f(x)^2\d x=\int_\alpha^\beta\psi(t)^2\varphi'(t)\d t.
$$
&nbsp;

**旋转体侧面积**

&emsp;&emsp;姑且认为细分圆台的侧面积 Riemann 和极限就是所谓的侧面积 (对一般体的严格定义是困难的). 分割 $\Delta$ 的某一个对于圆台侧面积, 有
$$
\Delta S_i=\pi(y_{i-1}+y_i)|M_{i-1}M_i|.
$$
容易看出, 对 $x=x(t),~y=y(t),~t\in[\alpha,\beta]$, 有
$$
S=2\pi\int_{\alpha}^\beta y(t)\sqrt{x'(t)^2+y'(t)^2}\d t.
$$
&emsp;&emsp;例如, 对半径为 $R$ 的球, 它是 $y=\sqrt{R^2-x^2}$ 给出的旋转体. 则球台侧面积
$$
\env{aligned}{
	S &= 2\pi\int_{x_1}^{x_2}\sqrt{R^2-x^2}\sqrt{1+\br{\frac{x}{\sqrt{R^2-x^2}}}^2}\d x\\
	&= 2\pi\int_{x_1}^{x_2}R\d x=2R\pi(x_2-x_1).
}
$$
&emsp;&emsp;再如由圆 $x^2+(y-c)^2=a^2$ 给出的环面, 有 $y=c\pm\sqrt{a^2-x^2}$, $y'=\mp\frac{x}{\sqrt{a^2-x^2}}$. 那么
$$
\env{aligned}{
	S &= 2\pi\int_{-a}^a\br{y_+\sqrt{1+y_+'^2}+y_-\sqrt{1+y_-'^2}}\d x\\
	&= 2\pi\int_{-a}^a 2c\sqrt{\frac{a^2}{a^2-x^2}}\d x\\
	&= 4ac\pi^2.
}
$$
**$\pi$ 的无理性**

&emsp;&emsp;反证, 若 $\pi=\frac{p}{q}\in\Q$, $p\perp q$. 考虑整系数多项式 $f_n(x)=q^nx^n(p-qx)^n$, 则 $f^{(k)}(0)=f^{(k)}(\pi)=0~(\A k\in[0,n-1])$. 继续考察 $k\in[n,2n]$, $f^{(k)}(0)$ 和 $f^{(k)}(\pi)$ 一定都是整数且是 $n!$ 的倍数 (这里用 Legendre 定理方便证明). 那么
$$
I_n=\frac{1}{n!}\int_0^\pi f_n(x)\sin x\d x>0.
$$
计算之:
$$
\env{aligned}{
	I_n &= \frac{1}{n!}\int_0^\pi f_n(x)\d(-\cos x)\\
	&= \frac{1}{n!}\l.\br{-f_n(x)\cos x+\int_0^\pi f_n'(x)\cos x\d x}\r|_0^\pi\\
	&= \frac{1}{n!}\l.\br{-f_n(x)\cos x+f'_n(x)\sin x-\int_0^\pi f_n''(x)\sin x\d x}\r|_0^\pi\\
	&= \frac{1}{n!}\l.\br{\cdots}\r|_0^\pi.
}
$$
省略号内, $0..n-1$ 阶导无贡献, $n..2n$ 阶导贡献 $n!$ 倍数, 则 $I_n\in\Z$, 所以 $I_n\ge 1$. 但是
$$
f_n(x)=(qx(p-qx))^n\le\frac{p^n}{2^n},
$$
说明
$$
I_n\le \frac{\br{\frac{p}{2}}^{2n}}{n!}\pi\overset{n\to\oo}\longrightarrow 0.
$$
得到矛盾.

## $\S7.7$ 定积分在物理学中的应用

**曲线质量**

&emsp;&emsp;对 $x=x(t),~y=y(t),~t\in[\alpha,\beta]$, 要求 $x',y'\in C[a,b]$, 线密度 $\rho(t)\in C[\alpha,\beta]$, 最终能得到
$$
m=\int_\alpha^\beta \rho(t)\sqrt{x'(t)^2+y'(t)^2}\d t.
$$
再讨论质心 $(\ol x,\ol y)$, 类似地有
$$
m\ol x=\int_\alpha^\beta \rho(t)x(t)\sqrt{x'(t)^2+y'(t)^2}\d t,\\
m\ol y=\int_\alpha^\beta \rho(t)y(t)\sqrt{x'(t)^2+y'(t)^2}\d t.\\
$$
如果令 $\rho\equiv 1$, 就有
$$
\ell\ol x=\int_\alpha^\beta x(t)\sqrt{x'(t)^2+y'(t)^2}\d t,\\
\ell\ol y=\int_\alpha^\beta y(t)\sqrt{x'(t)^2+y'(t)^2}\d t.
$$
因此
$$
2\pi\ell\ol y=2\pi\int_\alpha^\beta y(t)\sqrt{x'(t)^2+y'(t)^2}\d t.
$$
这就是 Guldin 第一定理: 曲线弧长 $\x$ 质心绕 $x$ 轴旋转一周的周长 $=$ 曲线旋转体侧面积.

&emsp;&emsp;在上一节的例子中, 对 $x^2+(y-c)^2=a^2$, 有 $(\ol x,\ol y)=(0,c)$, 轻易地有
$$
S=2\pi c\cdot 2\pi a=4ac\pi^2.
$$
或者, 也可以用这个定理求质心. 例如对于半圆, 我们知道球表面积 $4\pi R^2=2\pi\ol y\cdot R\pi$, 因此半圆质心 $\ol y=\frac{2}{\pi}R$.

&nbsp;

**平面图形质心**

&emsp;&emsp;只研究 $\rho\equiv1$, 给定 $f(x)\ge g(x)\ge 0,~x\in[a,b],~f,g\in C[a,b]$, 求 $D:\{(x,y)\in\R^2:x\in[a,b],y\in[g(x),f(x)]\}$ 的质心. 总质量:
$$
m=\int_a^b(f(x)-g(x))\d x.
$$
静力矩分别为
$$
M_x=\frac{1}{2}\int_a^b(f(x)^2-g(x)^2)\d x,\\
M_y=\int_a^b x(f(x)-g(x))\d x.
$$
因此就可求出 $(\ol x,\ol y)$. 同时也就有
$$
\env{aligned}{
	2\pi\ol yS &= 2\pi\ol y\int_a^b(f(x)-g(x))\d x\\
	&= \pi\int_a^b(f(x)^2-g(x)^2)\d x=V.
}
$$
这就是 Guldin 第二定理.

&emsp;&emsp;仍考虑 $x^2+(y-a)^2\le r^2$ 的例子,
$$
V=2\pi a\cdot \pi r^2=2\pi^2 ar^2.
$$
&nbsp;

**转动惯量**

&emsp;&emsp;对 $x=x(t),~y=y(t),~t\in[\alpha,\beta]$ 关于 $y$ 轴的转动惯量, 容易给出
$$
J_y=\int_\alpha^\beta x(t)^2\rho(t)\sqrt{x'(t)^2+y'(t)^2}\d t.
$$
关于 $x$ 轴形式完全一致.

&nbsp;

**引力**

&emsp;&emsp;不妨 $G=1$. 研究球面与质点之间的引力, 若半径 $R$, 质点距离圆心 $r>R$. 对于距离圆心 $x$ 的球带,
$$
F=\sum_i\frac{mm_i\cos\varphi}{(r-x)^2+(R^2-x^2)}=\frac{m\cos\varphi}{(r-x)^2+(R^2-x^2)}2\pi R\Delta x=\frac{m(r-x)2\pi R}{\br{(r-x)^2+R^2-x^2}}\Delta x.
$$
因此
$$
F=\int_{-R}^R \frac{2m\pi R(r-x)}{\br{r^2+R^2-2rx}^{\frac{3}{2}}}\d x.
$$
做换元 $t^2=r^2+R^2-2rx$, 积分得到
$$
F=\env{cases}{
	0,&0\le r<R;\\
	\frac{2\pi R^2m}{r^2},&R<r.
}
$$
&nbsp;

**积分数值计算**

&emsp;&emsp;对朴素的矩形划分估计, 若 $f\in C^1[a,b]$, 有
$$
\env{aligned}{
	\int_a^b f(x)\d x &= \frac{b-a}{n}\sum_{i=1}^n y_k-\frac{(b-a)^2}{2n}f'(\xi)\\
	&= \frac{b-a}{n}\sum_{i=0}^{n-1}y_k+\frac{(b-a)^2}{2n}f'(\eta).
}
$$
后一项可视作误差估计.

&emsp;&emsp;前一式推导:
$$
\env{aligned}{
	\int_a^b f(x)\d x-\frac{b-a}{n}\sum_{i=1}^n y_i &= \sum_{i=1}^n\int_{x_{i-1}}^{x_i}(f(x)-f(x_i))\d x\\
	&= \sum_{i=1}^n\int_{x_{i-1}}^{x_i}(f(x)-f(x_i))\d(x-x_{i-1})\\
	&= -\sum_{i=1}^n\int_{x_{i-1}}^{x_i}(x-x_{i-1})f'(x)\d x\\
	&= -\sum_{i=1}^nf'(\xi_i)\frac{(b-a)^2}{2n}\\
	&= -\frac{(b-a)^2}{2n}f'(\xi).
}
$$
&emsp;&emsp;若 $f\in C^2[a,b]$, 有
$$
\int_a^b f(x)\d x = \frac{b-a}{n}\sum_{k=1}^ny_{k-\frac{1}{2}}+\frac{(b-a)^3}{24n^2}f''(\xi).
$$
事实上, 对 $f(x)-f(x_{k-\frac{1}{2}})$ Taylor 展开, 有
$$
f(x)-f(x_{k-\frac{1}{2}})=(x-x_{k-\frac{1}{2}})f'(x-x_{k-\frac{1}{2}})+\frac{1}{2}(x-x_{k-\frac{1}{2}})^2f''(\xi_k).
$$
设 $f''$ 在每个区间上的上下确界为 $M_k,m_k$, 则
$$
(x-x_{k-\frac{1}{2}})f'(x-x_{k-\frac{1}{2}})+\frac{m_k}{2}(x_k-x_{k-\frac{1}{2}})^2\\
\le f(x)-f(x_{k-\frac{1}{2}})\\
\le(x-x_{k-\frac{1}{2}})f'(x-x_{k-\frac{1}{2}})+\frac{M_k}{2}(x_k-x_{k-\frac{1}{2}})^2.
$$
对上下界积分再求和即可.

&emsp;&emsp;如果采用梯形而非矩形拟合, $f\in C^2[a,b]$, 有
$$
\int_a^b f(x)\d x=\frac{b-a}{n}\br{\frac{y_0+y_n}{2}+\sum_{k=1}^{n-1}y_k}-\frac{(b-a)^3}{12n^2}f''(\xi).
$$
这是因为
$$
\env{aligned}{
	\int_{x_{k-1}}^{x_k}f(x)\d x &= \int_{x_{k-1}}^{x_k}f(x)\d(x-x_{k-1})\\
	&= \frac{b-a}{n}f(x_k)-\int_{x_{k-1}}^{x_k}f''(x)(x-x_{k-1})\d x\\
	&= \frac{b-a}{n}f(x_k)-\frac{1}{2}\int_{x_{k-1}}^{x_k}f''(x)\d(x-x_{k-1})^2\\
	&= \frac{b-a}{n}f(x_k)-\frac{1}{2}f'(x_k)\br{\frac{b-a}{n}}^2+\frac{1}{2}\int_{x_{k-1}}^{x_k}f''(x)(x-x_{k-1})^2\d x\\
	&\overset{\text{likewise}}=\frac{b-a}{n}f(x_{k-1})+\frac{1}{2}f'(x_{k-1})\br{\frac{b-a}{n}}^2+\frac{1}{2}\int_{x_{k-1}}^{x_k}f''(x)(x-x_k)^2\d x.
}
$$
后两式相加, 得到
$$
\env{aligned}{
	\int_{x_{k-1}}^{x_k}f(x)\d x &= \frac{f(x_k)+f(x_{k-1})}{2}\frac{b-a}{n}\\
	&+\frac{1}{4}\int_{x_{k-1}}^{x_k}f''(x)\br{(x-x_k)^2+(x-x_{k-1})^2-\br{\frac{b-a}{n}}^2}\d x\\
	&= \frac{f(x_k)+f(x_{k-1})}{2}\frac{b-a}{n}+\frac{1}{2}\int_{x_{k-1}}^{x_k}f''(x)(x-x_k)(x-x_{k-1})\d x\\
	&= \frac{f(x_k)+f(x_{k-1})}{2}\frac{b-a}{n}+\frac{1}{2}f''(\xi_k)\int_{x_{k-1}}^{x_k}(x-x_k)(x-x_{k-1})\d x\\
	&= \frac{1}{2}(y_{k-1}+y_k)\Delta x-\frac{1}{12}f''(\xi_k)\frac{(b-a)^3}{n^3}.
}
$$
整理就能得到结果.

&emsp;&emsp;后来是不带自适应的 Simpson 积分, [左转自己博客](https://www.cnblogs.com/rainybunny/p/14376273.html).

&emsp;&emsp;分析精度. 假设 $f\in C^4[a,b]$, 结论: 误差在 $-\frac{(b-a)^5}{2880n^4}f^{(4)}(\xi)$,

&nbsp;

**R-S 积分**

&emsp;&emsp;给定单调不减的 $\alpha:[a,b]\to\R$ 和函数 $f:[a,b]\to\R$, 取任意分划 $p:a=x_0\ops<x_n=b$, 定义
$$
\Delta\alpha_k=\alpha(x_k)-\alpha(x_{k-1})\ge 0;\\
M_k=\sup_{x\in[x_{k-1},x_k]}\{f(x)\},\quad m_k=\inf_{x\in[x_{k-1},x_k]}\{f(x)\};\\
U(p,f,\alpha)=\sum_{k=1}^n M_k\Delta\alpha_k,\quad L(p,f,\alpha)=\sum_{k=1}^n m_k\Delta \alpha_k;\\
\ol{\int_a^b}f(x)\d\alpha=\inf_p\{U(p,f,\alpha)\},\quad \ul{\int_a^b}f(x)\d\alpha=\sup_p\{L(p,f,\alpha)\}.
$$
若 $\ol{\int_a^b}f(x)\d\alpha=\ul{\int_a^b}f(x)\d\alpha$, 则称 $f$ 关于 $\alpha$ R-S 可积, 其值定义为 R-S 积分, 记作 $\int_a^b f(x)\d\alpha$.

&emsp;&emsp;对于 $p$ 的任意加密 $p^*$, 显然有
$$
L(p,f,\alpha)\le L(p^*,f,\alpha)\le U(p^*,f,\alpha)\le U(p,f,\alpha).
$$
从而
$$
L(p,f,\alpha)\le L(p\cup p',f,\alpha)\le U(p\cup p',f,\alpha)\le U(p',f,\alpha),
$$
即
$$
\ul{\int_a^b}f(x)\d\alpha\le\ol{\int_a^b}f(x)\d\alpha.
$$
若 $f\in R_\alpha[a,b]$, 则 (当且仅当) $\A\eps>0,~\E p,~0\le U(p,f,\alpha)-L(p,f,\alpha)<\eps$.

&emsp;&emsp;仿照 Riemann 和, 任取 $t_k\in[x_{k-1},x_k]$, 则 $\sum_{k=1}^nf(t_k)\Delta\alpha_k$ 称为 R-S 和. 对连续函数 $f\in C[a,b]$, 必有 $f\in R_\alpha[a,b]$, 同时:
$$
\A\eps>0,~\E\delta>0,~\A|p|<\delta,~\abs{\sum_{k=1}^nf(t_k)\Delta\alpha_k-\int_a^bf(x)\d\alpha}<\eps.
$$
&emsp;&emsp;对任给的 $\eps>0$, 取 $\gamma>0$ 使得 $(\alpha(b)-\alpha(a))\gamma<\eps$. 由于 $f$ 一致连续, 一定存在 $\delta>0$ 使得 $|x-y|<\delta\Ra|f(x)-f(y)|<\gamma$. 这时, 对任意 $|p|<\delta$, 就有
$$
U(p,f,\alpha)-L(p,f,\alpha)\le\gamma(\alpha(b)-\alpha(a))<\eps.
$$
这样就可以证明上面的命题.

&emsp;&emsp;将上面的 $f$ 连续减弱, 我们要求 $f$ 单调且 $\alpha$ 连续, 则仍然有 $f\in R_\alpha[a,b]$. 不妨 $f$ 单增, 对给定的 $\alpha$, 取定 $n\in\Z_{\ge 1}$ 使得
$$
\frac{\alpha(b)-\alpha(a)}{n}(f(b)-f(a))<\eps.
$$
由于 $\alpha$ 有介值性, 能够取出满足 $\Delta\alpha_k=\frac{\alpha(b)-\alpha(a)}{n}$ 的分划, 这样就完成证明.

&nbsp;

&emsp;&emsp;接下来研究 R-S 积分的性质.

- $f_1,f_2\in R_\alpha[a,b]\Ra f_1+f_2\in R_\alpha[a,b]$ 且 $\int f_1+\int f_2=\int(f_1+f_2)$, 分别研究 R-S 上下和即可.
- $f\in R_\alpha[a,b]\Ra cf\in R_\alpha[a,b]$ 且 $\int cf=c\int f$.
- $f_1,f_2\in R_\alpha[a,b]$, 则 $f_1\le f_2\Ra\int f_1\le \int f_2$.
- $f\in R_\alpha[a,b]$, $c\in[a,b]$, 则 $f\in R_\alpha[a,c]\land f\in R_\alpha[c,b]$, $\int_a^b f=\int_a^c f+\int_c^bf$.
- $f\in R_\alpha[a,b]$, $|f|\le M$, 则 $\abs{\int f}\le M(\alpha(b)-\alpha(a))$.
- $f\in R_{\alpha_1}[a,b]\cap R_{\alpha_2}[a,b]\Ra f\in R_{\alpha_1+\alpha_2}[a,b]$, 积分值亦为加和.
- $f\in R_\alpha[a,b]$, $c>0$, 则 $f\in R_{c\alpha}[a,b]$, 积分值亦为乘积.

&nbsp;

- 对复合函数, $f\in R_\alpha[a,b]$, $m\le f\le M$, $g\in C[m,M]$, 则 $gf\in R_\alpha[a,b]$.

&emsp;&emsp;证明, 对任意 $\eps>0$, 存在 $\delta<\eps$, 使得 $|s-t|<\delta\Ra |g(s)-g(t)|<\eps$. 取划分 $p$ 使得
$$
U(p,f,\alpha)-L(p,f,\alpha)<\delta^2.
$$
设
$$
A=\{k\in[1:n]:M_k-m_k<\delta^2\},B=[1:n]\setminus A.
$$
以及
$$
M_k^*=\sup_{x\in[x_{k-1},x_k]}\{gf(x)\},\quad m_k^*=\cdots.
$$
注意当 $k\in A$, $M_k^*-m_k^*<\eps$; 当 $k\in B$, $M_k^*-m_k^*\le 2\sup|g|$. 所以 $\delta\sum_{k\in B}\Delta\alpha_k\le \sum_{k\in B}(M_k-m_k)\Delta\alpha_k<\delta^2$. 这给出 $\sum_{k\in B}\Delta\alpha_k<\delta$, 因此:
$$
\env{aligned}{
	U(p,gf,\alpha)-L(p,gf,\alpha)&=\sum_{k\in A}(M_k^*-m_k^*)\Delta \alpha_k+\sum_{k\in B}(M_k^*-m_k^*)\Delta\alpha_k\\
	&<\eps(\alpha(b)-\alpha(a))+2\sup|g|\delta\\
	&<\eps(\alpha(b)-\alpha(a)+2\sup|g|).
}
$$
&nbsp;

- 若 $u,v\in R_\alpha[a,b]$, 则 $u\cdot v\in R_\alpha[a,b]$; $|u|\in R_\alpha[a,b]$, $\int u\le\int|u|$.

&emsp;&emsp;利用复合性质, 分别取 $g(x)=x^2$ 构造 $4uv=(u+v)^2-(u-v)^2$ 以及 $g(x)=|x|$ 即可.&nbsp;

&nbsp;

- 若 R-S 和极限 $\lim_{|p|\to 0}RS(p,f,\alpha)$ 存在, 则 $f\in R_\alpha[a,b]$ 且极限即积分值.

&emsp;&emsp;设极限为 $A$, 对 $\eps>0$ 取 $\delta$ 使得 $|p|<\delta\Ra A-\eps\le RS(p,f,\alpha)\le A+\eps$, 中间取上下极限即可.

&emsp;&emsp;然而这个命题的逆命题并不成立. 在 $[0,1]$ 上, 设 $f(x)=1+[x\ge0,5]$, $\alpha(x)=3+[x>0.5]$, 可验证 $\ol\int f=\ul\int f=2$, 然而 R-S 不存在极限.

&nbsp;

- 若 $f\in C[a,b]$ 或 \{$\alpha\in C[a,b]$ 且 $f\in R_\alpha[a,b]$ 有界\}, 则上述逆命题成立.

&emsp;&emsp;前一种情况已经证明过. 接下来只证: 对 $\eps>0$, 存在分划 $p^*$, 使得 $U(p^*,f,\alpha)<\lim_{|p|\to 0}RS(p,f,\alpha)+\frac{\eps}{4}$. 注意到 $f\gets f+C$ 不影响命题, 不妨设 $f>0$. 设 $M=\sup|f|$, 存在 $\delta_1>0$, 使得 $|p|<\delta_1$ 时有 $\Delta\alpha_k<\frac{\eps}{4Mn}$. 对这样的一个 $p$, 设
$$
A=\{k\in[1:m]:\E i,~x_i^*\in(x_{k-1},x_k)\},\quad B=[1:m]\setminus A.
$$
那么
$$
\env{aligned}{
	\sum_{k\in A}f(t_k)\Delta\alpha_k\le(n-1)\max_k\{\Delta\alpha_k\}M<\frac{\eps}{4};\\
	\sum_{k\in B}f(t_k)\Delta\alpha_k\le M_k\Delta\alpha_k\le U(p^*,f,\alpha)<\int f+\frac{\eps}{4}.
}
$$
这就给出了一个
$$
RS(p,f,\alpha)\le\int f+\frac{\eps}{2}.
$$
&nbsp;

**R-S 有界变差推广**

&emsp;&emsp;现在尝试将 R-S 积分扩展到有界变差的 $\alpha:[a,b]\to\R$ 上. 根据 <u>定理 7.6.4</u>, 可以写出 $\alpha(x)=\beta(x)-\gamma(x)$, 其中 $\beta$ 和 $\gamma$ 均单增. 定义
$$
\int_a^b f(x)\d\alpha:=\int_a^b f(x)\d\beta-\int_a^bf(x)\d\gamma.
$$
根据递增函数 R-S 积分的性质, 若积分值存在, 可以验证上述定义是良的. 若 $f\in C[a,b]$ 或 \{$f$ 有界变差且 $\alpha\in C[a,b]$\}, 任取的 $\beta,\gamma$ 都能使得积分值存在.

&emsp;&emsp;若 $f\in C[a,b]$ 而 $\alpha$ 有界变差, 同样有结论
$$
\lim_{|p|\to 0}RS(p,f,\alpha)=\int_a^bf(x)\d\alpha.
$$
&nbsp;

&emsp;&emsp;设 {$f\in C[a,b]$, $\alpha$ 有界变差} 或 {$f$ 有界变差且 $\alpha\in C[a,b]$ 有界变差}. 令 $v(x)=V_a^x\alpha$ 表示 $\alpha$ 在 $[a,x]$ 的全变差, 则
$$
\abs{\int_a^b f\d\alpha}\le\int_a^b|f|\d v.
$$
证明, 对任意分划 $p$, 考虑 R-S 和:
$$
\env{aligned}{
	|RS(p,f,\alpha)| &= \abs{\sum_{k=1}^n f(t_k)\Delta\alpha_k}\\
	&\le \sum_{k=1}^n |f(t_k)|\cdot|\Delta\alpha_k|\\
	&\le \sum_{k=1}^n |f(t_k)|\Delta v_k.
}
$$
对 $f\in C[a,b]$ 的情形, 左右取极限即可.

&emsp;&emsp;作为推论, $f\in C[a,b]$ 时有
$$
\abs{\int_a^bf\d\alpha}\le\sup|f|\cdot V_a^b\alpha.
$$
&nbsp;

**R-S 分部积分**

&emsp;&emsp;若 $f\in C[a,b]$ 且有界变差, $\alpha$ 有界变差, 则
$$
\int_a^b f\d\alpha=\ev{f\alpha}_a^b-\int_a^b\alpha\d f.
$$
事实上, 对任意分划 $p$, 取 $t_k\in[x_{k-1},x_k]$ 得到另一个分划 $q$. 则
$$
\env{aligned}{
	RS(p,f,\alpha) &= \sum_{k=1}^nf(t_k)\br{\alpha(x_k)-\alpha(x_{k-1})}\\
	&= f(b)\alpha(b)-f(a)\alpha(a)-\sum_{k=1}^{n+1}\alpha(x_{k-1})\br{f(t_k)-f(t_{k-1})}\\
	&= \ev{f\alpha}_a^b-RS(q,\alpha,f).
}
$$
取极限即可.

&nbsp;

**R-S 积分中值定理**

&emsp;&emsp;第一积分中值定理: 若 $f\in C[a,b]$, $\alpha$ 单增, 则
$$
\int_a^b f\d\alpha=f(\xi)(\alpha(b)-\alpha(a)).
$$
&emsp;&emsp;第二积分中值定理: 若 $f$ 单调, $\alpha$ 连续且有界变差, 则
$$
\int_a^b f\d\alpha=f(a)(\alpha(\xi)-\alpha(a))+f(b)(\alpha(b)-\alpha(\xi)).
$$
这是因为
$$
\env{aligned}{
	\int_a^b f\d\alpha&=f(b)\alpha(b)-f(a)\alpha(a)-\int_a^b\alpha\d f\\
	&= f(b)\alpha(b)-f(a)\alpha(a)-\alpha(\xi)(f(\xi)-f(a)).
}
$$
&nbsp;

**R-S 变量替换**

&emsp;&emsp;设 $f,g\in C[a,b]$, $g$ 严格单增, $h=g^{-1}$, $c=g(a)$, $d=g(b)$, 则
$$
\int_a^b f(x)\d x=\int_c^d f(h(y))\d h(y).
$$
展开不难验证. 右侧可以视作 R-S 积分, 从而蕴含了 $h$ 不可导的情况.

&emsp;&emsp;若 $f\in R[a,b]$, $\alpha'\in R[a,b]$ (则 $\alpha$ 李氏连续, 有界变差), 那么 $f\in R_\alpha[a,b]$, 且
$$
\int_a^b f\d\alpha=\int_a^b f\alpha'\d x.
$$
证明, 由于 $f,\alpha'\in R[a,b]$, 则 $f\alpha'\in R[a,b]$. 对分划 $p$,
$$
\Delta\alpha_k=\alpha(x_k)-\alpha(x_{k-1})=\alpha'(s_k)\Delta x_k.
$$
所以
$$
\env{aligned}{
	RS(p,f,\alpha) &= \sum_{k=1}^n f(t_k)\Delta\alpha_k\\
	&= \sum_{k=1}^n f(t_k)\alpha'(s_k)\Delta x_k.
}
$$
在 $\alpha$ 单调时, 对上式取极限就能给出证明. 若 $\alpha$ 不单增, 拆分为单调函数的差, 套用上述结果也就给出了证明.

# 第八章 广义积分

## $\S8.1$ 无穷积分

> **定义 8.1.1**
>
> &emsp;&emsp;对 $f:[0,+\oo)\to\R$, 若 $\A0\le a<b,~f\in R[a,b]$ (这称为内闭可积), 且
> $$
> I:=\lim_{A\to+\oo}\int_a^A f(x)\d x
> $$
> 存在, 则称广义积分
> $$
> \int_a^{+\oo}f(x)\d x:=I
> $$
> 收敛 (存在).

&emsp;&emsp;例如
$$
\env{aligned}{
	\int_{-\oo}^{+\oo}\frac{\d x}{1+x^2} &= \br{\int_{-\oo}^0+\int_0^{+\oo}}\frac{\d x}{1+x^2}\\
	&= \lim_{A\to-\oo}\arctan A+\lim_{A\to+\oo}\arctan A\\
	&= \pi.
}
$$
运算上无非是求定积分之后顺便取极限. 再如
$$
\env{aligned}{
	\int_1^{+\oo}\frac{\arctan x}{x^3}\d x &= -\frac{1}{2}\int_1^{+\oo}\arctan x\d x^{-2}\\
	&= \ev{-\frac{\arctan x}{2x^2}}_1^{+\oo}+\frac{1}{2}\int_1^{+\oo}\frac{\d x}{x^2(x^2+1)}\\
	&= \frac{\pi}{8}+\frac{1}{2}\int_1^{+\oo}\br{\frac{1}{x^2}-\frac{1}{x^2+1}}\d x\\
	&= \frac{1}{2}.
}
$$
&emsp;&emsp;不平凡处在于广义积分存在性的证明. 例如,

> **例子 8.1.2**
>
> &emsp;&emsp;若 $f$ 在 $\R$ 内闭可积, $f(+\oo)=A$, $f(-\oo)=B$, $a>0$, 求证
> $$
> \int_{-\oo}^{+\oo}(f(x+a)-f(x))\d x
> $$
> 收敛并求其值.

&emsp;&emsp;*→ Proof.* 先考虑 $[0,+\oo)$ 上的积分.
$$
\env{aligned}{
	\int_0^M (f(x+a)-f(x))\d x &= \int_a^{a+M}f(x)\d x-\int_0^M f(x)\d x\\
	&= \int_M^{M+a}f(x)\d x-\int_0^af(x)\d x\\
	&\overset{M\to+\oo}\to aA-\int_0^a f(x)\d x.
}
$$
同理
$$
\int_{-\oo}^0(f(x+a)-f(x))\d x=\int_0^a f(x)\d x-aB.
$$
因此所求积分存在且等于 $a(A-B)$.

&emsp;&emsp;对非负且内闭可积的 $f$, 令 $F(A)=\int_a^A f(x)\d x$, 明显 $F(+\oo)$ 存在当且仅当 $F(A)$ 有上界, 这给出了比较原理:

> **命题 8.1.3 (比较原理)**
>
> &emsp;&emsp;若 $0\le f\le cg$, $c>0$, 则
> $$
> \int_a^{+\oo}f<+\oo\Leftarrow \int_a^{+\oo}g<+\oo,\quad \int_a^{+\oo}f=+\oo\Ra\int_a^{+\oo}g=+\oo.
> $$

&emsp;&emsp;这允许我们使用一些初等函数的积分来控制复杂函数. 例如 $\int\frac{\d x}{x^p}$ 可用于控制非负函数, 并依据 $p$ 和 $1$ 的大小关系得到收敛性.

> **例子 8.1.4**
>
> &emsp;&emsp;(1) 若 $f\in C^1[0,+\oo)$ 单调, $f(+\oo)=0$, 求证
> $$
> \int_a^{+\oo}f'\sin^2 x\d x
> $$
> 收敛.
>
> &emsp;&emsp;(2) 判断
> $$
> \int_0^{\oo}\frac{x\d x}{1+x^4\sin^2 x}
> $$
> 的收敛性.

&emsp;&emsp;*→ Proof.* (1) 依据比较原理, 不妨 $f'\ge 0$, 就有
$$
0\le \int_a^{+\oo}f'\sin^2 x\d x\le \int_a^{+\oo}f'\d x=-f(a)<\oo.
$$
&emsp;&emsp;(2) 设 $F(A)=\int_0^A\cdots$, 研究 $F(n\pi)$ 的有界性:
$$
\env{aligned}{
	F(n\pi) &= \int_0^{n\pi}\frac{x\d x}{1+x^4\sin^2 x}\\
	&= \sum_{k=1}^n\int_{(k-1)\pi}^{k\pi}\frac{x\d x}{1+x^4\sin^2 x}\\
	&\ge \sum_{k=1}^n(k-1)\pi\int_{(k-1)\pi}^{k\pi}\frac{\d x}{1+(k\pi)^4\sin^2 x}\\
	&= \sum_{k=1}^n2(k-1)\pi\int_{0}^{\frac{\pi}{2}}\frac{\d x}{1+(k\pi)^4\sin^2 x}\\
	&\ge \sum_{k=1}^n2(k-1)\pi\int_{0}^{\frac{\pi}{2}}\frac{\d x}{1+(k\pi)^4x^2}\\
	&= \sum_{k=1}^n \frac{2(k-1)\pi}{k^2\pi^2}\ev{(\arctan k^2\pi^2 x)}_0^{\frac{\pi}{2}}\\
	&\ge c_0+c_1\ln n.
}
$$
发散.

> **定义 8.1.5**
>
> &emsp;&emsp;变号函数 $f:[a,+\oo)\to\R$ 内闭可积, 若 $\int_0^\oo|f|\d x<\oo$, 则称 $f$ 绝对收敛; 若 $f$ 收敛但不绝对收敛, 则称 $f$ 条件收敛.

> **定理 8.1.6**
>
> &emsp;&emsp;若上述 $f$ 绝对收敛, 则 $f$ 收敛.

&emsp;&emsp;*→ Proof.* 对 $0\le |f|-f\le 2|f|$ 使用比较原理.

> **例子 8.1.9**
>
> &emsp;&emsp;(1) 判断 $\DS\int_0^\oo\frac{x\ln x}{(1+x^2)^2}\d x$ 的收敛性.
>
> &emsp;&emsp;(2) 若 $f,g\in C^1[a,\oo)$, $f'\ge 0$, $f(\oo)=0$, $g$ 有界, 判断 $\DS\int_a^\oo fg'\d x$ 的收敛性.

&emsp;&emsp;*→ Proof.* (1) 在 $x>1$ 时放缩, 证明绝对收敛性.

&emsp;&emsp;(2)
$$
\int_a^\oo fg'\d x = \ev{(fg)}_a^\oo-\int_a^\oo f'g\d x.
$$
后一项用中值定理放缩即可.

## $\S8.2$ 无穷积分收敛性的判别法

> **定理 8.2.1 (Cauchy)**
>
> &emsp;&emsp;$\DS\int_a^\oo f(x)\d x$ 收敛, 当且仅当
> $$
> \A\eps>0,~\E M>a,~\A A>B\ge M,~\abs{\int_B^A f(x)\d x}<\eps.
> $$

> **例子 8.2.2**
>
> &emsp;&emsp;对内闭可积的 $f$ 和 $p>0$, 若 $\DS\int_{-\oo}^\oo |f|^p\d x<\oo$, 求证
> $$
> \lim_{h\to 0}\int_{-\oo}^\oo|f(x+h)-f(x)|^p\d x=0.
> $$

&emsp;&emsp;*→ Proof.* 考察 (注意 $(|a|+|b|)^p\le(2\max\{|a|,|b|\})^p\le 2^p|a|^p+2^p|b|^p$):
$$
\int_A^\oo|f(x+h)-f(x)|^p\d x\le2^p\int_A^\oo|f(x+h)|^p\d x+2^p\int_A^\oo|f(x)|^p\d x.
$$
右侧可用 Cauchy 收敛判据控制到任意小. 所以 $|f(x+h)-f(x)|^p$ 在远处的积分绝对收敛. 接下来, 在 $[-A-1,A+1]$ 上, 取分划 $\Delta$, 定义分段线性函数
$$
g(x)=\frac{f(x_k)-f(x_{k-1})}{x_k-x_{k-1}}(x-x_{k-1})+f(x_{k-1}),
$$
设 $f$ 在 $[x_{k-1},x_k]$ 的上下确界为 $M_k,m_k$, 则 $[x_{k-1},x_k]$ 上有 $|f-g|\le M_k-m_k$. 取定 $\Delta$ 使得
$$
\sum_{i=1}^n(M_i-m_i)\Delta x_i<\eps^2.
$$
需要证明
$$
\sum_k|f(\xi_k)-g(\xi_k)|\Delta x_k\le \sum_k(M_k-m_k)\Delta x_k<\eps,
$$
利用可积性的等价定义, 分别控制振幅和区间长即可. 最后, 利用 $g$ 控制原积分:
$$
\env{aligned}{
	\int_{-\oo}^\oo|f(x+h)-f(x)|^p\d x &< 2\eps+\int_{-A}^A|f(x+h)-f(x)|^p\d x\\
	&\le 2\eps+\int_{-A}^A\br{\abs{f(x+h)-g(x+h)}+\abs{g(x+h)-g(x)}+\abs{g(x)-f(x)}}^p\d x\\
	&\le 2\eps+3^p\br{\int\cdots+\int\cdots+\int\cdots}\\
	&\le 2\eps+3^p\eps'+3^p\eps''+\int_{-A}^A|g(x+h)-g(x)|^p\d x.
}
$$
因此 $h\to0$ 时有结论.

> **定理 8.2.3 (Dirichlet/Abel 判别法)**
>
> &emsp;&emsp;设 $f,g:[a,+\oo)\to\R$ 内闭可积, $f$ 单调, 则
>
> - Dirichlet: 若 $f(+\oo)=0$, $G(A)=\int_a^A g\d x$ 有界; 或
> - Abel: 若 $f$ 有界, $\int_0^\oo g\d x$ 收敛,
>
> 则 $\int_a^\oo fg\d x$ 收敛.

&emsp;&emsp;*→ Proof.* 取足够远处的积分, 用第二中值定理展开积分, 分别用有界和小量控制即可.

> **例子 8.2.4**
>
> &emsp;&emsp;证明 $\DS\int_0^\oo\frac{\sin x}{x}\d x$ 收敛.

&emsp;&emsp;*→ Proof.* 不妨在 $[1,+\oo)$ 积分. 套用 Dirichlet 判别法即可. 注意原积分显然不绝对收敛.

&emsp;&emsp;事实上, 有 $\int_0^\oo\frac{\sin x}{x}\d x=\frac{\pi}{2}$, 为了证明这一点, 先给出引理:

> **引理 8.2.3 (Riemann)**
>
> &emsp;&emsp;若 $f\in R[a,b]$, 则
> $$
> \lim_{\lambda\to\oo}\int_a^b f(x)\sin \lambda x\d x=\lim_{\lambda\to\oo}\int_a^b f(x)\cos \lambda x\d x=0.
> $$

&emsp;&emsp;*→ Proof.* 对 $\eps>0$, 取分划 $\Delta$ 使得 $\sum\omega_i\Delta x_i<\eps$. 这时
$$
\env{aligned}{
	\abs{\int_a^bf(x)\sin\lambda x\d x} &= \abs{\sum_{i=1}^n\int_{x_{i-1}}^{x_i}f(x)\sin\lambda x\d x}\\
	&\le \abs{\sum_{i=1}^n\int_{x_{i-1}}^{x_i}(f(x)-m_i)\sin\lambda x\d x}+\abs{\sum_{i=1}^n\int_{x_{i-1}}^{x_i}m_i\sin\lambda x\d x}\\
	&\le \sum_{i=1}^n(M_i-m_i)\Delta x_i+\frac{2}{\lambda}\sum_{i=1}^n|m_i|\Delta x_i\\
	&<\eps+\frac{2(b-a)|\sup f|}{\lambda}\\
	&\overset{\lambda\to\oo}<2\eps.
}
$$
&emsp;&emsp;接下来求证上述积分. (由于 $\frac{1}{x}$ 在 $(0,\pi)$ 不可积, 过程中将其拆分为在 $0$ 附近同阶的一项和可积的 $f$.)
$$
\env{aligned}{
	\int_0^\oo\frac{\sin x}{x}\d x &= \lin\int_0^{\br{n+\frac{1}{2}}\pi}\frac{\sin t}{t}\d t\\
	&= \lin\int_0^\pi\frac{\sin\br{n+\frac{1}{2}}x}{x}\d x\\
	&= \lin\int_0^\pi\br{f(x)+\frac{1}{2\sin\frac{x}{2}}}\sin\br{n+\frac{1}{2}}x\d x\\
	&\overset{\text{R.~lem}}=\lin\int_0^\pi\frac{\sin\br{n+\frac{1}{2}}x}{2\sin\frac{x}{2}}\d x\\
	&= \lin\int_0^\pi\br{\frac{1}{2}+\sum_{k=1}^n\cos kx}\d x\\
	&= \frac{\pi}{2}.
}
$$

> **例子 8.2.4**
>
> &emsp;&emsp;若 $f\in C[0,+\oo)$, $\int_0^\oo f^2<+\oo$, $g(x)=\int_0^x f$, 求证 $g(x)/x$ 平方可积, 且 $\int_0^\oo g(x)^2/x^2\d x\le 4\int_0^\oo f^2$.

&emsp;&emsp;*→ Proof.* 利用 Cauchy 不等式:
$$
\env{aligned}{
	\int_0^A\frac{g(x)^2}{x^2}\d x &= \int_0^A g(x)^2\d\br{-\frac{1}{x}}\\
	&= \ev{-\frac{g(x)^2}{x}}_0^A-\int_0^A\frac{2g(x)f(x)}{x}\d x\\
	&= -\frac{g(A)^2}{A}+2\int_0^A\frac{g(x)}{x}\cdot f(x)\d x\\
	&\le 2\br{\int_0^A\frac{g(x)^2}{x^2}\d x}^{\frac{1}{2}}\br{\int_0^Af(x)^2\d x}^{\frac{1}{2}}.
}
$$
整理即得. (tip: $0$ 不是瑕点, 洛一下验证即可.)

## $\S8.3$ 瑕积分

> **定义 8.3.1**
>
> &emsp;&emsp;称 $f$ 的某个 $x$ 是瑕点, 当且仅当 $f$ 在任意 $U_\circ(x,\delta)$ 无界. 若 $f:[a,b)\to\R$ 内闭可积, $b$ 为瑕点, 则称广义积分
> $$
> \int_a^b f(x)\d x
> $$
> 收敛, 当且仅当
> $$
> \lim_{A\to b-}\int_a^Af(x)\d x
> $$
> 存在.

&emsp;&emsp;例如对 $\int_0^1x^{-p}\d x$, 则当且仅当 $p<1$ 时广义积分存在.

&emsp;&emsp;先研究非负函数的瑕积分. 若 $f\ge 0$ 在 $[a,b)$ 内闭可积, 则 $\int_a^bf(x)\d x$ 存在当且仅当 $F(A)=\int_a^Af(x)\d x$ 有界. 这时也有比较原理: 若 $0\le f\le cg$, $c>0$, $若 \int_a^b g<\oo$, 则 $\int f<\oo$; 若 $\int_a^b f=+\oo$, 则 $\int_a^b g=+\oo$.

&emsp;&emsp;例如
$$
\int_0^{\frac{\pi}{2}}\frac{\cos x}{\sqrt{x}}\d x\le\int_0^{\frac{\pi}{2}}\frac{\d x}{\sqrt{x}}<\oo.
$$
再如
$$
I=\int_0^{\frac{\pi}{2}}\frac{\sin x}{x^p}\d x,
$$
当 $p\le 1$ 平凡. 当 $p>1$,
$$
\frac{2}{\pi x^{p-1}}\le\frac{\sin x}{x^p}=\frac{\sin x}{x}\frac{1}{x^{p-1}}\le\frac{1}{x^{p-1}}.
$$
所以收敛性与 $x^{1-p}$ 相同.

&emsp;&emsp;类似上一节, 绝对收敛也能保证瑕积分的收敛性.

> **定理 8.3.2 (Cauchy)**
>
> &emsp;&emsp;若 $b$ 为 $f:[a,b)\to\R$ 的瑕点, 则 $\int_a^b f$ 收敛, 当且仅当
> $$
> \A\eps>0,~\E 0<\delta<b-a,~\A b-\delta<x_1<x_2<b,~\abs{\int_{x_1}^{x_2}f}<\eps.
> $$

> **定理 8.3.3 (Abel/Dirichlet)**
>
> &emsp;&emsp;若 $f,g\in C[a,b)$, $g$ 单调, 则若
>
> - $F(x)=\int_0^x f$ 有界, $g(b-)=0$; 或
> - $\int_a^b f$ 收敛, $g$ 有界,
>
> 则 $\int_a^b fg$ 收敛.

&emsp;&emsp;*→ Proof.* 利用积分第二中值定理展开乘积, 用两种约束控制即可.

&emsp;&emsp;例如对 $\int_0^1\frac{1}{1-x}\sin\frac{1}{1-x}\d x$, 构造 $f=\frac{1}{(1-x)^2}\sin\frac{1}{1-x}$, $g=1-x$, 则 $g\downarrow 0$, $\int f=\cos\frac{1}{1-x}$ 有界, 原积分收敛.

&emsp;&emsp;若 $[a,+\oo)$ 上的积分, $a$ 为瑕点, 则 $\int_a^{+\oo}f$ 收敛当且仅当对任取的 $c>a$, 广义积分在两侧都存在. 例如
$$
I=\int_0^\oo\frac{x^\alpha\sin x}{1+x^\beta}\d x=\br{\int_0^1+\int_1^\oo}\cdots\d x=:I_1+I_2\quad(\beta\ge 0).
$$
其中
$$
I_1=\int_0^1\frac{x^{\alpha+1}}{1+x^\beta}\frac{\sin x}{x}\d x,
$$
除 $x^{\alpha+1}$ 外, 其余在 $0$ 处极限为 $1$, 因此此积分收敛性与 $x^{\alpha+1}$ 相同, 要求 $\alpha>-2$.
$$
I_2=\int_1^\oo\sin x\frac{x^\alpha}{1+x^\beta}\d x,
$$
若 $\beta>\alpha$, $\frac{x^\alpha}{1+x^\beta}\downarrow 0$, A/D 判别给出其收敛; 若 $\alpha=\beta=0$, 自然发散; 若 $\alpha=\beta>0$, $\sin x\frac{x^\alpha}{1+x^\beta}=\sin x-\frac{\sin x}{1+x^\alpha}$, 后者趋于 $0$, 因此积分发散. 最后, 若 $0\le\beta<\alpha$, 容易验证 Cauchy 判据不成立, 积分发散.

&emsp;&emsp;因此, 当且仅当 $\beta>\alpha>-2$ 时积分收敛.

&emsp;&emsp;再如, $f\in C[0,+\oo)$, $\int_0^\oo\frac{f(x)}{x}\d x$ 收敛, 则 $\int_0^\oo\frac{f(ax)-f(bx)}{x}\d x=f(0)\ln\frac{b}{a}~(a,b>0)$.

&emsp;&emsp;谔谔, 好多例子.
$$
I=\int_0^{\frac{\pi}{2}}\ln\sin x\d x,
$$
注意到
$$
I=\int_0^{\frac{\pi}{2}}\ln\sin x\d x=\int_0^{\frac{\pi}{2}}\ln\cos x\d x,
$$
因此
$$
\env{aligned}{
	I &= \frac{1}{2}\int_0^\pi\ln\sin x\d x\\
	&= \int_0^{\frac{\pi}{2}}\ln\sin 2x\d x\\
	&= \int_0^{\frac{\pi}{2}}\br{\ln 2+\ln\sin x+\ln\cos x}\d x\\
	&= \frac{\pi}{2}\ln2 +2I.
}
$$
&emsp;&emsp;Euler 积分:
$$
\int_0^\oo\frac{x^{p-1}}{1+x}\d x\quad(0<p<1).
$$
略过对其收敛性的分析. 当 $0\le x<1$,
$$
\env{aligned}{
	\frac{x^{p-1}}{1+x}&=x^{p-1}\sum_{j=1}^\oo(-x)^j\\
	&= \sum_{j=0}^\oo(-1)^jx^{p+j-1}.
}
$$
我们假设积分对幂级数交换, 这样
$$
\int_0^1\frac{x^{p-1}}{1+x}\d x=\sum_{j=0}^\oo\frac{(-1)^j}{p+j}.
$$
对后一半,
$$
\env{aligned}{
	I_2 &= \int_1^\oo\frac{x^{p-1}}{1+x}\d x\\
	&= \int_0^1\frac{t^{1-p}}{1+t^{-1}}\frac{\d t}{t^2}\\
	&= \int_0^1\frac{t^{-p}}{1+t}\d t\\
	&= \sum_{j=0}^\oo\frac{(-1)^j}{1-p+j}.
}
$$


因此
$$
I_1+I_2=\sum_{j=-\oo}^\oo\frac{(-1)^j}{p+j}\overset{\text{Euler}}=\frac{\pi}{\sin p\pi}
$$

# 第九章 数项级数

## $\S9.1$ 基本概念

> **定义 9.1.1**
>
> &emsp;&emsp;对部分和 $S_n=\sum_{k=1}^n a_k$, 若 $\lin S_n=S$ 存在, 则称级数 $\sum_{k=1}^\oo a_k$ 收敛, 记为 $\sum_{k=1}^\oo a_k:=S$.

> **定理 9.1.2**
>
> &emsp;&emsp;若 $\sum_{k=1}^\oo a_k$ 收敛, 则 $\lin a_n=0$.

> **性质 9.1.3**
>
> &emsp;&emsp;若 $\sum_{n=1}^\oo a_n=a$, $\sum_{n=1}^\oo b_n=b$, 则
>
> - $\sum_{n=1}^\oo(a_n+b_n)=a+b$;
> - $\sum_{n=1}^\oo ca_n=ca$.

> **定理 9.1.4**
>
> &emsp;&emsp;若 $\sum_{n=1}^\oo a_n=a$, 考虑一组加括号的形式 $\{n_0=1,n_1,\cdots\}$, 那么
> $$
> c_k:=\sum_{i=n_{k-1}}^{n_k-1} a_i,\quad \sum_{n=1}^\oo c_n=a.
> $$

&emsp;&emsp;*→ Proof.* 这对应于: 收敛序列的子列也收敛.

&emsp;&emsp;这个逆命题显然是不对的, 但如果限制 $\lin a_n=0$, 且 $n_{k+1}-n_k$ 有上界, 则可以从后者收敛推出前者收敛.

&emsp;&emsp;对于正项级数, 明显级数收敛当且仅当部分和有界. 例如, 对 $a_1=1,a_2=2,a_n=a_{n-1}+a_{n-2}$, 容易放缩出 $a_n>\br{\frac{3}{2}}^n$, 所以 $\sum_{n=1}^\oo\frac{1}{a_n}$ 收敛.

## $\S9.2$ 正项级数

> **定理 9.2.1**
>
> &emsp;&emsp;若 $0\le a_n\le b_n$, 则 $b$ 级数收敛 $\Ra$ $a$ 级数收敛; $a$ 级数发散 $\Ra$ $b$ 级数发散.

> **推论 9.2.2**
>
> &emsp;&emsp;若 $a_n,b_n>0$, 则
> $$
> \lsup\frac{a_n}{b_n}<\oo\land\sum b_n<\oo\Ra \sum a_n<\oo;\\
> \linf\frac{a_n}{b_n}>0\land \sum b_n=+\oo\Ra\sum a_n=+\oo.
> $$

&emsp;&emsp;为此, 我们有必要了解一些典型的数列的收敛性, 进而使用比较定理给出其他序列的收敛性. 例如:
$$
\sum_{n=1}^\oo\frac{1}{n}=+\oo,\quad \sum_{n=1}^\oo q^n<+\oo~(0\le q<1).
$$

> **定理 9.2.3**
>
> &emsp;&emsp;若 $a_n\downarrow 0$, 则
> $$
> \sum_{n=1}^\oo a_n<+\oo\Eq\sum_{k=0}^\oo 2^ka_{2^k}<+\oo.
> $$

&emsp;&emsp;证明仍然是容易的. 这可以用来证明 $\sum_{n=1}^\oo\frac{1}{n^p}~(p>1)$ 的收敛性, 因为
$$
\sum_{k=0}^\oo 2^k\cdot\frac{1}{2^{kp}}<\oo\Ra\sum_{n=1}^\oo\frac{1}{n^p}<\oo.
$$
再如
$$
\sum_{k=1}^\oo\frac{2^k}{2^k(\ln 2^k)^p}=\sum_{k=1}^\oo\frac{1}{k^p(\ln 2)^p},
$$
它收敛当且仅当 $p>1$, 这也给出 $ \sum_{n=2}^\oo\frac{1}{n(\ln n)^p}$ 的收敛性.

&emsp;&emsp;很多时候只关注阶数, 所以可用 Taylor 展开做一些估计. 例如 $a_n=\br{1-\sqrt[3]{\frac{n-1}{n+1}}}^p~(p>0)$, 注意有
$$
\env{aligned}{
	\sqrt[3]{\frac{n-1}{n+1}}&=\br{1-\frac{1}{n}}^{\frac{1}{3}}\br{1+\frac{1}{n}}^{-\frac{1}{3}}\\
	&=\br{1-\frac{1}{3n}+\mathcal O\br{\frac{1}{n^2}}}\br{1-\frac{1}{3n}+\mathcal O\br{\frac{1}{n^2}}}\\
	&=1-\frac{2}{3n}+\mathcal O\br{\frac{1}{n^2}}.
}
$$
因此收敛当且仅当 $p>1$.

> **定理 9.2.4 (积分判别法)**
>
> &emsp;&emsp;若单减的连续函数 $f(x)>0$, $a_n=f(n)$, 则
> $$
> \sum_{n=1}^\oo a_n<\oo\Eq \int_1^\oo f<\oo.
> $$

> **定理 9.2.5 (比值判别法)**
>
> &emsp;&emsp;若 $a_n>0$, 且 $\lsup\frac{a_{n+1}}{a_n}=\ell<1$, 则 $\ser a_n<\oo$; 若 $\linf\frac{a_{n+1}}{a_n}=\ell>1$, 则 $\ser a_n=\oo$.

&emsp;&emsp;经验上来说, 这个判别法更适合出来带有阶乘或 $n$ 次幂的通项形式, 因为这样在比值里会消掉大部分项.

> **定理 9.2.6 (根值判别法)**
>
> &emsp;&emsp;若 $a_n>0$, $\ell:=\lsup\sqrt[n]{a_n}<1$, 则 $\ser a_n<\oo$; 若 $\ell>1$, 则 $\ser a_n=\oo$.

&emsp;&emsp;*→ Proof.* $\ell<1$ 时, 取 $\eps>0$ 使得 $\ell+\eps<1$, 则 $\lsup\sqrt[n]{a_n}=\ell$ 给出 $\E N_0,~\A n>N_0,~\sqrt[n]{a_n}<\ell+\eps$, 即 $a_n<(\ell+\eps)^n$, 等比数列直接控制级数. 当 $\ell>1$ 时, 取 $\eps>1$ 使得 $\ell-\eps>1$, 则 $\lsup\sqrt[n]{a_n}=\ell$ 给出子列 $\{n_k\}$, 使得 $\sqrt[n_k]{a_{n_k}}>\ell-\eps$, 即 $a_{n_k}>(\ell+\eps)^{n_k}$, 所以 $\ser a_n=\oo$.

&emsp;&emsp;理论上讲, 根值判别法是强于比值判别法的. 事实上, 有:

> **定理 9.2.7**
>
> &emsp;&emsp;若 $a_n>0$, 则
> $$
> \linf\frac{a_{n+1}}{a_n}\le\linf\sqrt[n]{a_n}\le\lsup\sqrt[n]{a_n}\le\lsup\frac{a_{n+1}}{a_n}.
> $$

&emsp;&emsp;*→ Proof.* 先证最右侧, 设最右侧上极限为 $\ell$, 不妨 $\ell<\oo$. $\A\eps>0,~\E N_0,~\A n>N_0,~\frac{a_{n+1}}{a_n}<\ell+\eps$, 这给出了 $a_n\le(\ell+\eps)^{n-N_0}a_{N_0}$, 所以 $\sqrt[n]{a_n}\le(\ell+\eps)^{1-\frac{N_0}{n}}a_{N_0}^{\frac{1}{n}}$, 即 $\lsup a_n\le\ell+\eps$, 明所欲证. 最左侧同理.

&emsp;&emsp;上面几个定理使用等比数列控制的级数, 还可以尝试使用 $\frac{1}{n^p}$ 来控制, 这样理论上会更加精确.

> **定理 9.2.8**
>
> &emsp;&emsp;若 $a_n>0$, 则 $\linf n\ln\frac{a_n}{a_{n+1}}>1\Ra\ser a_n<\oo$; $\lsup n\ln\frac{a_n}{a_{n+1}}<1\Ra\ser a_n=\oo$.

&emsp;&emsp;*→ Proof.* 令 $\ell$ 为所写下极限, 若 $\ell>1$, 取 $\ell-\eps=:p>1$, 那么
$$
\frac{a_n}{a_{n+1}}>e^{\frac{p}{n}}>\br{\br{1+\frac{1}{n}}^n}^{\frac{p}{n}}=\br{\frac{n+1}{n}}^p.
$$
可以用常数倍的 $b_n:=n^{-p}$ 控制级数, 所以 $\ser a_n<\oo$. 另一侧同理.

&emsp;&emsp;例如, 对于 $a_n=\frac{n^{n-1}}{e^nn!}$, 由于
$$
\env{aligned}{
	n\ln\frac{a_n}{a_{n+1}} &= n\ln\frac{n^{n-1}e^{n+1}(n+1)!}{(n+1)^ne^nn!}\\
	&= n\ln\br{e\br{\frac{n}{n+1}}^{n-1}}\\
	&= n\br{1+\ln\br{1+\frac{1}{n}}-n\ln\br{1+\frac{1}{n}}}\\
	&\to\frac{3}{2},
}
$$
所以它发散.

> **定理 9.2.9**
>
> &emsp;&emsp;$a_n>0$. 若 $\linf n\br{\frac{a_n}{a_n+1}-1}>1$, 则 $\ser a_n<\oo$; 若 $\lsup n\br{\frac{a_n}{a_{n+1}}-1}<1$, 则 $\ser a_n=\oo$.

&emsp;&emsp;*→ Proof.* 令 $b_n=n\br{\frac{a_n}{a_{n+1}}-1}$, 前一条件给出 $\linf b_n=:\ell>1$, 择取 $1<\ell'<\ell$, 进而取出语境下的 $N_0$. 这样
$$
\frac{a_n}{a_{n+1}}=1+\frac{b_n}{n}\Ra\ln\frac{a_n}{a_{n+1}}=\ln\br{1+\frac{b_n}{n}}>\ln\br{1+\frac{\ell'}{n}}.
$$
所以
$$
n\ln\frac{a_n}{a_{n+1}}\ge\linf\ln\br{1+\frac{\ell'}{n}}^n=\ell'>1,
$$
归约到前一种判别法. 另一侧同理.

&emsp;&emsp;例如 $a_n=\frac{\sqrt{n!}}{(2+\sqrt{1})\cdots(2+\sqrt n)}$, 则 $\frac{a_n}{a_{n+1}}=1+\frac{2}{\sqrt{n+1}}$, 代入判别法可知收敛.

&emsp;&emsp;还有诸如 $a_n^{\frac{1}{\ln n}}$ 的上下极限与 $\frac{1}{e}$ 比较的判别法, 它也是基于 $\frac{1}{n^p}$ 且证明思路相同, 太丑了就不抄了.

&emsp;&emsp;还有高手, 是比较 $\ln\frac{1}{a_n}/\ln n$ 的上下极限与 $1$, 这能归约到上段的判别法.

## $\S9.3$ 任意项级数

&emsp;&emsp;自然, 对任意项级数的首要研究方式是考察其绝对收敛性, 这里不提.

> **定理 9.3.1**
>
> &emsp;&emsp;对 $a_n>0$, 称 $\ser(-1)^{n-1}a_n$ 为交错级数. 若 $a_n\downarrow 0$, 则交错级数收敛.

&emsp;&emsp;*→ Proof.* 考察部分和, 注意到 $S_{2n}\uparrow$, $S_{2n+1}\downarrow$, $S_{2n}<S_{2n+1}$ 且 $S_{2n+1}-S_{2n}=a_{2n+1}\to0$, 所以二者极限存在且相等, 也就是交错级数极限.

&emsp;&emsp;类似广义积分, 我们有 Cauchy 收敛原理和 Abel/Dirichlet 判别法.

> **引理 9.3.2 (Abel)**
>
> &emsp;&emsp;若 $a_n$ 单调, $B_n$ 为 $b_n$ 的部分和, $|B_n|\le M$, 则
> $$
> \abs{\sum_{i=1}^n a_ib_i}\le M(|a_1|+2|a_n|).
> $$

&emsp;&emsp;*→ Proof.* 运用 Abel 变换,
$$
\env{aligned}{
	\abs{\sum_{i=1}^n a_ib_i} &= \sum_{i=1}^{n-1}|B_i|\cdot|a_i-a_{i+1}|+|a_nB_n|\\
	&\le M\br{\sum_{i=1}^{n-1}|a_i-a_{i+1}+|a_n|}\\
	&\le M(|a_1|+2|a_n|).
}
$$

> **定理 9.3.3 (Abel/Dirichlet 判别法)**
>
> &emsp;&emsp;若 $a_n$ 单调, $|B_n|<M$, 则:
>
> - (Dirichlet) 若 $a_n\to 0$, 则 $\ser a_nb_n$ 收敛;
> - (Abel) 若 $\ser b_n$ 收敛, $a_n$ 有界, 则 $\ser a_nb_n$ 收敛.

&emsp;&emsp;*→ Proof.* 依赖 Cauchy 判据,
$$
\abs{\sum_{k=n}^{n+p}a_kb_k}\le M(|a_n|+2|a_{n+p}|).
$$
尝试控制后者即可.

&emsp;&emsp;例如, $\ser\frac{\sin nx}{n}$, 在 $x\neq 0$ 时,
$$
\env{aligned}{
	\abs{\ser \sin nx} &= \abs{\frac{\ser 2\sin\frac{x}{2}\sin nx}{2\sin\frac{x}{2}}}\\
	&= \abs{\frac{\ser \cos\br{n-\frac{1}{2}}x-\cos\br{n+\frac{1}{2}}x}{2\sin\frac{x}{2}}}\\
	&\le\abs{\frac{1}{\sin\frac{x}{2}}}.
}
$$
这一部分和有界, 因而原级数收敛. 尝试计算原级数的值. Formally, $\e^{\i nx}=\cos nx+\i\sin nx$, 已知有 $\ser\frac{z^n}{n}=-\ln(1-z)$, 代入得
$$
\env{aligned}{
	-\ln(1-\e^{\i x})&=-\ln\br{2\sin\frac{x}{2}\br{\sin\frac{x}{2}-\i\cos\frac{x}{2}}}\\
	&=-\ln\br{2\sin\frac{x}{2}\e^{\i\frac{x-\pi}{2}}}\\
	&=-\ln2\sin\frac{x-\pi}{2}+\frac{\pi-x}{2}\i.
}
$$
提取实部和虚部就能得到 $\ser\frac{\cos nx}{n}$ 和 $\ser\frac{\sin nx}{n}$ 的值, 以上运算是形式的, 需要复变的严格论证.

> **定理 9.3.4 (积分判别法)**
>
> &emsp;&emsp;对函数 $f(x)$ 和级数 $\ser f(n)$, 若
> $$
> \omega_n:=\br{\sup_{x\in[n,n+1]}-\inf_{x\in[n,n+1]}}f(x)
> $$
> 满足 $\sum\omega_n<\oo$, 则 $\int_1^\oo f$ 与 $\ser f(n)$ 收敛性相同.

&emsp;&emsp;*→ Proof.* 考虑
$$
\env{aligned}{
	\abs{\sum_{k=1}^nf(k)-\int_1^{n+1}f(x)\d x} &\le \sum_{k=1}^n\int_k^{k+1}\abs{f(k)-f(x)}\d x\\
	&\le \sum_{k=1}^n\int_k^{k+1}\omega_k\d x\\
	&= \sum_{k=1}^n\omega_k
}
$$
绝对收敛, 因此作差的二者收敛性相同.

&emsp;&emsp;不过 $\ser\omega_n$ 也不方便研究, 我们可以进一步推广:

> **命题 9.3.5**
>
> &emsp;&emsp;若 $f$ 可导, $f'$ 可积, 且 $\int_1^\oo|f'|<\oo$, 则 $\ser\omega_n<\oo$. (并进一步给出级数和积分收敛性相同.)

&emsp;&emsp;*→ Proof.* 直接验证
$$
\env{aligned}{
	\omega_n &= f(x_n)-f(y_n)\\
	&=\abs{\int_{x_n}^{y_n}f'}\\
	&\le\abs{\int_{x_n}^{y_n}|f'|}\\
	&\le\int_n^{n+1}|f'|.
}
$$
因此
$$
\int_1^\oo|f'|<\oo\Ra\ser\omega_n<\oo.
$$
&emsp;&emsp;例如, 若 $f\downarrow 0$, 则 $\ser f(n)$ 的收敛性就和 $\int_1^\oo f$ 相同. 作为例子, 考察 $\ser\frac{\sin n^\alpha x}{n^\beta}$ 和 $\ser\frac{\cos n^\alpha x}{n^\beta}$ 的收敛性, 其中 $\beta>\alpha>0$, $\alpha+\beta>1$. 我们令 $f(t)=\frac{\sin t^\alpha x}{t^\beta}$, 则
$$
f'(t)=\frac{\alpha t^{\alpha-1}\cos t^\alpha x\cdot t^\beta-\beta t^{\beta-1}\sin t^\alpha x}{t^{2\beta}}=\mathcal O\br{\frac{1}{t^{\beta-\alpha+1}}}.
$$
因此 $\int_1^\oo|f'|$ 收敛, 只需要研究原积分的收敛性.
$$
\env{aligned}{
	\int_1^\oo f &= \int_1^\oo\frac{\sin t^\alpha x}{t^\beta}\d t\\
	&\overset{s=t^\alpha}{=} \int_1^\oo\frac{\sin sx\cdot s^{\frac{1}{\alpha}-1}}{\alpha s^{\frac{\beta}{\alpha}}}\d s\\
	&= \frac{1}{\alpha}\int_1^\oo\frac{\sin sx}{s^{1+\frac{\beta-1}{\alpha}}}\d s
}
$$
$\alpha+\beta>1$ 给出了收敛性.

## $\S9.4$ 数项级数的性质

> **命题 9.4.1**
>
> &emsp;&emsp;若 $a_n>0$, $\ser a_n<\oo$, $f:\N^*\overset{1:1}\to\N^*$ 是一个重排, 则
> $$
> \ser a_n=\ser a_{f(n)}.
> $$

&emsp;&emsp;*→ Proof.* 设 $A_n=\sum_{k=1}^na_k$, $B_n=\sum_{k=1}^n a_{f(n)}$, 当 $n$ 固定时, 总能取 $N_n=\max_{k\in[n]}f(k)$, 使 $B_n\le A_{N_n}\le\ser a_n$. 因此 $\ser a_{f(n)}\le\ser a_n$, 对称地 $\ser a_n\le\ser a_{f(n)}$, 因此就有 $\ser a_n=\ser a_{f(n)}$.

> **命题 9.4.2**
>
> &emsp;&emsp;若 $\ser|a_n|<\oo$, $f$ 是重排, 则
> $$
> \ser a_n=\ser a_{f(n)}.
> $$

&emsp;&emsp;*→ Proof.* 设 $a_n^+=\frac{|a_n|+a_n}{2}$, $a_n^-=\frac{|a_n|-a_n}{2}$, 那么
$$
\ser a_{f(n)}=\ser(a_{f(n)}^+-a_{f(n)}^-)=\ser a_{f(n)}^+-\ser a_{f(n)}^-=\ser a_n^+-\ser a_n^-=\ser a_n.
$$

> **定理 9.4.3 (Riemann 级数重排定理)**
>
> &emsp;&emsp;若 $\ser a_n$ 条件收敛, 则对任意指定的 $A,B\in\R\sqcup\{\pm\oo\}$, $B\le A$, 都存在重排 $f$, 使得
> $$
> S_n:=\sum_{k=1}^n a_{f(n)},\quad \lsup S_n=A,\quad \linf S_n=B.
> $$

&emsp;&emsp;*→ Proof.* 设 $A_+=\{n\in\N^*:a_n\ge 0\}=\{n_1<n_2<\cdots\}$, $A_-=\N^*\setminus A_+=\{m_1<m_2<\cdots\}$, 根据条件收敛性, 应当有 $a_n\to0$, 且 $\sum_{n\in A_+}a_n=+\oo$, $\sum_{m\in A_-}a_m=-\oo$.

&emsp;&emsp;对于构造, 直观上是容易的: 我们任意取数列 (这是为了处理 $\pm\oo$) $A_k\to A$ 和 $B_k\to B$, 不妨 $A>0$, 我们不断依次取 $A_+$ 中的下标直到和超过 $A_1$, 然后不断依次取 $A_-$ 中的下标直到和小于 $B_1$, 此后 $A_2$, $B_2$, ... 由于 $a_n\to 0$, 每次超过 $A_k,B_k$ 的步长会越来越小, 这样就构造出了目标.

> **命题 9.4.5**
>
> &emsp;&emsp;若 $\ser a_n$, $\ser b_n$ 绝对收敛, 则对任意 $\N^*\x\N^*$ 的重排 $\{(i_k,j_k)\}$, 都有
> $$
> \ser a_{i_n}b_{j_n}=\br{\ser a_n}\br{\ser b_n}.
> $$

&emsp;&emsp;*→ Proof.* 对任意 $n$, 令 $\mu_n=\max_{k\in[n]}\{i_k,j_k\}$, 则
$$
\sum_{k=1}^n|a_{i_k}b_{j_k}|\le\sum_{i=1}^{\mu_n}|a_i|\sum_{j=1}^{\mu_n}|b_j|\le\br{\ser|a_n|}\br{\ser|b_n|}.
$$
所以 $\ser a_{i_n}b_{j_n}$ 绝对收敛, 与求和顺序无关. 按照矩形排序可知 $\ser a_{i_n}b_{j_n}=\br{\ser a_n}\br{\ser b_n}$.

> **命题 9.4.6**
>
> &emsp;&emsp;若 $\ser a_n<\oo$, $\ser |b_n|<\oo$, 则 Cauchy 和 $\sum_{k=2}^\oo\sum_{i+j=k}a_ib_j$ 收敛.

&emsp;&emsp;*→ Proof.* 设 $c_k=\sum_{i+j=k+1}a_ib_j$, $u_k=\sum_{i,j\le n,~(i=n\lor j=n)}a_ib_j$, 则
$$
\env{aligned}{
	\abs{\sum_{k=1}^n u_k-\sum_{k=1}^nc_k} &= \abs{\sum_{i+j>n+1,~i,j\le n}a_ib_j}\\
	&\le \sum_{i=2}^n|b_i|\abs{\sum_{j=n-i+2}^n a_j}\\
	&= \sum_{i=2}^N|b_i|\abs{\sum_{j=n-i+2}^na_j}+\sum_{i=N+1}^n|b_i|\abs{\sum_{j=n-i+2}^na_i}\\
	&\overset{\text{controlled by }n,N}\le\eps\ser|b_n|+M\sum_{i=N+1}^n|b_i|.
}
$$
足够小.

## $\S9.5$ 无穷乘积

> **定义 9.5.1**
>
> &emsp;&emsp;令 $A_n=a_1\cdots a_n$, 若 $\lin A_n$ 存在**且非 $0$**, 则称无穷乘积 $\prod_{n=1}^\oo a_n$ 收敛.

&emsp;&emsp;例如对 $|x|<1$, $a_n=1+x^{2^{k-1}}$, 则
$$
A_n=\prod_{k=1}^n(1+x^{2^{k-1}})=\frac{1-x^{2^n}}{1-x}\to\frac{1}{1-x}.
$$
再如
$$
A_n=\prod_{k=1}^n\cos\frac{\varphi}{2^k}=\frac{\sin\varphi}{2^n\sin\frac{\varphi}{2^n}}\to\frac{\sin\varphi}{\varphi}.
$$
需要注意 $\varphi$ 的特殊取值.

&emsp;&emsp;在无穷乘积的极限存在时, 显然总能假设 $\lin a_n=1$ 以及 $a_n>0$, 此时, $A_n$ 有非零极限等价于 $\ln A_n=\sum_{k=1}^n\ln a_k$ 有极限.

&emsp;&emsp;接下来研究 $\ser\ln(1+a_n)$ 的收敛性, 其中 $a_n\to 0$. 如果 $a_n$ 定号, 由于 $a_n\sim\ln(1+a_n)$, $\ser\ln(1+a_n)$ 的收敛性和 $\ser a_n$ 的收敛性一致. 如果 $a_n$ 不定号, 需要注意 $\ln(1+a_n)=a_n-\frac{a_n^2}{2}+o(a_n^3)$, 二阶项中 $a_n$ 的符号消失, 可能造成级数发散, 所以在 $\ser a_n^2<\oo$ 时, 才能保证 $\ser\ln(1+a_n)$ 与 $\ser a_n$ 的收敛性相同.

&emsp;&emsp;当然, 我们也可以谈论绝对收敛性: 若 $\ser|a_n|<\oo$, 则称无穷乘积 $\prod_{n=1}^\oo(1+a_n)$ 绝对收敛.

&emsp;&emsp;*例*: $\DS\prod_{n=1}^\oo\frac{e^{\frac{1}{n}}}{1+\frac{1}{n}}$ 收敛, 当然这个能直接算出极限来, 不提.

&emsp;&emsp;*又例*: $\DS\Gamma(x):=\frac{1}{x}\prod_{n=1}^\oo\frac{\br{1+\frac{1}{n}}^x}{1+\frac{x}{n}}~(x\notin\Z_{\le 0})$,  对 $\frac{1}{n}$ Taylor 展开:
$$
\env{aligned}{
	\frac{\br{1+\frac{1}{n}}^x}{1+\frac{x}{n}} &= \br{1+\frac{x}{n}+\frac{x(x-1)}{2}\cdot\frac{1}{n^2}+o\br{\frac{1}{n^2}}}\br{1-\frac{x}{n}+\frac{x^2}{n^2}+o\br{\frac{1}{n^2}}}\\
	&=1-\frac{x^2}{n^2}+\frac{x(x-1)}{2n^2}+\frac{x^2}{n^2}+o\br{\frac{1}{n^2}}\\
	&=1+\frac{x(x-1)}{2n^2}+o\br{\frac{1}{n^2}}
}
$$
绝对收敛. 进一步研究这一极限,
$$
\env{aligned}{
	A_n &= \frac{1}{x}\prod_{k=1}^n\frac{\br{1+\frac{1}{k}}^x}{1+\frac{x}{k}}\\
	&= \frac{(n+1)^x}{x(1+x)\cdots\br{1+\frac{x}{n}}}\\
	&= \br{\frac{n+1}{n}}^x\frac{n!n^x}{x(x+1)\cdots(x+n)}.
}
$$
因此
$$
\Gamma(x)=\lin\frac{n!n^x}{x(x+1)\cdots(x+n)}.
$$
注意有
$$
\Gamma(1)=1,\quad \frac{\Gamma(x+1)}{\Gamma(x)}=\lin\frac{nx}{n+1+x}=x.
$$
所以有结论: $\Gamma(n+1)=n!$.

&emsp;&emsp;第一个例子的结论给出 (虽然我们并没有写出来; $c$ 为 Euler 常数):
$$
e^{cx}=\prod_{n=1}^\oo\frac{e^{\frac{x}{n}}}{\br{1+\frac{1}{n}}^x},
$$
所以
$$
e^{cx}\Gamma(x+1)=\prod_{n=1}^\oo\frac{e^\frac{x}{n}}{1+\frac{x}{n}}\Ra\frac{1}{\Gamma(x+1)}=e^{cx}\prod_{n=1}^\oo\br{1+\frac{x}{n}}e^{-\frac{x}{n}}.
$$
&emsp;&emsp;*再例*, 研究 $\ser\frac{(nx)^n}{n!}$ 的收敛性.
$$
\frac{|a_{n+1}|}{|a_n|}=\frac{(n+1)^{n+1}|x|^{n+1}}{(n+1)!}\cdot\frac{n!}{n^n|x|^n}=\br{1+\frac{1}{n}}^n|x|\to e|x|.
$$
当 $|x|<\frac{1}{e}$, 绝对收敛, 当 $|x|>\frac{1}{e}$, 发散, 只需要研究 $x=\pm\frac{1}{e}$ 的情况.

&emsp;&emsp;当 $x=\frac{1}{e}$,  根据 <u>定理 9.2.9</u>,
$$
\env{aligned}{
	n\br{\frac{a_n}{a_{n+1}}-1} &= n\br{\br{1-\frac{1}{n+1}}^ne-1}\\
	&=n\br{e^{n\ln\br{1-\frac{1}{n+1}}+1}-1}\\
	&=n\br{e^{n\br{-\frac{1}{n+1}-\frac{1}{2(n+1)^2}+o\br{\frac{1}{n^2}}}+1}-1}\\
	&=n\br{\frac{1}{n+1}-\frac{n^2}{2(n+1)^2}+o\br{\frac{1}{n}}}\to\frac{1}{2}<1,
}
$$
原级数发散.

&emsp;&emsp;当 $x=-\frac{1}{e}$, 令 $a_n=\frac{n^n}{n!e^n}$, 则 $\frac{a_{n+1}}{a_n}=\br{1+\frac{1}{n}}^n\frac{1}{e}<1$, 此外
$$
\sum\ln\frac{a_{n+1}}{a_n}=-\frac{1}{2}\sum\frac{1}{n}\to-\oo,
$$
因此 $a_n\downarrow 0$, 条件收敛.

&emsp;&emsp;*第四例*, 求证 $\DS\ser\frac{n!a_n}{x\cdots(x+n)}$ 与 $\DS\ser\frac{a_n}{n^x}$ 的敛散性相同 $(x\notin\Z_{\le 0})$.

&emsp;&emsp;令 $b_n=\frac{n!n^x}{x\cdots(x+n)}$, 刚刚讨论过 $b_n\to\Gamma(x)\neq 0$, 则
$$
\frac{b_{n+1}}{b_n}=\frac{\br{1+\frac{1}{n}}^{x+1}}{1+\frac{x+1}{n}}\overset{\text{Taylor}}=1+\frac{x(x+1)}{2n^2}+o\br{\frac{1}{n^2}}.
$$
可见, 当 $n\gg 1$, $b_n$ 有单调性, 有非 $0$ 极限. 这样, $\ser\frac{a_n}{n^x}$ 与 $\ser\frac{a_n}{n^x}\cdot b_n$ 的同敛散性已经由 Abel/Dirichlet 判别法给出.

&emsp;&emsp;*第五例*, 求证, 由一切 $x\notin\Z$ 给出的 $\ser a_n(x^2-1)\cdots(x^2-n^2)$ 具有相同的敛散性.

&emsp;&emsp;设 $f_n(x)=(x^2-1)\cdots(x^2-n^2)$, 则
$$
\frac{f_n(x)}{f_n(x_0)}=\frac{(x^2-1)\cdots(x^2-n^2)}{(x_0^2-1)\cdots(x_0^2-n^2)}
$$
在 $n\gg1$ 后定号, 而 $\frac{x^2-n^2}{x_0^2-n^2}=1+\frac{x^2-x_0^2}{x_0^2-n^2}$, 所以上述比值的极限存在且非 $0$, 这就给出了原命题的同敛散性.

&emsp;&emsp;*第六例*, 可以验证 $\sin x$ 只有实根, 将所有 "因式" 相乘并保证绝对收敛性, 我们尝试写出
$$
\sin x=x\prod_{k=1}^\oo\br{1-\frac{x^2}{k^2\pi^2}},
$$
如果这个展开是对的, 它能进一步给出有趣的结论, 例如提取左右的 $x^3$ 项可以得到
$$
\ser\frac{1}{n^2}=\frac{\pi^2}{6}.
$$
现证明这一公式. 由于
$$
(\cos x+\i\sin x)^{2n+1}=\sum_{k=0}^{2n+1}\binom{2n+1}{k}\cos^k x(\i\sin x)^{2n-1-k}=\cos(2n+1)x+\i\sin(2n+1)x,
$$
考虑虚部, 就有
$$
\sin(2n+1)x=\sin x\cdot P_n(\sin^2 x),
$$
其中 $P_n(t)$ 为 $n$ 次多项式. 当 $x=\varphi_k=\frac{k\pi}{2n+1}$, $P_n$ 有根 $\sin^2\varphi_k$, 此外
$$
\lix0 P_n(\sin^2 x)=P_n(0)=2n+1,
$$
所以
$$
P_n(x)=(2n+1)\prod_{k=1}^n\br{1-\frac{x}{\sin^2\varphi_k}}.
$$
也即是
$$
\sin x=(2n+1)\sin\frac{x}{2n+1}\cdot\prod_{k=1}^n\br{1-\frac{\sin^2\frac{x}{2n+1}}{\sin^2\frac{k\pi}{2n+1}}}=:U_m\cdot V_m,
$$
其中
$$
U_m=(2n+1)\sin\frac{x}{2n+1}\prod_{k=1}^m\br{1-\frac{\sin^2\frac{x}{2n+1}}{\sin^2\frac{k\pi}{2n+1}}}\overset{n\to\oo}=x\prod_{k=1}^m\br{1-\frac{x^2}{k^2\pi^2}}.
$$
对后者, 利用不等式 $\frac{2}{\pi}x<\sin x<x$, 放缩得
$$
1>V_m\ge\prod_{k=m+1}^n\br{1-\frac{x^2}{4k^2}}>\prod_{k=m+1}^\oo\br{1-\frac{x^2}{4k^2}}\overset{m\to\oo}=1.
$$

# 第十章 函数序列与函数项级数

## $\S10.1/2$ 基本问题 / 一致收敛的概念

&emsp;&emsp;对函数序列 $\{f_n(x)\}_{n=1}^\oo~(x\in I\sub\R)$, 且 $\A x\in I,~\{f_n(x)\}$ 收敛, 则称 $f(x):=\lin f_n(x)$ 为 $\{f_n(x)\}$ 的极限函数. 类似地也可以定义函数项级数 $\ser f_n(x)$. 此外, 我们称 $\{x\in I:\lin f_n(x)~\text{exists}\}$ 为 $\{f_n(x)\}$ 的收敛域, 其中的 $x$ 称为收敛点, 非收敛点则称为发散点.

&emsp;&emsp;*例如*, $\ser x^n$ 的收敛域就是 $(-1,1)$; $f_n(x)=x^n~(x\in[0,1])$ 的极限函数就是 $f(x)=[x=1]~(x\in[0,1])$.

&emsp;&emsp;据此可以看出: **连续函数的极限函数不一定连续; 光滑函数列的极限函数不一定光滑.**

&emsp;&emsp;*又如*, $f_n(x)=[n!x\in\Z]$, 则 $\lin f(x)=D(x)$.

&emsp;&emsp;据此可以看出: **Riemann 可积函数的极限函数不一定 Riemann 可积.**

&emsp;&emsp;*例如* (唉懒得换词了), $f_n(x)=nx(1-x^2)^n (x\in[0,1])$ 明显处处收敛到 $f(x)\equiv 0$. 但是 $\DS\int_0^1 f_n=\frac{n}{2(n+1)}\to\frac{1}{2}$.

&emsp;&emsp;据此可以看出: (即使是解析函数列) **极限函数的积分不一定等于函数积分的极限.**

&emsp;&emsp;*例如*, $f_n(x)=\frac{\sin nx}{\sqrt{n}}\to f(x)\equiv 0$, 左右都是光滑的, 但是 $f_n'(x)=\sqrt{n}\cos nx$, 不收敛到 $f'(x)\equiv 0$.

&emsp;&emsp;设现在有 $\lin f_n(x)=f(x)~(x\in[a,b])$, 我们关心:

- 何时 $f_n\in C[a,b]\Ra f\in C[a,b]~\text{or}~\ser f_n\in C[a,b]$;
- 何时 $f_n\in R[a,b]\Ra f\in R[a,b]~\text{or}~\ser f_n\in R[a,b]$, 进一步, 何时 $\lin\int f_n=\int f$, $\ser\int f_n=\int\ser f_n$;
- 何时 $f_n'~\text{exists}\Ra f'~\text{exists or }\br{\ser f}'\text{ exists}$, 进一步, 何时 $\lin f_n'=f'$, $\br{\ser f_n}'=\ser f_n'$;

> **定义 10.1.1 (一致收敛)**
>
> &emsp;&emsp;对函数列 $\{f_n(x)\}~(x\in I)$, 称 $f_n(x)$ 在 $I$ 上一致收敛到 $f(x)$, 当且仅当
> $$
> \A\eps>0,~\E N,~\A n>N,~\A x\in I,~|f(x)-f_n(x)|<\eps\\
> \Eq M_n:=\sup_{x\in I}|f(x)-f_n(x)|,~\lin M_n=0.
> $$

&emsp;&emsp;*例如*, $f_n(x)=\frac{x}{1+n^2 x^2}\to f(x)\equiv0$, 考察 $|f_n(x)|=\frac{|x|}{1+n^2x^2}\le\frac{|x|}{2n|x|}=\frac{1}{2n}\to 0$, 所以 $f_n(x)\tto 0$, 但可以验证 $f_n(x)=\frac{1}{n^2x^2}$ 并不一致收敛. 对 $f_n(x)=x^n$, 对任意 $\delta\in(0,1)$, 都有 $f_n(x)\tto0~(x\in[0,\delta])$, 然而 $f_n(x)\not\tto0~(x\in[0,1))$.

&emsp;&emsp;一致收敛性有以下性质:

- $f_n\tto f$, $g_n\tto g$, 则 $c_1f_n+c_2g_n\tto c_1f+c_2g$. 用 $M_n$ 控制即可.

- $f_n\tto f$, $g_n\tto g$, 且 $f_n,g_n$ 一致有界 (函数列有公共的界; 当然由于一致收敛性, 这里可以弱化为有界), 则 $f_ng_n\tto fg$.

    考察 $|f_ng_n-fg|=|f_ng_n-f_ng+f_ng-fg|\le |f_n||g_n-g|+|g||f_n-f|$.

    即使有一个不一致有界, 矛盾也存在, 例如 $f_n\equiv\frac{1}{n}$, $g_n=x$.

- 若 $f_n\tto f~(x\in I\lor x\in J)$, 则 $f_n\tto f~(x\in I\cap J)$, 同样用一致收敛的等价定义控制.

&emsp;&emsp;*例如*, $g\in C[0,1]$, $g(1)=0$, 则 $f_n(x):=x^ng(x)\tto 0~(x\in [0,1])$. 分 $[0,\delta]$ 和 $[\delta,1]$ 两段, 分别用 $x^n$ 和 $g(x)$ 来控制 $M_n$ 即可.

&emsp;&emsp;*例如*, $f(x)=nx\e^{-nx}~(x\ge 0)$, 有 $\lin f_n(x)=0$, 然而 $\sup f_n(x)\ge f_n\br{\frac{1}{n}}=e^{-1}$, 所以 $f_n(x)\not\tto 0$.

&emsp;&emsp;*例如*, $f_n(x)=\arctan\frac{n}{x^2}~(x\ge 1)$, $\lin f_n(x)=\frac{\pi}{2}$, 然而 $\sup\abs{f_n(x)-\frac{\pi}{2}}\ge\abs{f_n(\sqrt{n})-\frac{\pi}{2}}=\frac{\pi}{4}$, 不绝对收敛.

## $\S10.3$ 一致收敛的判别法

> **定理 10.3.1 (Cauchy)**
>
> &emsp;&emsp;$f_n(x)~(x\in I)$ 一致收敛, 当且仅当
> $$
> \A\eps>0,~\E N,~\A n,m>N,~\A x\in I,~|f_n(x)-f_m(x)|<\eps.
> $$
> $S_n(x)=\sum_{k=1}^nf_k(x)\tto S(x)$, 当且仅当
> $$
> \A \eps>0,~\E N,~\A n,m>N,~\A x\in I,~\abs{\sum_{k=m}^n f_k(x)}<\eps.
> $$

&emsp;&emsp;证明不复杂, 可以转换到数项级数的情况.

&emsp;&emsp;对于级数, 我们也能定义绝对收敛和绝对一致收敛. (绝对一致收敛 $\Ra$ 一致收敛, 注意绝对一致收敛 $\not\Leftarrow$ 绝对收敛且一致收敛.)

> **命题 10.3.2 (M-判别法)**
>
> &emsp;&emsp;若 $\A x\in I,~|f_n(x)|\le a_n$, 且 $\ser a_n<\oo$, 则 $\ser f_n(x)$ 绝对一致收敛.

&emsp;&emsp;*→ Proof.* 由于 $\ser a_n<\oo$, $\A\eps>0,~\E N,~\A n\ge m>N,~\sum_{k=m}^n a_k<\eps$, 此时 $\sum_{k=m}^n|f_k(x)|\le \sum_{k=m}^na_k<\eps$, 所以 $\ser|f_n(x)|$ 绝对一致收敛.

&emsp;&emsp;前文 "$\not\Leftarrow$" 的反例: $\ser(-1)^n x^n(1-x)~(x\in[0,1])$. 其余项
$$
R_n(x):=\sum_{k=n+1}^\oo(-1)^k x^k(1-x)=\frac{(-x)^{n+1}(1-x)}{1+x}\le x^{n+1}(1-x)\le\frac{1}{n+1}\br{\frac{n+1}{n+2}}^{n+2}\tto 0.
$$
所以级数一致收敛. 它也绝对收敛, 因为
$$
\sum_{k=1}^n\abs{(-x)^k(1-x)}=\sum_{k=1}^n(x_k-x^{k+1})=x-x^{n+1}\to[x\neq 1]x.
$$
但根据上式容易看出级数并不绝对一致收敛.

> **命题 10.3.3 (Dirichlet/Abel 判别法)**
>
> &emsp;&emsp;对两个函数列 $\{a_n(x)\}$, $\{b_n(x)\}$, 若固定任意 $x\in I$ 时 $\{a_n(x)\}$ 都具有单调性 (各点处上升或下降并不要求统一), 设 $b_n(x)$ 的部分和为 $B_n(x)$, 则
>
> - $a_n(x)\tto 0$, $B_n(x)$ 一致有界; 或
> - $a_n(x)$ 一致有界, $B_n(x)$ 一致收敛时
>
> $\ser a_k(x)b_k(x)$ 一致收敛.

&emsp;&emsp;*→ Proof.* Abel 变换可以给出
$$
\abs{\sum_{k=n+1}^{n+p}a_k(x)b_k(x)}\le \br{\sup_{i=1}^p\abs{\sum_{k=n+1}^{n+i}b_k(x)}}\br{|a_{n+1}(x)+2|a_{n+p}(x)|}.
$$
两种条件分别在控制前后两项时, 将另一项做成小量.

&emsp;&emsp;*例如*, 对 $\ser(-1)^n\frac{x^2+n}{n^2}$, 我们可以将它拆分为两个级数 $\ser\frac{(-1)^n}{n}$ 以及 $\ser(-1)^n\frac{x^2}{n^2}$, 前者与 $x$ 无关, 自然一致收敛, 后者在任意有界区间上一致收敛, 原级数同理, 但原级数在 $\R$ 上并不一致收敛.

&emsp;&emsp;*例如*, $\ser\frac{\sin nx}{n^p}$ 以及 $\ser\frac{\cos nx}{n^p}$. 当 $p>1$ 时二者绝对一致收敛, 只需考虑 $0<p\le 1$. 由于 $\frac{1}{n^p}\downarrow\tto 0$, 可以尝试使用 D/A 判别法. 对于 $x\neq 2k\pi$,
$$
\env{aligned}{
	\abs{\sum_{k=1}^n\sin kx} &= \abs{\frac{\sum_{k=1}^n\br{\cos\br{k-\frac{1}{2}}x-\cos\br{k+\frac{1}{2}}x}}{2\sin\frac{x}{2}}}\\
	&= \abs{\frac{\cos\frac{x}{2}-\cos\br{n+\frac{1}{2}}x}{2\sin\frac{x}{2}}}\\
	&\le \frac{1}{\abs{\sin\frac{x}{2}}},
}
$$
同理可以证明另一者的一致有界性. 至少它们在不含 $2k\pi$ 的闭区间上一致收敛.

&emsp;&emsp;*例如*, $\ser\frac{(-x)^n}{n}$ 在 $(-1,1]$ 上收敛, 在 $(-1,1]$ 的任意闭子区间上一致收敛.

&emsp;&emsp;*例如*, 若 $b_n\downarrow 0$, 则 $\ser b_n\sin nx$ 在 $\R$ 一致收敛, 当且仅当 $b_n=o\br{\frac{1}{n}}$. 记 $S_{n,p}(x)=\sum_{k=n}^p b_k\sin kx$. 先证明必要性: 设级数一致收敛, 则 $\A\eps>0,~\E N,~\A p>n>N,~\A x\in\R,~|S_{n,p}(x)|<\eps$. 取 $p=2n-1$, $x=\frac{\pi}{4n}$, 则对 $n\le k\le 2n-1$, $\sin kx>\sin\frac{\pi}{4}$, 所以 $b_k\sin kx>b_{2n}\sin\frac{\pi}{4}$, 则 $\eps>S_{n,2n-1}>nb_{2n}\sin\frac{\pi}{4}>\frac{\sqrt 2}{2}nb_{2n}$, 由 $\eps$ 的任意性就给出必要性.

&emsp;&emsp;充分性, 只需证明级数在 $[0,\pi]$ 上一致收敛. 设 $\mu_n=\max_{m\ge n}\{mb_m\}\downarrow 0$. 当 $x\in\bk{0,\frac{\pi}{p}}$ 时,
$$
\env{aligned}{
	|S_{n,p}| &= S_n,p\\
	&= \sum_{k=n}^p b_k\sin kx\\
	&< \sum_{k=n}^pb_k kx\\
	&< \frac{\pi}{p}\sum_{k=n}^pb_kk\\
	&< \pi\mu_n.
}
$$
当 $x\in\bk{\frac{\pi}{n},\pi}$ 时, 由于锐角上有 $\sin x\ge\frac{2}{\pi}x$, 则 $|\sin nx\ops+\sin px|\le\frac{1}{\sin\frac{x}{2}}<n$, 所以
$$
|S_{n,p}|\le n(2b_n+b_p)<3nb_n<3\mu_n.
$$
当 $x\in\br{\frac{\pi}{p},\frac{\pi}{n}}$, 取 $k=\lfloor \pi/x\rfloor$, 那么 $k\le\pi/x<k+1$ 我们希望证明 $|S_{n,p}|\le |S_{n,k}|+|S_{k+1,p}|<\pi\mu_n+3\mu_{k+1}$. 根据锐角上的不等式, 仍然有 $|\sin\frac{x}{2}|\ge\frac{2}{\pi}\cdot\frac{x}{2}>\frac{1}{k+1}$, 同上地就有 $|S_{k+1,p}|<3\mu_{k+1}$.

> **定义 10.3.4**
>
> &emsp;&emsp;称函数列 $\{f_n\}$ 等度连续, 当且仅当
> $$
> \A\eps>0,~\E\delta>0,~\A n,~\A|x-y|<\delta,~|f_n(x)-f_n(y)|<\eps.
> $$

> **命题 10.3.5**
>
> &emsp;&emsp;若 $f_n(x)\in C[a,b]$ 等度连续, 若 $\lin f_n(x)=f(x)$, 则 $f_n\tto f$.

&emsp;&emsp;*→ Proof.* 对 $\eps>0$, 总能取 $\delta>0$, 使得 $|x-y|<\delta\Ra|f_n(x)-f_n(y)|<\eps/3$. 取定分划 $\Delta:a=x_0\ops<x_m=b$, 其中 $|\Delta|<\delta$. 由于 $f_n\to f$, 又存在 $N$, 使得 $n>N\Ra \A i\in[0,m],~|f_n(x_i)-f(x_i)|<\eps/3$.  这样, 对任意 $x\in[a,b]$, 总存在 $|x-x_i|<\delta$, 这样
$$
|f_n(x)-f(x)|\le|f_n(x)-f_n(x_i)|+|f_n(x_i)-f(x_i)|+|f(x_i)-f(x)|<\eps.
$$
所以 $f_n\tto f$.

## $\S10.4$ 一致收敛函数的性质

> **引理 10.4.1**
>
> &emsp;&emsp;若 $x_0\in[a,b]$, $f_n\tto f~(x\in[a,b]\setminus\{x_0\})$, 且 $\lix{x_0}f_n(x)=\alpha_n$ 存在, 则 $\lin\alpha_n$ 存在并满足
> $$
> \lix{x_0}f(x)=\lin\alpha_n.
> $$

&emsp;&emsp;*→ Proof.* $f_n\tto f$ 给出, 对 $\eps>0$, 存在 $N$, $n,m>N\Ra|f_n(x)-f_m(x)|<\eps/3~(x\neq x_0)$. 令 $x\to x_0$, 则 $|\alpha_n-\alpha_m|\le\eps/3$, 极限存在.

&emsp;&emsp;接着, 总能取出 $\delta>0$, 使得 $0<|x-x_0|<\delta\Ra |f_N(x)-\alpha_N|\le\eps/3$, 那么
$$
|f(x)-\alpha|\le|f(x)-f_N(x)|+|f_N(x)-\alpha_N|+|\alpha_N-\alpha|<\eps.
$$

> **推论 10.4.2**
>
> &emsp;&emsp;若 $f_n\tto f~(x\in[a,b])$, 且 $f_n$ 在 $x_0\in[a,b]$ 处连续, 则 $f$ 在 $x_0$ 处连续.

&emsp;&emsp;*→ Proof.* 使用上述结论, $\lix{x_0}f(x)=\lin\lix{x_0}f(x)=\lin f_n(x_0)=f(x_0)$.

> **推论 10.4.3**
>
> &emsp;&emsp;若 $C[a,b]\ni f_n\tto f$, 则 $f\in C[a,b]$; 若 $C[a,b]\ni f_n\to f\notin C[a,b]$, 则 $f_n\not\tto f$.

> **命题 10.4.4**
>
> &emsp;&emsp;若 $f_n(x)\in C[a,b]$, $f_n\uparrow f$, 则 $f_n\tto f\Eq f\in C[a,b]$.

&emsp;&emsp;*→ Proof.* 当 $f\in C[a,b]$ 时, $R_n(x):=f(x)-f_n(x)\ge 0$ 连续, 注意有 $\A x,~\lin R_n(x)=0$ 和 $R_n(x)\ge R_{n+1}(x)$. 设 $M_n=\max_{x\in[a,b]}R_n(x)=:R_n(x_n)$, 若 $\lin M_n\neq 0$, 则必然有 $\A n,~M_n>\eps_0$, 这时 $\{x_n\}$ 的聚点给出矛盾. 另一侧已经证明过了.

> **推论 10.4.5**
>
> &emsp;&emsp;若 $f_n(x)\ge 0$, $f_n\in C[a,b]$, $S(x)=\ser f_n(x)$, 则 $\ser f(x)$ 一致收敛当且仅当 $S(x)\in C[a,b]$.

> **命题 10.4.6**
>
> &emsp;&emsp;若 $f_n:[a,b)\to\R_{\ge 0}$ 单增, 且 $\A x\in[a,b),~\ser f_n(x)\le M$, 则
> $$
> \lix{b-}\ser f(x)=\ser f_n(b-).
> $$

&emsp;&emsp;*→ Proof.* 令 $S(x)=\ser f_n(x)\le M$ 存在, 则 $\sum_{n=1}^mf_n(x)\le S(x)$, 令 $x\to b-$, 则
$$
\sum_{n=1}^m f_n(b-)\le\lix{b-}S(x)=S(b-)\Ra \ser f_n(b-)\le S(b-).
$$
另一侧,
$$
\sum_{n=1}^mf_n(x)\le\sum_{n=1}^mf_n(b-)\le\ser f_n(b-)\Ra S(x)\le\ser f_n(b-).
$$
明所欲证.

> **命题 10.4.7**
>
> &emsp;&emsp;若 $f_n\in R[a,b]$, $f_n\tto f$, 则 $f\in R[a,b]$ 且
> $$
> \int_a^b f=\lin\int_a^b f_n.
> $$

&emsp;&emsp;*→ Proof.* $\A\eps>0,~\E N,~\A n>N,~|f_n-f|<\eps\Ra |f|\le|f_n|+\eps$, 所以 $f$ 有界. 设 $K_n$ 为 $f_n$ 的间断点集, 则它应当零测, $K=\bigcup_{n=1}^\oo K_n$ 也零测. 对 $x\notin K$, $f_n$ 在 $x$ 处连续, 由 $f_n\tto f$ 可知 $f$ 在 $x$ 连续, 所以 $f$ 有界且几乎处处连续, $f\in R[a,b]$. 令 $M_n=\sup|f-f_n|$, 则 $M_n\to0$, 那么
$$
\abs{\int_a^b f-\int_a^b f_n}\le\int_a^b|f-f_n|\le\int_a^b M_n\d x=M_n(b-a)\to 0.
$$
&emsp;&emsp;更为朴素的证明版本: 令 $|f_n|\le M$; $\A\eps>0,~\E n,~\A x,~|f_n(x)-f(x)|<\eps/3$, 由 $f_n\in R[a,b]$, 存在分划 $\Delta$ 使得
$$
\sum_{i=1}^p(M_i-m_i)\Delta x_i<\frac{\eps}{3}.
$$
其中 $M_i,m_i$ 表示 $f_n$ 的上下界, $\widetilde{M}_i,\widetilde{m}_i$ 表示 $f$ 的上下界, 简单分析可知 $\wt M_i\le M_i+\eps/3$, 这样
$$
\sum\wt M_i\Delta x_i\le\sum M_i\Delta x_i+\frac{\eps}{3}(b-a),
$$
下界同理. 所以
$$
\sum(\wt M_i-\wt m_i)\Delta x_i\le\sum(M_i-m_i)\Delta x_i+\frac{2\eps}{3}(b-a)<\frac{\eps}{3}(1+2(b-a)).
$$
可积.

> **命题 10.4.8**
>
> &emsp;&emsp;若 $f_n\in C^1[a,b]$, $x_0\in[a,b]$, 已知 $\{f_n(x_0)\}$ 收敛, $\{f_n'\}$ 一致收敛, 则 $f_n\tto f\in C^1[a,b]$, 且 $f'(x)=\lin f_n'(x)$.

&emsp;&emsp;*→ Proof.* 令 $g(x)=\lin f_n'(x)~(x\in[a,b])$, 则 $g\in C[a,b]$. 而 $f_n(x)=f_n(x_0)+\int_{x_0}^x f_n'(t)\d t$. 所以
$$
\env{aligned}{
	\lin f_n(x) &{{}\color{red}=} \lin f_n(x_0)+\lin\int_{x_0}^xf'_n(t)\d t\\
	&= \lin f_n(x_0)+\int_{x_0}^x\lin f_n'(t)\d t\\
	&= \lin f_n(x_0)+\int_{x_0}^x g(t)\d t,
}
$$
即
$$
f(x)=\lin f_n(x_0)+\int_{x_0}^xg(t)\d t.
$$
<font color="cyan">因此</font> $f\in C^1[a,b]$ 且 $f'=g$. 接下来验证一致收敛性.
$$
\env{aligned}{
	|f_n(x)-f(x)| &= \abs{f_n(x_0)+\int_{x_0}^xf_n'(t)\d t-f(x_0)-\int_{x_0}^xg(t)\d t}\\
	&\le |f_n(x_0)-f(x_0)|+\int_{x_0}^x|f_n'(t)-g(t)|\d t\\
	&\le |f_n(x_0)-f(x_0)|+\sup|f_n'-g|\cdot(b-a).
}
$$
因此
$$
\sup|f_n(x)-f|\le|f_n(x_0)-f(x_0)|+(b-a)\sup|f_n'-g|\to 0.
$$
上述推导过程中, 红色和青色处分别使用了 $f_n'\in R[a,b]$ 和 $f_n'\in C[a,b]$. 理论上, 删掉 $f_n'\in C[a,b]$ 这一条件, 命题也成立.

> **命题 10.4.9**
>
> &emsp;&emsp;对 $f_n(x)\in C[a,b]$, 已知 $\E x_0\in [a,b],~\lin f_n(x_0)\text{ exists}$, 且对任意 $\eps>0$, 存在 $N$, 当 $n,m>N$ 时, $f_n(x)-f_m(x)$ 的李氏常数小于 $\eps$, 则 $f_n\tto f$. 进一步, 若某个 $x_1\in[a,b]$ 使 $f_n'(x_1)$ 存在且 $\lin f_n'(x_1)=c$, 则 $f'(x_1)$ 存在且 $f'(x_1)=c$.

&emsp;&emsp;*→ Proof.* 对 $\eps>0$, 取 $N$ 使得 $n,m>N$ 时 $|f_n(x_0)-f_m(x_0)|<\eps/2$, 且 $f_n(x)-f_m(x)$ 的李氏常数 $<\frac{\eps}{2(b-a)}$, 则
$$
\env{aligned}{
	|f_n(x)-f_m(x)| &\le |f_n(x)-f_m(x)-(f_n(x_0)-f_m(x_0)|+|f_n(x_0)-f_m(x_0)|\\
	&\le\frac{\eps}{2(b-a)}|x-x_0|+\frac{\eps}{2}\le \eps.
}
$$
所以 $f_n\tto f$. 接下来令
$$
\varphi_n(t)=\frac{f_n(t)-f_n(x_1)}{t-x_1},\quad t\in[a,b]\setminus\{x_1\}.
$$
同理定义 $\varphi(t)$. 则
$$
\env{aligned}{
	|\varphi_n(t)-\varphi_m(t)| &= \frac{1}{|t-x_1|}|f_n(t)-f_m(t)-(f_n(x_1)-f_m(x_1))|\\
	&\le\frac{1}{|t-x_1|}\br{\frac{\eps}{2(b-a)}|t-x_1|}\\
	&=\frac{\eps}{2(b-a)}.
}
$$
所以 $\varphi_n\tto\varphi~(x\neq x_1)$. 根据 <u>引理 10.4.1</u>,
$$
\lim_{t\to x_1}\lin \varphi_n(t)=\lin\lim_{t\to x_1}\varphi_n(t)\Ra f'(x)=\lin\varphi_n'(x_1)=c.
$$

> **推论 10.4.10**
>
> &emsp;&emsp;可导函数列 $\{f_n(x)\}$ 在 $x_0$ 处收敛, 且 $f_n'\tto g$, 则 $f_n\tto f$ 可导, 且 $f'=g$.

> **推论 10.4.11**
>
> &emsp;&emsp;一致收敛的导函数列的极限函数也是导函数.

&emsp;&emsp;*例如*, 设 $[0,1]$ 上的有理数 $\{r_n\}$, 设
$$
f(x)=\ser\frac{|x-r_n|}{3^n},\quad x\in[0,1].
$$
记 $f_n$ 为其部分和, 则 $f_n\tto f$. 对 $\eps>0$, $n,m$ 充分大后 $f_n-f_m$ 的李氏常数 $<\eps$. 因此, 对于任意 $x_0\in[0,1]\setminus\Q$,  $f_n'(x_0)$ 存在, 且
$$
f'(x_0)=\ser\frac{\sgn(x_0-r_n)}{3^n}.
$$
而 $f$ 在有理点都不可导.

&emsp;&emsp;*例如*, $f(x)=\ser\frac{\sin nx}{n^3}$, 它绝对一致收敛, 其导函数受 $\ser\frac{1}{n^2}$ 控制, 也绝对一致收敛, 所以 $f\in C^1(\R)$, 可以逐项求导. 即
$$
f'(x)=\ser\frac{\cos nx}{n^2}.
$$
&emsp;&emsp;*例如*, $S(x)=\ser n\e^{-nx}~(x>0)$, 由于 $|(n\e^{-nx})^{(k)}|=n^{k+1}\e^{-nx}\le n^{k+1}\e^{-n\delta}~(\A x\ge\delta)$, 则 $S\in C^\oo(0,+\oo)$.

> **定理 10.4.12 (控制收敛定理)**
>
> &emsp;&emsp;若 $f_n\in R[a,b]$, $|f_n(x)|\le M$ 一致有界, 且 $f(x)=\lin f_n(x)\in R[a,b]$, 则
> $$
> \int_a^b f(x)\d x=\lin\int_a^bf_n(x)\d x.
> $$

> **引理 10.4.13**
>
> &emsp;&emsp;若 $f\in R[a,b]$, 则
> $$
> \int_a^b f(x)\d x = \sup_{g}\l\{\int_a^b g(x)\d x\r\},
> $$
> 其中 $g\le f$ 是阶梯函数.

&emsp;&emsp;为了证明上述控制收敛定理, 先引入一些定义.

- 初等集: 有限个不交区间的并. 对初等集 $E$, 定义 $m(E)$ 为其区间长度之和.
- 闭初等集: 有限个不交闭区间的并.
- 若 $A_n$ 是有界闭初等集列, $A_{n+1}\sub A_n\neq\varnothing$, 则 $\bigcap_{n=1}^\oo A_n\neq\varnothing$.
- 对有界非空集合列 $A_n$, $A_{n+1}\sub A_n$, $\bigcap_{n=1}^\oo A_n=\varnothing$, 则令 $\alpha_n=\sup\{m(E):E\sub A_n\}$, 有 $\lin\alpha_n=0$.

&emsp;&emsp;对最后一点, 显然 $\alpha_n\downarrow 0$, 设 $\alpha_n>\delta$, 取闭初等子集 $E_n\sub A_n$, $m(E_n)<\alpha_n-\frac{\delta}{2^n}$, $H_n=\bigcap_{k=1}^n E_k$ 为闭初等子集, $H_{n+1}\sub H_n$, 对 $A_n\setminus H_n$ 的任意初等子集 $E$,
$$
E=E\setminus H_n=E\setminus\bigcap_{k=1}^n E_k=\bigcup_{k=1}^n(E\setminus E_k),
$$
又因为 $m(E\setminus E_k)+m(E_k)\le\alpha_n$, 则 $m(E\setminus E_k)\le\frac{\delta}{2^k}$, $m(E)<\delta$, 那么 $H_n\neq\varnothing$, $\bigcap_{n=1}^\oo H_n\neq\varnothing$, 与 $\bigcap_{n=1}^\oo A_n=\varnothing$ 矛盾.

&emsp;&emsp;*→ Proof @ 10.4.12* 对 $\eps>0$, 设
$$
A_n=\{x\in[a,b]:\E i\ge n,~|f_i(x)-f(x)|\ge\eps\},
$$
则 $A_n\supset A_{n+1}$, $\bigcap_{n=1}^\oo A_n=\varnothing$. 由引理 $\alpha_n\to 0$, 因而存在 $N$, 当 $n\ge N$ 时, $A_n$ 的任意初等子集 $E$ 都有 $m(E)<\eps$. 现在给定 $n\ge N$, 对任意阶梯函数 $0\le S(x)\le|f_n(x)-f(x)|$, 设 $E=\{x\in [a,b]:S(x)\ge \eps\}$, 它是初等集, $F=[a,b]\setminus E$ 也是初等集, 那么
$$
\int_a^b S(x)\d x=\int_E S(x)\d x+\int_F S(x)\d x\le 2M\eps+\eps(b-a),
$$
即
$$
\int_a^b|f_n(x)-f(x)|\d x\le 2M\eps+\eps(b-a).
$$
那么
$$
\lin\int_a^b|f_n(x)-f(x)|\d x=0.
$$
这就证明了控制收敛定理.

> **推论 10.4.14**
>
> &emsp;&emsp;若 $f_n\in R[a,b]$, $|f_n|\le M$, 已知 $\lin f_n(x)=f(x)$ 存在, 则 $\lin\int_a^bf_n(x)\d x$ 存在.

&emsp;&emsp;*→ Proof.* 令 $\DS\ol F=\lsup\int_a^bf_n(x)\d x$, $\DS\ul{F}=\linf\int_a^bf_n(x)\d x$, 并设
$$
\ol F=\lim_{k\to\oo}\int_a^b f_{n_k}(x)\d x,\quad \ul{F}=\lim_{k\to\oo}\int_a^b f_{m_k}(x)\d x.
$$
而 $\{f_{n_k}-f_{m_k}\}\to0$, $f_{n_k}-f_{m_k}\to 0$,
$$
\ol F-\ul F=\lim_{k\to 0}\int_a^b(f_{n_k}-f_{m_k})\d x=\int_a^b\lim_{k\to 0}(f_{n_k}(x)-f_{m_k}(x))\d x=0.
$$

> **引理 10.4.15 (Borel)**
>
> &emsp;&emsp;对任意实数列 $\{a_n\}_{n\ge 0}$, 存在 $f\in C^\oo(\R)$, 满足 $f^{(n)}(0)=a_n$.

&emsp;&emsp;*→ Proof.* 先尝试构造满足
$$
g(x)=\env{cases}{
	1,&0\le x\le\frac{1}{2};\\
	0,&x\ge 1
}
$$
的 $g\in C^\oo$. 我们取 $h(x)=[x\neq 0]\e^{-\frac{1}{x^2}}$, $I(x)=[x\in[0,1]]h(x)h(1-x)$, $H(x)=\int_{-\oo}^x I(t)\d t$, 可以验证 $H$ 就是一个合法的 $g$. 构造
$$
f(x)=\sum_{n=0}^\oo\frac{a_nx^n}{n!}g(\lambda_n|x|),
$$
其中 $\lambda_n\uparrow+\oo$ 待定. 显然 $f(x)$ 逐点收敛 (在 $x\neq 0$ 时都是有限和), 并且 $f\in C^\oo(\R\setminus\{0\})$. 在 $x=0$ 处, 对和式的每一项都有 $f_n(x)=\frac{a_nx^n}{n!}g(\lambda_n|x|)\in C^\oo(\R)$, 且 $f_n^{(n)}(0)=a_n$.
$$
\env{aligned}{
	|f_n^{(k)}(x)| &\le \frac{|a_n|}{n!}\sum_{m=0}^k\binom{k}{m}|n^{\ul m}x^{n-m}g^{(m)}(\lambda_n|x|)\cdot\lambda_n^m|\\
	&\le \frac{|a_n|}{n!}\sum_{m=0}^k\binom{k}{m}n^{\ul m}\frac{M_k}{|\lambda_n|^{n-2m}}\\
	&\le \sum_{m=0}^k|a_n|k!\frac{M_k}{|\lambda_n|^{n-2k}},
}
$$
其中 $M_k=\max_{0\le\ell\le k}|g^{(\ell)}|$. 取发散充分快的 $\lambda_n$, 例如 $\lambda_n=(n!)^2M_n\lceil a_n+1\rceil!$, 就能使 $f_n^{(k)}(x)$ 绝对一致收敛, 因此 $f\in C^\oo(\R)$, 可以逐项求导. 这样就证明了结论.

&nbsp;

**处处连续处处不可导的函数** 

&emsp;&emsp;设函数
$$
h(x)=\env{cases}{
	x,&0\le x\le 1;\\
	2-x,&1\le x\le 2.
}
$$
且满足 $h(x+2)=h(x)$. 构造
$$
f(x)=\sum_{n=0}^\oo\br{\frac{3}{4}}^nh(4^n x)\le\sum_{n=0}^\oo\br{\frac{3}{4}}^n<\oo,
$$
它是一致收敛的. 所以 $f\in C(\R)$. 对任意取定的 $x$, 设 $[4^mx]=k_m$, 令 $\alpha_m=4^{-m}k_m$, $\beta_m=4^{-m}(k_m+1)$, 则 $\alpha_n\le x\le\beta_n$, 切当 $n<m$ 时, $4^n\alpha_m,4^n\beta_m$ 之间无整数. 考虑
$$
\env{aligned}{
	|f(\beta_m)-f(\alpha_m)| &= \abs{\sum_{n=0}^m\br{\frac{3}{4}}^n(h(4^n\beta_m)-h(4^n\alpha_m))}\\
	&\ge \br{\frac{3}{4}}^m-\sum_{n=0}^{m-1}\br{\frac{3}{4}}^n 4^{n-m}\\
	&= \br{\frac{3}{4}}^m-\frac{1}{4^m}\frac{3^m-1}{3-1},
}
$$
那么
$$
\frac{|f(\beta_m)-f(\alpha_m)|}{\beta_m-\alpha_m}>3^m-\frac{3^m-1}{2}>\frac{3^m}{2}\to\oo,
$$
这给出 $\lim_{y\to x}\frac{f(y)-f(x)}{y-x}$ 不存在.

&emsp;&emsp;类似地可以构造 $\sum_{n=0}^\oo\br{\frac{3}{4}}^n\sin\br{\frac{\pi}{2}\cdot 4^nx}$.

&nbsp;

**存在充满 $[0,1]\x[0,1]$ 的连续曲线**

&emsp;&emsp;设函数
$$
g(t)=\env{cases}{
	0, & t\in\bk{0,\frac{1}{3}}\cup\bk{\frac{5}{3},2};\\
	3t-1, & t\in\bk{\frac{1}{3},\frac{2}{3}};\\
	1, & t\in\bk{\frac{2}{3},\frac{4}{3}};\\
	3t+5, & t\in\bk{\frac{4}{3},\frac{5}{3}}.
}
$$
且满足 $g(t+2)=g(t)$. 构造
$$
x(t)=\ser\frac{1}{2^n}g(3^{2n-2}t),\quad y(t)=\ser\frac{1}{2^n}g(3^{2n-1}t).
$$
不难说明 $x,y\in C[0,1]$, $0\le x,y\le 1$. 现断言对任意 $(a,b)\in[0,1]\x[0,1]$, 都存在 $t\in[0,1]$, 使得 $(a,b)=(x(t),y(t))$.

&emsp;&emsp;设 $a=\ser\frac{a_n}{2^n}$, $b=\ser\frac{b_n}{2^n}$ 为二者的二进制表示, 定义 $c_{2n-1}=a_n$, $c_{2n}=b_n$, 令
$$
c=2\ser\frac{c_n}{3^n}\in[0,1].
$$
下证 $x(c)=a$, $y(c)=b$. 计算
$$
3^kc=2\sum_{n=1}^k c_n3^{k-n}+2\sum_{n=k+1}^\oo\frac{c_n}{3^{n-k}},
$$
前一项是偶数, 对 $g$ 无作用. 设后一项为 $d_k$, 则
$$
0\le d_k=2\sum_{n=k+1}^\oo\frac{c_n}{3^{n-k}}\le 2\sum_{n=k+1}^\oo\frac{1}{3^{n-k}}=1.
$$
若 $c_{k+1}=0$, $0\le d_k\le\frac{1}{3}$; 否则 $\frac{2}{3}\le d_k\le 1$, 那么 $g(d_k)=g(3^kc)=c_{k+1}$. 因此 $g(3^{2n-2}c)=c_{2n-1}=a_n$, $g(3^{2n-1}c)=c_{2n}=b_n$, 因此
$$
x(c)=\ser\frac{g(3^{2n-2}c)}{2^n}=\ser\frac{a_n}{2^n}=a,\\
y(c)=\ser\frac{g(3^{2n-1}c)}{2^n}=\ser\frac{b_n}{2^c}=b.
$$

# 第十一章 幂级数

## $\S11.1$ 收敛半径与收敛域

> **命题 11.1.1**
>
> &emsp;&emsp;对幂级数 $\sum_{n=0}^\oo a_nx^n$, 若 $x=r\neq0$ 时级数收敛, 则一切 $|x|<|r|$ 处级数均绝对收敛.

&emsp;&emsp;*→ Proof.* 注意到 $a_nr^n$ 一定有界, 则
$$
\sum_{n=0}^\oo|a_nx^n|=\sum_{n=0}^\oo|a_nr^n|\cdot\abs{\frac{x}{r}}^n\le M\sum_{n=0}^\oo\abs{\frac{x}{r}}^n<\oo.
$$
&emsp;&emsp;因此, 幂级数总是仅在一个区间 $\lang -R,R\rang$ 收敛 (开闭不确定), 且总是在 $(-R,R)$ 绝对收敛. 其中
$$
R:=\sup\{|x|:\sum_{n=0}^\oo a_nx^n\text{ 收敛}\}
$$
称为幂级数的收敛半径, $(-R,R)$ 称为收敛区间, 上述 $\lang -R,R\rang=:E$ 称为收敛域.

&emsp;&emsp;实际上上述结论和推导对 $\C$ 上的级数也自然成立, 此时 $R$ 确定了一个收敛圆盘, 也仅有圆周上的点的收敛性不确定.

&emsp;&emsp;*例如*:

- $\serz x^n$, $R=1$, $E=(-1,1)$;
- $\ser\frac{(-1)^{n-1}}{n}x^n$, $R=1$, $E=(-1,1]$;
- $\ser\frac{x^n}{n^2}$, $R=1$, $E=[-1,1]$;
- $\serz\frac{x^n}{n!}$, $R=\oo$, $E=\R$;
- $\serz n!x^n$, $R=0$.

> **定理 11.1.2**
>
> &emsp;&emsp;对幂级数 $\serz a_nx^n$, 设
> $$
> \rho=\lsup\sqrt[n]{|a_n|},
> $$
> 则 $R=\rho^{-1}$ ($\rho=0\Ra R=\oo$).

&emsp;&emsp;*→ Proof.* $\rho=0$ 时, $\lsup\sqrt[n]{|a_nx^n|}=|x|\rho=0<1$, 根值判别法给出绝对收敛.

&emsp;&emsp;$\rho>0$ 时, $\lsup\sqrt[n]{|a_nx^n|}=|x|\rho<1\Eq|x|<\rho^{-1}$, 且 $\cdots>1\Eq|x|>\rho^{-1}$, 同样利用根值判别法.

> **推论 11.1.3**
>
> &emsp;&emsp;若 $a_n\neq0$, $\lin\abs{\frac{a_{n+1}}{a_n}}$ 收敛, 则 $\rho=\lin\abs{\frac{a_{n+1}}{a_n}}$.

&emsp;&emsp;可以回顾对根值和比值判别法的比较.

&emsp;&emsp;*例如*, 对 $\ser n^nx^{n^2}$, 有 $a_{n^2}=n^n$, 那么 $\lsup\sqrt[n]{a_n}=\lsup(\sqrt n)^{\frac{1}{\sqrt n}}=1$, $R=1$.

## $\S11.2$ 幂级数的性质

> **定理 11.2.1**
>
> &emsp;&emsp;若 $0<R\le\oo$ 为 $\serz a_nx^n$ 的收敛半径, 则对任意 $0<r<R$, $\serz a_nx^n$ 在 $[-r,r]$ 绝对一致收敛. 若 $x=R$ 收敛, 则其在 $[0,R]$ 一致收敛 (负方向同理).

&emsp;&emsp;*→ Proof.* $\A x\in[-r,r],~\serz|a_nx^n|\le\serz|a_nr^n|<\oo$, 绝对一致收敛. 对后一种情况,
$$
\serz a_nx^n=\serz a_nR^n\cdot\br{\frac{x}{R}}^n,
$$
 Abel 判别法给出一致收敛性.

> **推论 11.2.2**
>
> &emsp;&emsp;设 $f(x)=\serz a_nx^n$ 的收敛域为 $E$, 则 $f\in C(E)$.

&emsp;&emsp;*例如*, 对幂级数 $f(x)$, 收敛半径 $R=1$, 若 $\serz a_n$ 收敛, 则 $\lix{1-}f(x)=f(1)=\serz a_n$. 但若仅已知 $\lix{1-}f(x)$ 存在, 不一定有 $\serz a_n$ 收敛: $f(x):=\serz(-1)^n x^n$, $\lix{1-}f(x)=\frac{1}{2}$, 但 $\serz(-1)^n$ 发散.

&emsp;&emsp;如果加条件加强为 $f(x)=\serz a_nx^n~(|x|<1)$, $a_n=o\br{\frac{1}{n}}$, 且 $\lix{1-}f(x)=S$, 则 $\serz a_n=S$.  令 $\sigma_n=\frac{1}{n}\sum_{k=0}^nk|a_k|$, 则 $\lin\sigma_n=\lin n|a_n|=0$. 所以 $\A\eps>0,~\E N,~\A n\ge N,~|f\br{1-\frac{1}{n}}-S|<\eps/3$, $\sigma_n<\eps/3$, $n|a_n|<\eps/3$. 令 $S_n=\sum_{k=0}^n a_k$, 则 $S_n-S=f(x)-S+\sum_{k=0}^na_k(1-x^k)-\sum_{k=n+1}^\oo a_kx^k$,  而
$$
0<1-x^k=(1-x)(1\ops+x^{k-1})\le k(1-x),
$$
当 $n\ge N$,
$$
|S_n-S|\le|f(x)-S|+(1-x)\sum_{k=0}^nk|a_k|+\frac{\eps}{3n}\frac{x^{n+1}}{1-x}\quad(\A x\in(0,1)).
$$
最后令 $x=1-1/n$, 给出 $|S_n-S|<\eps/3+\eps/3+\eps/3=\eps$.

&emsp;&emsp;*例如*, 若 $\serz a_n=A$, $\serz b_n=B$ 均收敛, 设 $c_n=\sum_{k=0}^na_{n-k}b_k$, 若 $\serz c_n$ 收敛, 则 $\serz c_n=AB$.

&emsp;&emsp;证明, 在 $(-1,1)$ 上令 $f(x)=\serz a_nx^n$, $g(x)=\serz a_nx^n$, 由于它们都内闭绝对一致收敛, 所以
$$
f(x)g(x)=\serz a_nx^n\cdot\serz b_nx^n=\serz c_nx\quad(\A|x|\le r<1).
$$
利用上段结论, 因为 $\serz c_n$ 收敛, 所以 $fg\in C[0,1]$, 则 $\serz c_n=\lix{1-}f(1)g(1)=AB$.

&emsp;&emsp;注意这个结论需要已知 $\serz c_n$ 收敛. 反例: $a_n=b_n$, $\serz a_nx^n=\frac{1}{\sqrt{1+x}}$, 则
$$
a_n=\frac{(-1)^n\cdot\frac{1}{2}\cdot\frac{3}{2}\ops\cdot\frac{2n-1}{2}}{n!}=(-1)^n\frac{(2n-1)!!}{2^nn!}\to0,
$$
求和收敛. 然而 $c_n=(-1)^n$, 并不收敛.

**逐项积分与微分**

&emsp;&emsp;对幂级数 $\serz a_nx^n$, 收敛半径 $R>0$, 通过计算收敛半径给出内闭一致收敛性, 则
$$
\serz\frac{a_n}{n+1}x^{n+1}=\int_0^x\serz a_nt^n\d t\quad(\A x\in E),
$$
且收敛半径不变. (注意收敛域有可能改变, 例如对 $\serz \frac{x^n}{n}$ 积分.)

&emsp;&emsp;类似地, 其逐项微分
$$
\ser na_nx^{n-1}=\der x\serz a_nx^n,
$$
且收敛半径不变. 因此 $f:=\serz a_nx^n\in C^\oo(-R,R)$.

&emsp;&emsp;*例如*, 欲求 $\serz\frac{(-1)^n}{3n+1}$, 令 $f(x)=\serz\frac{(-1)^n}{3n+1}x^{3n+1}$, 则
$$
\env{aligned}{
	f(x)&=\serz\int_0^x(-1)^n t^{3n}\d t\\
	&=\int_0^x\serz(-1)^nt^{3n}\d t\\
	&=\int_0^x\frac{\d t}{1+t^3}\\
	&=\cdots\\
	&=\ev{\br{\frac{1}{3}\ln(1+t)-\frac{1}{6}\ln(t^2-t+1)+\frac{\sqrt 3}{3}\arctan\frac{2t-1}{\sqrt 3}}}_0^x\\
	&=\frac{1}{6}\ln\frac{(x+1)^2}{x^2-x-1}+\frac{\sqrt{3}}{3}\arctan\frac{2x-1}{\sqrt 3}+\frac{\pi}{6\sqrt 3}.
}
$$
代入 $x=1$, $f(1)=\frac{\ln 2}{3}+\frac{\pi}{3\sqrt 3}$.

## $\S11.3$ 幂级数展开

> **定义 11.3.1**
>
> &emsp;&emsp;称 $f\in C^\oo$ 在 $x_0$ 处解析, 当且仅当其在 $x_0$ 处 Taylor 展开时
> $$
> f(x)=f(x_0)+\sum_{k=1}^n\frac{f^{(k)}(x_0)}{k!}(x-x_0)^k+r_n(x),\quad r_n(x)=\frac{f^{(n+1)}(\xi)}{(n+1)!}(x-x_0)^{n+1},
> $$
> 满足 $\lin r_n(x)=0$ 在 $x_0$ 某邻域上成立.

&emsp;&emsp;注意若 $f^{(n)}(x)$ 一致有界, 则显然 $r_n(x)\tto 0$, 函数解析. 例如 $\cos x$, $\sin x$ 都是解析的.

&emsp;&emsp;事实上, 若 $f,g$ 都在 $x_0$ 处解析, 则 $f\pm g$, $fg$, $\frac{f}{g}~(g(x_0)\neq 0)$ 都在 $x_0$ 解析. 例如, 对 $\frac{1}{g}$, 可以待定系数地解出其级数表达式, 然后说明它的收敛半径是正的. 若 $g$ 在 $x_0$ 解析, $f$ 在 $g(x_0)$ 解析, 则 $f(g(x))$ 在 $x_0$ 处解析.

&emsp;&emsp;设 $f(x)=(1+x)^\alpha$, 则 $f^{(n)}(x)=\alpha^{\ul n}(1+x)^{\alpha-n}$, $f^{(n)}(0)=\alpha^{\ul n}$. 因此
$$
f(x)\sim\serz\frac{\alpha^{\ul n}}{n!}x^n.
$$
定义 $\binom{\alpha}{n}:=\frac{\alpha^{\ul n}}{n!}$. 注意到有
$$
\abs{\frac{\binom{\alpha}{n}}{\binom{\alpha}{n+1}}}=\abs{\frac{n+1}{\alpha-n}}\to1.
$$
则右侧收敛半径为 $1$, 右侧令为 $g(x)~(x\in(-1,1))$, 则 $g'(x)=\ser n\binom{\alpha}{n}x^{n-1}$. 那么
$$
\env{aligned}{
	(1+x)g'(x) &= \ser n\binom{\alpha}{n}x^{n-1}+\ser n\binom{\alpha}{n}x^n\\
	&= \ser\br{(n+1)\binom{\alpha}{n+1}+n\binom{\alpha}{n}}x^n+\alpha\\
	&=\alpha g(x).
}
$$
因此
$$
\env{aligned}{
	((1+x)^{-\alpha}g) &= -\alpha(1+x)^{-\alpha-1}g+(1+x)^{-\alpha}g'\\
	&= (1+x)^{-\alpha-1}(-\alpha g+(1+x)g')\\
	&\equiv 0.
}
$$
所以 $(1+x)^{-\alpha}g\equiv C$, $x=0$ 处得知 $C=1$, 因此 $g(x)=(1+x)^\alpha~(x\in(-1,1))$.

&emsp;&emsp;接下来关注端点处的收敛性. 试直接说明在 $\pm1$ 处绝对收敛, 即
$$
\serz\abs{\binom{\alpha}{n}}<\oo.
$$
当 $\alpha>0$ 时, 注意到
$$
n\br{\frac{\abs{\binom{\alpha}{n}}}{\abs{\binom{\alpha}{n+1}}}-1}=n\br{\frac{n+1}{n-\alpha}-1}\to 1+\alpha>0.
$$
绝对收敛. 当 $-1<\alpha<0$ 时, 则
$$
\env{aligned}{
	\abs{\binom{\alpha}{n}} &= \abs{\br{1-\frac{\alpha+1}{1}}\br{1-\frac{\alpha+1}{2}}\cdots\br{1-\frac{\alpha+1}{n}}}\\
	&= \exp\sum_{k=1}^n\ln\abs{1-\frac{1+\alpha}{k}}\\
	&\sim \frac{1}{n^{1+\alpha}}.
}
$$
则 $\serz\binom{\alpha}{n}(-1)^n$ 发散, $\serz\binom{\alpha}{n}$ 收敛.

&emsp;&emsp;综上, $\alpha>0$, $-1<\alpha<0$, $\alpha\le -1$ 时, 收敛域分别为 $[-1,1]$, $(-1,1]$, $(-1,1)$.

&emsp;&emsp;*例如*, 展开 $(1-x^2)^{-\frac{1}{2}}$:
$$
\env{aligned}{
	(1-x^2)^{-\frac{1}{2}} &= 1+\ser\binom{-\frac{1}{2}}{n}(-x^2)^n\\
	&= 1+\ser\frac{(2n-1)!!}{(2n)!!}x^{2n},\quad|x|<1.
}
$$
在 $\pm 1$ 上,
$$
n\br{\frac{\frac{(2n-1)!!}{(2n)!!(2n+1)}}{\frac{(2n+1)!!}{(2n+2)!!(2n+3)}}-1}=n\br{\frac{(2n+2)(2n+3)}{(2n+1)^2}-1}\to\frac{3}{2}.
$$
收敛. 因而
$$
\arcsin x=\int_0^x\frac{\d t}{\sqrt{1-t^2}}=x+\ser\frac{(2n-1)!!}{(2n)!!}\frac{x^{2n+1}}{2n+1},\quad|x|<1.
$$
&emsp;&emsp;*例如*, 求 $\int_0^\pi\frac{\ln(1+a\cos x)}{\cos x}\d x$. 考虑展开分子, 那么
$$
\env{aligned}{
	\int_0^\pi\frac{\ln(1+a\cos x)}{\cos x}\d x &= \int_0^\pi\br{a+\ser(-1)^n\frac{a^{n+1}\cos^n x}{n+1}}\d x\\
	&= \pi\br{a+\ser\frac{(2n-1)!!}{(2n)!!(2n+1)}a^{2n+1}}.
	
}
$$
(回忆 $\int_0^\pi\cos^mx\d x=[2\mid m]\frac{(m-1)!!}{m!!}\pi$.) 抬头对比一下系数, 就有
$$
\text{LHS}=\pi\arcsin a.
$$
&emsp;&emsp;*例如*, 对于 $\arcsin x$ 的展开式:
$$
t=\sin t+\ser\frac{(2n-1)!!}{(2n+1)(2n)!!}\sin^{2n+1}t,\quad t\in[-\pi/2,\pi/2].
$$
那么
$$
\env{aligned}{
	\frac{\pi^2}{8} &= \int_0^{\frac{\pi}{2}}t\d t\\
	&= 1+\ser\frac{(2n-1)!!}{(2n+1)(2n)!!}\int_0^{\frac{\pi}{2}}\sin^{2n+1}t\d t\\
	&= 1+\ser\frac{(2n-1)!!}{(2n+1)(2n)!!}\frac{(2n)!!}{(2n+1)!!}\\
	&= \serz\frac{1}{(2n+1)^2}.
}
$$
解方程可进一步得到
$$
\ser\frac{1}{n^2}=\frac{\pi^2}{6}.
$$
&emsp;&emsp;*例如*, 求 $S=1-\frac{2^3}{1!}+\frac{3^3}{2!}-\cdots$.
$$
\env{aligned}{
	S &= \serz\frac{(-1)^n(n+1)^3}{n!}\\
	&= \serz\frac{(-1)^n}{n!}\br{\e^{(n+1)x}}'''.
}
$$
其中
$$
\env{aligned}{
	f(x) &= \serz\frac{(-1)^n}{n!}\e^{(n+1)x}\\
	&= \e^x\serz\frac{(-\e^x)^n}{n!}\\
	&= \e^x\cdot\e^{-\e^x}=\e^{x-\e^x}.
}
$$
则
$$
\env{aligned}{
	f' &= (1-\e^x)f\\
	f'' &= (1-\e^x)f+(1-\e^x)^2f=(2-3\e^x+\e^{2x})f\\
	f''' &= (-3\e^x+2\e^{2x})f+(2-3\e^x+\e^{2x})(1-\e^x)f.
}
$$
所以 $f'''(0)=-f(0)=-\e^{-1}$.

&emsp;&emsp;*例如*, 求 $\ser\frac{\cos nx}{n}$.

&emsp;&emsp;令 $f(t)=\ser\frac{\cos nx}{n}t^n,~t\in(-1,1]$, 则
$$
\env{aligned}{
	f' &= \ser\cos nx\cdot t^{n-1}\\
	&= \Re\ser t^{n-1}\e^{\i nx}\\
	&= \Re\frac{\e^{\i x}}{1-t\e^{\i x}}\\
	&= \Re\frac{\cos x+\i\sin x}{1-t\cos x-\i t\sin x}\\
	&= \frac{\cos x(1-t\cos x)+t\sin^2 x}{(1-t\cos x)^2+t^2\sin^2 t}\\
	&= \frac{\cos x-t}{1+t^2-2t\cos x}.
}
$$
积回去:
$$
\env{aligned}{
	f(t) &= f(0)+\int_0^tf'(t)\d t\\
	&= -\frac{1}{2}\ln\br{1-2t\cos x+t^2}.
}
$$
所以
$$
\ser\frac{\cos nx}{n}=f(1)=-\frac{1}{2}\ln(2-2\cos x)=-\ln 2-\ln\abs{\sin\frac{x}{2}}.
$$
&emsp;&emsp;*例如*, $f(x)=\ser\frac{(-1)^{n-1}}{n^x}\in C^\oo(0,\oo)$, 欲求 $f'(1)=\ser\frac{(-1)^{n-1}\ln n}{n}$.

&emsp;&emsp;我们知道
$$
\zeta(x)=\ser\frac{1}{n^x}=\frac{1}{x-1}+c+\ser\frac{(-1)^n\gamma_n}{n!}(x-1)^n.
$$
其中 $c$ 为 Euler 常数, 后一项级数的收敛半径为 $\oo$, 有
$$
\gamma_n=\lim_{m\to\oo}\br{\sum_{k=1}^m\frac{(\ln k)^n}{k}-\frac{(\ln m)^{n+1}}{n+1}}.
$$
令 $f(x)=(1-2^{1-x})\zeta(x)$, 则
$$
\env{aligned}{
	f'(x) &= \zeta'(x)(1-2^{1-x})+\zeta(x)2^{1-x}\ln 2\\
	&= \zeta'(1+t)(1-2^{-t})+\zeta(1+t)(2^{-t}\ln2)\\
	&= \br{-\frac{1}{t^2}-\gamma_1+O(t)}(1-\e^{-t\ln 2})+\br{\frac{1}{t}+c+O(t)}\ln 2\cdot\e^{-t\ln 2}\\
	&= \br{-\frac{1}{t^2}-\gamma_1+O(t)}\br{t\ln2-\frac{t^2\ln^2 2}{2}+O(t^3)}\\
	&+\br{\frac{1}{t}+c+O(t)}\br{\ln 2-t\ln^2 2+O(t^2)}\\
	&= c\ln 2-\frac{1}{2}\ln^2 2+O(t).
}
$$
因此 $f'(1)=c\ln 2-\frac{1}{2}\ln^2 2$.

## $\S11.4$ 连续函数的多项式逼近

> **定义 11.4.1**
>
> &emsp;&emsp;对 $f:[a,b]\to\R$, 若存在一列多项式 $P_n(x)\tto f(x)$, 则称 $f(x)$ 可被多项式一致逼近.

&emsp;&emsp;显然可被多项式一致逼近要求 $f\in C[a,b]$.

> **定理 11.4.2 (Weiestrass)**
>
> &emsp;&emsp;有界闭区间上的连续函数可由多项式一致逼近.

&emsp;&emsp;*→ Proof. (构造性)* 不妨在 $[0,1]$ 上研究, 构造
$$
B_n(f)=\sum_{p=0}^n\binom{n}{p}f\br{\frac{p}{n}}x^p(1-x)^{n-p}\quad(x\in[0,1]).
$$
注意总有 $\deg B_n(f)\le n$, 且 $B_n:C[0,1]\to\R[x]/(x^{n+1})$ 是两向量空间的同态, $\min f\le|B_n(f)|\le\max f$.

&emsp;&emsp;设 $r_p(x)=\binom{n}{p}x^p(1-x)^{n-p}$, 简单 GF 运算可知
$$
\sum_{k=0}^n r_k(x)=1,\\
\sum_{k=0}^n kr_k(x)=nx,\\
\sum_{k=0}^n k(k-1)r_K(x)=n(n-1)x^2.
$$
考虑
$$
\env{aligned}{
	\sum_{p=0}^n(p-nx)^2r_p(x) &= \sum_{p=0}^n p^2r_p(x)-2nx\sum_{p=0}^n pr_p(x)s+n^2x^2\sum_{p=0}^n r_p(x)\\
	&= n(n-1)x^2+nx-2n^2x^2+n^2x^2\\
	&= nx(1-x)\le\frac{n}{4}.
}
$$
&emsp;&emsp;回到原命题, 设 $|f|\le M$, 对任意 $\eps>0$, 取 $\delta>0$ 使得 $|x-x'|<\delta\Ra |f(x)-f(x')|<\eps/2$, 此时
$$
\env{aligned}{
	\abs{B_n(f)-f} &= \abs{\sum_{p=0}^n\binom{n}{p}\br{f\br{\frac{p}{n}}-f(x)}x^p(1-x)^{n-p}}\\
	&\le \sum_{p=0}^n\binom{n}{p}\abs{f\br{\frac{p}{n}}-f(x)}x^p(1-x)^{n-p}\\
	&=\sum_{\abs{\frac{p}{n}-x}<\delta}\binom{n}{p}\abs{f\br{\frac{p}{n}}-f(x)}x^p(1-x)^{n-p}\\
	&\quad+\sum_{\abs{\frac{p}{n}-x}\ge\delta}\binom{n}{p}\abs{f\br{\frac{p}{n}}-f(x)}x^p(1-x)^{n-p}\\
	&\le \frac{\eps}{2}\sum_{p=0}^n r_p(x)+2M\sum_{p=0}^n\frac{(p-nx)^2}{n^2\delta^2}r_p(x)\\
	&\le \frac{\eps}{2}+\frac{M}{2n\delta^2}\\
	&\overset{n>\frac{M}{\eps\delta^2}}<\eps.
}
$$
&emsp;&emsp;*→ Proof. (存在性)* 显然 $C[a,b]$ 是完备的线性空间. 称 $A\sub C[a,b]$ 为一个代数, 当且仅当 $f,g\in A$ 时总有 $f+g\in A$, $fg\in A$, $\A c\in\R,~cf\in A$. 定义其代数闭包
$$
\ol A:=\{f\in C[a,b]:\E f_n\in A,~f_n\tto f\}\supset A.
$$
我们只需要证明下述定理.

> **定理 11.4.3**
>
> &emsp;&emsp;对上述 $A$, 若它还满足 $\R\sub A$, 且 $\A x\neq y\in[a,b],~\E f\in A,~f(x)\neq f(y)$, 则 $\ol A=C[a,b]$.

> **引理 11.4.4**
>
> &emsp;&emsp;设 $c>0$, 则存在多项式列 $P_n\tto|x|~(x\in[-c,c])$.

&emsp;&emsp;*→ Proof.* 注意到
$$
\env{aligned}{
	|x| &= (c^2-(c^2-x^2))^{\frac{1}{2}}\\
	&= c\br{1-\br{1-\br{\frac{x}{c}}^2}}^{\frac{1}{2}}\\
	&= c\serz\binom{\frac{1}{2}}{n}\br{1-\br{\frac{x}{c}}^2}^n\quad(|x|\le c).
}
$$

> **引理 11.4.5**
>
> &emsp;&emsp;若 $f\in A$, $P$ 为多项式, 则 $P(f(x))\in A$.

&emsp;&emsp;这是显然的.

> **引理 11.4.6**
>
> &emsp;&emsp;若 $f\in\ol A$, 则 $|f|\in\ol A$.

&emsp;&emsp;*→ Proof.* 由于 $f\in\ol A$, 必有 $|f|<c$, 在 $[-c,c]$ 上取多项式列 $P_n(x)\tto|x|$, 那么
$$
\ol A\ni P_n(f(x))\tto|f|\in\ol A.
$$

> **推论 11.4.7**
>
> &emsp;&emsp;若 $f,g\in\ol A$, 则 $\max\{f,g\},\min\{f,g\}\in\ol A$.

&emsp;&emsp;*→ Proof.* $\max\{f,g\}=\frac{f+g}{2}+\frac{|f-g|}{2}$.

> **引理 11.4.8**
>
> &emsp;&emsp;$\A x\neq y\in [a,b],~\A\alpha,\beta\in\R,~\E h\in A,~h(x)=\alpha\land h(y)=\beta$.

&emsp;&emsp;*→ Proof.* 取 $\varphi\in A$ 使得 $\varphi(x)\neq\varphi(y)$, 令
$$
h(t)=\alpha+(\beta-\alpha)\frac{\varphi(t)-\varphi(x)}{\varphi(y)-\varphi(x)}
$$
即可.

&emsp;&emsp;*→ Proof. @ 11.4.3* 下证明, 对任意 $f\in C[a,b]$ 和 $n\ge 1$, 都存在 $g_n\in\ol A$, 使得 $|f(x)-g_n(x)|<\frac{1}{n}$.

&emsp;&emsp;对任意 $x,y\in[a,b]$, <u>引理 11.4.8</u> 保证存在 $h_{x,y}(z)\in A$, 使得 $h_{x,y}(x)=f(x)$, $h_{x,y}(y)=f(y)$. 对一切 $y\in[a,b]$, 总存在 $\delta=\delta(y)$, 使得 $z\in I_y:=(y-\delta,y+\delta)\Ra h_{x,y}(z)<f(z)+\frac{1}{n}$, 这时
$$
\bigcup_{y\in[a,b]}I_y\supset[a,b].
$$
因此存在有限子列 $\{I_{y_1},\cdots,I_{y_m}\}$, 使得
$$
[a,b]\sub\bigcup_{i=1}^mI_{y_i}.
$$
令
$$
h_x(z)=\min_{i=1}^m\{h_{x,y_i}(z)\}\in\ol A,
$$
则它满足 $\A z\in[a,b],~h_x(z)<f(z)+\frac{1}{n}$ 以及 $h_x(x)=f(x)$. 因此
$$
\E\delta_x>0,~\A z\in J_x:=(x-\delta_x,x+\delta_x),~h_x(z)>f(z)-\frac{1}{n}.
$$
而
$$
\bigcup_{x\in[a,b]}J_x\supset[a,b].
$$
再取出相应有限覆盖子列 $\{J_{x_1},\cdots,J_{x_k}\}$, 再构造
$$
g_n(z)=\max_{i=1}^k\{h_{x_i}(z)\}\in\ol A,
$$
则 $\A z\in[a,b],~f(z)+\frac{1}{n}>g_n(z)>f(z)-\frac{1}{n}$.

&emsp;&emsp;现在已然有 $\ol A\ni g_n\tto f$, 因此 $f\in\ol A$.

&nbsp;

&emsp;&emsp;以下是一些使用定理的例子.

> **引理 11.4.9 (Riemann)**
>
> &emsp;&emsp;若 $f\in C[a,b]$, 则 $\DS\lin\int_a^bf(x)\sin nx\d x=0$.

&emsp;&emsp;*→ Proof.* 若 $f\in C^1[a,b]$, 分部积分:
$$
\env{aligned}{
	\abs{\int_a^bf(x)\sin nx\d x} &= \abs{-\frac{1}{n}\int_a^bf(x)\d\cos nx}\\
	&= \abs{\ev{\br{-\frac{1}{n}f(x)\cos nx}}_a^b+\frac{1}{n}\int_a^b\cos nxf'(x)\d x}\\\\
	&\le \frac{2}{n}\max|f|+\frac{1}{n}\max|f'|(b-a)\to 0.	
}
$$
对一般的 $f$ 和任意 $\eps>0$, 总存在多项式 $P$, 使得 $\max|f-P|<\eps$, 则
$$
\env{aligned}{
	\lsup\abs{\int_a^b f(x)\sin nx\d x} &\le \lsup\abs{\int_a^b P(x)\sin nx\d x}+\lsup\abs{\int_a^b(f(x)-P(x))\sin nx\d x}\\
	&\le\eps(b-a).
}
$$

> **命题 11.4.10**
>
> &emsp;&emsp;若 $f\in C[a,b]$, 且 $\DS\A n\ge 0,~\int_a^b f(x)x^n\d x=0$, 则 $f\equiv 0$.

&emsp;&emsp;*→ Proof.* 由题意, 对任意多项式 $P$ 都有 $\int_a^b f(x)P(x)\d x=0$. 则对 $\eps>0$, 存在多项式 $P$ 使得 $|P-f|<\eps$. 则
$$
\env{aligned}{
	\int_a^b f(x)^2\d x &= \int_a^b f(x)P(x)\d x+\int_a^b f(x)(f(x)-P(x))\d x\\
	&=\int_a^bf(x)(f(x)-P(x))\d x\\
	&\le\eps\int_a^b|f(x)|\d x.
}
$$
因此 $\int_a^b f(x)^2\d x=0\Ra f\equiv 0$.

> **命题 11.4.11**
>
> &emsp;&emsp;(已知 $C[a,b]=\ol{\lang X^n:n\ge 0\rang}$), 则 $C[a,b]=\ol{\lang 1,X,X^3,X^4,\cdots\rang}$.

&emsp;&emsp;*→ Proof.* 对 $f\in C[a,b]$, $f(x^{\frac{1}{3}})\in C[a^{\frac{1}{3}},b^{\frac{1}{3}}]$, 存在 $P(x)\tto f(x^{\frac{1}{3}})$, 则已然有 $P(x^3)\tto f(x)$.

&emsp;&emsp;自然的疑问是, 在张成多项式的基底中, 哪些基在删除后仍保持闭包的形态?

> **定理 11.4.12**
>
> &emsp;&emsp;对整数列 $0<\lambda_1<\lambda_2<\cdots$, 若 $0\notin(a,b)$, 当且仅当 $\ser\frac{1}{\lambda_n}=\oo$ 时,
> $$
> \ol{\lang 1,x^{\lambda_1},x^{\lambda_2},\cdots\rang}=C[a,b];
> $$
> 若 $0\in (a,b)$, 当且仅当 $\sum_{2\mid\lambda_i}\frac{1}{\lambda_i}=\sum_{2\nmid\lambda_i}\frac{1}{\lambda_i}=\oo$ 时,
> $$
> \ol{\lang 1,x^{\lambda_1},x^{\lambda_2},\cdots\rang}=C[a,b].
> $$

> **引理 11.4.13**
>
> &emsp;&emsp;对互异实数列 $\lambda_i>0$, 若 $\lin\lambda_n=\oo$, $\ser\frac{1}{\lambda_n}=\oo$, 则
> $$
> \ol{\lang 1,x^{\lambda_1},\cdots\rang}=C[0,1].
> $$

&emsp;&emsp;*→ Proof.* 只需证明, 对任意 $m\in\N^*\setminus\{\lambda_n\}$, $x^m$ 总能被逼近. 令
$$
Q_0(x)=x^m,\quad Q_n(x)=(\lambda_n-m)x^{\lambda_n}\int_x^1Q_{n-1}(t)t^{-1-\lambda_n}\d t.
$$
则断言 $Q_n(x)$ 形如 $x^m-\sum_{i=1}^n a_{n,i}x^{\lambda_i}$. 归纳地,
$$
\env{aligned}{
	Q_{n+1}(x) &= (\lambda_{n+1}-m)x^{\lambda_{n+1}}\int_x^1\br{t^m-\sum_{i=1}^na_{n,i}t^{\lambda_i}}t^{-1-\lambda_{n+1}}\d t\\
	&= (\lambda_{n+1}-m)x^{\lambda_{n+1}}\int_x^1\br{t^{m-1-\lambda_{n+1}}-\sum_{i=1}^ma_{n,i}t^{\lambda_i-1-\lambda_{n+1}}}\d t\\
	&= \cdots\\
	&= x^m-\sum_{i=1}^{n+1}a_{n+1,i}x^{\lambda_i}.
}
$$
在最大模范数下,
$$
\env{aligned}{
	|Q_n(x)| &\le |\lambda_n-m|x^{\lambda_n}\|Q_{n-1}\|\int_x^1 t^{-1-\lambda_n}\d t\\
	&= |\lambda_n-m|x^{\lambda_n}\|Q_{n-1}\|\ev{\abs{\frac{1}{\lambda_n}t^{-\lambda_n}}}_1^x\\
	&= |\lambda_n-m|x^{\lambda_n}\|Q_{n-1}\|\frac{1}{\lambda_n}(x^{-\lambda_n}-1)\\
	&= \abs{1-\frac{m}{\lambda_n}}\|Q_{n-1}\|(1-x^{\lambda_n})\\
	&\le \abs{1-\frac{m}{\lambda_n}}\|Q_{n-1}\|.
}
$$
因此
$$
\|Q_n\|\le\abs{1-\frac{m}{\lambda_n}}\|Q_{n-1}\|\le\cdots\le\prod_{i=1}^n\abs{1-\frac{m}{\lambda_i}}.
$$
根据发散性, $\lin\|Q_n\|=0$, 回顾 $Q_n$ 的形式, 已然给出对 $x^m$ 的逼近.

&nbsp;

&emsp;&emsp;*→ Proof. @ 11.4.12 (充分性)* 对第一种情况, 不妨 $0\le a<b=1$, 直接常数延拓到 $C[0,1]$ 上的函数, 使用引理即可.

&emsp;&emsp;不妨 $\max\{-a,b\}=1$, 只需证明闭包为 $C[-1,1]$. 对任意 $f\in C[-1,1]$, 有
$$
g_1(x):=\frac{f(x)+f(-x)}{2}\in\ol{\lang 1,x^{\lambda_i}:2\mid\lambda_i\rang},\\
g_2(x):=\frac{f(x)-f(-x)}{2}\in\ol{\lang x^{\lambda_i}:2\nmid\lambda_i\rang}.
$$
因而 $f(x)=g_1(x)+g_2(x)\in\cdots$.

---

&emsp;&emsp;回忆内积空间 $V$ 上, $g\in V$ 到 $\lang\seq f1n\rang$ 的距离为
$$
d=\min_{p\in E}\|g-p\|=\br{\frac{G(g,\seq f1n)}{G(\seq f1n)}}^{\frac{1}{2}},
$$
其中
$$
G(\seq h1m):=\|(h_i\mid h_j)_{i,j}\|.
$$
(其实是高维体的体积除以底面积.)

&emsp;&emsp;此外,
$$
\det\br{\frac{1}{\alpha_i+\beta_j}}=\frac{\DS\prod_{1\le i<j\le n}(\alpha_j-\alpha_i)(\beta_j-\beta_i)}{\DS\prod_{1\le i,j\le n}(\alpha_i+\beta_j)}.
$$
&emsp;&emsp;在 $C[0,1]$ 配备内积 $(f\mid g):=\int_0^1 fg\d x$, $\|f\|_2:=\sqrt{(f\mid f)}$, 明显 $\|f\|_2\le\|f\|=\max|f|$. 并用 $\|\cdot\|_2$ 引进距离 $d$.

&nbsp;

> **引理 11.4.14**
>
> &emsp;&emsp;若 $0<\lambda_i\uparrow$, $c:=\inf_{i\ge 1}\{\lambda_{i+1}-\lambda_i\}>0$, $\ser\frac{1}{\lambda_n}<\oo$, 则
> $$
> \lin\frac{1}{\lambda_n}\sum_{i=1,i\neq m}^\oo\ln\abs{\frac{\lambda_i+\lambda_n}{\lambda_i-\lambda_n}}=0.
> $$

&emsp;&emsp;暂且承认之.

---

&emsp;&emsp;*→ Proof @ 11.4.12 (必要性)* 令 $E=\lang x^{\lambda_1},x^{\lambda_2},\cdots\rang$, 根据上述事实可以算出
$$
d(x^\lambda,E)=\frac{1}{\sqrt{2\lambda+1}}\prod_{i=1}^n\abs{\frac{\lambda-\lambda_i}{\lambda+\lambda_i+1}}.
$$
&emsp;&emsp;设 $p(x)\in\lang x^{\lambda_i}:i\neq m\rang$, 则一定存在 $n$, 使得 $p(x)\in\lang x^{\lambda_i}:1\le i\le n,i\neq m\rang=:E$, 那么
$$
d(x^m,p)\ge d(x^{\lambda_m},E)\ge\frac{1}{2\lambda_m+1}\prod_{i=1,i\neq m}^\oo\abs{\frac{\lambda_i-\lambda_m}{\lambda_i+\lambda_m+1}}=\e^{\ell_m\lambda_m}\quad\br{\lin\lambda_n=0}.
$$

> **引理 11.4.15**
> $$
> \A\eps>0,~\E c_\eps>0,~\A p(x)=:\sum_{i=0}^na_ix^{\lambda_i}\in\lang x^{\lambda_i}:i\ge 0,\lambda_i=0\rang,~|a_i|\le c_\eps(1+\eps)^{\lambda_i}\|p\|_2.
> $$

&emsp;&emsp;*→ Proof.* 考虑 $\frac{p(x)}{a_i}=x^{\lambda_i}+\sum_{m=0,m\neq i}^n\frac{a_m}{a_i}x^{\lambda_m}$, 则
$$
\frac{\|p(x)\|_2}{|a_i|}=\l\|\frac{p(x)}{a_i}\r\|_2\ge d(x^i,E),
$$
其中 $E=\lang x^{\lambda_j}:0\le j\le n,~j\neq i\rang$, 套用结论, $d(x^i,E)\ge \e^{-\ell_i\lambda_i}$, $\ell_i\to 0$ 只与 $\{\lambda_i\}$ 有关. 于是1
$$
|a_i|\le\e^{\ell_i\lambda_i}\|p\|_2.
$$
只需取足够大的 $i$ 使得 $\e^{\ell_i}\le(1+\eps)$ 即可.

&emsp;&emsp;*→ Proof @ 11.4.12  Cont.* 对 $f\in C[0,1]$, 我们能取出 $p_n(x)=\sum_{i=0}^na_{i,n}x^{\lambda_i}\tto f(x)$, 自然 $\|p_n\|_2\to\|f\|_2$, 根据 <u>引理 11.4.15</u>, $|a_{i,n}|$ 有界, $|a_{i,n}|\le c_\eps(1+\eps)^{\lambda_i}~(\A n)$. 通过不断取子列的子列, 能取出子列 $\{n_k\}$, 使得 $\lim_{k\to\oo}a_{i,n_k}=a_i$ 收敛.

&emsp;&emsp;现在, 设 $g(x)=\sum_{i=0}^\oo a_ix^{\lambda_i}$, 则 $\lsup\sqrt[\lambda_i]{|a_i|}\le1+\eps$, 收敛半径 $R\ge 1$. 现在 $p_{n_k}\to g$ 且 $p_{n_k}\to f$, 所以 $f=g$.

&emsp;&emsp;下面讨论具体的区间. 第一种情况, 不妨 $0\le a<b=1$, 取如上 $p(x)$, 令 $\delta=\frac{a+1}{2}$, 取 $\eps>0$ 使得 $(\eps+1)\delta<1$. 现在
$$
|a_i|<c_\eps(1+\eps)^{\lambda_i}\|p\|_2\le c_\eps(1+\eps)^{\lambda_i}\|p\|.
$$
所以
$$
\env{aligned}{
	|p'(x)| &= \abs{\sum_{i=1}^n a_i\lambda_ix^{\lambda_i-1}}\\
	&\le \sum c_\eps(1+\eps)^{\lambda_i}\lambda_i\|p\||x|^{\lambda_i-1}\\
	&\le \frac{c_\eps}{a}\|p\|\sum_{i=1}^n\lambda_i\br{(1+\eps)\delta}^{\lambda_i},\quad x\in[a,\delta]\\
	&\le \frac{c_\eps}{a}\|p\|\ser n((1+\eps)\delta)^n\\
	&= \frac{c_\eps}{a}\|p\|\frac{(1+\eps)\delta}{(1-(1+\eps)\delta)^2}
}
$$
Intuitively, 可被逼近的 $p$ 的导数都能被其最大模控制, 只需要造一个足够 "陡峭" 的函数, 就无法被逼近了. 令
$$
f(x)=\env{cases}{
	\lambda(x-a),&x\in[a,a+\lambda^{-1}];\\
	1,&x\in[a+\lambda^{-1},1].
}
$$
当 $\lambda\gg 1$ 时, $f$ 便不能被这样的 $p$ 一致逼近.

&emsp;&emsp;第二种情况, 不妨 $\max\{-a,b\}=1$. 设 $M_1=\lang x^{\lambda_i}:2\mid \lambda_i\rang$, $M_2$ 同理. 若 $\sum_{2\mid\lambda_i}\frac{1}{\lambda_i}<\oo$, 对偶函数 $f\in C[-1,1]$, 设 $g_n+h_n\tto f$, $g_n\in M_1$, $h_n\in M_2$, 则 $g_n-h_n\tto f$, 于是 $g_n\tto f$, $h_n\tto 0$, 但这与第一种情况的断言矛盾.

# 第十二章 傅里叶级数

## $\S12.1$ 函数的傅里叶级数

&emsp;&emsp;我们称 $\{1,\cos nx,\sin nx\}_{n\in\N^*}$ 为基本三角系, 它们的线性组合称为三角多项式, 形如 $\sum_{k=0}^\oo(a_k\cos kx+b_k\sin kx)$ 则称为三角级数. 现在若 $f(x)=\sum_{k=0}^\oo(a_k\cos kx+b_k\sin kx)$ 逐点收敛, 显然 $f(x+2\pi)\equiv f(x)$, 我们关心是否能用 $f$ 反过来表示 $\{a_k\}$ 和 $\{b_k\}$.

&emsp;&emsp;容易验证
$$
\int_{-\pi}^\pi\cos nx\cdot\cos mx=\int_{-\pi}^\pi\sin nx\cdot\sin mx=[m=n]\pi,\quad \int_{-\pi}^\pi\cos nx\cdot\sin mx=0.
$$
即三角系中的函数两两正交.

&emsp;&emsp;若三角级数一致收敛到 $f$, 根据上述结论,
$$
a_0=\frac{1}{2\pi}\int_{-\pi}^\pi f(x)\d x;\\
a_k=\frac{1}{\pi}\int_{-\pi}^\pi f(x)\cos kx\d x,\quad b_k=\frac{1}{\pi}\int_{-\pi}^\pi f(x)\sin kx\d x.
$$
为统一公式的形式, 一般将三角级数写作 $f(x)=\frac{a_0}{2}+\sum_{k=1}^n(a_k\cos kx+b_k\sin kx)$, 这样 $a_0$ 不必额外${}\div2$.

&nbsp;

&emsp;&emsp;反过来, 自然地思考: 将一般的 $f$ 强行代入以上公式会得到什么? 这里, 我们要求 $\int_{-\pi}^\pi|f|<\oo$ 以保证收敛性, 这样 $\{a_k\}$, $\{b_k\}$ 均存在, 称为 $f(x)$ 的傅里叶级数, 记作 $f(x)\sim\frac{a_0}{2}+\sum_{k=1}^n(a_k\cos kx+b_k\sin kx)$.

&emsp;&emsp;*例如*, $f(x)=[x> 0]x~(x\in[-\pi,\pi])$, 分部积分不难计算
$$
a_0=\frac{\pi}{2},\quad a_n=[2\nmid n]\br{-\frac{2}{n^2\pi}},\quad b_n=\frac{(-1)^{n+1}}{n}.
$$
得到
$$
f(x)\sim\frac{\pi}{4}+\ser\br{-\frac{2}{(2n-1)^2\pi}\cos(2n-1)x+\frac{(-1)^{n+1}}{n}\sin nx}.
$$

> **性质 12.1.1**
>
> &emsp;&emsp;若 $f\in\mathscr F[-\pi,\pi]$ (绝对可积函数), 则其傅里叶级数满足:
>
> - $\lin a_n=\lin b_n=0$;
>
> - $a_n(\alpha f+\beta g)=\alpha a_n(f)+\beta a_n(g)$, $b_n$ 同理;
>
> - 若 $f$ 是偶函数, 则 $b_n\equiv 0$, 若 $f$ 是奇函数, 则 $a_n\equiv 0$;
>
> - 若 $f\br{\frac{\pi}{2}-x}=f\br{\frac{\pi}{2}+x}$, 则 $b_{2n}=0$, 若 $f\br{\frac{\pi}2-x}=-f\br{\frac{\pi}{2}+x}$, 则 $b_{2n-1}=0$;
>
> - 记 $f_h(x)=f(x+h)$, 和角公式展开得
>     $$
>     a_n(f_h)=a_n(f)\cos nh+b_n(f)\sin nh,\\
>     b_n(f_h)=b_n(f)\cos nh-a_n(f)\sin nh.
>     $$
>
> - 若 $f(x+h)\equiv f(x)$, 则 $a_{2n-1}=b_{2n-1}\equiv0$, 可将 $a_n(f)=a_n(f_\pi)$ 代入上一条证明.

> *Remark.*
>
> &emsp;&emsp;实在有必要澄清一下, 对 $a_n$ 和 $b_n$ 的定义实际上应该采用 Lebesgue 积分, 在此意义下绝对可积足够给出傅里叶级数存在. 如果单纯使用 Riemann 积分, $f(x)=(-1)^{D(x)}$, $D(x)$ 为 Dirichlet 函数, 足矣给出反例.

&emsp;&emsp;接下来研究 $\{a_n\}$, $\{b_n\}$ 趋向 $0$ 的速度.

> **定理 12.1.2**
>
> &emsp;&emsp;对 $\alpha\in(0,1]$, 若 $|f(x)-f(y)|\le L|x-y|^\alpha$, 则 $a_n,b_n=O(n^{-\alpha})$.

&emsp;&emsp;*→ Proof.* 构造
$$
\env{aligned}{
	a_n &= \frac{1}{\pi}\int_{-\pi}^\pi f(x)\cos nx\d x\\
	&= \frac{1}{\pi}\int_{-\pi-\frac{\pi}{n}}^{\pi-\frac{\pi}{n}}f\br{t+\frac{\pi}{n}}\cos(nt+\pi)\d t\\
	&= -\frac{1}{\pi}\int_{-\pi}^\pi f\br{t+\frac{\pi}{n}}\cos nt\d t.
}
$$
则
$$
a_n=\frac{1}{2\pi}\int_{-\pi}^\pi\br{f(x)-f\br{x+\frac{\pi}{n}}}\cos nx\d x,
$$
利用 Holder 连续性,
$$
|a_n|\le\frac{1}{2\pi}\int_{-\pi}^\pi L\br{\frac{\pi}{n}}^{\alpha}\d x=\frac{O(1)}{n^\alpha}.
$$

> **推论 12.1.3**
>
> &emsp;&emsp;若 $f\in C^1(\R)$, 则 $a_n,b_n=o(n^{-1})$.

&emsp;&emsp;*→ Proof.*
$$
a_n=\frac{1}{\pi}\int_{-\pi}^\pi f(x)\cos nx\d x=-\frac{1}{n\pi}\int_{-\pi}^\pi f'(x)\sin nx\d x,
$$
后者积分项已然 $\to 0$.

> **命题 12.1.4**
>
> &emsp;&emsp;若 $f$ 在 $[-\pi,\pi]$ 可导, $f'$ 在其上绝对可积, 则
> $$
> a_n(f)=-\frac{b_n(f')}{n},\quad b_n(f)=\frac{a_n(f')}{n}.
> $$

> **推论 12.1.5**
>
> &emsp;&emsp;若 $f\in C^{m-1}(\R)$, $f^{(m)}\in\mathscr F[-\pi,\pi]$, 则
> $$
> |a_n(f)|+|b_n(f)|\le\frac{|a_n(f^{(m)})|+|b_n(f^{(m)})|}{n^m}.
> $$
> 若 $f\in C^\oo(\R)$, 则
> $$
> a_n(f),b_n(f)=o(n^{-m})\quad(\A m\in\N^*).
> $$
> 若 $f\in C^\omega(\R)$ (解析函数), 则
> $$
> \E c>0,~|a_n(f)|,|b_n(f)|<M\e^{-nc}.
> $$

&emsp;&emsp;最后一个论断并不平凡, 这里不细说.

> **命题 12.1.6**
>
> &emsp;&emsp;若 $f\in C(\R)$, $f(x+2\pi)\equiv f(x)$, 则对任意 $\eps>0$, 都存在三角多项式 $T_n(x)$ 满足 $\|T_n(x)-f(x)\|<\eps$.

&emsp;&emsp;*→ Proof.* 若 $f(x)=f(-x)$, $f(\arcsin y)\in C[-1,1]$, 则存在多项式 $p(y)$, 使得 $\|f(\arcsin y)-p(y)\|<\eps$, 即 $\|f(x)-p(\cos x)\|<\eps~(x\in[0,\pi])$, 利用偶函数性质就有 $\|f(x)-p(\cos x)\|<\eps~(x\in[-\pi,\pi])$.

&emsp;&emsp;对一般的 $f$, 设 $g(x)=f(x)+f(-x)$, 对它取出三角多项式 $T_1(x)$, 使得 $\|g-T_1\|<\frac{\eps}{2}$. 再设
$$
\varphi(x)=(f(x)-f(-x))\sin x,
$$
它也是偶函数, 取同样的 $T_2$. 现在有
$$
\|g(x)\sin^2 x-T_1(x)\sin^2 x\|<\frac{\eps}{2},\quad|\varphi(x)\sin x-T_2(x)\sin x|<\frac{\eps}{2}.
$$
令 $T_3(x)=T_1(x)\sin^2 x+T_2\sin x$, 则
$$
\|2f(x)\sin^2 x-T_3(x)\|<\eps.
$$
 同理存在 $T_4(x)$, 使得
$$
\l\|2f\br{x-\frac{\pi}{2}}\sin^2 x-T_4(x)\r\|<\eps.
$$
即
$$
\l\|2f(x)\underbrace{\sin^2\br{x+\frac{\pi}{2}}}_{\cos^2 x}-T_4\br{x+\frac{\pi}{2}}\r\|<\eps.
$$
所以
$$
\l\|f(x)-\frac{T_3(x)+T_4\br{x+\frac{\pi}{2}}}{2}\r\|<\eps.
$$
&nbsp;

&emsp;&emsp;*例如*, 若 $f\in C(\R)$, $f(x+2\pi)\equiv f(x)$, 且 $a_n(f)=b_n(f)\equiv 0$, 则 $f\equiv0$.

&emsp;&emsp;证明: 对 $\eps>0$ 取三角多项式 $T_n$ 使得 $\|f-T_n\|<\eps$, 则
$$
\int_{-\pi}^\pi f^2=\int_{-\pi}^\pi f(f-T_n)\le\int_{-\pi}^\pi|f||f-T_n|\le\eps\int_{-\pi}^\pi|f|.
$$
由 $\eps$ 任意性可知结论.

&emsp;&emsp;用类似的手法可以说明, 基本三角系中的任意函数都无法被其他函数构成的三角级数逼近.

> **命题 12.1.7**
>
> &emsp;&emsp;已知 $b_n\downarrow 0$, $f(x)=\ser b_n\sin nx\in\mathscr F[-\pi,\pi]$, 则 $\ser b_n\sin nx$ 是 $f$ 的傅里叶级数.

&emsp;&emsp;*→ Proof.* 由于 $f(x)=-f(x)$, 必然 $a_n=0$. 注意
$$
\abs{\sum_{k=1}^n\sin kx\sin mx}=\abs{\frac{\cos\frac{x}{2}-\cos\br{n+\frac{1}{2}}x}{2\sin\frac{x}{2}}\sin mx}\le\frac{|\sin mx|}{|\sin\frac{x}{2}|}\le m\pi.
$$
部分和有界, $b_n\downarrow 0$, 所以 $f(x)\sin mx$ 总是一致收敛, 因此 $\int_{-\pi}^\pi f(x)\sin mx\d x=\pi b_m$.

## $\S12.2$ 傅里叶级数的收敛性

&emsp;&emsp;对 $2\pi$ 周期的 $f$, 已知 $\int_{-\pi}^\pi|f|<\oo$, 则有
$$
f(x)\sim\frac{a_0}{2}+\sum_{k=1}^\oo(a_k\cos kx+b_k\sin kx).
$$
现在考虑其部分和的收敛性.
$$
\env{aligned}{
	S_n(x_0) &= \frac{a_0}{2} +\sum_{k=1}^n\int_{-\pi}^\pi f(x)(\cos kx\cdot \cos kx_0+\sin kx\cdot \sin kx_0)\d x\\
	&= \frac{1}{2\pi}\int_{-\pi}^\pi f(x)\d x+\sum_{k=1}^n\int_{-\pi}^\pi f(x)\cos k(x-x_0)\d x\\
	&= \frac{1}{\pi}\int_{-\pi}^\pi f(x)\br{\frac{1}{2}+\sum_{k=1}^n\cos k(x-x_0)}\d x\\
	&= \frac{1}{\pi}\int_{-\pi}^\pi f(x)\frac{\sin\br{n+\frac{1}{2}}(x-x_0)}{2\sin\frac{x-x_0}{2}}\d x\\
	&=: \frac{1}{\pi}\int_{-\pi}^\pi f(x)D_n(x-x_0)\d x\\
	&= \frac{1}{\pi}\int_{-\pi}^\pi f(t+x_0)D(t)\d t\\
	&= \frac{1}{\pi}\int_0^\pi\br{f(x_0+t)+f(x_0-t)}D_n(t)\d t\\
	&=: \frac{2}{\pi}\int_0^\pi\varphi(x_0,t)D_n(t)\d t.
}
$$

> **定理 12.2.1 (Riemann 局部化)**
> $$
> \A\delta\in(0,\pi),~\lin\br{S_n(x_0)-\frac{2}{\pi}\int_0^\delta\varphi(x_0,t)\frac{\sin\br{n+\frac{1}{2}}t}{t}\d t}=0.
> $$

&emsp;&emsp;*→ Proof.* 注意函数 $\frac{1}{2\sin\frac{x}{2}}-\frac{1}{x}=\frac{x-2\sin\frac{x}{2}}{2x\sin\frac{x}{2}}$ 在 $x=0$ 时有极限, 去掉奇点后是解析的.  那么
$$
\env{aligned}{
	S_n(x_0) &= \frac{2}{\pi}\br{\int_0^\delta+\int_\delta^\pi}\cdots\\
	&= \frac{2}{\pi}\int_0^\delta\varphi(x_0,t)\frac{\sin\br{n+\frac{1}{2}}t}{t}\d t+\frac{2}{\pi}\int_0^\delta\varphi(x_0,t)\br{\frac{t-2\sin\frac{t}{2}}{2t\sin\frac{t}{2}}}{\color{red}\sin\br{n+\frac{1}{2}}t}\d t\\
	&+\frac{2}{\pi}\int_\delta^\pi\varphi(x_0,t)\frac{\color{red}\sin\br{n+\frac{1}{2}}t}{2\sin\frac{t}{2}}\d t
}
$$
两个红色适用于 Riemann 引理, 以此将对应的两个积分控制到任意小.

&emsp;&emsp;这意味着, 傅里叶级数在 $x_0$ 的收敛情况只取决于 $f$ 在 $x_0$ 的任意小的邻域上的取值.

&emsp;&emsp;利用这一结论, 我们进一步研究 $S_n$ 的收敛性.

> **引理 12.2.2**
>
> &emsp;&emsp;若 $\varphi\in R[0,\delta]$, $\varphi(0+)$ 存在, 且 $\DS\int_0^\delta\frac{|\varphi(t)-\varphi(0+)|}{t}\d t<\oo$, 则
> $$
> \lim_{\lambda\to\oo}\int_0^\delta\varphi(t)\frac{\sin\lambda t}{t}\d t=\frac{\pi}{2}\varphi(0+).
> $$

&emsp;&emsp;*→ Proof.* 由 Riemann 引理,
$$
\lim_{\lambda\to\oo}\int_0^\delta\frac{\varphi(t)-\varphi(0+)}{t}\sin\lambda t\d t=0.
$$
所以
$$
\env{aligned}{
	\lim_{\lambda\to\oo} \int_0^\delta\frac{\varphi(t)}{t}\sin\lambda t\d t &= \lim_{\lambda\to\oo}\int_0^\delta\frac{\varphi(0+)\sin\lambda t}{dt}\d t\\
	&= \varphi(0+)\lim_{\lambda\to\oo}\int_0^{\lambda\delta}\frac{\sin t}{t}\d t\\
	&= \varphi(0+)\int_0^{+\oo}\frac{\sin t}{t}\d t\\
	&= \frac{\pi}{2}\varphi(0+).
}
$$

> **推论 12.2.3 (Lipschitz)**
>
> &emsp;&emsp;若存在 $\alpha\in(0,1]$, 使得 $t$ 足够小时 $|f(x_0+t)-f(x_0)|\le C|t|^\alpha$,  则 $\varphi(x_0,t)=O(|t|^\alpha)$, 且 $S_n(x_0)\to f(x_0)$.

> **定义 12.2.4**
>
> &emsp;&emsp;若 $f(x_0\pm 0)$ 存在, 则定义
> $$
> \opn{D}_-f(x_0):=\lim_{h\to0-}\frac{f(x_0+h)-f(x_0-)}{h},\\
> \opn{D}_+f(x_0):=\lim_{h\to0+}\frac{f(x_0+h)-f(x_0+)}{h};
> $$
> 称为其左, 右广义导数.

> **推论 12.2.5**
>
> &emsp;&emsp;若 $\opn{D}_\pm f(x_0)$ 存在, 则 $\lin S_n(x_0)=\frac{f(x_0+)+f(x_0-)}{2}$.

> **推论 12.2.6**
>
> &emsp;&emsp;若 $f(x)\in R[-\pi,\pi]$ 分段可导且 $f(x\pm)$ 存在, 则
> $$
> \lin S_n(x)=\frac{f(x+)+f(x-)}{2}.
> $$

&nbsp;

> **命题 12.2.7**
>
> &emsp;&emsp;若 $\varphi$ 在 $[0,\delta]$ 单调, 则 $\lim_{\lambda\to\oo}\int_a^b\frac{\varphi(x)}{x}\sin\lambda x\d x=\frac{\pi}{2}\varphi(0+)$.

&emsp;&emsp;*→ Proof.* 不妨 $\varphi$ 单增. $\A\eps>0,~\E \delta'\in(0,\delta),~\A t\in(0,\delta'),~0\le\varphi(t)-\varphi(0+)<\eps$. 设 $\abs{\int_0^t\frac{\sin x}{x}\d x}\le M$, 则
$$
\abs{\int_0^{\delta'}(\varphi(t)-\varphi(0+))\frac{\sin\lambda t}{t}\d t}=\abs{(\varphi(\delta')-\varphi(0+))\int_\xi^{\delta'}\frac{\sin\lambda t}{t}\d t}\le 2M\eps.
$$
对于后半部分,
$$
\int_{\delta'}^\delta(\varphi(t)-\varphi(0+))\frac{\sin\lambda t}{t}\d t\overset{\lambda\to\oo}\longrightarrow 0.
$$
因此
$$
\lim_{\lambda\to\oo}\int_0^\delta(\varphi(t)-\varphi(0+))\frac{\sin t}{t}\d t=0\Ra\lim_{\lambda\to\oo}\int_0^\delta\varphi(t)\frac{\sin\lambda t}{t}\d t=\frac{\pi}{2}\varphi(0+).
$$
&emsp;&emsp;自然若 $\varphi$ 为有限个单调函数之和, 结论也成立.

> **定理 12.2.8**
>
> &emsp;&emsp;若 $f$ 在 $[-\pi,\pi]$ 逐段单调, 则
> $$
> \lin S_n(x)=\frac{f(x+)+f(x-)}{2}.
> $$

&emsp;&emsp;总之有结论: **若 $f$ 分段可导或分段单调, 则 $\lin S_n(x)=f(x)$.**

&emsp;&emsp;*例如*, 若 $f(x)=\env{cases}{-1,&x\in(-\pi,0);\\1,&x\in[0,\pi],}$ 明显 $a_k=0$,
$$
b_n=\frac{1}{\pi}\int_{-\pi}^\pi f(x)\sin nx\d x=\frac{2}{\pi}\int_0^\pi\sin nx\d x=[2\nmid n]\frac{4}{n\pi}.
$$
因此
$$
f(x)\sim\frac{4}{\pi}\serz\frac{\sin(2n+1)x}{2n+1}=\frac{f(x+)+f(x-)}{2}.
$$
与原函数不同的是, $S(0)=S(\pm\pi)=0$.

&emsp;&emsp;*例如*, 若 $f(x)=\env{cases}{\pi+x,&x\in[-\pi,0);\\\pi-x,&x\in[0,\pi),}$ 明显 $b_n=0$,
$$
a_n=\frac{2}{\pi}\int_0^\pi(\pi-x)\cos nx\d x=\cdots=\frac{2(1-(-1)^n)}{n^2\pi}.
$$
所以
$$
f(x)=\frac{\pi}{2}+\frac{4}{\pi}\ser\frac{\cos(2n-1)}{(2n-1)^2}.
$$
据此可以算出级数平方导数和, 进而容易算出自然数平方倒数和. 进一步,
$$
\env{aligned}{
	\int_0^xf(t)\d t &= \frac{\pi}{2}x+\frac{4}{\pi}\serz\int_0^x\frac{\cos(2n+1)t}{(2n+1)^2}\d t\\
	&= \frac{\pi}{2}x+\frac{4}{\pi}\serz\frac{\sin(2n+1)x}{(2n+1)^3}\\
	&= \env{cases}{
		\pi x+\frac{x^2}{2},&x\in[0,\pi];\\
		\pi x-\frac{x^2}{2},&x\in[-\pi,0].
	}
}
$$
继续不断积分可以得到更多的级数结论.

&emsp;&emsp;*例如*, 研究 $\cos ax$ 和 $\sin ax$ 的傅里叶级数. 对前者, $b_n=0$,
$$
a_0=\frac{2}{\pi}\int_0^\pi\cos ax\d x=\frac{2\sin a\pi}{ax},\\
a_n=\frac{2}{\pi}\int_0^\pi\cos ax\cos nx\d x=(-1)^n\frac{2a}{a^2-n^2}\frac{\sin ax}{\pi}.
$$
所以
$$
\cos ax=\frac{\sin a\pi}{a\pi}+\ser\frac{(-1)^n2a}{a^2-n^2}\frac{\sin a\pi}{\pi}\cos nx\\
\Ra\frac{\cos ax}{\sin a\pi}=\frac{1}{a\pi}+\ser\frac{(-1)^n2a}{a^2-n^2}\frac{\cos nx}{\pi}.
$$
令 $x=0$,
$$
\frac{1}{\sin a\pi}=\frac{1}{a\pi}+\ser(-1)^n\frac{2a\pi}{(a\pi)^2-(n\pi)^2}\\
\Ra\frac{1}{\sin z}=\frac{1}{z}+\ser(-1)^n\br{\frac{1}{z-n\pi}+\frac{1}{z+n\pi}}.
$$


&nbsp;

&emsp;&emsp;接下来, 自然地思考 $S_n(x)\to f(x)$ 的一致收敛性, 自然这里只讨论 $f\in C[-\pi,\pi]$. 我们先举例说明一致收敛不是无条件的.

&emsp;&emsp;*例如*, 定义
$$
Q_{m,n}(x)=\br{\frac{\sin mx}{n}\ops+\frac{\sin(m+n-1)x}{1}}-\br{\frac{\sin(m+n+1)x}{1}\ops+\frac{\sin(m+2n)x}{n}}
$$
对 $\sin$ 内系数和相等的各项和差化积,
$$
Q_{m,n}(x)=-2\cos(m+n)x\sum_{v=1}^n\frac{\sin vx}{v}.
$$
其中
$$
\env{aligned}{
	\sum_{v=1}^n\frac{\sin vx}{v} &= \int_0^x\sum_{v=1}^n\cos vt\d t\\
	&= \int_0^x\br{-\frac{1}{x}+\frac{\sin\br{n+\frac{1}{2}}t}{2\sin\frac{t}{2}}}\d t\\
	&= -\frac{x}{2}+\int_0^x\br{\frac{1}{2\sin\frac{t}{2}}-\frac{1}{t}}\sin\br{n+\frac{1}{2}}t\d t+\int_0^{\br{n+\frac{1}{2}}x}\frac{\sin t}{t}\d t.
}
$$
易知它是一致有界的, 不妨设它的绝对值小于 $C$ (绝对常数), 那么 $|Q_{m,n}(x)|<2C$.

&emsp;&emsp;现在取 $m_k=n_k=2^{k^3}$, $a_k=\frac{1}{k^2}$, 则
$$
\psi(x):=\sum_{k=1}^\oo\frac{1}{k^2}Q_{m_k,n_k}(x)
$$
一致收敛. $\psi(x)$ 是 $2\pi$ 周期的连续函数. 再考虑其傅里叶级数
$$
\psi(x)\sim\sum_{n=1}^\oo b_n\sin nx,
$$
部分和记为 $S_n(x)$. 则
$$
S_{2n_k-1}(x)-S_{n_k-1}(x)=a_k\br{\frac{\sin n_kx}{n_k}\ops+\frac{\sin(2k-1)x}{1}}.\qquad(*)
$$
取 $x=\frac{\pi}{4n_k}$, 则分子各项都不小于 $\frac{\sqrt 2}{2}$, 则
$$
S_{2n_k-1}(x)-S_{n_k-1}(x)>\frac{\sqrt 2}{2}\frac{1}{k^2}\br{\frac{1}{1}\ops+\frac{1}{n_k}}>\frac{\sqrt 2}{2}k\ln 2\to\oo.
$$
不一致收敛.

&nbsp;

> **引理 12.2.9**
>
> &emsp;&emsp;若 $g(x)\in\mathscr F[A,B]$, 设
> $$
> S_p=\sup_{[a,b]\sub[A,B]}\abs{\int_a^b g(t)\sin pt\d t}+\sup_{[a,b]\sub[A,B]}\abs{\int_a^bg(t)\cos pt\d t}.
> $$
> 则 $\lim_{p\to\oo}S_p=0$.

&emsp;&emsp;*→ Proof.* 对任意 $\eps>0$, 存在多项式 $f$ 使得 $\int_A^B|g(x)-f(x)|\d x<\frac{\eps}{2}$, 则
$$
\env{aligned}{
	\sup_{a,b}\abs{\int_a^bg(t)\sin pt\d t} &\le \sup_{a,b}\abs{\int_a^bf(x)\sin pt\d t} + \int_a^b|g(x)-f(x)|\d x\\
	&\le\sup_{a,b}\abs{\ev{\frac{1}{p}f\cos pt}_a^b}+\frac{\eps}{2}\\
	&\le\frac{\eps}{2}+\frac{M(\eps)^n}{p}<\eps.\quad(p\gg1)
}
$$

> **推论 12.2.10**
>
> &emsp;&emsp;若 $g(x)\in\mathscr F[a,b]$, 则
> $$
> \lim_{p\to\oo}\sup_{a,b,x}\abs{\int_a^bg(x\pm t)\u{u}(pt)\d t}=0.
> $$
> 其中 $\u{u}(pt)$ 取 $\sin pt$ 或 $\cos pt$.

> **推论 12.2.11**
>
> &emsp;&emsp;若 $\gamma(t)$ 在 $[a,b]$ 有界变差, 则
> $$
> \lim_{p\to\oo}\sup_{a,b,x}\abs{\int_a^bg(x\pm t)\gamma(t)\u{u}(t)\d t}=0.
> $$

&emsp;&emsp;不妨 $\gamma$ 单增, 用第二积分中值定理.

> **定理 12.2.12**
>
> &emsp;&emsp;设 $\varphi(t)=f(x+t)+f(x-t)-2f(x)$, $f\in\mathscr F[-\pi,\pi]$, $f|_{[a,b]}\in C[a,b]$. 已知
> $$
> \A\eps>0,~\E\delta>0,~\sup_{x\in[a,b]}\int_0^\delta\frac{|\varphi(t)|}{t}\d t<\eps,
> $$
> 则 $S_n(x)\tto f(x)~(x\in[a,b])$.

&emsp;&emsp;*→ Proof.* 考虑
$$
\env{aligned}{
	S_n(x)-f(x) &= \frac{1}{\pi}\int_0^\pi\varphi(t)\frac{\sin\br{n+\frac{1}{2}}t}{2\sin\frac{t}{2}}\d t\\
	&= \frac{1}{\pi}\br{\int_0^\delta+\int_\delta^\pi}\cdots
}
$$
其中
$$
\env{aligned}{
	\abs{\frac{1}{\pi}\int_0^\delta\cdots} &\le \frac{1}{\pi}\int_0^\delta\frac{|\varphi(t)|}{t}\frac{\frac{t}{2}}{\sin\frac{t}{2}}\d t\\
	&= \frac{1}{2}\int_0^\delta\frac{|\varphi(t)|}{t}\d t<\frac{\eps}{2}.
}
$$

> **定理 12.2.13**
>
> &emsp;&emsp;若 $f\in\mathscr F^1[-\pi,\pi]$, $f|_{[A,B]}\in C[A,B]$ 有界变差 (或 Holder 连续), 则 $S_n\tto f$ 内闭一致收敛.

&emsp;&emsp;*→ Proof.* 同上地处理. $\int_\delta^\pi$ 的部分用 Riemann 引理, 在另一部分, 由于
$$
\frac{1}{2\sin\frac{t}{2}}=\br{\frac{t-2\sin\frac{t}{2}}{2t\sin\frac{t}{2}}}+\frac{1}{t},
$$
 前一项平凡, 后一项, 用积分中值拆开, 只需处理对 $\int_\xi^\delta\frac{\sin\br{n+\frac{1}{2}}t}{t}\d t$ 的积分.

> **推论 12.2.14**
>
> &emsp;&emsp;若 $f(x)$ 是 $2\pi$ 周期的连续函数, $f|_{[-\pi,\pi]}$ 有界变差 (或 Holder 连续), 则 $S_n\tto f$.

&nbsp;

&emsp;&emsp;接下来研究平均收敛性. 设 $\sigma_n(x)=\frac{S_0(x)\ops+S_n(x)}{n+1}$, 它的收敛性是不强于 $S$ 本身的收敛性的. 计算
$$
\env{aligned}{
	\sigma_n(x) &= \frac{S_0(x)\ops+S_n(x)}{n+1}\\
	&= \frac{1}{(n+1)\pi}\int_{-\pi}^\pi f(x+t)\frac{\sum_{k=0}^n\sin\br{k+\frac{1}{2}}t}{2\sin\frac{t}{2}}\d t\\
	&= \frac{1}{(n+1)\pi}\int_{-\pi}^\pi f(x+t)\frac{\sin^2\frac{n+1}{2}t}{2\sin^2\frac{t}{2}}\d t\\
	&= \frac{1}{\pi}\int_0^\pi\br{f(x+t)+f(x-t)}\phi_n(t)\d t.
}
$$
其中
$$
\phi_n(t)=\frac{\sin^2\frac{n+1}{2}t}{2(n+1)\sin^2\frac{t}{2}}.
$$
可以验证 $\phi_n(t)\in C^\omega$, $\phi_n(-t)=\phi_n(t)$, $\phi(0)=\frac{n+1}{2}$, $\frac{1}{\pi}\int_{-\pi}^\pi\phi_n(t)\d t=1$.

> **定理 12.2.15**
>
> &emsp;&emsp;若 $f(x+2\pi)\equiv f(x)$, $\int_{-\pi}^\pi|f|\d x<\oo$, $f(x_0\pm)$ 存在, 则
> $$
> \lin\sigma_n(x_n)=\frac{f(x_0+)+f(x_0-)}{2},
> $$
> 进一步若 $f\in C(\R)$, $\sigma_n\tto f$.

&emsp;&emsp;*→ Proof.*  计算
$$
\env{aligned}{
	I_n &= \sigma_n(x) - \frac{f(x_0+)+f(x_0-)}{2}\\
	&= \frac{1}{\pi}\int_0^\pi\phi_n(t)\br{f(x+t)+f(x-t)-f(x+)-f(x-)}\d t.
}
$$
如果 $f(x_0\pm)$ 存在, 则
$$
\A\eps>0,~\E\delta>0,~\A t\in(0,\delta],~\abs{f(x\pm t)-f(\pm)}<\frac{\eps}{2\pi}.
$$
以此估算 $|I_n|=\frac{1}{\pi}\br{\int_0^\delta+\int_\delta^\pi}\cdots$. 其中
$$
\frac{1}{\pi}\abs{\int_0^\delta\cdots}\le\frac{1}{\pi}\frac{\eps}{2\pi}\int_0^\pi\phi_n(t)\d t<\frac{\eps}{2}.
$$
另一侧
$$
\frac{1}{\pi}\int_\delta^\pi\le\max_{[\delta,\pi]}\phi(t)\cdot\int_0^\xi(|f(x+t)|+|f(x-t)|)\d t.
$$
而
$$
|\phi_n|\le\frac{1}{(n+1)2\sin^2\frac{\delta}{2}}+|f(x+)|+|f(x-)|.
$$

## $\S12.3$ 其他收敛性

&emsp;&emsp;以 $\mathscr F^2[a,b]$ 表示 $[a,b]$ 上的平方可积函数类, 即 $f\in\mathscr F[a,b]$ 几乎处处连续, 只有有限个瑕点, $\int_a^b f^2<\oo$. 注意 $\mathscr F^2[a,b]\sub\mathscr F^1[a,b]$, 因为 Cauchy 不等式给出 $\int_a^b|f|\le\sqrt{\int_a^b f^2\cdot \int_a^b 1^2}$.

> **定理 12.3.1**
>
> &emsp;&emsp;若 $f\in\mathscr F^2[-\pi,\pi]$, $f\sim\frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx)$, $S_n$ 为级数前 $n$ 项和, 则
>
> &emsp;&emsp;(i) $\DS\int_{-\pi}^\pi (f-S_n)^2=\min_{T_n\in\mathscr F_n}\int_{-\pi}^\pi(f-T_n)^2$, 其中 $\mathscr F_n$ 表示不超过 $n$ 次的三角多项式集.
>
> &emsp;&emsp;(ii) $\DS\frac{a_0^2}{2}+\ser(a_n^2+b_n^2)\le\frac{1}{\pi}\int_{-\pi}^\pi f^2$.

&emsp;&emsp;*→ Proof.* 令 $T_n(x)=\frac{a_0}{2}+\sum_{k=1}^n(A_k\cos kx+B_k\sin kx)$, 利用正交性展开:
$$
\ALI{
	\int_{-\pi}^\pi(f-T_n(x))^2\d x &= \int_{-\pi}^\pi f(x)^2\d x+\pi\br{\frac{A_0^2}{2}+\sum_{k=1}^n(A_k^2+B_k^2)}\\
	&-2\pi\br{\frac{a_0A_0}{2}+\sum_{k=1}^n(a_kA_k+b_kB_k)}\\
	&= \int_{-\pi}^\pi f(x)^2\d x+\pi\br{\frac{(A_0-a_0)^2}{2}+\sum_{k=1}^n((A_k-a_k)^2+(B_k-b_k)^2)}\\
	&-\pi\br{\frac{a_0^2}{2}+\sum_{k=1}^n(a_k^2+b_k^2)}\\
	&\ge \int_{-\pi}^\pi f(x)^2\d x-\pi\br{\frac{a_0^2}{2}+\sum_{k=1}^n(a_k^2+b_k^2)}\\
	&= \min_{T_n\in\mathscr F_n}\int_{-\pi}^\pi(f(x)-T_n(x))^2\d x\ge0.
}
$$
等号成立当且仅当 $A_k=a_k$, $B_k=b_k$. 令 $n\to\oo$, 考察最后一个不等式得到
$$
\frac{a_0^2}{2}+\ser(a_n^2+b_n^2)\le\frac{1}{\pi}\int_{-\pi}^\pi f(x)^2\d x.
$$

> **引理 12.3.2**
>
> &emsp;&emsp;若 $f\in\mathscr F^2[-\pi,\pi]$, 则存在三角多项式列 $\{T_n(x)\}$, 使得
> $$
> \lin\int_{-\pi}^\pi(f(x)-T_n(x))^2\d x=0.
> $$

&emsp;&emsp;*→ Proof.* 若 $f\in R[-\pi,\pi]$, 不妨 $f(-\pi)=f(\pi)$, $\A \eps>0,~\E\Delta:-\pi=x_0<\cdots<x_n=\pi,~\sum_i\omega_i(f)\Delta x_i<\frac{\eps}{8M}$, 其中 $M=\|f\|$. 令
$$
g(x)=\frac{f(x_i)-f(x_{i-1})}{x_i-x_{i-1}}(x-x_{i-1})+f(x_{i-1})\quad(x\in[x_{i-1},x_i]),
$$
则
$$
|g(x)-f(x)|<\omega_i(f)\quad(\A x\in [x_{i-1},x_i]).
$$
因而
$$
\ALI{
	\int_{-\pi}^\pi|g(x)-f(x)|^2\d x &= \sum_{i=1}^n\int_{x_{i-1}}^{x_i}|f(x)-g(x)|^2\d x\\
	&\le 2M\sum_{i=1}^n\int_{x_{i-1}}^{x_i}|f(x)-g(x)|\d x\\
	&\le 2M\sum_{i=1}^n\omega_i(f)\Delta x_i<\frac{\eps}{4}.
}
$$
&emsp;&emsp;同时, $g(x)$ 连续, 所以存在三角多项式 $T$, 使得 $\|T-g\|<\frac{\sqrt{\eps}}{\sqrt{8\pi}}$, 这时
$$
\int_{-\pi}^\pi|T(x)-g(x)|^2\d x<\int_{-\pi}^\pi\frac{\eps}{8\pi}\d x=\frac{\eps}{4}.
$$
最终
$$
\int_{-\pi}^\pi|T(x)-f(x)|^2\d x\le 2\int_{-\pi}^\pi\br{(f-g)^2+(g-T)^2}\d x<\eps.
$$
&emsp;&emsp;接下来讨论 $f\in\mathscr F^2[-\pi,\pi]$ 的一般情况. 不妨 $\pi$ 是其唯一瑕点, $\A\eps>0,~\E\delta>0,~\int_{\pi-\delta}^\pi f(x)^2\d x<\eps/4$, 令
$$
f_1(x)=\CAS{f(x),&x\in[-\pi,\pi-\delta];\\0,&x\in(\pi-\delta,\pi].}
$$
则 $f_1\in R[-\pi,\pi]$, 根据上段结论, 存在三角多项式 $T(x)$ 使得 $\int_{-\pi}^\pi(f_1(x)-T(x))^2\d x<\eps/4$. 再设 $f_2=f-f_1$, 就有
$$
\int_{-\pi}^\pi f_2(x)^2\d x=\int_{\pi-\delta}^\pi f(x)^2\d x<\frac{\eps}{4},
$$

$$
\int_{-\pi}^\pi(f(x)-T(x))^2\d x\le2\int_{-\pi}^\pi((f_1(x)-T(x))^2+f_2(x)^2)\d x<\eps.
$$

对 $\eps>0$, 存在三角多项式 $T$, 使得
$$
\frac{1}{\pi}\int_{-\pi}^\pi(f(x)-T(x))^2\d x<\eps\pi.
$$
设 $T$ 为 $n$ 阶三角多项式, 则
$$
\int_{-\pi}^\pi(f(x)-S_n(x))^2\d x\le \int_{-\pi}^\pi(f(x)-T(x))^2\d x.
$$
所以
$$
\ALI{
	0 &\le \frac{1}{\pi}\int_{-\pi}^\pi f(x)^2\d x-\br{\frac{a_0^2}{2}+\sum_{k=1}^\oo(a_k^2+b_k^2)}\\
	&\le \frac{1}{\pi}\int_{-\pi}^\pi f(x)^2\d x-\br{\frac{a_0^2}{2}+\sum_{k=1}^n(a_k^2+b_k^2)}\\
	&\le \frac{1}{\pi}\int_{-\pi}^\pi(f(x)-T(x))^2\d x<\eps.
}
$$

> **定理 12.3.3**
>
> &emsp;&emsp;若 $f\in\mathscr F^2[-\pi,\pi]$, 则
> $$
> \frac{a_0^2}{2}+\sum_{k=1}^\oo(a_k^2+b_k^2)=\frac{1}{\pi}\int_{-\pi}^\pi f(x)^2\d x.
> $$

> **定理 12.3.4**
>
> &emsp;&emsp;若 $f,g\in\mathscr F^2[-\pi,\pi]$, 则
> $$
> \frac{1}{\pi}\int_{-\pi}^\pi f(x)g(x)\d x=\frac{a_0(f)a_0(g)}{2}+\ser(a_n(f)a_n(g)+b_n(f)b_n(g)).
> $$

&emsp;&emsp;*→ Proof.* 对 $f-g$ 和 $f+g$ 分别使用原定理即可.

&nbsp;

> **命题 12.3.5**
>
> &emsp;&emsp;若 $b_n\downarrow 0$, $f(x)=\ser b_n\sin nx$, $\ser\frac{b_n}{n}<\oo$, 则 $f\in\mathscr F^1[-\pi,\pi]$.

&emsp;&emsp;*→ Proof.* 由于
$$
\abs{\sum_{v=n+1}^{n+m}\sin vx}=\abs{\frac{\cos(n+m+\frac{1}{2})x-\cos(n+\frac{1}{2})x}{2\sin\frac{x}{2}}}\le\frac{1}{|\sin\frac{x}{2}|},
$$
记 $S_n$ 为其部分和, 则
$$
\ALI{
	\abs{\sum_{v=n+1}^{n+m}b_v\sin vx} &= \abs{\sum_{v=n+1}^{n+m}b_v(S_v-S_{v-1})}\\
	&= \abs{\sum_{v=n}^{m-1}(b_{v+1}-b_v)S_v}\\
	&\le \frac{b_{n+1}}{|\sin\frac{x}{2}|}.
}
$$
当 $x\in[\frac{\pi}{n+1},\frac{\pi}{n}]$ 时
$$
\abs{\sum_{v=n+1}^{n+m}b_v\sin vx}\le\frac{\pi}{x}b_{n+1}<(n+1)b_n.
$$
&emsp;&emsp;设 $B_n$ 为 $b$ 的部分和, 则
$$
\ALI{
	\ser\frac{B_n}{n(n+1)} &= \ser\frac{1}{n(n+1)}\sum_{k=1}^nb_k\\
	&= \sum_{k=1}^\oo b_k\sum_{n=k}^\oo\frac{1}{n(n+1)}\\
	&= \sum_{k=1}^\oo \frac{b_k}{k}=:B<\oo.
}
$$
&emsp;&emsp;回到原命题, 研究
$$
\ALI{
	\int_0^\pi|f(x)|\d x &= \ser\int_{\frac{\pi}{n+1}}^{\frac{\pi}{n}}|f(x)|\d x\\
	&\le \ser\int_{\frac{\pi}{n+1}}^{\frac{\pi}{n}}(B_n+(n+1)b_n)\d x\\
	&= \ser\frac{\pi}{n(n+1)}(B_n+(n+1)b_n)\\
	&= \pi B+\pi B<\oo.
}
$$


&emsp;&emsp;设 $f\in\mathcal F^1[-\pi,\pi]$, $f\sim\frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx)$, $F(x)=\int_0^x(f(t)-\frac{a_0}{2})\d t$, 则 $F$ 是 $2\pi$ 周期的有界变差连续函数, $F(x)=\frac{A_0}{2}+\ser(A_n\cos nx+B_n\sin nx)$, 根据广义分部积分公式:
$$
\ALI{
	A_n &= \frac{1}{\pi}\int_{-\pi}^\pi F(x)\cos nx\d x\\
	&= \ev{\frac{1}{\pi}F(x)\frac{\sin nx}{n}}_{-\pi}^\pi-\frac{1}{n\pi}\int_{-\pi}^\pi f(x)\sin nx\d x\\
	&= -\frac{b_n}{n}.
}
$$
同理 $B_n=-\frac{a_n}{n}$. 注意 $0=F(0)=\frac{A_0}{2}+\ser A_n$. 那么
$$
F(x)=\ser\frac{a_n\sin nx+b_n(1-\cos nx)}{n}.
$$
这告诉我们, 傅里叶级数总是可以逐项积分, 且积分后一定得到严格相等的傅里叶级数.

> **定理 12.3.6**
>
> &emsp;&emsp;若 $f$ 是 $2\pi$ 周期连续函数, 逐段可导, $\int_{-\pi}^\pi f'(x)^2\d x<\oo$, $\| f-S_n\|=o\br{\frac{1}{\sqrt n}}$.

&emsp;&emsp;*→ Proof.* 条件给出
$$
\frac{a_0(f')^2}{2}+\ser(a_n(f')^2+b_n(f')^2)=\frac{1}{\pi}\int_{-\pi}^\pi f'(x)^2\d x.
$$
则
$$
\eps_n:=\sum_{k=n+1}^m(a_n(f')^2+b_n(f')^2)=o(1).
$$
所以
$$
\ALI{
	\|f-S_n\| &= \l\|\sum_{k=n+1}^\oo(a_k(f)\cos kx+b_k(f)\sin kx)\r\|\\
	&\le \sum_{k=n+1}^\oo(|a_k(f)|+|b_k(f)|)\\
	&= \sum_{k=n+1}^\oo\frac{|a_k(f')|+|b_k(f')|}{k}\\
	&\le \br{\sum_{k=n+1}^\oo(|a_k(f')|^2+|b_k(f')|^2)}\br{\sum_{k=n+1}^\oo\frac{1}{k^2}}^{\frac{1}{2}}\\
	&= o(1)\cdot\frac{1}{\sqrt n}.
}
$$

> **命题 12.3.7**
>
> &emsp;&emsp;若 $f$ 可导, $2\pi$ 周期, $\int_{-\pi}^\pi|f'(x)|\d x<\oo$, 则 $a_0(f')=0$, $f=\frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx)$, 并且
> $$
> f'\sim\ser(-na_n\sin nx+nb_n\cos nx).
> $$

## $\S12.4$ 补充

**复数形式的级数**

&emsp;&emsp;由于
$$
\ALI{
	f(x) &\sim \frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx)\\
	&= \frac{a_0}{2}+\ser\br{a_n\frac{\e^{\i nx}+\e^{-\i nx}}{2}+b_n\frac{\e^{\i nx}-\e^{-\i nx}}{2\i}},
}
$$
因此在 $\{\e^{\i nx}:n\in\Z\}$ 这组基下, 定义
$$
c_0=\frac{a_0}{2},\quad c_n=\frac{a_n-\i b_n}{2},\quad c_{-n}=\frac{a_n+\i b_n}{2},
$$
就有
$$
f(x)\sim\sum_{n=-\oo}^\oo c_n\e^{\i nx}.
$$
或者说
$$
c_n=\frac{1}{2\pi}\int_{-\pi}^\pi f(x)\e^{-\i nx}\d x.
$$
(注意这里是和 $\e^{\i nx}$ 内积, 复内积取共轭.)

&nbsp;

&emsp;&emsp;若 $f$ 是 $2\ell$ 周期的, 自然地也有傅里叶级数
$$
f(x)\sim\frac{a_0}{2}+\ser\br{a_n\cos\frac{n\pi}{\ell}x+b_n\sin\frac{n\pi}{\ell}x};\\
a_n=\frac{1}{\ell}\int_{-\ell}^\ell f(x)\cos\frac{n\pi}{\ell}x\d x,\quad b_n=\frac{1}{\ell}\int_{-\ell}^\ell f(x)\sin\frac{n\pi}{\ell}x\d x.
$$
&nbsp;

**三角级数唯一性**

> **定理 12.4.1**
>
> &emsp;&emsp;若
> $$
> \frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx)=\frac{\wt{a_0}}{2}+\ser(\wt{a_n}\cos nx+\wt{b_n}\sin nx)
> $$
> 对 $x\in\R\setminus E$ 成立, $E$ 至多可数, 则 $a_n=\wt{a_n}$, $b_n=\wt{b_n}$.

&emsp;&emsp;*→ Proof.* 只需证明
$$
\br{\A x\in \R\setminus E,~\frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx)=0}\Ra a_n=b_n=0.
$$
&emsp;&emsp;我们先证明 $\lin a_n=\lin b_n=0$. 设
$$
\frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx)=\frac{a_0}{2}+\ser\rho_n\sin(nx+\varphi_n),
$$
则 $x\in\R\setminus E$ 上必有 $\rho_n\sin(nx+\varphi_n)\to 0$. 反证, 若 $\lin\rho_n\neq 0$, 则存在正常数 $c$ 和子列 $\rho_{n_k}>c$. 设 $E=\{x_1,x_2,\cdots\}$, $F=\{n_1,n_2,\cdots\}$, 一定能取出 $x_1\notin I_1$ 和 $m_1\in F$, 使得 $m_1|I_1|>2\pi$, 在其中取子区间 $J_1$ 使得 $J_1$ 上 $\sin(m_1x+\varphi_{m_1})>\frac{1}{2}$. 再取 $I_2\sub J_1$, 相应 $m_2\in F$, $J_2\sub I_2$, 以此类推. 考虑区间套 $\{I_1,J_1,I_2,J_2,\cdots\}$, 设其给出 $x\in \R$, 则总是有
$$
\sin(m_kx+\varphi_{m_k})>\frac{1}{2},\quad \rho_{m_k}\sin(m_kx+\varphi_{m_k})>\frac{c}{2}.
$$
但显然 $x\notin E$, 这与 $x$ 处的收敛性矛盾.

> **引理 12.4.2**
>
> &emsp;&emsp;设 $F\in C(a,b)$, $E\sub (a,b)$ 可数, 设
> $$
> \Delta_h^2 F(x):=F(x+2h)+F(x-2h)-2F(x),
> $$
> 已知
> $$
> \A x\in \R\setminus E,~\ol{\opn{D}}^2F:=\limsup_{h\to0+}\frac{\Delta_h^2 F(x)}{4h^2}\ge 0;
> $$
> (上式是一种广义的二阶导数) 且
> $$
> \A x\in E,~\limsup_{h\to0+}\frac{\Delta_h^2 F(x)}{h}\ge 0.
> $$
> 则 $F(x)$ 是凸的.

&emsp;&emsp;*→ Proof.* 反证, 若 $F$ 不凸, 则存在 $(\alpha,\beta)\sub(a,b)$, 使得 $F(x)-\frac{F(\beta)-F(\alpha)}{\beta-\alpha}(x-\alpha)-F(\alpha)>0$. 

&emsp;&emsp;a) 若 $\A x\in (a,b)\setminus E,~\ol{\opn{D}}^2F(x)>0$, 令
$$
G_\mu(x)=F(x)-(\mu(x-\alpha)+F(x)),\quad \mu=\frac{F(\beta)-F(\alpha)}{\beta-\alpha}+\eps,\quad 0<\eps\ll 1.
$$
以及
$$
x_0(\mu)=\arg\max_{x\in[\alpha,\beta]}G_\mu(x).
$$
注意有
$$
\ol{\opn{D}}^2G_\mu(x_0(\mu))=\ol{\opn{D}}^2F(x_0(\mu))\le 0\Ra x_0(\mu)\in E.
$$
由于 $\Delta_h^2G_\mu(x_0(\mu))\le 0$, 则
$$
\limsup_{h\to0+}\frac{\Delta_h^2G_\mu(x_0(\mu))}{h}=\limsup_{h\to0+}\frac{\Delta_h^2F(x_0(\mu))}{h}\le 0.
$$
结合条件有
$$
\limsup_{h\to0+}\frac{\Delta_h^2G_\mu(x_0(\mu))}{h}=0.
$$
同时,
$$
\Delta_h^2G_\mu(x_0(\mu))=G_\mu(x_0(\mu+2h))-G_\mu(x_0(\mu))+G_\mu(x_0(\mu)-2h)-G_\mu(x_0(\mu)).
$$
所以极限给出
$$
\limsup_{h\to0+}\frac{G_\mu(x_0(\mu+2h))-G_\mu(x_0(\mu))}{h}=0.
$$
因此
$$
\limsup_{h\to0+}\frac{F(x_0(\mu)+2h)-F(x_0(\mu))}{h}=2\mu.
$$
那么 $\mu\to x_0(\mu)$ 是单射! 这与 $x_0(\mu)\in E$ 可数矛盾!

&emsp;&emsp;*→ Proof @ 12.4.1 Cont.* 构造
$$
F(x)=\frac{a_0}{4}x^2+\ser\frac{a_n\cos nx+b_n\sin nx}{n^2},
$$
根据已证的结论, 它一致收敛, $F(x)\in C(\R)$. 计算
$$
\ALI{
	\Delta_h^2F(x) &= \frac{a_0}{4}\br{(x+2h)^2-(x-2h)^2-2x^2}\\
	&- \ser\frac{1}{n^2}a_n(\cos n(x+2h)+\cos n(x-2h)-2\cos nx)\\
	&- \ser\frac{1}{n^2}b_n(\sin n(x+2h)+\sin n(x-2h)-2\sin nx).
}
$$
展开并化简三角函数可知
$$
\frac{\Delta_h^2F(x)}{4h^2}=\frac{a_0}{2}+\ser(a_0\cos nx+b_n\sin nx)\br{\frac{\sin nh}{nh}}^2.
$$

> **引理 12.4.3**
>
> &emsp;&emsp;若 $\ser a_n=s$ 收敛, 则 $\lim_{h\to0+}\ser a_n\br{\frac{\sin nh}{nh}}^2=s$.

&emsp;&emsp;*→ Proof.* 令 $b_n(h)=\br{\frac{\sin nh}{nh}}^2$, $b_0(h)=1$; $a_0=0$, $s_n=a_0\ops+a_n$, 则
$$
\serz a_nb_n(h)=\ser(s_n-s_{n-1})b_n(h)=\serz s_n(b_n(h)-b_{n+1}(h)).
$$
设 $|s_n|<M$, 则
$$
\ALI{
	|b_{n+1}(h)-b_n(h)| &= \abs{\int_{nh}^{(n+1)h}\br{\frac{\sin^2 t}{t^2}}'\d t}\\
	&\le \int_{nh}^{(n+1)h}\abs{2\sin t\br{\cos t-\frac{\sin t}{t}}\frac{1}{t^2}}\d t.
}
$$
那么
$$
\ser|b_{n+1}(h)-b_n(h)|\le\int_0^\oo\abs{\frac{2\sin t\br{\cos t-\frac{\sin t}{t}}}{t^2}}\d t<\oo.
$$
是绝对一致收敛的. 令 $\varphi_n=b_n(h)-b_{n+1}(h)$, 则
$$
\ALI{
	\abs{\serz a_nb_n(h)-s} &= \abs{\serz(s_n\varphi_n(h)-s\varphi_n(h))}\\
	&\le \sum_{n=0}^N|s_n-s||\varphi_n(h)|+\sum_{n=N+1}^\oo|s_n-s||\varphi_n(h)|.
}
$$
所以 $\A\eps>0,~\E N,~\A n\ge N,~|s_n-s|<\eps$, 这时
$$
\ALI{
	\abs{\serz a_nb_n(h)-s} \le \sum_{n=0}^N|s_n-s||\varphi_n(h)|+\eps O(1).
}
$$
那么
$$
\limsup_{h\to0+}\abs{\serz a_nb_n(h)=s}\le\eps O(1).
$$
明所欲证.

&emsp;&emsp;*→ Proof @ 12.4.1 Cont.* 我们希望证明
$$
\ol{\opn{D}}^2F(x)=0,\\
\limsup_{h\to 0+}\abs{h\br{\frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx)\br{\frac{\sin nh}{nh}}^2}}=0.
$$
设 $s=s_1+s_2$, 其中
$$
s_1=\frac{a_0}{2}+\sum_{k=1}^N(a_k\cos kx+b_k\sin kx)\br{\frac{\sin kh}{kh}}^2,\quad s_2=\sum_{k=N+1}^\oo\cdots.
$$
对 $\eps >0$, 设 $n\ge N$ 时 $|a_k|+|b_k|<\eps$, 则
$$
|s_2h|<\eps\sum_{k=N+1}^\oo\br{\frac{\sin kh}{kh}}^2h<\eps\sum_{k=1}^\oo\br{\frac{\sin kh}{kh}}^2h=\eps\frac{\pi-h}{2}\to 0.
$$
&emsp;&emsp;利用这两条结论, $F$ 和 $-F$ 都适用于 <u>引理 14.4.2</u>, $F$ 既凸又凹, 必然是一次函数, 则 $a_0=0$, 后续系数必然全 $0$.

&nbsp;

&emsp;&emsp;在 <u>定理 14.4.1</u> 中, 将可数改为零测并不成立. 反例:
$$
f(x)=\prod_{n=1}^\oo\br{1+\frac{\cos 4^n x}{\sqrt n}}.
$$
(直接积化和差一定能得到三角级数, 因为各项展开出的圆频率互不影响.) 它几乎处处收敛到 $0$, 但系数并不全 $0$.

> **定理 12.4.4**
>
> &emsp;&emsp;若 $f(x)=\frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx)$ 在 $\R$ 处处收敛, $f(x)\in R[-\pi,\pi]$, 则
> $$
> a_n=\frac{1}{\pi}\int_{-\pi}^\pi f(x)\cos nx\d x,\quad b_n=\frac{1}{\pi}\int_{-\pi}^\pi f(x)\sin nx\d x.
> $$

&emsp;&emsp;*→ Proof.* 形式地积分两次, 令
$$
F(x)=\frac{a_0}{4}x^2-\ser\frac{1}{n^2}(a_n\cos nx+b_n\sin nx),
$$
仍考虑二阶差分 $\Delta_h^2F(x)=F(x+2h)+F(x-2h)-2F(x)$, 则
$$
\frac{\Delta_h^2 F(x)}{4h^2}=\frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx)\br{\frac{\sin nh}{nh}}^2\\
\Ra\lim_{h\to0+}\frac{\Delta_h^2F(x)}{4h^2}=f(x).
$$

> **引理 12.4.5**
>
> &emsp;&emsp;若 $F(x)\in C(a,b)$, 广义二阶导 $F^{['']}(x)=\lim_{h\to 0+}\frac{\Delta_h^2F(x)}{4h^2}\in[m,M]$ 处处存在, 则当 $x_0\in (a,b)$, $x_0\pm 2h\in(a,b)$ 时总有 $\frac{\Delta_h^2F(x_0)}{4h^2}\in[m,M]$.

&emsp;&emsp;*→ Proof.* 令 $\varphi(x)=F(x_0)+(x-x_0)\frac{F(x_0+2h)-F(x_0-2h)}{4h}+\frac{(x-x_0)^2}{2}\frac{\Delta_h^2F(x_0)}{4h^2}$, 为二次函数, 观察到
$$
\varphi(x_0)=F(x_0),\\
\ALI{
	\varphi(x_0\pm 2h) &= F(x_0)\pm\frac{F(x_0+2h)-F(x_0-2h)}{2}+\frac{F(x_0+2h)+F(x_0-2h)-2F(x_0)}{2}\\
	&=F(x_0\pm 2h).
}
$$
令 $g(x)=F(x)-\varphi(x)$, 在 $[x_0-2h,x_0+2h]$ 上, 设 $g$ 在 $x_1,x_2$ 分别取到最大值和最小值, 那么
$$
g^{['']}(x_1)\le 0\le g^{['']}(x_2),
$$
即
$$
F^{['']}(x_1)-\frac{\Delta_h^2F(x_0)}{4h^2}\le 0\le F^{['']}(x_2)-\frac{\Delta_h^2F(x_0)}{4h^2}\\
\Ra m\le F^{['']}(x_1)\le \frac{\Delta_h^2F(x_0)}{4h^2}\le F^{['']}(x_2)\le M.
$$
&emsp;&emsp;*→ Proof @ 12.4.4 Cont.* 由一致连续性,
$$
a_n\br{\frac{\sin nh}{nh}}^2=\frac{1}{\pi}\int_{-\pi}^\pi\frac{\Delta_h^2F(x)}{4h^2}\cos nx\d x,\\
b_n\br{\frac{\sin nh}{nh}}^2=\frac{1}{\pi}\int_{-\pi}^\pi\frac{\Delta_h^2F(x)}{4h^2}\sin nx\d x.
$$
那么
$$
a_n=\lim_{h\to0+}a_n\br{\frac{\sin nh}{nh}}^2=\lim_{h\to 0+}\frac{1}{\pi}\int_{-\pi}^\pi\frac{\Delta_h^2F(x)}{4h^2}\cos nx\d x.
$$
根据引理, $\frac{\Delta_h^2F(x)}{4h^2}\in[m,M]$, $\abs{\frac{\Delta_h^2F(x)}{4h^2}\cos nx}$ 有界, 控制收敛定理给出
$$
a_n=\frac{1}{\pi}\int_{-\pi}^\pi\lim_{h\to0+}\frac{\Delta_h^2F(x)}{4h^2}\cos nx\d x=\frac{1}{\pi}\int_{-\pi}^\pi f(x)\cos nx\d x.
$$
$b_n$ 同理. 事实上, 原命题条件弱化为 $f(x)\in\mathscr F[-\pi,\pi]$, 结论也成立.

&nbsp;

&emsp;&emsp;下面研究: 是否存在 $2\pi$ 周期的连续函数的傅里叶级数不处处收敛到自己. 记全体 $2\pi$ 周期连续函数构成空间 $C(\mathbb T)$, 为它配备范数 $\|\cdot\|_\oo$, 则其为 Banach 空间.

> **引理 12.4.6**
>
> &emsp;&emsp;$C(\mathbb T)$ 可数个开稠集的交集是稠密集.

&emsp;&emsp;*→ Proof.* 列出这些开稠集, 以此利用稠密性取出点, 利用开性取小圆盘, 由此得到可数个小圆盘的套, 取 Cauchy 列.

&emsp;&emsp;对 $f(x)\in C(\mathbb T)$, 设
$$
f(x)\sim\frac{a_0}{2}+\ser(a_n\cos nx+b_n\sin nx),
$$
则
$$
S_n(f,x)=\frac{a_0}{2}+\sum_{k=1}^n(a_k\cos kx+b_k\sin kx)=\frac{1}{2\pi}\int_{0}^\pi f(t)D_n(x-t)\d t,
$$
其中
$$
D_n(t)=\frac{\sin\br{n+\frac{1}{2}}t}{\sin\frac{t}{2}}.
$$
令
$$
\varphi_f(x)=\sup_{n\ge 0}|S_n(f,x)|,\\
E_m(x)=\{f\in C(\mathbb T):\varphi_f(x)>m\}.
$$

> **引理 12.4.7**
>
> &emsp;&emsp;$E_m(x)$ 是 $C(\mathbb T)$ 的开稠子集.

&emsp;&emsp;*→ Proof.* 不妨 $x=0$, 任给 $f\in E_m(0)$, 有 $\varphi_f(0)>m$, 则 $\E n\ge 0,~|S_n(f,0)|>m$. 由于 $S_n(f,0)$ 连续依赖于 $f$, 则当 $g\in C(\mathbb T)$, $\|g-f\|\ll1$ 时也有 $|S_n(g,0)|>m$, $\varphi_g(0)>m$,$g\in E_m(0)$, 所以 $E_m(0)$ 是开集.

&emsp;&emsp;对于稠密性, 设 $\eps>0$, 记 $U_\eps(f)=\{g\in C(\mathbb T):\|g-f\|<\eps\}$, 则存在三角多项式 $g\in U_{\eps/2}(f)$. 再令
$$
g_n(t)=\CAS{
	1,&D(t)\ge 1;\\
	D_n(t),&|D_n(t)|<1;\\
	-1,&D(t)\le-1.
}
$$
则 $g_n(t)$ 也是 $2\pi$ 周期连续的, 有
$$
S_n(g_n,0)=\frac{1}{\pi}\int_{-\pi}^\pi g_n(t)D_n(t)\d t=\frac{1}{\pi}\int_{-\pi}^\pi|D_n(t)|\d t+O(1).
$$
对于后者, 放缩
$$
\ALI{
	\frac{1}{2\pi}\int_{-\pi}^\pi|D_n(t)|\d t &= \frac{1}{\pi}\int_0^\pi\frac{\abs{\sin\br{n+\frac{1}{2}}t}}{\abs{\sin\frac{t}{2}}}\d t\\
	&> \frac{2}{\pi}\int_0^\pi\frac{\abs{\sin\br{n+\frac{1}{2}}t}}{t}\d t\\
	&= \frac{2}{\pi}\int_0^{\br{n+\frac{1}{2}}\pi}|\sin t|\frac{\d t}{t}\\
	&> \frac{2}{\pi}\sum_{k=1}^n\frac{1}{k\pi}\int_{(k-1)\pi}^{k\pi}|\sin t|\d t\\
	&= \frac{4}{\pi^2}\sum_{k=1}^n\frac{1}{n}\\
	&> \frac{4}{\pi^2}\ln n.
}
$$
所以 $S_n(g_n,0)>\frac{4}{\pi^2}\ln n+O(1)>\frac{1}{3}\ln n$.

&emsp;&emsp;再令
$$
h_n(x)=\frac{g_n(x)}{\sqrt{\ln n}},
$$
则 $|h_n|<\frac{1}{\sqrt{\ln n}}$, $S_n(h_n,0)>\frac{1}{3}\sqrt{\ln n}$, 令 $r_n(x)=g(x)+h_n(x)$, 则 $n\gg 1$ 时 $r_n\in U_\eps(f)$. 且
$$
S_n(r_n,0)=S_n(g,0)+S_n(h_n,0)\to \oo.
$$
$\varphi_{r_n}(0)>m$, $r_n\in E_m(0)$.

&emsp;&emsp;现在已知, $E_m(0)\cap U_\eps(f)\neq\varnothing$, $E_m(x)$ 为开稠集, 令 $E_x=\bigcap_{m=1}^\oo E_m(x)$ 为 $C(\mathbb T)$ 中的稠集, $E=\bigcap_{x\in\Q}E_x$ 同样是稠集, 这样, 对任意 $f\in E$, 其傅里叶级数在任意有理点发散.

&nbsp;

&emsp;&emsp;发散点能不能再多一点?

&emsp;&emsp;对 $f\in C(\mathbb T)$, 设 $F_n(f)=\{x\in\R:\varphi_f(x)>n\}$, 是 $\R$ 的开子集, 令 $F_f=\bigcap_{n=1}^\oo F_n(f)$ 是可数个开集的交. 当 $f\in E$ 时, $Q\sub F_f$, 则 $F_f$ 是可数开稠集的交, 因此上面构造的函数的发散性其实更强.
