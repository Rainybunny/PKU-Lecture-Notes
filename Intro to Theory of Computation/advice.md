$$
\text{TOC/advice}

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
\newcommand{\loop}[0]{{\circlearrowleft}}
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
\newcommand{\ts}[1]{\textsf{#1}}
\newcommand{\tb}[1]{\textbf{#1}}
\newcommand{\os}[2]{\overset{#1}{#2}}
\newcommand{\lix}[1]{\lim_{x\to #1}}
\newcommand{\ops}[1]{#1\cdots #1}
\newcommand{\seq}[3]{{#1}_{#2}\ops,{#1}_{#3}}
\newcommand{\dedu}[2]{\u{(#1)}\Ra\u{(#2)}}
\newcommand{\prv}[3]{\DS{{\DS #1} \over {\DS #2}}~(#3)}
$$

### 知识点

**[A1]** 非正则语言类对 $\cap$ 不封闭. **Prf.** 两个非正则的交可以为空.

**[A2]** 正则语言 $A$ 的 reverse $A^R$ 也正则. **Prf.** 用 NFA 模拟反向 DFA.

**[A3 Myhill-Nerode's]** $A$ 正则当且仅当 $A$ 存在有限等价类划分, 其中 $x\sim_A y\Eq(\A z,~xz\in A\Eq yz\in A)$.

**[A4]** CFL 对取 $\cap$ 不封闭, 对取 $\cup$ 封闭. **Eg.** $\{0^n1^n2^*\}\cap\{0^*1^n2^n\}$.

**[A5]** CFL 和正则的 $\cap$ 仍然是 CFL. **Prf.** 把 DFA 揉到 PDA 里.

**[A6]** 前缀封闭 ($xy\in A\Ra x\in A$) 的无穷 CFL 存在无穷正则子集. **Prf.** 泵, $uv^i$ ($|v|>0$) 或者 $uxy^iz$ ($|v|=0$) 正则.

**[A7 22']** $\{0^a1^b2^a:0\le a\le b\le3a\}$ 不是 CFL. **Prf.** 泵 $0^p1^p2^p$, 讨论 $vxy$ 位置.

---

**[A8 Rice's]** 对任意非平凡 (存在一个可识别语言满足, 也存在一个不满足) 的关于语言的命题 $P$, $\{\alp:P(L(M_\alp))\}$ 不可判定.

**[A9]** 不可识别: $\t{E}_{\t{TM}},\t{EQ}_{\t{TM}},\ol{\t{EQ}_{\t{TM}}},\ol{\t{HALT}},\t{UC},\ol{\t{A}_{\t{TM}}}$.

**[A10]** 队列自动机 QA 等效于 TM. **Prf.** 互相模拟.

**[A11]** 给定单带 $M$, 存在对 $M$ 运行历史的编码方式, 设 $A=\{H:M~\text{accepted}~\t{as history}~H\}$ 包含所有正确记录 $M$ 运行到接受的历史的字符串 (至多一个元素), 则 $\ol A$ 是 CFL. **Prf.** $\mathcal H(\seq C0k)=\#q_0@w_0\#q_1@w_1^{\t R}\#\cdots\#$, 非确定性判断每种错误. **Eg.** 因此 CFG 全性不可判定, 否则 $\t{A}_{\t{TM}}$ 可判定.

**[A12]** $\tb{NP}$ 对 $\cap$ 和 $\cup$ 都封闭. **Prf.** 把两个 NDTM 拼装.

---

**[A13]** $f(n)=o(n\log n)$, 则 $\t{DTIME}(f(n))$ 只包含正则语言.

**[A14]** $\tb{DP}:=\{L_1\cap L_2:L_1\in\tb{NP},L_2\in\tb{coNP}\}$, 则 $\t{EXACT-INDSET}$ 是 $\tb{DP}$-完全的.

**[A15]** $\t{SPACE-TMSAT}$ (TM 在给定空间接受输入) 和 $\t{LINEAR-SPACE-TMSAT}$ (TM 在线性空间接受输入) 都是 $\tb{PSPACE}$-完全的.

**[A16]** 若允许 $\tb{NL}$ 验证机反复读证书, 则它强化为 $\tb{NP}$. **Also**: 可以对数空间地检查单步格局转移正确性.

**[A17 Immerman-Szelepcsenyi's]** $\ol L\le_{\u l}\t{PATH}\Eq L\le_{\u l}\ol{\t{PATH}}$.

---

**[A18]** 所有 $f:\{0,1\}^n\to\{0,1\}$ 都能用 $\mathcal O(2^n/n)$ 规模电路计算. **Prf.** 朴素的 $\mathcal O(2^n)$ 决策树的最低 $\log_2 n$ 层电路门数超过了本质不同的函数数, 将它们合并.

**[A19]** 存在神谕 $A$ 使得 $\tb{P}^A\neq\tb{NP}^A\land \tb{NP}^A\sub\tb{P}^A/\t{poly}$.

**[A20]** 对任意 $k>0$, $\tb{PH}$ (更强地, $\mathbf{\Sigma}_4^{\u p}$) 中包含电路复杂性为 $\Omega(n^k)$ 的语言.

**[A21]** $\t{Add}_n:\{0,1\}^{2n}\to\{0,1\}^{n+1}$ 和 $\t{Maj}_n:\{0,1\}^n\to\{0,1\}$ 均能在 $\mathcal O(n)$ 规模电路计算.

**[A22]** $\tb{uNC}^1\sub\tb{L}$, 进而空间分层出 $\tb{uNC}^1\subsetneq\tb{PSPACE}$. **Prf.** DFS.

---

**[A23]** $\t{Maj}\notin\tb{AC}^0$ (否则改装成 $\t{THR}$, counting, 直接枚举有多少个 $1$ 就计算了 $\t{XOR}$); $\t{Add},\t{Cmp}\in\tb{AC}^0$, $\t{Sum}\in\tb{AC}^1$, $T_{\bs\omega,\theta}\in\tb{NC}^1$ ($w$ 是常数, 直接复制输入若干份, pad 后用 $\t{Maj}$), $\t{Maj}\in\tb{NC}^1$ (用全加器不断 3 to 2 归并), 进而 $\tb{AC}^0\subsetneq\tb{TC}^0\subseteq\tb{NC}^1$ (TC 是 AC with threshold).

**[A24]** 对 $p\in\Q$, $\tb{BPP}_p=\tb{BPP}$, 但对 $p\in\R$ 存在反例.

**[A25]** 深度 $k$ 的电路计算 $\t{XOR}_n$ 的规模紧下界是 $2^{\Omega(n^{1/(k-1)})}$.

---

**[A26]** *Complexity Zoo*
$$
\tb{L}\sub\tb{NL}=\tb{coNL}\sub\tb P\sub\{\tb{BPP},\tb{NP},\tb{coNP}\}\sub\tb{PH}\\
\sub\tb{PSPACE}=\tb{NPSPACE}=\tb{IP}\sub\tb{EXP}\sub\tb{NEXP}=\tb{MIP}.\\
$$

- $\tb{NL}=\tb{coNL}$ (**Immerman-Szelepcsényi's**). **Prf.** 归纳计数.
- $\tb{NL}\sub\tb{uNC}^2$ (**[B6]**).
- $\mathbf{\Sigma}_i^{\u p}=\mathbf{\Pi}_i^{\u p}\Ra\tb{PH}=\mathbf{\Sigma}_i^{\u p}$. **Eg.** $\tb{NP}=\tb{coNP}\Ra\tb{BPP}=\tb{NP}$.
- $\tb{BPL}\sub\tb{nAC}^1$ (**[B8]**).
- $\tb{BPL}\sub\tb{L}^2\cap\t{P}$.
- $\tb{RP}\sub\tb{NP}$, $\tb{coRP}\sub\tb{coNP}$, $\tb{ZPP}=\tb{RP}\cap\tb{coRP}$.
- $\tb{NP}\sub\tb{P}/\t{poly}\Ra\tb{PH}=\mathbf{\Sigma}_2^{\u p}$ (**Karp-Lipton's**). **Prf.** 在这一假设下证明 $\Pi_2\t{SAT}\le_{\u p}\Sigma_2\t{SAT}$: 取判定 SAT 的 $C$, search-to-decision 地构造直接生成证书的 $C'$, $\A u~\E v~\phi(u,v)\Eq\E C'~\A u~\phi(u,C'(\phi,u))$.
- $\tb{NP}=\tb{NuAC}^0$; $\tb{NP}/\t{poly}=\tb{NnAC}^0$ (**[B3]**).
- $\tb{BPP}\sub\mathbf{\Sigma}_2^{\u p}\cap\mathbf{\Pi}_2^{\u p}$ (**[B11]**).
- $\tb{BPP}\sub\tb{P}/\t{poly}$ (**Adleman's**).
- $\tb{BPP}\sub\tb{ZPP}^{\t{SAT}}$. **Prf.** 拆成 $\tb{RP}^{\t{SAT}}$ 和 $\tb{coRP}^{\t{SAT}}$, 用平移覆盖去随机.
- $\tb{NP}\sub\tb{BPP}\Ra \tb{P}^{\t{SAT}}\sub\tb{BPP}=\tb{ZPP}^{\t{SAT}}$. **Prf.** 将 $\t{SAT}$ 神谕用 $\tb{BPP}$ 机器实现, error reduction.
- $\tb{NP}\neq\tb{P}\Ra\tb{P}\cup\tb{NPC}\subsetneq\tb{NP}$ (**Ladner's**).
- $\tb{BP}\cdot\tb{NP}\sub\tb{NP}/\t{poly}$. **Prf.** error reduction, 取万能种子.
- $\tb{coNP}\sub\tb{NP}/\t{poly}\Ra \tb{PH}=\mathbf{\Sigma}_3^{\u p}$. **Prf.** 证 $\mathbf{\Pi}_3^{\u p}\sub\mathbf{\Sigma}_3^{\u p}$: 把 $\A\E\A$ 的最内层 $\A$ 用假设转换成 $\E$, 和前一层合并, 最外层枚举电路结构得到 $\E\A\E$.
- $\tb{P}=\{\log\t{-space uniform circuits family}\}$. **Prf.** 右含于左显然, 左含于右, 在格局图上 local 地算 (类似 Cook-Levin).
- $\tb{P}=\tb{NP}\Ra\tb{EXP}=\tb{NEXP}$. **Prf.** 给 $\tb{NEXP}$ pad 为 $\tb{NP}$, 转换为 $\tb{P}$, 删去 pad 得到 $\tb{EXP}$.
- $\t{NSPACE}(S(n))\sub\t{DTIME}(2^{\mathcal O(S(n))})$. **Prf.** 格局图上 BFS.
- $\t{NSPACE}(S(n))\sub\t{SPACE}(S(n)^2)$ (**Savitch's**). **Prf.** 倍增搜可达性.
- $f(n)=o(g(n))\Ra\t{SPACE}(f(n))\subsetneq\t{SPACE}(g(n))$ (**空间分层**).
- $f(n)\log f(n)=o(g(n))\Ra\t{DTIME}(f(n))\subsetneq\t{DTIME}(g(n))$ (**时间分层**).
- $n<f(n)<f(n)\log^2 f(n)=o(g(n))<g(n)=o(2^n/n)\Ra\t{SIZE}(f(n))\subsetneq\t{SIZE}(g(n))$ (**规模分层**). **Prf.** 取 $\ell = \log t_2 + \log \log t_2 + C$, 存在需要至少 $2^\ell/\ell=\omega(f(n))$ 规模电路才能计算的 $p:\{0,1\}^\ell\to\{0,1\}$，由于 $\ell< n$, 可 pad 得到 $p': \{0, 1\}^n \to \{0, 1\}$, 同时至多需要 $\ell 2^\ell = \mathcal O(g(n))$ 规模计算. (后者来自平凡上界, 所以应该可以用 **[A18]** 的技术做得更紧.)
- $\tb{MA}\sub\tb{AM}[2]$ (**[B9]**).
- $\tb{IP}[k]\sub\tb{AM}[k+2]$ (**Goldwasser-Sipser's**).
- 对任意常数 $k$, $\tb{AM}[2]=\tb{AM}[k]$. ==考场上助教 ~~恼羞成怒~~ 禁止直接用这个结论, 建议补个完整证明.==
- $\tb{IP}_1=\tb{IP}$ (下标 $1$ 表示完美完备性). **Prf.** $\tb{IP}=\tb{PSPACE}$, $\t{TQBF}$ 由 sum-check 协议已经得到完美完备性.
- $\tb{MA}_1=\tb{MA}$ (**[B10]**), $\tb{AM}_1=\tb{AM}$. **Prf.** 后者还是平移覆盖展开为 $\tb{MAM}$, 然后 $\tb{MA}\sub\tb{AM}$ 压缩回 $\tb{AM}$.
- $\tb{MA}_0=\tb{AM}_0=\tb{NP}$. **Prf.** 使 Arthur 接受的 Merlin 证据和随机种子可以直接作为证书.
- 任何要求完美可靠性的交互式证明至多描述 $\tb{NP}$ (**Fürer-Goldreich-Mansour-Sipser-Zachos's**) *补充*.
- $\t{PATH},\ol{\t{PATH}}$ 都 $\tb{NL}$-完全. $\t{TQBF}$ 是 $\tb{PSPACE}$-完全.

### 经典证明

**[B1]** 单带只读 TM 能力等同于 DFA.

**Prf.** *省流: 考虑一处交错序列, 它无法区分大量等价前缀的.* 反证. 令 $Q_\loop:=Q\sqcup\{\loop\}$, $|Q_\loop|=n$, $\#\{f:Q_\loop\to Q_\loop\}=n^n$ 有限. 设 $m=n^{n+1}+1$, 由于 $A$ 非正则, **[A3]** 给出存在 $m$ 个等价类 $E=\{[x_1],\cdots,[x_m]\}$ 使得 $\bigsqcup_{i=1}^{\oo}[x_i]\sub A$. 不妨 $|x_1|=\cdots=|x_m|=\ell$. 令 $\psi:E\to Q_\loop$ 表示 TM 输入 $x\in E$ 的初始格局开始, 当纸带指针第一次到达 $\ell+1$ 时, TM 的状态 (如果已经停机而不能到达 $\ell+1$, 则直接设为对应停机状态; 如果陷入死循环而不能到达 $\ell+1$, 则直接设为 $\loop$). 令 $\varphi:E\to Q_\loop\to Q_{\loop}$ 表示 TM 从输入 $x\in E$, 指针指向 $\ell$, 状态为 $q\in Q_\loop$ 的格局开始, 当指针第一次到达 $\ell+1$ 时, TM 的状态 (边界情况同上). 设 $m'=n^n+1=\lceil m/n\rceil$. 由鸽巢原理, 存在 $E'=\{[y_1],\cdots,[y_{m'}]\}\sub E$, 使得 $\psi(y_1)=\cdots\psi(y_m)$. 再由鸽巢原理, 存在 $\{u,v\}\sub E$, 使得 $\varphi(u)=\varphi(v)$. 而由于 $[u]\neq[v]$, 存在 $z\in\Sigma^*$ 使得 $uz$ 和 $vz$ 仅有一者被识别. 但是由于以上两个函数在 $u,v$ 上相等, $uz$ 和 $vz$ 在 $M$ 上的每一步转移都相同, 应当 $M(uz)=M(vz)$, 矛盾.

---

**[B2]** 若某个 $A\sub\{1\}^*$ 是 $\tb{NP}$-完全的, 那么 $\tb{P}=\tb{NP}$.

**Prf.** 设 $f:\t{CNF}\to\N$ 满足 $\varphi\in\t{SAT}\Eq 1^{f(\varphi)}\in A$, DFS 求解 $\t{SAT}$ 并用 $f$ 做记忆化, 它能保证记忆化答案正确且总状态数是 $\t{poly}$.

---

**[B3 22' 24']** $\tb{NP}=\tb{NuAC}^0$; $\tb{NP}/\t{poly}=\tb{NnAC}^0$.

**Prf.** 第一个, $\supset$ 显然. $\subset$, 给出 NDTM 的格局列表, 可以在 $\tb{NC}^1$ 或 $\tb{AC}^0$ 检查格局列表正确性. 非确定性枚举这个多项式长度列表. 第二个, $\supset$ 显然. $\sub$, 硬编码 advice, 然后同上.

---

**[B4 22']** $\t{TQBF}$ 在对数空间归约下 $\tb{PSPACE}$-完全.

**Prf.** $\t{TQBF}\in\tb{PSPACE}$: DFS. $\t{TQBF}$ hard: 任意 $\tb{PSPACE}$ 的 TM 只有 $2^{\t{poly}(n)}$ 个格局, 使用 Savitch 论证: 令 $\phi_i(C,C')$ 表示 $C$ 能否在 $2^i$ 步转移到 $C'$. 则
$$
\phi_{i+1}(C,C')=\E C''~\phi_i(C,C'')\land\phi_i(C'',C')=\E C''~\A(X,Y)\in\{(C,C''),(C'',C')\}~\phi_i(X,Y).
$$
显然可以对数空间计算这个函数.

---

**[B5 22']** 若 PTM $M_r$ 以 $\eps$ 双边错误率判定 $L$, 则存在 $2^{\mathcal O(\log\frac{n}{\delta})}$ 大小的种子集 $S$ 使得 ($r\sim S$ 即在集合中均匀采样):
$$
\A x\in\{0,1\}^n~\Pr_{r\sim S}\bk{M_r(x)\neq L(x)}\le\eps+\delta.
$$
**Prf.** 设 $M_r$ 的随机串在样本空间 $\Omega$ 中采样, 从 $\Omega$ 中独立均匀抽 $t=\mathcal O((n+1)\delta^{-2})$ 个串为 $S$, 对固定的 $x$, 设 $Z_i=[M_{r_i}(x)\neq L(x)]$, 则 $\Ex[Z_i]<\eps$, Chernoff 给出 $Z_i$ 均值大于 $\eps+\delta$ 的概率不超过 $\e^{-\Omega(\delta^2t)}$, 可以取为 $2^{-n-1}$. 最后对所有 $x$ union bound 得到, 取定 $S$ 时, 存在 $x$ 错误率超过 $\eps+\delta$ 的概率小于 $1$, 因而这样的 $S$ 一定存在.

---

**[B6 22']** $\tb{NL}\sub\tb{uNC}^2$.

**Prf.** 只需证 $\t{PATH}\in\tb{uNC}^2$. 在 Bool 矩阵乘法 $(BC)_{ij}=\bigvee_k(B_{ik}\land C_{kj})$ 下, 只需计算图的邻接矩阵幂 $A^{2^{\lceil\log N\rceil}}$, 也即进行 $\log N$ 次乘法, 每次乘法可以用 $\log$ 层电路完成. 明所欲证.

---

**[B7 22']** 给定 $S\sub\{0,1\}^m$, 其成员关系可以 $\t{poly}(m)$ 地验证. 给定 $k\ge 2$, $2^{k-2}<K\le 2^{k-1}$, 构造 $\tb{AM}[2]$ 协议使得以下两点都满足: (a) $|S|\ge K$ 时 Arthur 一定接受; (b) $|S|\le K/k^2$ 时 Arthur 以至少 $2/3$ 的概率拒绝.

**Prf.** 考虑仿射 hash 族 $\mathcal H:=\{h:\F_2^m\to\F_2^k\}$, 其中 $h_{A,b}(x)=Ax+b$, $A\in\M_{k\x m}(\F_2)$, $b\in\F_2^{k}$. 令 $t=4k$, 构造协议: **(a)** Merlin 发 $t$ 个 $\seq h1t:\F_2^m\to\F_2^k$. **(b)** Arthur 均匀随机取 $y\in\F_2^k$ 发回. **(c)** Merlin 回复下标 $i\in[t]$ 和元素 $x\in\F_2^m$. **(d)** Arthur 检查是否 $x\in S$ 以及 $h_i(x)=y$, 成功则接受, 否则拒绝.

**完备性**: $|S|\ge K$, 只需证明存在 $t=4k$ 个 $h$ 使得 $\bigcup_{i=1}^t h_i(S)=\F_2^k$. 令随机变量 $X_y=|\{x\in S:h(x)=y\}|$, 则 $\Ex_{h\sim \mathcal H}[X_y]=\frac{|S|}{2^k}>\frac{1}{4}$, 利用 **[C1]** 给出 $\Pr[X_y>0]\ge\frac{\Ex[X_y]}{1+\Ex[X_y]}\ge\frac{1}{5}$, 即 $\Pr[y\notin h(S)]\le\frac{4}{5}$. 独立选 $t$ 个再对所有 $y$ union bound 可知, 存在某个 $y$ 未被覆盖的概率不超过 $2^k\br{\frac{4}{5}}^{4k}<1$, 因而满足条件的 $h$ 族存在.

**可靠性**: $|S|\le K/k^2$, 此时 $\abs{\bigcup_{i=1}^t h_i(S)}\le t|S|$, 这样 Arthur 接受概率不超过 $\frac{4k\cdot K/k^2}{2^k}=\frac{4K}{k2^k}\le\frac{2^{k+1}}{k2^k}=\frac{2}{k}$. 不妨 $k\ge 6$ (常数的 $k$ 可以直接让 Merlin 提供所有元素, Arthur 检查是否属于 $S$ 且两两不同), 这时 Arthur 的接受概率就不超过 $\frac{1}{3}$.

---

**[B8 24']** $\tb{BPL}\sub\tb{nAC}^1$.

**Prf.** 用 Adleman 定理的 trick (error reduction 配合完美种子存在性去随机化) 可知 $\tb{BPL}\sub\tb{nAC}^1\Eq\tb{L}\sub\tb{nAC}^1$. 再用 **[B6]** 的 trick 给出 $\tb{L}\sub\tb{NL}\sub\tb{nAC}^1$.

---

**[B9 24']** $\tb{MA}\sub\tb{AM}[2]$.

**Prf.** 设原 Arthur 的证书长度为 $q(n)$, 重复 $r=\mathcal O(q(n)+n)$ 次取众数, error reduction 到 $2^{-q(n)-3}$ 的双边错误率. 构造 $\tb{AM}[2]$ 协议: **(a)** Arthur 发送证书包 $Y$; **(b)** Merlin 返回 $z$; **(c)** Arthur 用 $\tb{MA}$ 的 Arthur $V$ 验证 $V(x,Y,z)$.

**完备性**: 若 $x\in L$, 发送 $\tb{MA}$ 对应的好证书 $z$.

**可靠性**: 若 $x\notin L$, 对抗性的 Merlin 给出的 $z$ 总有
$$
\Pr_Y[\E z~V(x,Y,z)]\le\sum_{z\in\{0,1\}^{q(n)}}\Pr_Y[V(x,Y,z)=1]\le 2^{q(n)}\cdot 2^{-q(n)-2}<\frac{1}{3}.
$$
或者直接 $\tb{MA}\sub\tb{AM}[4]=\tb{AM}[2]$.

---

**[B10 24']** $\tb{MA}=\tb{MA}_1$, 其中 $\tb{MA}_1$ 要求完备性中接受概率为 $1$.

**Prf.** 只需证 $\tb{MA}\sub\tb{MA}_1$. 用 **[B11]** 的技术将 $\E z~\Pr\ge\frac{2}{3}$ 拆成 $\E z~\E(\seq y1m)~\A Y~\bigvee\cdots=1$, 让 Merlin 提供前两个 $\E$ 的结果.

---

**[B11 Sipser-Gács–Lautemann's]** $\tb{BPP}\in\mathbf{\Sigma}_2^{\u p}\cap\mathbf{\Pi}_2^{\u p}$ (平移覆盖去随机化).

**Prf.** 对 $L\in\tb{BPP}$, error reduction 后得到 $M_r$ 使用 $m=\t{poly}(n)$ 的随机 bit 以 $\delta<\frac{1}{m+1}$ 的双边错误率判定 $L$. 记 $A_x=\{r:M_r(x)=1\}$. 断言 (*平移覆盖技术*):
$$
\Pr_r[M_r(x)=1]\ge1-\delta\Eq \E(\seq y1{m+1})\in\{0,1\}^m,~\A z\in\{0,1\}^m,~\bigvee_{i=1}^{m+1}M_{y_i\oplus z}(x)=1.
$$
一方面, 若 $x\in L$, 则 $|A_x|\ge(1-\delta)2^m$, $|\ol{A_x}|\le\delta 2^m$. 对于任意 $z$ 和均匀独立采样的 $y$, $\Pr[z\notin\bigcup_{i=1}^{m+1}(A_x\oplus y_i)]\le\delta^{m+1}$, union bound 就有 $\Pr[\E z\notin\bigcup_{i=1}^{m+1}(A_x\oplus y_i)]\le 2^m\delta^{m+1}<1$, 所以这时右侧为真. 另一方面, 若 $x\notin L$, 直接 counting 就保证必然存在 $z$ 反例. 到此 $\tb{BPP}\sub\mathbf{\Sigma}_2^{\u p}$. 又因为 $\tb{BPP}$ 对补封闭, 就得到目标.

---

**[B12]** 集合下界协议板子 \& $\t{GNI}\in\tb{AM}[2]$.

*集合下界协议*: 设 $S_x=\{z\in\{0,1\}^N:\E w~R(x,z,w)=1\}$, 其中 $R$ 是 Arthur 的多项式验证器, 并且假设有 promise $|S_x|\ge L\lor|S_x|\le L/4$. 协议如下: **(a)** 取常数 $R_0=160$, 令 $m=\lfloor\log_2(L/R_0)\rfloor$, Arthur 随机选择仿射 hash 函数 $h_{A,b}(z)=Az+b:\{0,1\}^N\to\{0,1\}^m$, 并发送给 Merlin. **(b)** Merlin 需要回复 $120=3R_0/4$ 个两两不同的 $\seq z1{120}\in S_x$ 及其证书 $\seq w1{120}$ 满足 $h(z_i)=0^m\land R(x,z_i,w_i)=1$. Arthur 检查这一点.

**Prf.** 令 $X=\abs{\{z\in S_x:h(z)=0^m\}}$, 根据两两独立性, $\Ex[X]=|S_x|/2^m$, $\Var[X]\le\Ex[X]$ (因为是两两独立的 Bernoulli 实验). **完备性**: 若 $|S_x|\ge L$, 则 $\Ex[X]\ge R_0=160$, $\Pr[X<120]\le\Var[X]/(160-120)^2\le 16/160=0.1$, Merlin 有至少 $0.9$ 的概率成功. **可靠性**: 若 $|S_x|\le L/4$, 则 $\Ex[X]<80$, 这时 $\Pr[X\ge 120]\le\Var[X]/(120-80)^2\le 8/160=0.05$, 因此 Merlin 只有不超过 $0.05$ 的概率可以作弊成功.

**Eg.** 对 $\t{GNI}$, 令 $\t{Orb}(G)=\{\pi(G):\pi\in\mathfrak S_n\}$, $\t{Aut}(H)=\{\alp\in\mathfrak S_n:\alp(H)=H\}$,
$$
\mathcal S=\{(H,\alp):H\in\t{Orb}(G_0)\cup\t{Orb}(G_1),\alp\in\t{Aut}(H)\}.
$$
轨道-稳定子定理给出 $G_0\simeq G_1\Ra |\mathcal S|=n!$, $G_0\not\simeq G_1\Ra|\mathcal S|=2n!$. 取 $\mathcal T=\mathcal S^2$, 这样就有 $4$ 倍差距的 promise, 直接套板子.

---

**[B13]** *Sum-check 协议*.

对于 $\t{SAT}$: 将 CNF 改写成 $P(\seq x1n)\in\{0,1\}$ 的多项式, 欲判定 $\sum_{x_{1:n}}P(x)$ 是否为 $c$. 先要求 Merlin 给一个素数 $p\in[2^n,2^{2n}]$ (用 Millar-Rabin 检查), 此后在 $\F_p$ 下计算. 每次向 Merlin 询问 $s(x_1):=\sum_{x_{2:n}}P(x_{2:n};x_1)$ 这个多项式, 检查是否 $s(0)+s(1)=c$, 然后采样 $a\in\F_p$ 并递归检查是否 $s(a;x_{2:n})=\sum_{x_{2:n}}P(a;x_{2:n})$. 单次正确率至少 $1-\frac{\mathcal O(n )}{p}$.

对于 $\t{TQBF}$, 需要引入 $\A$ 对应的 $\prod$ 和降低度数的算子 $L_i(P)=x_iP|_{x_i=1}+(1-x_i)P|_{x_i=0}$, 且需要处理乘积上溢出 $p$ 导致的误判 ($\E$ 替换为 $P(0)+P(1)-P(0)P(1)$). 最终也能得到具有完美完备性的协议.

---

**[B14]** *交叉序列技术*: $f(n)=o(n\log n)$ 的 $\t{DTIME}(f(n))$ 只含正则语言.

**Prf.** 反证. 设单带 TM $M\in\t{DTIME}(f(n))$, $f(n)=o(n\log n)$ 而 $M$ 识别的 $A$ 不正则. 记 $\t{cs}_x(i)$ 表示将 $x$ 作为输入时, $M$ 的读写头穿过纸带 $i$ 和 $i+1$ 边界时的机器状态按照运行时间升序排列得到的状态序列, 即交叉序列, $|\t{cs}_x(i)|$ 表示其长度.

先证引理: 若 $x=uvw$ 满足 $|u|=p$, $|uv|=q$, 且 $\t{cs}_x(p)=\t{cs}_x(q)$, 则 $M(x)=M(uw)$. 这是因为, $|\t{cs}_x(p)|=|\t{cs}_x(q)|$ 给出 $M$ 在停机 (或者陷入死循环) 时一定不处于 $v$ 内部, 那么 $M$ 在 $v$ 内部的运行行为完全由离开 $v$ 的状态决定, 即由 $v$ 两端的交叉序列. 而 $v$ 两端交叉序列与 $\eps$ 相同, 所以 $M(x)=M(uvw)=M(u\eps w)=M(uw)$.

由于 $A$ 不正则, 根据 Myhill-Nerode 定理, $A$ 中存在无穷多个前缀等价类. 因此, 对任意大的 $n\in\N$, 总存在一个 $x$, 它是其所属等价类中最短的代表元且满足 $|x|\ge n$. 根据引理, 若 $x$ 内部存在两个位置产生了相同的交叉序列, 则这两个位置之间的串可以删去得到 $x'$, 且 $x'\equiv x$, 与 $x$ 的最短性矛盾. 所以 $x$ 内部的交叉序列两两不同. 据此, 考虑 $M(x)$ 的运行时间
$$
T(n)\ge\sum_{i=1}^n\t{cs}_x(i)\ge\min_{\{c_j\}}\l\{\sum_{j=0}^\oo j\cdot c_j\mid\sum_{j=0}^\oo c_j=n\land\br{\A j,~c_j\le|Q|^j}\r\}.
$$
 不妨设 $|Q|=s$, $n=s^{k+1}-1$, 则 $T(n)\ge \sum_{j=0}^k j s^j\ge ks^k=\Theta(kn)=\Theta(n\log n)$, 矛盾.

---

**[B15]** *神谕世界的对角化技术*: 存在神谕 $A$ 使得 $\tb{P}^A\neq\tb{NP}^A\land\tb{NP}^A\sub\tb{P}^A/\t{poly}$.

**Prf. ** 取 $A=S\oplus T:=\{0x:x\in S\}\sqcup\{1y:y\in T\}$, 其中 $T=\t{TQBF}$ 满足 $\tb{P}^T=\tb{NP}^T$. 对于 $S$, 构造如下: 列出所有多项式时间的 OTM $M_1,M_2,\cdots$, 设它们的时间上界为多项式 $p_1,p_2,\cdots$, 令 $S_0=\varnothing$, 此后归纳地构造. 对 $k\in\Z_{\ge 1}$, 取足够大的 $n_k$ 满足 $n_k>\max\{n_i:1\le i\le k-1\}$ 且 $2^{n_k}>p_k(n_k)$. 讨论 $M_k^{S_{k-1}\oplus T}(0^{n_k})$ 的运行结果:

- 若 $M_k$ 接受, 则 $S_k:=S_{k-1}$, $D_k:=D_{k-1}$.
- 否则, 由于 $p_k(n_k)<2^{n_k}$, 一定存在 $x^*_k\in\{0,1\}^{n_k}$ 没有被 $M_k$ 在运行过程中询问过. 取其中字典序最小者, 令 $S_k:=S_{k-1}\cup\{x_k^*\}$.

最后取 $S:=\bigcup_{k\ge 1}S_k$. 以下说明这样构造的 $A$ 满足题设. 对于 $\tb{P}^A\neq\tb{NP}^A$, 考虑对角线构造: $L:=\{0^n:\E x\in\{0,1\}^n,~0x\in A\}$. 一方面, $L\in\tb{NP}^A$, 这是因为我们可以用 NDTM 非确定性枚举所有长为 $n$ 的串, 然后调用预言机验证结果. 另一方面, 如果存在多项式的 OTM $M=M_k$ 判定 $L$, 则考虑 $M_k^A(0^{n_k})$ 的结果:

- 若 $M_k$ 拒绝了 $0^{n_k}$, 根据定义, 长为 $n_k$ 的 $x_k^*$ 已然被加入 $A$ 中, 应当有 $0^{n_k}\in L$, 判定错误.
- 若 $M_k$ 接受了 $0^{n_k}$, 由于 $x_k^*$ 是 $S$ 中唯一可能长为 $n_k$ 的串, 必然就有 $x_k^*\in S_k\sub S$. 但这意味着 $M_k^{S_{k-1}\oplus T}$ 其实拒绝了 $0^{n_k}$, 且由于运行时间限制, $M_k^{S_{k-1}\oplus T}$ 的行为应当和 $M_k^A$ 一致, 这与 $M_k$ 接受 $0^{n_k}$ 矛盾.

总之, 不存在多项式的 OTM 判定 $L$, $\tb{P}^A\neq\tb{NP}^A$.

对于 $\tb{NP}^A\sub\tb{P}^A/\t{poly}$, 考虑任意 ONDTM $N^A$, 设其时间界为多项式 $p$. 由于 $S$ 是稀疏的, 当给定输入长度 $n$, 设 $\ell=p(n)$, $N$ 至多向预言机询问长度不超过 $\ell$ 的串, 因此, 令建议 $a(n)$ 硬编码集合 $\{x:x\in S\land |x|\le \ell\}$, 集合字符串总长不超过 $\ell^2$, 因而编码能在多项式内完成. 每当 $N$ 向预言机询问 $0x$ 时, $N/a(n)$ 直接遍历 $a(n)$ 以检查 $x$ 是否被编码, 即可用这个建议代替语言的功能. 这样, $N^A=N^{S\oplus T}=N^T/a(n)$. 而根据 $T$ 的定义, $\tb{P}^T=\tb{NP}^T$, 则存在 OTM $M^T$ 能够模拟 $N^T$. 那么 $M^T/a(n)$ 模拟了 $N^A$. 最终就有 $\tb{NP}\sub\tb{P}^A/\t{poly}$.

### 数学工具

**[C1]** $X\ge 0$, $\Ex[X^2]<\oo$, $\Ex[X]>0$, 则 $\Pr[X>0]\ge\frac{\Ex[X]^2}{\Ex[X^2]}$ (可用于 $\tb{AM}$ 协议构造时的概率分析).

**[C2 Chernoff's]** 若 $X_i\in[0,1]$ 且 $\seq X1n$ 互相独立, 那么 $\Pr\bk{\frac{1}{n}\sum X_i\ge \mu+\delta}\le\e^{-2\delta^2n}~(\delta\ge 0)$.

---

---

---

#### 1. Automata

**[1.1]** CFL 对 intersection 不封闭

#### 2. Computability

**[2.1]** $EX = \{\langle M \rangle \mid M\text{ doesn't accept } \langle M \rangle\}$，$A_{TM}=\{\langle M,w\rangle: M \text{ accepts } w\}$，$HALT_{TM}=\{\langle M,w\rangle:M(w)\text{ halts}\}$，$E_{TM}=\{\langle M\rangle:L(M)=\emptyset\}$，$EQ_{TM}=\{\langle M_1,M_2\rangle:L(M_1)=L(M_2)\}$ 不可判定，其中 $EX$，$\overline{A_{TM}}$，$\overline{HALT_{TM}}$，$EQ_{TM}$，$\overline{EQ_{TM}}$ 不可识别

**[2.2]** $L$ decidable iff $L$ 与 $\overline L$ recognizable

#### 3. Time Complexity

**[3.1]** (Time Hierarchy Theorem) 若 $t_2(n)\log t_2(n)=o(t_1(n))$，则 $DTIME(t_2(n))\subsetneq DTIME(t_1(n))$

**[3.2]** NPC 问题包含 SAT、3SAT、独立集、顶点覆盖、哈密顿路 / 回路、TSP、3-coloring、3-matching

**[3.3]** 若 $P = NP$，则 $EXP = NEXP$

> 给 $NEXP$ 问题的输入加上指数级长度的 padding 即可得到 $NP$ 算法，由假设 $P = NP$ 得到 $P$ 算法，再删掉 padding 得到 $EXP$ 算法

**[3.4]** (Ladner's Theorem) 若 $P \neq NP$，则 $\exists L \in NP \backslash P$，且 $L$ 不为 $NP$-hard

#### 4. Space Complexity

**[4.1]** $NSPACE(S(n)) \subseteq TIME(2^{O(S(n))})$ 且(Savitch's Theorem) $\subseteq SPACE(S^2(n))$

> 前者只需在 configuration graph 上搜索
>
> 后者折半地在 configuration graph 上搜索（$dfs(k, s, t)$ 判定是否存在 $2^k$ 长度从 $s$ 到 $t$ 的路径），递归深度只需 $O(S(n))$，栈帧大小也为 $O(S(n))$，总空间 $O(S^2(n))$

**[4.2]** (Space Hierarchy Theorem) 若 $t_2(n) = o(t_1(n))$，则 $SPACE(t_2(n)) \subsetneq SPACE(t_1(n))$

**[4.3]** TQBF 为 $PSPACE$-complete

> 类似 Savitch's Theorem 的证明，用 $dfs(k, s, t) = \exists m. \forall x\ y. \lnot ((x = s \land y = m) \lor (x = m \land y = m)) \lor dfs(k - 1, x, y)$ 将 $dfs$ 用 Boolean formula 表示，注意该规约甚至是 $\log$-space 的

**[4.4]** $PATH$ 和 $\overline{PATH}$ 均是 $NL$-complete 的，$NL = coNL$

> $\overline{PATH}$ 的 certificate 逐步提供从起点出发走 $i$ 步可到达的点数 $c_i$，每次先用 $c_{i+1}$ 条路径升序指出可达点集，再升序对 $n - c_{i+1}$ 个不可达的点 $x$ 列出 $c_i$ 条路径指出 $i$ 步可达点集并说明其没有指向 $x$ 的边

**[4.5]** 若 $\exists k. \Sigma_k^P = \Pi_k^P$，则 $PH = \Sigma_k^P = \Pi_k^P$

#### 5. Boolean Circuit

**[5.1]** (Non-uniform Size Hierarchy) 若 $n < t_2(n) < t_2(n) \log^2 t_2(n) = o(t_1(n)) < t_1(n) < \frac{2^n}{n}$，则 $SIZE(t_2(n)) \subsetneq SIZE(t_1(n))$

> 取 $l = \log t_2 + \log \log t_2 + C$，by counting 存在需要至少 $\frac{2^l}{l} = \omega(t_2(n))$ 规模的 $f: \{0, 1\}^l \to \{0, 1\}$，由于 $l < n$ 可加 padding 得到 $f': \{0, 1\}^n \to \{0, 1\}$，同时至多需要 $l 2^l = O(t_1(n))$ 的规模

**[5.2]** (Karp-Lipton Theorem) $NP \subseteq P / poly \implies PH = \Sigma_2^P$

> 在假设下证明 $\Pi_2^P SAT \leq_P \Sigma_2^P SAT$：$\Pi_2^P SAT$ 去掉最外层的 $\forall$ 就是一个 $SAT$，找到对应的 circuit $C$ 判定 $SAT$ 问题，则 search to decision 可以找到找到证书的电路 $C'$， $\forall u. \exists v. \phi(u, v) \iff \exists C' \forall u. \phi (u, C'(\phi, u))$，另一方向由于找到 $C'$ 就可以计算 $v = C'(\phi, u)$

**[5.3]** 用 $k(n)$ 层电路计算 $Parity$ 至少需要 $\exp(\Omega(n^{1/(k(n)-1)}))$ 规模，故 $Parity \notin AC_0$ 

#### 6. Randomized Computation

**[6.0]** $RP$ 指的是 $x \in L$ 时正确率 $\geq \frac 2 3$，$x \notin L$ 时正确率为 $1$

**[6.1]** (Chernoff Bound) 对独立伯努利随机变量 $X_1 \cdots X_n$，设 $X = \sum X_i$，则 $Pr(|X - \mu| > \epsilon) \leq 2\exp(-2\frac{\epsilon^2}{n})$

**[6.2]** $BPP \subseteq P / poly$

> 先 error reduction 到错误率小于 $2^{-n}$，则由 union bound 存在输入导致错误的概率 $< 1$，则可找到一个全对的种子
>
> 将种子刻在电路里，再把 $BPP$ 当 $P$ 处理即可

**[6.3]** $BPP \subseteq \Sigma_2^P \cap \Pi_2^P$

> 由 $coBPP = BPP$ 只需证 $BPP \subseteq \Sigma_2^P$：将 error reduction 到错误率小于 $2^{-n}$，取 $k = \lceil \frac m n \rceil + 1$，考虑 formula $\exists u_1 \dots u_k. \forall r. \lor M(x, u_i \oplus r)$，其中 $u_i \oplus r$ 为种子
>
> 若 $x \notin L$，则给定 $u_i$ 对于均匀随机的 $r$，$M(x, u_i \oplus r)$ 的错误率不超过 $2^{-n}$，总错误率不超过 $k2^{-n} < 1$，故一定有不错误 $r$ 导致公式错误
>
> 若 $x \in L$，则给定 $r$ 对于独立均匀随机的 $u_i$，$\lor M(x, u_i \oplus r)$ 错误率为 $2^{-k n} < 2^{-m}$，故存在 $r$ 导致错误的概率 $<1$，故一定有正确 $u_i$ 保证公式正确

**[6.4]** $BPL \subseteq L^2 \cap P$

> 把 configuration graph 的转移写成概率矩阵，计算矩阵快速幂判定其最终起点到接收状态概率之和是否 $\geq \frac 1 2$，对于 $L^2$ 情况需要折半递归（类似 $dfs$，定义 $mut(k, i, j)$ 计算 $M^{2^k}(i;j)$），实际细节包括如何将精度压缩在 $poly(n)$ 中

#### 7. Interactive Proof

**[7.1]** $IP = PSPACE$

> $\subseteq$ 考虑用 $PSPACE$ prover 计算成功概率最大的返回值
>
> $\supseteq$ 需要 sum-check protocol，对于 $SAT$ 问题，将 Boolean formula 写成 $P(x_i) \in \{0, 1\}$ 形式，欲判定 $\sum\limits_{x_i} P(x_i) = c$ or not，先向 prover 索取一大素数 $\in [2^n, 2^{2n}]$，用 MR 多项式时间判定，然后在 $F_p$ 内考虑。
>
> 每次向 prover 询问 $s(x_1) = \sum\limits_{x_i, i > 1} P(x_i)$，要求 $s(0) + s(1) = c$，然后随机 $a \in F_p$ 并递归检查 $s(a) = \sum\limits_{x_i, i > 1} P(a, x_i)$，单次正确率至少 $1-\frac{O(n)}{p}$，因为 $P$ 度数为 $O(n)$
>
> 对于 $TQBF$，需要引入 $\forall$ 对应的 $\prod$ 和降度数的 $L_i$，$L_i(P) = x_i P(\dots, x_i = 1,\dots) + (1-x_i)P(\dots, x_i = 0, \dots)$，且需要将 $\sum$ 改为 $P(0) + P(1) - P(0)P(1)$ 处理值域爆炸问题

**[7.3]** 对任意常数 $k \geq 2$，$AM[k] = AM[2]$

**[7.2]** 对 $S \subseteq \{0, 1\}^m$ 且 $x \in S$ 可多项式时间判定，给定的数 $K$ 和 $2^{k-2} < K \leq 2^{k - 1}$，$S$ 要么 $\in [K, 2^{k-1}]$ 要么 $\leq \frac{K}{2}$。存在一 $AM$ 上的 protocol 可判定 $S$ 是大还是小

> Verifier 均匀选取 pointwise-independent hash function $h_{m, k}$ 和 $y \in \{0, 1\}^k$ 并向 prover 发送，prover 应返回 $x \in S$ 使得 $h_{m, k}(x) = y$
>
> 令 $p = \frac{|S|}{2^k}$，则 $p \geq Pr(\exists y. h(x) = y) \geq \frac{3}{4}p$
>
> 左侧由 $|h(S)| \leq |S|$ 保证
>
> 右侧通过 $Pr(\exists y. h(x) = y) \geq \sum\limits_{x} Pr(h(x) = y) - \frac 1 2\sum\limits_{x \neq x'} Pr(h(x) = h(x') = y) = |S| 2^{-k} - \binom{|S|}{2}2^{-2k} = p(1 - \frac{|S| - 1}{2^{k + 1}}) \geq \frac 3 4 p$ 得到