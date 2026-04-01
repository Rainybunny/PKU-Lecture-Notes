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



**微尺度模拟中的 AI for Science**

- 多尺度建模: 解小一级尺度的方程, 提取信息以获得本尺度的恰当模型.
- Why AI? AI 提供了逼近高维函数的数学方法.

---

**分子动力学**

以 $q_i$ 表示第 $i$ 个原子的坐标, $p_i$ 为其动量, 那么
$$
\dot q_i=\frac{\part\mathcal H}{\part p_i},\quad \dot p_i=-\frac{\part\mathcal H}{\part q_i}.
$$
其中哈密顿量
$$
\mathcal H=\sum_{i=1}^N\frac{p_i^2}{2m_i}+E(q_1,\cdots,q_N).
$$
其中 $E$ 给出了原子体系的势能. 例如, $-\part\mathcal H/\part q_i$ 给出了 $i$ 的受力情况.

关键问题是给出 $E$ 的表达.

---

**First principles**
$$
\hat H\Psi=E\Psi,
$$
其中波函数 $\Psi$ 依赖于电子和原子核坐标. $\hat H$ 是算子, $E$ 是一个数值, 这相当于给出, "$\Psi$ 是 $\hat H$ 的特征向量, $E$ 为特征值".
$$
\hat H=-\sum_\alpha\frac{h^2}{2m_\alpha}\nabla_\alpha^2-\sum_{i,I}\frac{Z_I}{r_i-R_I}+\sum_{i<j}\frac{1}{|r_i-r_j|}.
$$

$$
\Ra E=\min_\Psi\frac{\DS\int\Psi^*(r,R)\hat H\Psi(r,R)\d r\d R}{\DS\int\Psi^*(r,R)\Psi(r,R)\d r\d R}.
$$

**Born-Oppenheimer 近似**
$$
E(R)=\min_\Psi\frac{\DS\int\Psi^*(r;R)\hat H\Psi(r;R)\d r\d R}{\DS\int\Psi^*(r;R)\Psi(r;R)\d r\d R}
$$
允许先固定原子核坐标.

**Kohn-Sham 密度泛函理论**

对最小特征值 $\varepsilon$,
$$
\hat H_{\u{KS}}[\rho]\psi=\varepsilon\psi,
$$
然而 $\rho$ 也依赖于方程的解, $\hat H_{\u{KS}}$ 中的 $\hat V_{\u{xc}}[\rho]$ (exchange-correlation functional) 有待良好刻画.

---

**Empirical force fields**
$$
E=E_{\u{bond}}+E_{\u{angle}}+E_{\u{dihedral}}+E_{\u{vdw}}+E_{\u{coulomb}}. 
$$
e.g.
$$
E_{\u{bond}}^i=\frac{1}{2}k_b(b^i-b_0^i)^2,\quad E_{\u{bond}}=\sum_iE_{\u{bond}}^i.
$$

---

**Machine Learning**

DFT -> Data --(Train)--> Deep learning model: $E(\bs R,\omega)$.

*Deep learning can express high-dim functions.*

Deep learning potential (势能) should subject ot physical principles:

- Energy conservation.
- Extensibility (广延量).
- Symmetries (translational, rotational, permutational, ...) in a molecular system.

E.g. for rotational symmetry, use data $\{(R,E),(U_1R,E),(U_2R,E),\cdots\}$ to train the model => $E(R)=E(UR)$. But if the latter property is "learned", the former can be reduced to just $(R,E)$.

**Construction of machinne learning potentials**
$$
E=\sum_iE_i.
$$
只考虑空间邻域内的原子.
$$
E_i=\mathcal F(\mathcal D(R_i))\\
\mathcal F:\text{fitting model}\\
\mathcal D:\text{Descriptor}\\
R_i=\{r_i\}\cup\{r_j:|r_i-r_j|<r_c\}
$$
Descriptor *preserves symmetries* and has a *strong ability of representation*.

**Deep potential: design of descriptor**

Function $f$ is permuationally invariant iff $\E\rho,\phi,~f(\{x_i\})=\rho\l(\sum_i\phi(x_i)\r)$.

For $i$-th atom, let
$$
\mathcal R_i=\pmat{1/r_{i1}&x_{i1}/r_{i1}^2&y_{i1}/r_{i1}^2&z_{i1}/r_{i1}^2\\\vdots&\vdots&\vdots&\vdots}.
$$
And $(\mathcal G_i)_{jk}=G_{ik}(r_{ij})$. Construct what we want from $\mathcal R$ and $\mathcal G$.

**Handling of atom types**

- Separate embedding nets for differennt atom types

- Atom type embeding

**Training**
$$
\min_\omega\mathcal L,\quad\mathcal L=p_e(E-\hat E)^2+p_f\sum_i|\bs F_i-\hat{\bf F}_i|^2.
$$
Second item: monitoring $\nabla E$.

---

Generalization

Data generation: (more for accuracy, less for efficiency) -> conquer learning.