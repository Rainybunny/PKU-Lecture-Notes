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

- 音乐的三大要素: 节奏, 旋律, 和声.
    - 节奏是音乐的发端.
- 一段音乐中的基本律动称为 **拍子 (beat)**, 若干拍子按照一定的强弱规律组合形成 **节拍 (meter)**, 构成节拍的一组拍子循环出现, 每次循环称为一个 **小结 (measure)**, 由 **小节线 (bar line)** 标记. 节拍通常用 **拍号 (time signature)** 表示. (e.g. $2/4,3/4,4/4,6/8$ 等等.)
- 二拍子, 三拍子称作 **单拍子**, 由相同单拍子组合为 **复拍子**.
    - 五拍子也一定是单拍子, 如 *Mission: Impossible*, *Take Five*.
- **节奏 (rhythm)**: "止" 与 "作", 由音符不同的 **时值 (duration)** 组合构成的模式.
- **节奏型 (rhythm ostinato)**: 舍弃音高, 将时值统一为最短者, 只记录 **起拍 (onset)** 与 **休止拍**.
    - **固定节奏型**: 在乐曲中无变化, 反复出现, 贯穿始终的节奏模式. 如 *Bolero* 的军鼓.
    - e.g. 包含 $5$ 个起拍的 $16$ 拍节奏型共 $\binom{16}{5}=4368$ 种.
    - **极大均衡 (maximal evenness) 原则**: 起拍尽可能均匀地分布在整个节奏型中. 例如对于上述节奏型, 原则指导我们将起拍排列在 $y=3.2x$ 附近 (规定第一拍起拍), 共 $16$ 种. 再周期加上循环.
    - **节奏奇性**: 不含对径 (相距半个节奏型长度) 起拍的节奏型.
    - **距离序列**: (的确是对圆环信息的惯用刻画) 记录相邻起拍的距离. 例如起拍 $[0,3,6,10,12]_{16}$ 的距离序列为 $[3,3,4,2,4]$.
    - **轮廓 (contour)**: 提取节奏型距离序列的差分符号 ($-/0/+$) 得到节奏型的轮廓. 例如上述节奏型的轮廓为 $[0,+,-,+,-]$, 距离序列 $[2,2,3,2,3]$ 的轮廓亦是如此. 人们对音乐事件的相对变化更为敏感, 所以这两种节奏型在听感上相似. 和距离序列一样, 轮廓也在尊重节奏型的相位循环.
    - **影子 (shadow)**: 节奏型各相邻起拍点的中点构成的起拍构成原节奏型的影子. 例如距离序列 $[2,3,3]$ 的影子的距离序列是 $[2.5,3,2.5]$. e.g. 对于 *古巴颂乐*, 其节奏型和其影子的轮廓是同构 (up to 循环唯一) 的, 这是上述 $16$ 种满足极大均衡原理的节奏型中唯一的一个满足这一条件的节奏型.
- 四行圣十 (tetractys), 同度, 纯八度, 纯五度, 纯四度.
- "Music studies the relations between quantities."

---

- 音乐风格的多样性 $\Rightarrow$ "音乐文化" 到 "听觉文化" 的转型;
- 谐和音乐;
- Voice, Beating, Bass line (VBB). (e.g. 阿卡贝拉)

---

- **音乐** 是凭借声波振动而存在, 在时间中展现, 通过人类的听觉器官而引起各种情绪反应和情感体验的艺术门类.

- 声音的物理属性:

    - **音高**: "声音的高低", 由振动频率决定.
    - **力度**: "声音的强弱", 由振动幅度决定.
    - **时值**: 声音持续的时间长度.
    - **音色**: "声音的特点", 由振动波形决定.

- **声压水平 (sound pressure level, SPL)** 度量人耳对于声音强弱的感觉:
    $$
    L_p=20\log_{10}\br{\frac{p}{p_0}}\quad(\u{dB})
    $$
    其中 $p_0=20\u{\mu Pa}$ 是 $1000\u{Hz}$ 时听觉下限阈值.

- **振幅包络**: 起音 (attack), 衰减 (decay), 持续 (sustain), 释放 (release).

- **频谱图** (横轴: 时间; 纵轴: 频率; 颜色/亮度等: 强度), **泛音列**.

- **乐音**, **噪音**.

- **乐音体系**:

    - **音列**: 全体音级从低到高排列;
    - **半音**, **全音**.
    - **音名**: 一个 **八度** 中循环使用 C, D, E, F, G, A, B.
    - **升音**, **降音**, **重升**, **重降**, **还原**.
    - 异名同音称为 **等音**.

- **唱名**, 固定唱名法 (唱名与音名固定对应), 首调唱名法.

- 五线谱中, 音符通常由符头, 符干, 符尾组成, 音符所代表的时值是相对长度.

- 休止符区分: 全休止在四线下, 二分休止在三线上.

- **高音谱号** (下加一线为 $\u{C_4}$), **低音谱号** (上加一线为 $\u{C_4}$), **中音谱号 (及其变体)** (穿过符号中心的谱线为 $\u{C_4}$).

- **音程**: 两个音级之间的距离称为音程. **旋律音程**, **和声音程**.

- **度数**, **半音数**.

- **自然音程**: **小三度** (三半音), **大三度** (四半音), **纯四度** (五半音), **增四度** (六半音), **减五度**, **纯五度**, ..., **纯八度**.

- **协和音程**: 纯四, 纯五, 纯八 (完全协和); 大小三, 大小六 (不完全协和).

- **拍音**: $\sin(2\pi\omega t)+\sin(2\pi(\omega+\delta)t)=2\cos(\pi\delta t)\sin\br{2\pi\br{\omega+\frac{\delta}{2}}t}$, 这是一个强度周期变化的音. (这里 $\omega$ 和 $\delta$ 的数值恰好是赫兹数.)

---

&emsp;&emsp;假设弦是一位匀质的, 长度 $L$, 张力 $T$, 线密度 $\rho$. $t$ 时刻 $x\in[0,L]$ 处质点的位移为 $u(x,t)$. 对 $[x,x+\Delta x]$ 处的小段 $PQ$, 质量 $m=\rho\Delta x$, 竖直方向上
$$
T\br{\ev{\frac{\part u}{\part x}}_{x+\Delta x}-\ev{\frac{\part u}{\part x}}_{x}}=\rho\Delta x\frac{\part^2 u}{\part t^2}\Ra \frac{\part^2 u}{\part x^2}=\frac{\rho}{T}\frac{\part^2 u}{\part t^2}.
$$
边界有 $u(0,t)=u(L,t)=0$. 最终可以解得
$$
\ALI{
	u(x,t)=\ser u_n(x,t) &= \ser \br{a_n\cos\frac{n\pi c}{L}t+b_n\sin\frac{n\pi c}{L}t}\sin\br{\frac{n\pi}{L}x}\\
	&= \ser \sqrt{a_n^2+b_n^2}\sin\br{\omega_nt+\theta_n}\sin\br{\frac{n\pi}{L}x}.
}
$$
其中 $\omega_n=\frac{n\pi c}{L}$ 称为弦的第 $n$ 个振动模态, $c^2=\frac{T}{\rho}$, 因而频率
$$
f_n=\frac{n}{2L}\sqrt{\frac{T}{\rho}}.
$$
序列
$$
\{f_1,f_2,\cdots\}
$$
称为弦的固有频率, $f_1$ 称为基频, 相应声音称为基音. $f_n~(n\ge 2)$ 对应的声音称为第 $(n-1)$ 泛音. 记基频为 $f$, 则 $f_n=nf$. 则
$$
\{f,2f,3f,\cdots\}
$$
称为泛音列.

&emsp;&emsp;在加上初值条件 $u(x,0)=\phi(x)$ 与 $\ev{\frac{\part u}{\part t}}_0=\psi(x)$, 就能确定 $a_n$, $b_n$ 和 $\theta_n$.

---

- 音乐的风格体: 有机体, 几何体, 集合体, 类型体.