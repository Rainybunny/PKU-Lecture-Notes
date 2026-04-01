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

> *Tips.*
>
> - 梳理知识概念, 积极归纳总结.
> - 打好数学基础, 习惯通用表达.
> - 做作业! 做作业! 做作业! $\to$ 动手做, 完整地做完, 并与标准答案核对.

# 第一章 运动和力

## $\S1.1$ 质点运动的描述

&emsp;&emsp;如何描述物体的运动?

- 描述的对象 $\to$ 质点
- 分析框架 $\to$ 参考系, 坐标系
- 对象的物理量 $\to$ 时间 $t$, 空间 $\bs r$.

> **定义 1.1.1 (质点)**
>
> &emsp;&emsp;质点, 具有质量但其形状和大小可以忽略的理想物体.

&emsp;&emsp;将某一物体视为质点时, 要求**针对所研究的运动学和力学问题**, 物体的形状和大小基本不产生影响.

&emsp;&emsp;意义: *化繁为简*, *由简到繁*.

&nbsp;

> **定义 1.1.2 (参考系)**
>
> &emsp;&emsp;参考系, 描述物体运动时, 被选作参考的物体.

> **定义 1.1.3 (坐标系)**
>
> &emsp;&emsp;在参考系上固定的坐标系统, 用于定量描述物体的位置与运动情况.

&emsp;&emsp;*→ Notice.* 坐标系只影响所描述物理量的形式, 不影响其本质.

&nbsp;

> **定义 1.1.4 (空间)**
>
> &emsp;&emsp;反映了物质的广延性, 与物体的体积和位置的变化联系在一起.

> **定义 1.1.5 (时间)**
>
> &emsp;&emsp;反应物理事件的顺序性

&nbsp;

> **定义 1.1.6 (位矢)**
>
> &emsp;&emsp;用来确定质点所在位置的矢量. 位矢是从坐标原点指向质点所在位置的有向线段.

&emsp;&emsp;直角坐标系中,
$$
\bs r=x\bs i+y\bs j+z\bs k,
$$
位矢的大小为
$$
r=|\bs r|=\sqrt{x^2+y^2+z^2},
$$
位矢的方向余弦 (以与 $x$ 正方向夹角 $\alpha$ 为例):
$$
\cos\alpha=\frac{x}{r},\quad\cdots
$$


> **定义 1.1.7 (运动学方程)**
>
> &emsp;&emsp;质点的位置用坐标表示为时间的函数. 描述**质点**在选定的**参考系和坐标系**框架下, **位矢 $\bs r$** 随**时间 $t$** 的变化关系.

&emsp;&emsp;直角坐标系这种,
$$
\bs r(t)=x(t)\bs i+y(t)\bs j+z(t)\bs k.
$$
将运动方程中的时间 $t$ 消去, 可以得到质点运动的轨迹方程. 例如, 对平抛运动
$$
x(t)=v_0t,~y(t)=\frac{1}{2}gt^2\Ra y=\frac{1}{2}g(x/v_0)^2.
$$
&nbsp;

> **定义 1.1.8 (位移)**
>
> &emsp;&emsp;在 $\Delta t$ 时间内, 位矢的变化量成为位移.

&emsp;&emsp;即, $\Delta\bs r=\bs r_B-\bs r_A=\vec{AB}$. 直角坐标系中也可作相应投影分解.
$$
\Delta\bs r=\Delta x\bs i+\Delta y\bs j+\Delta z\bs k,\\
|\Delta\bs r|=\sqrt{x^2+y^2+z^2}.
$$
注意区分位移 $\Delta\bs r$ 和路程 $\Delta s$. 注意区分 $\Delta\bs r$ (粗体, 表示位移) 和 $\Delta r$ (球坐标下距离原点距离变化量).

> **定义 1.1.9 (速度)**
>
> &emsp;&emsp;速度是反应质点运动的快慢和方向的物理量.
>
> - 平均速度 $\DS\bar{\bs v}=\frac{\Delta\bs r}{\Delta t}$ (c.f. 平均速率 $\DS\bar v=\frac{\Delta s}{\Delta t}$, $\bar v\not\equiv|\bar{\bs v}|$).
>
> - 瞬时速度 $\DS\bs v=\frac{\d\bs r}{\d t}$, 延轨道切向指向质点前进方向, 这里有 $\DS|\bs v|=\frac{|\d\bs r|}{\d t}=\frac{\d s}{\d t}=v$ (瞬时速度大小 $=$ 瞬时速率).

&emsp;&emsp;直角坐标系中,
$$
\bs v=\frac{\d\bs r}{\d t}=\der{t}(x\bs i+y\bs j+z\bs k)=v_x\bs i+v_y\bs j+v_z\bs k,\\
\text{where}\quad v_\#=\frac{\d\#}{\d t}.
$$

> **定义 1.1.10 (加速度)**
>
> &emsp;&emsp;$\Delta t$ 时间内, 速度增量为 $\Delta\bs v=\bs v_B-\bs v_A$. 同理有 $\DS\bar{\bs a}=\frac{\Delta\bs v}{\Delta t}$ 和 $\DS\bs a=\frac{\d\bs v}{\d t}=\frac{\d^2\bs r}{\d t^2}$.

## $\S1.2$ 抛体运动

&emsp;&emsp;对抛体运动, 常规地有
$$
\bs r=(v_0t\cos\theta)\bs i+(v_0t\sin\theta-\frac{1}{2}gt^2)\bs j,
$$
也能用 $\bs v_0$ 进一步简化为
$$
\bs r=\bs vt+\frac{1}{2}\bs gt^2.
$$
令 $x=v_0t\cos\theta$ 反解 $t$, 可知运动轨迹
$$
y=x\tan\theta-\frac{1}{2}\frac{gx^2}{v_0^2\cos^2\theta},
$$
进而得到射程和最大射高
$$
x_m=\frac{v_0^2\sin2\theta}{g},\quad y_m=\frac{v_0\sin^2\theta}{2g}.
$$
结合 <u>例题 1.4</u>.

## $\S1.3$ 圆周运动和一般曲线运动

> **定义 1.3.1 (自然坐标系)**
>
> &emsp;&emsp;在质点的运动轨迹上任意一点建立如下坐标系, 其中一根坐标轴延轨迹在该点的切线方向, 该方向的单位矢量用 $\bs e_{\u t}$ 表示, 另一坐标轴沿着该点轨迹的法线并指向曲线的凹侧, 相应的单位矢量用 $\bs e_{\u n}$ 表示, 这种坐标系就叫做**自然坐标系**.

- 延轨迹上的各点, 自然坐标轴的方向不断变化.
- 速度只有延切向方向的分量.

&emsp;&emsp;在此坐标系下,
$$
\bs v=v\bs e_{\u t}=\frac{\d s}{\d t}\bs e_{\u t}.
$$
加速度注意坐标架的运动,
$$
\bs a=\frac{\d\bs v}{\d t}=\frac{\d v}{\d t}\bs e_{\u t}+v\frac{\d\bs e_{\u t}}{\d t}.
$$
考虑 $\bs e_{\u t}$ 的一个 $\d\theta$ 的旋转, 可见 $\frac{\d\bs e_{\u t}}{\d t}$ 的长度就是 $\d\theta$, 方向平行于 $\bs e_{\u n}$, 于是
$$
\d\bs e_{\u t}=\bs e_{\u n}\d t\Ra\frac{\d\bs e_{\u t}}{\d t}=\frac{\d\theta}{\d t}\bs e_{\u n}=\omega\bs e_{\u n}.
$$
代回整理得到加速度
$$
\bs a=\frac{\d v}{\d t}\bs e_{\u t}+\frac{v^2}{R}\bs e_{\u n}=a_{\u t}\bs e_{\u t}+a_{\u n}\bs e_{\u n}.
$$

> **定义 1.3.2 (角位置, 角位移)**
>
> &emsp;&emsp;对圆周运动的物体, 以 $Ox$ 为参考方向, 有角位移 $\theta$, 角位移 $\Delta\theta$, 角速度 $\omega$, 角加速度 $\alpha=\frac{\d\omega}{\d t}$.

&emsp;&emsp;接下来考虑角量和线量的对应关系. 例如
$$
v=\frac{\d s}{\d t}=\frac{\d(R\theta)}{\d t}=R\omega;\\
a_{\u t}=\frac{\d v}{\d t}=R\alpha,\quad a_{\u n}=\frac{v^2}{R}=R\omega^2.
$$
&nbsp;

&emsp;&emsp;再进一步, 来研究一般曲线运动.

> **定义 1.3.3 (密切圆, 曲率半径)**
>
> &emsp;&emsp;对于质点在平面上运动轨迹的一点 $P$, 取其两侧 $P_1,P_2$, 三点可确定一个圆. 当 $P_1,P_2\to P$, 此时的圆成为曲线在 $P$ 点的**密切圆**. 此时密切圆的半径成为曲线在 $P$ 点的**曲率半径** $\rho$. 质点在曲线中任意一点的运动可以等效为 $R=\rho$ 的瞬时的圆周运动.

&emsp;&emsp;完全类似圆周运动, 直接给出
$$
\bs a_{\u t}=\frac{\d v}{\d t}\bs e_{\u t},\quad \bs a_{\u n}=\frac{v^2}{\rho}\bs e_{\u n}.
$$
注意 $\bs a$ 处处指向曲率中心. To some extent, 如果 $\bs a$ 反而是好求的, $\rho=\frac{v^2}{a_{\u n}}$ 也能反过来给出曲率半径. 这里尤其需要注意的是, $v$ 是速率, $\dot v$ 是速率的微分, 不一定是加速度.

## $\S1.4$ 相对运动

&emsp;&emsp;若参考系 $K(Oxyz)$ 和 $K'(O'x'y'z')$, 若 $O'$ 相对于 $O$ 的位矢是 $\bs R$, 那么 $O'$ 中位矢为 $\bs r'$ 的质点在 $O$ 中的位矢为 $\bs r=\bs R+\bs r'$. (这里假定了时空绝对性.) 如果两参考系相对平动, 即有 $\bs R=\bs ut$, 那么 $\bs r=\bs ut+\bs r'$, 时间坐标有 $t=t'$. 这被称为伽利略变换. 对于速度, 也就有 $\bs v=\bs v'+\bs u$. 还能详细地写为 $\bs v_{AB}=\bs v_{AC}+\bs v_{CB}$, 其中 $v_{AB}$ 表示 $A$ 相对 $B$ 的速度.

## $\S1.5$ 牛顿运动定律

- 牛一: 惯性定律.

&emsp;&emsp;牛顿运动定律并非在所有参考系都成立. 使牛一成立的参考系称为**惯性系**.

- 牛二: $\bs F=m\bs a$.

&emsp;&emsp;其中 $m$ 是**惯性质量**, 是平动惯性大小的量度.

- 牛三: 作用力和反作用力, $\bs F_{AB}=-\bs F_{BA}$.

&nbsp;

&emsp;&emsp;力学中的常见力:

- 万有引力: 存在于任何两个物体之间的相互作用力,
    $$
    F=G\frac{m_1m_2}{r^2}.
    $$
    其中 $m_1,m_2$ 是两个质点的**引力质量**, $r$ 为两质点的距离, $G$ 为引理常量. "通过对 $G$ 的调整, 我们让惯性质量恰好等于引力质量, 因此不必区分." 研究 $OA$ 间的力, 若 $A$ 的位矢为 $\bs r$, 则上式也能写出完整的矢量形式
    $$
    \bs F_{AO}=G\frac{m_1m_2}{r^3}\bs r.
    $$

- 重力: 地球表面物体所受地球吸引而受的力. 考虑地球自转时, (不严谨地说,) 重力是地球对物体万有引力的一个分力. 具体地, 设物体纬度角为 $\varphi$, 有 $g=g_0(1-k\cos^2\varphi)$, 其中 $k$ 由地球参数决定.

- 弹力: 发生形变的物体, 由于需要恢复原状, 对与它接触的物体会产生力的作用. 如正压力, 弹力 $\bs F=-k\bs x$, 绳中的张力. 注意, 只有不受摩擦的轻绳上的张力才处处相等.

- 摩擦力: 当物体与接触面存在相对滑动趋势时, 物体所收到接触面对它的阻力. 方向与滑动趋势方向相反.

    最大静摩擦力有 $\bs F_{\u s}=\mu_{\u s}\bs F_{\u N}$, 滑动摩擦力有 $\bs F_{\u s}=\mu_{\u k}\bs F_{\u N}$ 且*一般* $\mu_{\u k}<\mu_{\u s}<1$.

&nbsp;

&emsp;&emsp;基本相互作用力: 引力相互作用, 电磁相互作用, 强相互作用, 弱相互作用.

## $\S1.6$ 惯性系, 伽利略相对性原理, ...

> **定义 1.6.1 (惯性系)**
>
> &emsp;&emsp;是牛顿第一定律成立的参考系被称为惯性系.

&emsp;&emsp;这是一种理想的物理模型, 绝对的惯性系并不存在. 工程问题中, 可以根据研究问题的尺度选取近似的惯性系. 以此近似惯性系为基础, 可以定义出其他的惯性系, 这就是:

> **原理 1.6.2 (Galilean 相对性)**
>
> &emsp;&emsp;相对惯性系做匀速直线运动的参考系也是惯性系.

&emsp;&emsp;例如, 这一点可以指出, 不可能通过力学实验判断某物体在某参考系下是静止还是匀速直线运动.

> **定义 1.6.3 (非惯性系)**
>
> &emsp;&emsp;牛顿运动定律不成立的参考系 $\Eq$ 相对惯性系做加速运动的参考系.

> **定义 1.6.4 (惯性力)**
>
> &emsp;&emsp;为了使牛顿运动定律的形式在非惯性系内成立而引进的一个虚构的力, 满足
> $$
> \bs F_{\u I}=-m\bs a_0.
> $$
> 其中 $\bs a_0$ 是非惯性系相对惯性系的加速度. 

&emsp;&emsp;这样, 在非惯性系中, 动力学方程表示为
$$
\bs F+\bs F_{\u I}=m\bs a'.
$$

> **例子 1.6.5** (例 1-16)
>
> &emsp;&emsp;试分析物体重量与地球纬度的关系.

&emsp;&emsp;在纬度 $\varphi$ 处的惯性离心力:
$$
F_{\u I}=m\omega^2r=m\omega^2R\cos\varphi,
$$
则物体重量
$$
F_{\u g}=\sqrt{F_{\u G}^2+F_{\u I}^2-2F_{\u G}F_{\u I}\cos\varphi}.
$$
因为我们定义了 "重力" 方向是铅垂线的方向, 它其实并不指向地心, 所以这里的 $F_{\u g}$ 就是所求.

> **定义 1.6.6\* (Coriolis 力)**
>
> &emsp;&emsp;旋转体系中进行直线运动的质点, 由于惯性相对于旋转体系产生偏移的一种描述.
> $$
> \bs F_{\u c}=-2m(\bs\omega\times\bs v).
> $$

&emsp;&emsp;例如典型的傅科摆.

# 第二章 运动的守恒量和守恒定律

## $\S2.1$ 质点系的内里和外力, 质心, ...

> **定义 2.1.1 (内力, 外力)**
>
> - 内力: 质点系内各个质点间的相互作用.
> - 外力: 质点系外物体对系统内质点施加的力.

&emsp;&emsp;系统内内力成对出现, 内力和为 $0$, 对整体运动不发生影响.

> **定义 2.1.2 (质心)**
>
> &emsp;&emsp;与质量分布有关的一个代表点, 在平均意义上代表的质量分布中心.

&emsp;&emsp;对 $n$ 个质点组成的质点系 $\{(m_k,\bs r_k)\}_{k=1}^n$, 质心位矢有
$$
\bs r_{\u C}=\sum_{k=1}^n\frac{m_i\bs r_i}{m}.
$$
对质量连续分布的物体, 质心位矢有
$$
\bs r_{\u C}=\int\frac{\bs r\d m}{m}.
$$
例如, 对线分布 $\d m=\lambda\d\ell$, 面分布 $\d m=\sigma\d S$, 体分布 $\d m=\rho\d V$ 等, 可代入积分.

&emsp;&emsp;重心是重力的作用点, 尤其是在物体尺度相对地球不可忽略时, 重心和质心不一定重合.

> **定理 2.1.3 (质心运动定理)**
> $$
> \bs v_{\u C}=\frac{\d\bs r_{\u C}}{\d t}=\frac{\sum m_i\bs v_i}{m},\\
> \bs a_{\u C}=\frac{\d\bs v_{\u C}}{\d t}=\frac{\sum m_i\bs a_i}{m}\Ra m\bs a_{\u C}=\sum\bs F_i.
> $$
> 其中 $\bs F_i$ 表示质点 $i$ 受到的外力.

&emsp;&emsp;也即是, 质心的运动等同于一个质点的运动, 这个质点具有质点系的总质量, 它受到的外力为质点系受到的所有外力的矢量和.

&nbsp;

&emsp;&emsp;由牛顿运动定律, $\bs F=\der tm\bs v=\der t\bs p$, 进而
$$
\bs I:=\int_{t_1}^{t_2}\bs F\d t=\int_{\bs p_1}^{\bs p_2}\d\bs p=\bs p_2-\bs p_1.
$$

## $\S2.2$ 动量定理

> **定理 2.2.1 (动量定理)**
>
> &emsp;&emsp;质点的运动过程中, 所受合外力的冲量等于质点动量的增量.

&emsp;&emsp;可用 $\bar{\bs F}=\frac{\bs I}{\Delta t}$ 来估算平均冲力.

&emsp;&emsp;接下来研究质点系的动量定理. 例如对双质点系统, 设内力为 $\bs f$, 那么有
$$
\begin{cases}
	(\bs F_1+\bs f)\d t=\d\bs p_1\\
	(\bs F_2+\bs f')\d t=\d\bs p_2
\end{cases} \Ra (\bs F_1+\bs F_2)=\d(\bs p_1+\bs p_2).
$$
一般地,
$$
\l(\sum_i\bs F_i\r)\d t=\d\l(\sum_i\bs p_i\r)\\
\Eq\sum\int_{t_1}^{t_2}\bs F_i\d t=\sum_i\bs p_{i2}-\sum_i\bs p_{i1}=\sum_im_i\bs v_{i2}-\sum_im_i\bs v_{i1}.
$$
即, "质点系总动量的增量 等于 同一时间内作用于质点上的外力冲量的矢量和".

&emsp;&emsp;特别地, 如果系统所受外力之和为 $\bs 0$, 则系统总动量不变.

&emsp;&emsp;典型的例子是火箭推进过程, 相关推导见 P71.

&emsp;&emsp;若质量为 $m$ 的火箭在喷射了 $\d m$ 的燃气 (原文设的 $-\d m$, 留意), 燃气相对火箭速度为 $u$ (相对于喷前喷后不影响), 使火箭速度增加了 $\d v$, 那么根据动量定理,
$$
mv=(m-\d m)(v+\d v)+(v-u)\d m\\
\Ra mv=mv-v\d m+m\d v+(v-u)\d m\\
\Ra \d v=u\frac{\d m}{m}\\
\Ra v-v_0=u\ln\frac{m_0}{m}.
$$
其中 $v_0$ 和 $m_0$ 为火箭最初的速度和质量. 式中 $\frac{m_0}{m}$ 称为火箭的质量比.

&emsp;&emsp;研究燃气产生的推力, 以 $\d m$ 的燃气为研究对象, 有
$$
F_{\u{gas}}\d t=(v-u)\d m-v\d m\Ra F_{\u{gas}}=-u\frac{\d m}{\d t}.
$$

## $\S2.3$ 质点的角动量定理和角动量守恒定律

> **定义 2.3.1 (角动量)**
>
> &emsp;&emsp;质点相对参考点 $O$ 有位矢 $\bs r$, 定义其角动量
> $$
> \bs L:=\bs r\times\bs p=\bs r\times(m\bs v).
> $$

&emsp;&emsp;例如, 质点绕 $O$ 点作圆周运动时, 有 $\bs L=\bs r\times(m\bs v)$, 其大小, 方向均恒定.

> **定理 2.3.2 (质点的角动量定理)**
>
> &emsp;&emsp;质点所受合外力力矩 等于 它对同一参考点的角动量的时间变化率.

$$
\bs L=\bs r\times\bs p\\
\Ra \frac{\d\bs L}{\d t}=\der t(\bs r\times\bs p)=\frac{\d\bs r}{\d t}\times\bs p+\bs r\times\frac{\d\bs p}{\d t}.
$$

注意 $\bs v=\frac{\d\bs r}{\d t}$ 而 $\bs v\times\bs v=\bs 0$, 所以
$$
\frac{\d\bs L}{\d t}=\bs r\times\frac{\d \bs p}{\d t}=\bs r\times\bs F.
$$
后者就是合理 $\bs F$ 对参考点 $O$ 的力矩, 定义为
$$
\bs M:=\bs r\times\bs F.
$$
最终
$$
\bs M=\frac{\d \bs L}{\d t}.
$$
这和动量定理有相似性.

&emsp;&emsp;当合外力矩 $\bs M=\bs 0$, 那么 $\bs L$ 为常矢量, 质点对该参考点的角动量保持不变. (常见情况: 外力始终指向参考点.)

..................质点系?....................

&emsp;&emsp;典型的例子是行星的公转, 以中心天体为参考点, 行星的角动量保持不变. 过参考点作行星速度的垂线, 长度为 $d$, 那么 $L=mvd$ 不变, 这就是 Kepler 第二定律: 绕行行星的面积速度相等.

## $\S2.4$ 功, 能量, 动能定理

> **定义 2.4.1 (功, 功率)**
>
> &emsp;&emsp;物体在力 $\bs F$ 的作用下发生一无限小的唯一 $\d\bs r$ 时, 此力对它做的功 (元功) 定义为
> $$
> \d A=\bs F\cdot\d\bs r.
> $$
> 变力总功即 $\int_a^b\bs F\cdot\d\bs r$.
>
> &emsp;&emsp;单位时间做的功为功率,
> $$
> P=\frac{\d A}{\d t}=\frac{\bs F\cdot\d r}{\d t}=\bs F\cdot\bs v.
> $$

&emsp;&emsp;设质点在变力 $\bs F$ 的作用下沿着曲线从 $a$ 点移动到 $b$ 点, 变力所做的功为
$$
A=\int_a^bF\cos\varphi|\d\bs r|.
$$
由牛顿第二定律,
$$
F\cos\varphi=ma_{\u t}=m\frac{\d v}{\d t}\Ra F\cos\varphi|\d\bs r|=m\frac{\d v}{\d t}\d s=mv\d v.
$$
因此
$$
A=\int_{v_a}^{v_b}mv\d v=\frac{1}{2}mv_b^2-\frac{1}{2}mv_a^2.
$$

> **定义 2.4.2 (动能)**
>
> &emsp;&emsp;定义质点的动能 $E_{\u k}=\frac{1}{2}mv^2$.

&emsp;&emsp;则 $A_{ab}=E_{\u kb}-E_{\u ka}=\Delta E_{\u k}$. 这就是:

> **定理 2.4.3 (动能定理)**
>
> &emsp;&emsp;惯性系中, 力对质点所做的功等于质点动能的增量.

&emsp;&emsp;在非惯性系中补充上惯性力, 动能定理才能成立. 这也相当于补充上惯性力的做功.

## $\S2.5$ 保守力, 成对力的功, 势能

> **定义 2.5.1 (保守力)**
>
> &emsp;&emsp;做功与路径无关, 只与始末位置有关的力称为保守力, 反之为非保守力 (还与路径有关).

&emsp;&emsp;非保守力如摩擦力, 空气阻力. 上述概念也立即给出: 保守力沿任何闭合路径做功等于 $0$, 即
$$
\oint_L\bs F_{\u c}\cdot\d\bs r=0.
$$
例如, 万有引力做功, 设 $m$ 星体距离重心星体 $m'$ 的距离为 $r$, 位矢为 $\bs r$, 有
$$
\bs F=-G\frac{mm'}{r^3}\bs r,\\
\d A=\bs F\cdot\d\bs r=G\frac{mm'}{r^2}\cos\alpha|\d\bs r|;
$$

其中 $\alpha=\lang \bs r,\bs v\rang$, 继而有

$$
-|\d\bs r|\cos\alpha=|\d\bs r|\cos(\pi-\alpha)=\d r\\
\Ra A=-Gmm'\int_{r_a}^{r_b}\frac{\d r}{r^2}=-Gmm'\l(\frac{1}{r_a}-\frac{1}{r_b}\r).
$$

所以万有引力是保守力.

&nbsp;

&emsp;&emsp;设质点 $m_1$ 和 $m_2$ 之间存在一堆相互作用力 $\bs F_1$ 和 $\bs F_2$, 在 $\d t$ 时间内分别经过元位移 $\d\bs r_1$ 和 $\d\bs r_2$, 这一对力所做的元功为
$$
\begin{aligned}
	\d A &= \bs F_1\cdot\d\bs r_1+\bs F_2\cdot\d\bs r_2\\
	&= \bs F_2\cdot(\d\bs r_2-\d\bs r_1)\\
	&= \bs F_2\cdot\d\bs r_{21}.
\end{aligned}
$$
其中 $\bs r_{21}$ 表示 $m_2$ 相对于 $m_1$ 的位移. 因此:

- 成对作用力和反作用力所做的总功只与作用力及相对位移有关, 而与每个质点各自的运动无关.
- 质点减的相对位移和作用力都不随参考系而变化, 因此任何一对作用力和反作用力所做的总功与参考系无关.

&emsp;&emsp;基于此, 保守力做功可以看做能量的积累和释放. 所以自然地引入

> **定义 2.5.2 (势能)**
>
> &emsp;&emsp;与物体的位置相联系的系统能量称为势能.

&emsp;&emsp;一对保守力的功可以写成如下形式:
$$
A_{ab}=-(E_{\u pb}-E_{\u pa})=-\Delta E_{\u p}.
$$
所以, 成对保守内力的功等于系统势能的减少.

- 重力势能, 若取 $E_{\u pb}\mid_{h_b=0}=0$, $E_{\u p}=mgh$.
- 引力势能, 若取 $E_{\u pb}\mid_{r_b=\oo}=0$, $E_{\u p}=-G\frac{mm'}{r}$.
- 弹性势能, 若取 $E_{\u pb}\mid_{x_b=0}=0$, $E_{\u p}=\frac{1}{2}kx^2$.

&emsp;&emsp;已知势能函数, 可以计算保守力, 即有 $\d A=-\d E_{\u p}$, 那么
$$
\d A=\bs F_x\d x\Ra\bs F_x=-\frac{\d E_{\u p}}{\d x}.
$$

## $\S2.6$ 质点系的功能原理, 机械能守恒定律

> **定理 2.6.1**
>
> &emsp;&emsp;系统的外力和内力做功的总和等于系统动能的增量.

&emsp;&emsp;同时, 内力的功可以分为保守内力做功和非保守内力做功,
$$
A_{\u i}=A_{\u{ic}}+A_{\u{id}}\\
\Ra A_{\u e}+A_{\u{id}}=\Delta E_{\u k}-A_{\u{ic}}=\Delta E_{\u k}+\Delta E_{\u p}=\Delta E.
$$

> **定理 2.6.2 (质点系的功能原理)**
>
> &emsp;&emsp;系统机械能的增量等于外力的功与非保守内力的功的总和.

&emsp;&emsp;在非惯性系中, 自然也需要加入惯性力的修正; 然而在质心系中, 由于惯性力做功为 $0$, 则无需修正. 另一方面, 如果系统内的非保守内力和外力做功都为 $0$, 即 $A_{\u e}=A_{\u{id}}=0$, 就有 $\Delta E=0$, 机械能守恒. 对孤立系统, $A_{\u e}=0$, 则 $A_{\u{id}}=\Delta E$, 能量守恒.

&emsp;&emsp;一些例题见书.

## $\S2.7$ 碰撞

&emsp;&emsp;微观粒子间的非接触相互作用 (散射) 也可以被视为碰撞.

> **定律/定义 2.7.1 (牛顿运动定律, 恢复系数)**
>
> &emsp;&emsp;碰撞后两球的分离速度与碰撞前两球的接近速度成正比, 比值由两球的材料性质决定, 即恢复系数.
> $$
> e=\frac{v_2-v_1}{v_{10}-v_{20}}.
> $$

&emsp;&emsp;可见, 完全弹性碰撞有 $e=1$, 能量守恒; $e=0$ 为完全非弹性碰撞. 碰撞中的机械能损失可以给为
$$
\Delta E=-\frac{1}{2}(1-e^2)\frac{m_1m_2}{m_1+m_2}(v_{10}-v_{20})^2.
$$
对非弹性碰撞, 利用动量守恒和 $e$ 给出的比值, 最终解出
$$
\begin{cases}
	\DS v_1=v_{10}-\frac{(1+e)m_2(v_{10}-v_{20})}{m_1+m_2},\\
	\DS v_2=v_{20}-\frac{(1+e)m_1(v_{20}-v_{10})}{m_1+m_2}.
\end{cases}
$$

## $\S2.8$ 对称性和守恒定律

- 空间平移对称性 $\to$ 动量守恒定律 $\d E/\d x=F=0$.
- 旋转平移对称性 $\to$ 角动量守恒定律 $\d E/\d\theta=L=0$.
- 时间平移对称性 $\to$ 能量守恒定律 $\d E/\d t=0$.

# 第三章 刚体和流体运动

## $\S3.1$ 刚体模型及其运动

> **定义 3.1.1 (刚体)**
>
> &emsp;&emsp;刚体是考虑物体的质量和形状大小, 但忽略其形变的物理模型.

&emsp;&emsp;因此, 可以视作质量连续分布且任意两质量元之间相对距离保持不变的质点系.

> **定义 3.1.2 (平动)**
>
> &emsp;&emsp;当刚体运动时, 若刚体内任何一条给定的直线在运动中始终保持方向不变, 这种运动叫平动.

&emsp;&emsp;平动时, 刚体内各质点在任意时刻具有相同的速度和加速度. 这样, 刚体内任何一个质点的运动都可以代表整个刚体的运动, 如质心.

> **定义 3.1.3 (转动)**
>
> &emsp;&emsp;如果刚体的各个质点在运动中都绕统一直线做圆周运动, 这种运动就叫转动, 这一直线称为转轴. 若转轴固定不动, 则叫做定轴转动.

&emsp;&emsp;可以证明, 刚体的一般运动可以看做是平动和转动的叠加.

> **定义 3.1.4 (自由度)**
>
> &emsp;&emsp;决定系统在空间的位置所需要的独立坐标的数目称为自由度.

&emsp;&emsp;分析运动刚体的自由度. 刚体运动可视为质心平动 + 绕质心轴的转动. 对质心平动, 有 $3$ 个平动的自由度; 对过质心轴, 有 $2$ 个自由度 $(\theta,\varphi)$; 对定轴转动的角位置, 有 $1$ 个自由度 $\psi$. 因此, 自由刚体有 $6$ 个自由度.

## $\S3.2$ 力矩, 转动惯量, 定轴转动定律

**力矩**

&emsp;&emsp;对于定轴转动, 同一时间内, 各点转过的角度相同, 称为角位移. 若用角量表示运动, 和直线运动类似.

&emsp;&emsp;若转动轴为 $z$ 轴, 由于内力合力矩为 $\bs 0$, 只需考虑外力矩. 明显, 只有垂直转轴的外力分量才能产生沿转轴方向的力矩 $\bs M_z$. 即 $\bs M_z=\bs r\x\bs F_{xy}$, 其中 $\bs F_{xy}$ 为 $\bs F$ 在垂直 $z$ 轴平面的投影, $\bs M_z$ 称为 $\bs F$ 对转轴 $oz$ 的力矩.

&nbsp;

**角速度矢量**

&emsp;&emsp;角速度的方形: 与刚体转动方向呈右手螺旋关系. 由于定轴转动中角速度方向沿着转轴方向, 因此, 计算中可以用正负表示其方向.

&emsp;&emsp;这里就有 $\bs v=\bs\omega\times\bs r$.

&nbsp;

**定轴转动定律**

&emsp;&emsp;对刚体质元 $\Delta m_i$, 受外力 $\bs F_i$ 和内力 $\bs F_i'$. 因而
$$
\bs F_i+\bs F_i'=\Delta m_i\bs a_i.
$$
采用自然坐标系, 上式的切向分量为
$$
F_i\sin\varphi_i+F_i'\sin\theta_i=\Delta m_ia_{\u ti}=\Delta m_ir_i\alpha.
$$
其中 $\varphi,\theta$ 分别为对应的力与 $\bs r$ 的有向角. 两侧乘上 $r_i$,
$$
F_ir_i\sin\varphi_i+F_i'r_i\sin\theta_i=\Delta m_ir_i^2\alpha
$$
内力矩之和为 $\bs 0$, 这就给出
$$
\bs M_z=\l(\sum_i\Delta m_ir_i^2\r)\bs\alpha.
$$
&emsp;&emsp;定义
$$
J=\sum_i\Delta m_ir_i^2
$$
称为刚体的转动惯量. 这样
$$
\bs M_z=J\bs\alpha=J\frac{\d\bs\omega}{\d t}.
$$
即, 刚体的角加速度与合外力矩成正比, 与转动惯量成反比. 此外, 对于连续问题, 就有
$$
J=\int r^2\d m.
$$
转动惯量取决于刚体本身的性质和转轴的位置.

&nbsp;

**平行轴定理**

&emsp;&emsp;刚体对任意转轴的转动惯量 $J$ 与过质心的平行转轴的转动惯量 $J_C$ 满足关系

$$
J=J_C+mh^2.
$$

其中 $h$ 为两转轴平行距离.

&emsp;&emsp;以一维情况为例,
$$
J=\int(x+h)^2\d m=\int x^2\d m+h^2\int\d m+2h\int x\d m=J_C+mh^2+2hmx_C=J_C+mh^2.
$$
&nbsp;

**垂直轴定理**

.......................

## $\S3.3$ 定轴转动的功能关系

**力矩的功**

&emsp;&emsp;根据 $\S2.5$ 的推导, 刚体内成对内力不做功.
$$
\d A_i=\bs F_i\cdot\d\bs r_i=F_i\d s_i\cos\beta=F_i\sin\varphi_ir_i\d\theta=M_i\d\theta.
$$
因此
$$
\d A=M\d\theta,\quad A=\int_{\theta_0}^{\theta_1} M\d\theta.
$$
&nbsp;

**刚体的转动动能**
$$
E_{\u k}=\sum_i\frac{1}{2}\Delta m_iv_i^2=\sum_i\frac{1}{2}\Delta m_ir_i^2\omega^2=\frac{1}{2}J\omega^2.
$$
可以验证上面的推导遵从动能定理.

## $\S3.4$ 定轴转动刚体的角速度定理, 角动量守恒定律

**刚体的角动量**

&emsp;&emsp;例如对刚体杆, 设转轴过其上的 $O$ 点, 对质元 $\Delta m_i$ 有
$$
\Delta\bs L_i=\Delta\bs R_i\x(\Delta m_i\bs v_i)\\
\Ra\bs L=\sum_i\Delta\bs R_i\x(\Delta m_i\bs v_i).
$$
沿轴方向,
$$
L_z=\sum_i\Delta L_i\cos\theta=\sum_i\Delta m_iR_iv_i\cos\theta=\sum_i\Delta m_ir_i^2v_i=J\omega.
$$
因此
$$
\bs L_z=J\bs\omega.
$$
把 $\bs L_z$ 称为刚体绕定轴转动的角动量, 它本质上是相对转动点的角动量沿转动轴方向的分量.

&nbsp;

**定轴转动刚体的角动量定理**
$$
\bs M_z=J\frac{\d\bs\omega}{\d t}=\frac{\d(J\bs\omega)}{\d t}=\frac{\d\bs L_z}{\d t}.
$$
这形似于动量定理. 这也给出
$$
\int_{t_0}^t\bs M_z\d t=J\bs\omega-J\bs\omega_0.
$$
左侧可被称为 $\bs M_z$ 在 $t_0\sim t$ 时间段内对刚体做的冲量矩.

&emsp;&emsp;事实上, 对绕同一定轴转动的刚体系, 也有
$$
\bs L_z=\sum_iJ_i\bs\omega_i\Ra\bs M_z=\der t\sum_{i}J_i\bs\omega_i.
$$
因此, 当物体在 $z$ 方向的合力外矩为 $\bs 0$ 时, 物体对转轴的角动量保持不变. 再如对非刚体的情况, 若无合外力矩, $J$ 增大时 $\omega$ 则减小, vice versa.

## $\S3.5$ 刚体的平面平行运动

&emsp;&emsp;刚体的平面平行运动可以分解为平动和绕某一轴的转动.

&emsp;&emsp;**质心法**: 质心的平动 + 相对质心轴的转动 (此时惯性力对合外力矩无贡献).

刚体相对于面内某点 $O$ 的角动量大小为 ($\bs\ell_{CO}$ 为 $C$ 相对 $O$ 的位矢.)
$$
\bs L_O=\bs\ell_{CO}\x(m\bs v_C)+J_C\bs \omega.
$$
总动能
$$
E_{\u k}=\frac{1}{2}mv_C^2+\frac{1}{2}J_C\omega^2.
$$

&emsp;&emsp;**瞬心法**: 对平面平行运动的刚体, 其运动的任意时刻必然存在一点, 刚体的运动可以看做绕该点的转动. 该点称为刚体运动的瞬时转动中心, 即瞬心. 设瞬心为 $O$, 此时刚体上任意一点的速度满足
$$
\bs v_i=\bs\omega\x\bs R_{Oi}.
$$

## $\S3.6$ 进动

&emsp;&emsp;进动: 物体绕自旋轴告诉旋转的同时, 其自旋轴还绕另一个轴转动的现象. 又称回转效应. 其本质为外力矩引起的角动量方向的变化.

&emsp;&emsp;设陀螺质量为 $m$, 以角速度 $\omega$ 自转. 重力对固定点 $O$ 的力矩 $\bs M=\bs r\x(m\bs g)$, 绕自身轴转动的角动量 $\bs L=J\bs\omega$. 设公转偏角 $\varphi$, 自转周与公转轴夹角 $\varphi$, $|\d\bs L|=|\bs L|\sin\theta\cdot\d\varphi=J\omega\sin\theta\cdot\d\varphi$. 由角动量定理, $|\d\bs L|=|\bs M|\d t\Ra J\omega\sin\theta\d\varphi=M\d t$.

&emsp;&emsp;最终有陀螺的进动角速度
$$
\omega_{\u p}=\frac{\d\varphi}{\d t}=\frac{mgr}{J\omega}.
$$
因此

- $\omega_{\u p}$ 只与 $\omega$ 有关, 与 $\theta$ 无关;
- 进动轴过定点且与外力平行;
- 进动方向取决于外力矩和自转角速度的方向;
- 角速度不能满足上述稳定条件时, $\theta$ 会周期性变化, 称为章动.

## $\S3.7$ 流体力学入门

&emsp;&emsp;流体: 具有连续性的连续介质. 实际流体具有可压缩性和粘滞性. 可近似认为无可压缩性和粘滞性的流体称为理想流体.

&emsp;&emsp;流速场: 流体微元经过每个空间点的流速, 研究它们的空间分布和随时间的演化规律.

&emsp;&emsp;流线: 曲线上每一点的切线方向, 与流体的运动方向相同.


# 第四章 相对论基础 \*

&emsp;&emsp;伽利略变换与电磁理论给出的真空光速恒等于 $c$ 矛盾.

&emsp;&emsp;迈克尔逊莫雷实验.

**狭义相对论**

- 相对性原理: 物理定律在一切惯性系中有相同的数学表达形式.
- 光速不变原理: 在任一惯性系中, 所测得的光在真空中的传播速度都是相同的.

据此推导出的时空坐标变换关系称为洛伦兹变换.

**洛伦兹变换**

&emsp;&emsp;设坐标变换 $x=a_{11}x'+a_{12}t'$, $t=a_{21}x'+a_{22}t'$. 根据相对性原理, $-x'=a_{11}(-x)+a_{12}t$, $t'=a_{21}(-x)+a_{22}t$, 代回原式, 令 $x,t$ 的系数为 $0$, 得到两方程. 同时 $x'=0$ 点恒为 $x=vt$, 得到第三个方程.

&emsp;&emsp;这时令 $t=t'$ 即为伽利略变换. 但根据光速不变原理, 应当有 $c=x/t=x'/t'$, 得到第四个方程.

&emsp;&emsp;速度变换: 注意应当求 $\d x'/\d t'$ 而非 $\d x'/\d t$. 结论是
$$
u_x'=\frac{u_x-v}{1-\frac{v}{c^2}u_x}.
$$
$u_y',u_z'$ 的形式略有不同.

&emsp;&emsp;斐索实验: 相对论正确解释流动水流中的光速变化.

&emsp;&emsp;现象:

- "同时" 的相对性.
- 动钟变慢.
- 尺缩效应

&emsp;&emsp;惯性系下双生子佯谬: 时钟 "同时" 校准在另一参考系下不 "同时". 二者均觉得另一参考系下的时钟更慢.

&emsp;&emsp;要闹吃动量守恒定律的形式不变, 物体的质量必须发生变化: $m(v)=m_0\gamma$. 据此修正牛二 $\bs F=\d\bs p/\d t$, 在 $v$ 接近 $c$ 时, 外力主要驱动质量的改变. 以此基础 $\d E_{\u k}=\bs F\d\bs r=c^2\d m$, 可得 $E_{\u k}=mc^2-m_0c^2$. 也就是
$$
mc^2=E_{\u k}+m_0c^2.
$$
"物质的能量正比于物质的相对论质量."

**广义相对论**

- 弱等效原理: 引力场与相应的加速参考系等效.
- 强等效原理: "引力场导致时空弯曲".

双生子佯谬: "谁变速 (经历引力场), 谁变慢".

# 第一章 气体动理论与统计力学初步

**\[UPD 26/4/1\]** 这里应该是按照教材编的章节号.

- 热运动: 物质的一种基本运动形式, 是构成宏观物体的大量微观粒子永不停息的无规则运动.
- 热现象: 组成物体的大量粒子热运动的集体表现.
- 热学: 研究物体热现象和热运动规律的学科.

## $\S1.1$ 温度与热平衡

**温度**

&emsp;&emsp;理论定义: 护卫热平衡的系统具有一个数值相等的共有属性, 定义为温度.

&emsp;&emsp;温标换算: $t/\degree\u C=T/\u K-273.15$.

&nbsp;

**热平衡**

&emsp;&emsp;温度测量的依据: 两个处于热平衡的物体 (热力学系统) 冷热程度是相同的, 它们的温度也相同.

&emsp;&emsp;**平衡态**: 不受外界影响的条件下, 无论初始状态如何, 系统的宏观性质在经充分长时间后不再发生变化的状态. 是一个理想化的模型. *(稳定态或定常态不一定是平衡态.)*

&emsp;&emsp;一定质量的气体的平衡态可以用一组状态参量 ($p,V,T$) 来表示.

&emsp;&emsp;从微观角度, 存在无规则热运动, 又称为**热动平衡状态**:

- 是一个**动态平衡**: 系统宏观量不随时间改变.
- **存在涨落**. 分子数越多, 涨落就越小.

&emsp;&emsp;当气体的外界条件改变时, 气体从一个状态不断地变化到另一状态, 如果状态变化过程进展得十分缓慢, 使所经历的一系列中间状态都无限接近平衡状态, 这个过程就叫做**准静态过程**, 或**平衡过程**.

&emsp;&emsp;**弛豫时间**: 热力学系统由初始状态达到平衡态所经历的时间. 如果弛豫时间远小于外界变化的时间尺度 (外界条件的变化速率相对于系统自身由非平衡态趋向于平衡态的速率足够缓慢), 可以做平衡态近似.

&emsp;&emsp;**热平衡定律 (热零)**: 如果两个物体都与第三个物体处于热平衡, 则它们彼此处于热平衡.

## $\S1.3$ 理想气体

**状态参量**

&emsp;&emsp;一组状态参量描述一个平衡态, 一个平衡态对应一个状态参量. 对理想气体有 $pV=nRT$. 因此 $p,V,T$ 中任意两个量一定, 就能确定系统的状态.

&nbsp;

**理想气体的微观模型**

&emsp;&emsp;分子热运动: 大量分子做永不停息的无规则运动. 基本特征: 分子的永恒运动与频繁的相互碰撞.

&emsp;&emsp;平衡态统计假设: 平衡态时, 气体分子数密度分布均匀; 分子沿着各个方向运动的机会是均等的, 没有任何一个方向上气体分子的运动比其他方向更占优势.

&emsp;&emsp;微观量 & 宏观量 & 统计方法.

&emsp;&emsp;**力学假设**:

- 分子线度与间距相比可忽略;
- 忽略碰撞瞬间外的分子间相互作用;
- 分子在运动中遵守经典力学规律, 假设碰撞为弹性碰撞;
- 忽略分子重力.

&emsp;&emsp;**统计假设**:

- 平衡态时, 气体分子数密度 $n$ 分布均匀.

- 平衡态时, 想通速率的分子沿各个方向运动的平均分子数相等.
    $$
    \ol{\bs v_x}=\ol{\bs v_y}=\ol{\bs v_z}=\bs 0,\\
    \ol{v_x^2}=\ol{v_y^2}=\ol{v_z^2}=\frac{1}{3}\ol{v^2}.
    $$

&emsp;&emsp;依赖此假设可求得理想气体压强
$$
p=\frac{1}{3}nm_0\ol{v^2}=\frac{2}{3}n\ol{\eps_k}.
$$
设分子质量为 $m_0$, 分子数为 $N$, 数密度为 $n$, 那么
$$
m=Nm_0,\quad M=N_{\u A}m_0,\\
pV=\frac{m}{M}RT=\frac{Nm_0}{N_{\u A}m_0}RT=NkT.
$$
其中玻耳兹曼常量
$$
k=\frac{R}{N_{\u A}}=1.38\x10^{-23}\u{J/K}.
$$
进一步得到
$$
p=nkT.
$$
称为理想气体物态方程. 另一方面,
$$
\ol{\eps_k}=\frac{3}{2}kT.
$$
这反映了微观量的统计平均值和宏观量之间的关系, 指出了温度的统计意义: 温度标志着物体内部分子热运动的剧烈程度, 它是大量分子热运动的动能的统计平均值的度量. 另一个常用单位: $kT=0.026e\u V~(T=300\u K)$. 再有方均根速度
$$
v_{\u{rms}}=\sqrt{\ol{v^2}}=\sqrt{\frac{3kT}{m_0}}=\sqrt{\frac{3RT}{M}}.
$$


## $\S1.4$ 能量均分定理

**分子的自由度**

&emsp;&emsp;自由度 ($i$): 决定某物体在空间的位置所需要的独立的坐标数.

&emsp;&emsp;单原子: $i=3$. 双原子: $i=5$. 多原子 (不共线): $i=6$.

**能量按自由度均分定理**

&emsp;&emsp;分子的平均平动动能 $\frac{3}{2}kT$ 是均匀地分配在每个平动自由度上的, 每个平动自由度都具有相同的平均动能 $\frac{1}{2}kT$.

&emsp;&emsp;每个自由度都具有相同的平均动能 $\frac{1}{2}kT$, 那么分子平均动能 $\ol\eps=\frac{i}{2}kT$.

**理想气体的内能与热容**

&emsp;&emsp;气体的内能: 所有分子的热运动动能和分子间相互作用势能的总和.

&emsp;&emsp;理想气体内能: 气体中所有分子的平均动能的总和.

&emsp;&emsp;**一定量的理想气体, 其内能只是温度的单值函数.**

&emsp;&emsp;理想气体的定体热容:
$$
C_V=\l(\frac{\part E}{\part T}\r)_V.
$$
注意
$$
C_V^{\u{mol}}=\frac{M}{m}C_V=\frac{1}{2}R(t+r+2s).
$$
只与分子类型 (单原子, 多原子, ...) 有关. *实验表明: 随温度升高, 自由度逐渐激发.*

## $\S1.5$ 概率与统计性规律

**统计规律性的概念**

&emsp;&emsp;大量随机试验结果存在一定规律性. 大量**偶然性**从整体上体现的**必然性**.

&emsp;&emsp;大量分子的集体表现存在一定规律性. 在一定宏观条件下, 某一时刻系统以一定的概率处于某一微观运动状态.

&emsp;&emsp;统计规律特点:

- 只对大量偶然的时间才有意义.
- 它是不同于个体规律的整体规律.
- 大数量现象在宏观下具有稳定性.

**统计力学的任务**

&emsp;&emsp;对平衡态下的热现象进行微观描述, 然后运用统计规律的方法求得:

- 宏观量与微观量的统计平均值的关系, 解释宏观量的微观本质.
- 平衡态下微观量的统计分布.

**数学补充**

- 概率, 离散/连续型随机变量, 概率密度函数.
- 统计平均值. $\ol\xi=\lin\sum\xi_in_i/n=\sum\xi_iP_i$. $\ol x=\int x\d P(x)=\int x\rho(x)\d x$.

&emsp;&emsp;对连续型随机变量 $x$ of 分布 $f(x)$, 有归一性 $\int f(x)\d x=1$, 平均值 $\ol x=\int xf(x)\d x$. 对物理量 $G=G(x)$, 就有 $\ol G=\int G(x)f(x)\d x$.

&emsp;&emsp;分子速率分布函数: $f(v)=\frac{1}{N}\frac{\d N}{\d v}$. 例如麦克斯韦速率分布:
$$
f(v)=4\pi\l(\frac{m_0}{2\pi kT}\r)^{\frac{3}{2}}e^{-\frac{m_0v^2}{2kT}}v^2.
$$
对分布函数 $f(\bs v)$, 应当有
$$
f(\bs v)=\frac{\d N_{\bs v}}{N\d\bs v}=\frac{\d N_{\bs v}}{N\d v_x\d v_y\d v_z}.
$$
由麦克斯韦分布可推知分子速率的统计值. 令 $b=m_0/(2kT)$,
$$
\ol v=\int_0^\oo vf(v)\d v=4\pi(b/\pi)^{3/2}\int_0^\oo v^3e^{-bv^2}\d v.
$$
已知有
$$
\int_0^{\oo}v^3 e^{-bv^2}\d v=\frac{1}{2b^2},
$$
因此
$$
\ol v=\sqrt{\frac{8kT}{\pi m_0}}=\sqrt{\frac{8RT}{\pi M}}\approx1.60\sqrt{RT/M}.
$$
方均根速率
$$
\sqrt{\ol{v^2}}=\sqrt{\frac{3kT}{m_0}}=\sqrt{\frac{3RT}{M}}\approx1.73\sqrt{RT/M}.
$$
结合微观视角下理论压强 $p=\frac{1}{3}nmv^2$, 可知 $p=nkT$.

&emsp;&emsp;最概然速率
$$
v_{\u p}=\sqrt{\frac{2kT}{m_0}}=\sqrt{\frac{2RT}{M}}\approx1.41\sqrt{RT/M}.
$$
**注意三者大小关系和推导方法.** 注意这三个量各自可以直接反过来决定分布曲线. 例如 $v_{\u p}$ 相同 $f(v)$ 就一定相同, 与气体种类无关. 令 $W=v/v_{\u p}$, 也可以优化速率分布的形式.

&emsp;&emsp;玻尔兹曼则给出势能分布 $f_B(\bs r)=C_0e^{-\frac{\eps_{\u p}}{k_BT}}$, 与麦克斯韦的 $f_M(v)$ 相乘则获得麦克斯韦玻耳兹曼分布律
$$
f_{MB}(\eps)=Ce^{-\frac{\eps}{k_BT}}.
$$
*速度分布律推理想气体压强?*

**粒子按能量分布?**

- 能级 $\eps_1,\eps_2,\cdots$.
- 能级上粒子数 $N_1,N_2,\cdots$.
- 平均粒子数 $\ol{n_1},\ol{n_2},\cdots$.
- 概率 $P_1,P_2,\cdots$.
- 约束条件: $N=\sum N_i$ 守恒, $E=\sum\eps_iN_i$ 守恒.

假设所有微观态的出现概率相等. 占有数 (平均能级) $\ol n_j=n_{j1}p_1+n_{j2}p_2+\cdots$, 其中 $j$ 表示某微观态, $n_{j\cdot}$ 表示各能级上的粒子数.

## $\S1.7$ 微观态和统计力学的基本原理

**微观态**

&emsp;&emsp;组成系统的所有微观粒子的运动状态的可能组合称为系统的微观状态, 简称微观态.

**等概率原理**

&emsp;&emsp;对于处于平衡态的孤立系统, 其各个可能的微观态出现的概率都相等. *第一性原理*

&emsp;&emsp;在平衡状态下, 如果粒子数目足够大, 宏观系统的状态可以用最大概然分布代表, 其他分布的情况可以忽略不计.

## $\S1.8$ 理想气体分子能量的统计分布律

**麦克斯韦玻耳兹曼分布**
$$
\ol{n_i}=A\exp-\frac{E_i}{k_BT}.
$$
例如, 等温理想气体在重力场中随高度的分布
$$
n=n_0e^{-\frac{m_0gz}{kT}}.
$$
则有等温气压公式
$$
p=p_0e^{-\frac{m_0gz}{kT}}=p_0e^{-\frac{Mgz}{RT}}.
$$
反过来可以通过气压测定高度
$$
z=\frac{RT}{Mg}\ln\frac{p_0}{p}.
$$
**量子分布律**

&emsp;&emsp;量子粒子的特点分类: 量子粒子不可分辨.

&emsp;&emsp;费米子: 电子, 质子, 中子. 遵循泡利不相容原理 => 费米-狄拉克分布.

&emsp;&emsp;玻色子: 光子, 声子 => 波色-爱因斯坦分布.
$$
\ol{n}_{\u{BE}}(E)=\frac{1}{Be^{E/k_BT}-1}.\\
\ol{n}_{\u{FD}}(E)=\frac{1}{He^{E/k_BT}+1}=\frac{1}{e^{(E-E_F)/k_BT}+1}.
$$
注意有
$$
\ol{n}_{\u{FD}}(E_F)=0.5.
$$

广延量: 正比于系统大小, 可简单相加. 如 $V,S,E$.

强度量 (内含量): 与系统大小无关. 如 $p,T$.

**绝热璧** & **导热璧**: 前者不允许两边物体发生任何形式的热交换.

**孤立系统**, **封闭系统** (无物质交换, 客户已有能量交换), **开放系统** (物质和能量都可交换).

热力学系统, 热力学过程, **准静态过程** (平衡过程), 非静态过程.

准静态过程可用 $p$-$V$ 图描述.

---

设系血统从外界吸热 $Q$, 对外做功 $A$, 则 $Q=\Delta E+A$.

*对过程进行的方向没有给出任何限制.*

**等体过程**
$$
\frac{p}{T}=\u{const},\quad \delta A=p\d V=0,\quad \delta Q=\d E.
$$
即此时有
$$
Q=E_2-E_1.
$$
气体从外界吸热全部用来增加内能, 而没有用于对外做功.
$$
C_{V,m}=\frac{(\delta Q)_V}{\frac{m}{M}\d T}=\frac{\d E}{\frac{m}{M}\d T}=\frac{i}{2}R.
$$
**等压过程**
$$
p=\u{const},\quad \d p=0,\quad \delta Q=\d E+p\d V;\\
A=\int_{V_1}^{V_2}p\d V=\frac{m}{M}R(T_2-T_1),\\
Q=E_2-E_1+A=\frac{m}{M}\frac{i}{2}R(T_2-T_1)+\frac{m}{M}R(T_2-T_1).
$$
进一步代入有
$$
C_{p,m}=C_{V,m}+R=\frac{i+2}{2}R.
$$
比热容比
$$
\gamma:=\frac{C_{p,m}}{C_{V,m}}=\frac{i+2}{i}.
$$
**等温过程**

**绝热过程**

## $\S2.3$ 热力学第二定律

**热机机器效率**

热机: 把热转化为功的机器.

热机效率:
$$
\eta=\frac{A}{Q_1}=1-\frac{Q_2}{Q_1}.
$$
制冷机: 利用外界做功获得低温的机器

制冷系数:
$$
w=\frac{Q_2}{A}=\frac{Q_2}{Q_1-Q_2}.
$$
**卡诺循环**: 由两个等温过程和两个绝热过程组成的准静态循环过程 (等温膨胀-绝热膨胀-等温压缩-绝热压缩).

**热力学第二定律的多种表述**

热力学第二定律是指示自发过程进行方向的规律.

Kelvin 表述: "不可能制成一种循环动作的热机, 使之从热源吸热全部转化为功, 而不产生其他影响." (不存在单源热机.)

Clausius 表述: "热量不能自动地从低温物体传向高温物体. " (不存在无功冷机.)

**热机效率极限问题**

可逆过程: 在某一过程 $P$ 中, 系统状态 $A\to B$, 若能使 $B\to A$ 且周围环境也恢复原状, 过程 $P$ 就称为可逆过程.

热力学系统的无摩擦 (无耗散) 准静态过程是可逆过程.

功转化为热的过程不可逆; 热量有高温物体传向低温物体的过程不可逆.

气体的绝热自由膨胀过程不可逆.

**卡诺热机效率和卡诺定理**
$$
\eta_{\u C}=1-\frac{T_2}{T_1}.
$$
在同样的高低温热源之间工作的一切可逆热机效率相同, 与工作物质无关.

**熵的热力学定义**

&emsp;&emsp;卡诺循环:
$$
\eta=\frac{Q_1+Q_2}{Q_1}=\frac{T_1-T_2}{T_1}\Ra\frac{Q_1}{T_1}+\frac{Q_2}{T_2}=0.
$$
系统经历卡诺循环后, 热温比综合为 $0$. 对任意可逆循环, 可分解为无限个微小的卡诺循环. 即
$$
\oint_{\text{invertible}} \frac{\delta Q}{T}=0.
$$
所以沿着可逆过程 $\delta Q/T$ 的积分只取决于初末状态, 而与过程无关, 定义为态函数: (Clausius) 熵 $\d S=\delta Q/T$.

&emsp;&emsp;两态的熵差或者熵变为:
$$
\Delta S=S_2-S_1=\int_1^2\br{\frac{\delta Q}{T}}_{\text{invertible}}.
$$
熵是态函数, 熵变与过程无关.

**熵增加原理**

孤立或绝热系统中的不可逆过程, 其熵要增加; 孤立或绝热系统中的可逆过程, 其熵不变.

&nbsp;

进一步, 把热一热二结合起来, 就有
$$
\d E=T\d S-p\d V.
$$
要求初态和末态都是平衡态.

若将其作为 $E=E(S,V)$, 则有
$$
\d E=\br{\frac{\part E}{\part S}}_V\d S+\br{\frac{\part E}{\part V}}_S\d V.
$$
也有
$$
T=\br{\frac{\part E}{\part S}}_V,\quad p=-\br{\frac{\part E}{\part V}}_S.
$$
**热力学第三定律**

表述:

- 绝对零度不能达到.
- 系统的熵在等温过程中的改变随绝对温度趋于 $0$. $\lim_{T\to 0}(\Delta S)_T=0$.
- 系统的熵随绝对温度趋于 $0$ (规定此时的绝对熵值为 $0$). $\lim_{T\to 0}S(T)=0$.

&nbsp;

再引入化学势, 有
$$
\d E=T\d S-p\d V+\mu\d N.
$$
&nbsp;

**信息熵**

如果有一组表述, 概率分别为 $p_i$, 则其平均信息量为
$$
S=-c\sum_iP_i\log_2 P_i.
$$
信息本身也可以作为一个物理量. 例如一个信息处理了单元在 $T$ 温度下擦除一个 bit 所需求的最小能量为
$$
\Delta Q=T\Delta S=Tk\ln 2.
$$
**焓**

定义一个系统的内能 $E$ 加上把该系统放进常压 $p$ 环境中所需的功
$$
H=E+pV
$$
称为焓.

**亥姆霍兹自由能**

若环境温度 $T$ 是一个常量, 系统可以 "免费" 地从环境提取能量, 则创造系统所需的做功为:
$$
F=E-TS
$$
称为亥姆霍兹自由能.

**吉布斯自由能**

定压定温, 结合上两者,
$$
G=H-TS=E+pV-TS.
$$
&nbsp;

**弛豫** (稍偏离平衡态 $\to$ 去向平衡态), **输运** (非平衡态 $\to$ 平衡态)

**粘性力**, 粘性现象 (围观本质: 分子定向动量的净迁移; 动量流), 牛顿流体.

**热传导现象** (能量流)

温度梯度 $\d T/\d x$, 热量传递:
$$
H=\frac{\Delta Q}{\Delta t}=-\kappa\frac{\d T}{\d x}\Delta S.
$$
$\kappa$ 称为热传导系数 (热导率).

单位时间在单位面积上流过的热量: 热流密度
$$
h=-k\frac{\d T}{\d x}.
$$
**扩散现象 **(质量流)

Fick 扩散定律
$$
\frac{\Delta m}{\Delta t}=-D\frac{\d\rho}{\d x}\Delta S,
$$

## $\S3.2$ 气体分子碰撞和平均自由程

平均碰撞频率 $\ol Z$: 单位时间内一个分子和其他分子碰撞的平均次数.

平均自由程 $\ol\lambda$: 每两次连续碰撞间一个分子自由运动的平均路程.
$$
\ol Z=\pi d^2\ol v_rn,\quad \ol v_r=\sqrt 2\ol v\\
\ol\lambda=\frac{\ol v}{\ol Z}=\frac{kT}{\sqrt 2\pi d^2p}.
$$
