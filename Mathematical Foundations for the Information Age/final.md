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

[TOC]

### Properties: Unit ball in High dimensional space

$$
\u{surface}:=\l\{(\seq x1d):\sum_{i=1}^dx_i^2=1\r\},\quad \u{interior}:=\l\{(\seq x1d):\sum_{i=1}^dx_i^2\le1\r\};\\
V(d):=\u{volume~of~}\R^d\u{~unit~ball},\quad V(d,r)=V(d)r^d.
$$

> **Question 1**
>
> When trying to sample a point within a unit ball:
>
> - How to sample it?
> - What's the (expected) norm of this random vector?

We highlight the intuition that "probability" has a lot to do with "volume". Analytically,
$$
\Pr[\bs x\text{ in ball with }r=1-\eps]=1-\underbrace{\frac{V(d)(1-\eps)^d}{V(d)}}_{\text{ratio of volume}}=1-(1-\eps)^d\overset{d\to\oo}\to1.
$$
Or there is a convenient variation:
$$
\Pr[\cdots]=1-(1-\eps)^d\ge1-\e^{-\eps d}.
$$
We focus on sampling point on the surface of the ball first. We are familiar with the algorithm below:

- Sample $x_i$ from $\mathcal N(0,1)$, and normalize $(\seq x1d)$ to yield a random point.

The uniformity of the direction is easy to prove (by entropy intuitively, or little calculation).

Given the independency of the direction and the norm of a vector, the problem is reduced to sample the norm of the vector properly. Formally, the sampling algorithm is like

- Sample $r$ from distribution $P(r)$ (which is uncertain yet);
- Sample $\bs x$ on the surface of a unit ball;
- Yield $r\bs x$.

When sampling $r$, it is required to sample $r\in[0,1]$ s.t. the density of $r$ is proportional to $r^{d-1}$. That is, $P(r)=dr^{d-1}~(r\in[0,1])$. To achieve this, we can pick $s\sim\opn{Unif}([0,1])$ and let $r=\sqrt[d]{s}$.

&nbsp;

> **Question 2**
>
> What's the relation between $V(d)$ and $A(d)$?

$$
\frac{\d}{\d r}V(d,r)=A(d,r)\Ra \frac{\d}{\d r}(V(d)r^d)=A(d)r^{d-1}.
$$

Here we know $V(d)=\frac{A(d)}{d}$.

&nbsp;

> **Question 3**
>
> Find $I:=\int_{-\oo}^{+\oo}\e^{-x^2}\d x$.

A classical problem.
$$
\ALI{
	I^2 &= \int_{-\oo}^{+\oo}\int_{-\oo}^{+\oo}\e^{-x^2}\e^{-y^2}\d x\d y\\
	&= \int_{-\oo}^{+\oo}\int_{-\oo}^{+\oo}\e^{-(x^2+y^2)}\d x\d y\\
	&= \int_0^{+\oo}\e^{-r^2}\cdot 2\pi r\d r\\
	&= \pi\int_0^{+\oo}\e^{-t}\d t\\
	&= \pi.
}
$$
Therefore, $I=\sqrt\pi$.

One step further, this may derive the formula for volumes of $n$-balls:
$$
\int\cdots\int\e^{-\sum_{i=1}^dx_i^2}\d x_1\cdots\d x_d=\pi^{\frac{d}{2}}\\
\Ra \int_0^{+\oo}\e^{-r^2}A(d,r)\d r=\pi^{\frac{d}{2}},
$$
which gives
$$
A(d)=\frac{\pi^{\frac{d}{2}}}{\underbrace{\int_0^{+\oo}\e^{-r^2}r^{d-1}\d r}_{J_{d}}}.
$$
Remains to solve: $J_d$s.

> **Question 4**
>
> Find $I_n:=\int_0^{+\oo}x^n\e^{-x}\d x$.

It gives factorials, deriving the Gamma function $\Gamma(t+1):=\int_0^{+\oo}x^t\e^{-x}\d x$ as a generalization.

Back to $J_d$s:
$$
\ALI{
	J_d &= \int_0^{+\oo}\e^{-r^2}r^{d-1}\d r\\
	&= \int_0^{+\oo} \e^{-t}t^{\frac{d-1}{2}}\d t^{\frac{1}{2}}\\
	&= \frac{1}{2}\int_0^{+\oo}e^{-t}t^{\frac{d}{2}-1}\d t\\
	&= \frac{1}{2}\Gamma\br{\frac{d}{2}}.
}
$$
Therefore, $A(d)=\frac{2\pi^{d/2}}{\Gamma(d/2)}$ and $V(d)=\frac{2\pi^{d/2}}{d\Gamma(d/2)}$.

&nbsp;

Next step, we are to illustrate that the mass of a ball is concentrated on its equator in a high dimensional space.

The reason is obvious: we may calculate the volume (mass) by integrating on the first axis, where
$$
\d V=V(d-1)(1-x_1^2)^{\frac{d-1}{2}}\d x_1
$$
just causes the phenomenon:
$$
\ALI{
	V_h:=\int_{h}^1V\br{d-1,\sqrt{1-x_1^2}}\d x_1 &= V(d-1)\int_h^1(1-x_1^2)^{\frac{d-1}{2}}\d x_1\\
	&\le V(d-1)\int_h^1 \e^{-x_1^2\frac{d-1}{2}}\d x_1\\
	&\le V(d-1)\int_h^{+\oo}\frac{x_1}{h}\e^{-x_1^2\frac{d-1}{2}}\d x_1\\
	&= \frac{V(d-1)}{2h}\int_{h^2}^{+\oo}\e^{-t\frac{d-1}{2}}\d t\\
	&= \frac{V(d-1)}{(d-1)h}\e^{-h^2\frac{d-1}{2}}.
}
$$
For the whole half ball, we may estimate its lower bound with the volume of the cylinder inside it. If the height of the cylinder is $h'$, then
$$
\frac{V(d)}{2}\ge V_{\u{cylinder}}=h'\x V(d-1,\sqrt{1-h'^2})=V(d-1)h'(1-h'^2)^{\frac{d-1}{2}}.
$$
Pick $h'=\frac{1}{\sqrt{d-1}}$ for the tightest bound:
$$
\frac{V(d)}{2}\ge V(d-1)\cdot\frac{1}{\sqrt{d-1}}\br{1-\frac{1}{d-1}}^{\frac{d-1}{2}}\ge\frac{V(d-1)}{2\sqrt{d-1}}
$$
and set $h=\frac{c}{\sqrt{d-1}}$,
$$
V_h\le\frac{V(d-1)}{c\sqrt{d-1}}\e^{-\frac{c^2}{2}}.
$$
Therefore,
$$
\frac{2V_h}{V(d)}\le\frac{2}{c}\e^{-\frac{c^2}{2}}.
$$

> **Theorem**
>
> $\seq{\bs x}1n$ are uniformly and independently sampled from the interior of a unit ball, then with the probability of $p\ge 1-\frac{1}{n}$:
>
> (a) $\A i,~\|\bs x_i\|\ge 1-\frac{2\ln n}{d}$;
>
> (b) $\A i\neq j,~|\bs x_i\cdot \bs x_j|<\sqrt{\frac{6\ln n}{d-1}}$.

*→ Proof.* Use estimations above and take a union bound.

&nbsp;

Look back at the property $\lim_{d\to\oo}V(d)=0$. We define the intersection of $d$ equators is the box of a $d$-unit ball. Then when sampling $\bs x$ in the ball:
$$
\Pr[\bs x\text{ not in box}]\le d\x\frac{2}{c}\e^{-\frac{c^2}{2}}\overset{c=2\sqrt{\ln d}}{\le}\frac{1}{d}\le\frac{1}{2}.
$$
This goes contradictory with our intuition: this box should be quite small since the mass proves to concentrate on the surface of the ball. Why is that?

The induction is correct so let's just change our intuition: a proper 2D visualization of a high-dimensional ball should be a "star" (think about it in your mind) instead of a naive 2D ball.

> **Gaussian Annulus Theorem**
>
> For all $\beta\le\sqrt{d}$, with the probability $1-3\e^{-c\beta^2}$, $|\bs x|\in[\sqrt{d}-\beta,\sqrt{d}+\beta]$, where $c$ is a fixed and calculable constant.

&nbsp;

> **Johnson-Lindenstrauss's Algorithm (JL algo.)**
>
> For $n$ points in $\R^d$, $\seq{\bs v}1n$, $\eps\in(0,1)$, there exists an algorithm who constructs a map $f:\R^d\to\R^k$ where $k\ge\frac{3\ln n}{c\eps^2}$, and with probability at least $1-\frac{3}{2n}$, ($c$ is the constant mentioned above), $f$ is $\eps$-pairwise-distance-preserving, i.e.
> $$
> \A i\neq j,~(1-\eps)\|\bs v_i-\bs v_j\|\le\|f(\bs v_i)-f(\bs v_j)\|\le(1+\eps)\|\bs v_i-\bs v_j\|.
> $$

*→ Proof.* Sample $\seq{\bs u}1k$ uni. & ind. on the $d$-unit ball, and set $f':\bs v\mapsto\pmat{\bs v\cdot\bs u_1&\cdots&\bs v\cdot \bs u_k}^\T$. This actually gives a Gaussian vector on $k$-unit ball. Therefore, a unit vector $\bs v$ is expected to be mapped to a vector of norm $\sqrt k$. That is, a distance vector $\bs v_i-\bs v_j$ is expected to be scaled $\sqrt{k}$ times (confirmed by Gaussian annulus theorem and union bound), independent with the vector itself. $f=\frac{1}{\sqrt k}f'$ meets our desire with high (could be quantified with little calculation) probability.


### Singular Value Decomposition

We are interesting in "compact" a high-rank matrix into a low-rank matrix while conserving its "information" as much as possible. As for the measurement of errors, we use Frobenius norm:
$$
\|A\|_F:=\sqrt{\sum_{i=1}^n\sum_{j=1}^m|a_{ij}|^2}.
$$
That is, for a matrix $A$, we want to find $B$ with $\rank B\le k$, which minimized $\|A-B\|_F$.

An easy version: find the best unit vector that minimized the sum of squared distance to a batch of vectors (as row vectors, they form a matrix $A$). Given the length of all the vectors are fixed, minimizing the sum is equivalent to maximizing the sum of squared norm of the projections on this unit vector, that is to maximize $\|Av\|_2^2$.

The first singular value $\sigma_1$ is defined as
$$
\sigma_1=\max_{\|v\|_2=1}\|Av\|_2,
$$
and the argmax of it as $v_1$ (maybe multiple even up to scaling).

> **Exercise 1 (Best Rank-One Approximation)**
>
> For the first singular value $v_1$ of $A$, $\|A-Av_1v_1^\T\|_F\le \|A-B\|_F$ for any $\rank B=1$.

*→ Proof.* $Av_1v_1^\T$ forms a matrix, row vectors of which are projections on $v_1$ of $A$'s row vectors. Further discussion is clear.

Let's go one step further, from best-fit line (1D) to best-fit plane (2D). Intuitively, we come up with a greedy algorithm: find $\sigma_1$ and $v_1$, and then find the best-fit line $v_2=\arg\max_{|v|=1\land v\perp v_1}|Av|$. (We write $\|\cdot\|_2$ as $|\cdot|$ for vectors for simplicity.)

Why is it correct? For any $w_1\perp w_2$, we can rotate $(w_1,w_2)$ on the plane they determine to make $w_2\perp v_1$. Now $|Av_1|\ge |Aw_1|$ and $|Av_2|\ge |Aw_2|$. (Despite the conciseness, I think this proof is very tricky and worth remembering.)

> **Exercise 2**
>
> $Av_1\perp Av_2$ where $v_1$ and $v_2$ are singular vectors of $A$.

*→ Proof.* Consider that ($(\cdot\mid\cdot)$ means the inner product of two vectors. This convention comes from *lww*.)
$$
\|A(\cos \theta v_1+\sin\theta v_2)\|_2^2=\cos^2\theta\|Av_1\|_2^2+\sin^2\theta\|Av_2\|_2^2+2\cos\theta\sin\theta\cdot(Av_1\mid Av_2),
$$
if $(Av_1\mid Av_2)\neq 0$, then
$$
\frac{\part}{\part\theta}\|A(\cos \theta v_1+\sin\theta v_2)\|_2^2=-\sin2\theta\cdot a+2\sin2\theta\cdot b+2\cos2\theta\cdot c\overset{\theta=0}{\neq} 0.
$$
It implies that $Av_1$ is not the argmax of $|Av_1|$, raising a contradiction.

Continuing this process, we can pick a orthogonal base of the space, $\seq v1d$, and
$$
A=\sum_i Av_iv_i^\T=\sum_i\sigma_iu_iv_i^\T,
$$
where $\seq u1{d'}$ also form a orthogonal base. A well-known form of this is $A=U\Sigma V^\T$.

&nbsp;

The final stuff is to compute $\Sigma$ and $V$. Given that
$$
\CAS{
	Av_i=\sigma_i u_i,\\
	A^\T u_i=\sigma_i v_i;
}
$$
we known $A^\T Av_i=\sigma_i^2 v_i$, and $A^\T A$ can always be orthogonally diagonalized as a positive semi-definite form.

> *Review list for midterm exam*
>
> - [ ] Theorem 2.7
> - [ ] Theorem 2.8
> - [ ] Theorem 2.9 -> 2.10 -> 2.11

&nbsp;

### Machine Learning

We will consider the balance between training error reduction and generalization ability.

**Linear Classifier**

For $\dat x_i\in\R^2$, a linear classifier $h_{\dat w,t}(\dat x)$ classifies the plane into positive and negative semi-planes. ($\dat a::\dat b$ means concatenate $\dat a\in\R^a$ and $\dat b\in \R^b$ to form a vector $\dat c\in\R^{a+b}$.)
$$
h_{\dat w,t}(\dat x)=\opn{sign}((\dat w::-t\mid\dat x::1)).
$$
We simply treat $\dat w$ as $(\dat w::-t)\in\R^3$ and $\dat x$ as $\dat x::1$. If there exists a perfect classifier that classifies all training data correctly, which means $\A i,~h(\dat x_i)\dat y_i>0$, then there should be a $\dat w^*$ s.t. $h_{\dat w^*}(\dat x_i)\dat y_i\ge 1$.

If $\dat w^*$ exists, we have a iterative algorithm to find a perfect classifier. Let $\dat w_0=\bs 0$, while there is an $\dat x_i$ s.t. $(\dat w_t\mid \dat x_i)y_i\le 0$, we set $\dat w_{t+1}\gets\dat w_t+y_i\dat x_i$. Note that
$$
(\dat w_{t+1}\mid \dat w^*) = (\dat w_t\mid \dat w^*)+y_i(\dat x_i\mid \dat w^*)\ge (\dat w_t\mid\dat w^*)+1\Ra \|\dat w_t\|\|\dat w^*\|\ge t.
$$
So $(\dat w_t\mid\dat w^*)$ increases monotonously. Besides, if $\|\dat x_i\|\le r^2$ holds,
$$
\ALI{
	(\dat w_{t+1}\mid\dat w_{t+1}) &= (\dat w_t\mid \dat w_t)+2y_i(\dat x_i\mid\dat w_i)+(\dat x_i\mid\dat x_i)\\
	&\le (\dat w_t\mid\dat w_t)+r^2.
}
$$
i.e. $\|\dat w_{t+1}\|^2\le\|\dat w_t\|^2+r^2$. Let $m$ be the time of updates (mistakes), then
$$
mr^2\ge\|\dat w_m\|^2\ge\frac{m^2}{\|\dat w^*\|^2}\Ra m\le \|\dat w^*\|^2r^2.
$$
This upper bound implies that our model is easier to train when positive and negative samples lie along a large gap between them, where $\|\dat w^*\|$ can be small.

For high dimensional space, we may find a "kernel function" $\lang \dat x_i,\dat x_j\rang^*$ with $\varphi$ existing s.t.
$$
\lang\dat x_i,\dat x_j\rang^*=(\varphi(\dat x_i)\mid\varphi(\dat x_j)).
$$
E.g. $\lang\dat x_i,\dat x_j\rang^*=\e^{-k\|\dat x_i-\dat x_j\|}$.

Now, assuming our training set is sampled from a distribution $D$, we define the true error of model $h$ as
$$
\opn{te}_D(h):=\Pr_{x\sim D}[h(\dat x)\neq h_{\text{gt}}(\dat x)].
$$
Let all possible $h\in\mathcal H$ (finite set). Bad event $B:\E h\in\mathcal H,~\text{te}_D(h)>\eps\land\text{err}_S(h)=0$. To make $\Pr(B)<\delta$, with union bound:
$$
|\mathcal H|(1-\eps)^{|S|}<\delta\Ra|S|>\frac{1}{\eps}\log\frac{|\mathcal H|}{\delta}.
$$
This give the desired size of sample set $S$.

> **Theorem 1**
>
> For $\eps>0$ and $0<\delta<1$, $\Pr[|\text{err}_S(h)-\text{err}_D(h)|<\eps]\ge 1-\delta$ when
> $$
> |S|>\frac{1}{2\eps^2}\br{\ln|\mathcal H|+\ln\frac{2}{\delta}}.
> $$

And when $|S|>\cdots$, we know, with high probability,
$$
\text{err}_D(h)<\text{err}_S(h)+\sqrt{\frac{\ln|\mathcal H|+\ln\frac{2}{\delta}}{2|S|}}.
$$
The second term implies our normalization penalty method in model training.

But... What to do with contiguous $\mathcal H$?

> **Definition 1**
>
> We say $(X,\mathcal H)$ shatters $A\sub X$, iff
> $$
> \A S\sub A,~\E h\in\mathcal H,~S=h\cap A,
> $$
> where binary hypothesis $h$ is seen as a subset of $X$.

> **Definition 2 (VC Dimension)**
>
> We say $\opn{VC}(X,\mathcal H)=d$, iff
> $$
> \CAS{
> 	\E A,~|A|=d\land A~\text{shattered by}~\mathcal H;\\
> 	\A A,~|A|>d\land A~\text{not shattered by}~\mathcal H.
> }
> $$

For example $\opn{VC}(\R,\{\text{intervals}\})=2$.

> **Proposition 1**
>
> $\mathcal H:=\{d~\text{dimensional semi-plane}\}$, $X:=\R^d$, then $\opn{VC}(X,\mathcal H)=d+1$.

*→ Proof.* $A=\{0,\pmat{1&0&0&\cdots},\pmat{0&1&0&\cdots}\}$ gives the desired set for $d+1$. For any $d+2$ points $\seq{\dat x}1{d+2}$ , a semi-plane can be expressed as $\dat h\in\R^{d+1}$, where
$$
\dat h^\T\pmat{
	\dat x_1&\cdots&\dat x_{d+2}\\
	1&\cdots&1
}=\dat c^\T,
$$
and we can treat $\dat x_i$ is a positive sample iff $\dat c_i\ge 0$. We can always construct $\dat c\in\R^{d+2}$, s.t.
$$
\CAS{
	\sum_{i=1}^{d+2}c_i\dat x_i=\dat 0,\\
	\sum_{i=1}^{d+2}c_i=0.
}
$$
In this case, $m:=\sum_{c_i\ge 0}c_i=\sum_{c_j<0}(-c_j)$, but
$$
\dat x^*:=\sum_{c_i\ge 0}\frac{c_i}{m}\dat x_i=\sum_{c_j<0}\frac{-c_j}{m}\dat x_j
$$
is a point in both the convex polygons of positive sample points and negative ones, which should not exist.

The same conclusion holds for $d$ dimensional sphere.

> **Definition 3 (Growth Function)**
>
> For a set system $(X,\mathcal H)$, we define
> $$
> \pi_{\mathcal H}(n):=\max_{|S|=n}|\{h\cap S:h\in\mathcal H\}|.
> $$

A key property of growth function:
$$
\pi_{\mathcal H}(n)\le\sum_{i=0}^d\binom{n}{i},\quad \text{where}~d=\opn{VC}(X,\mathcal H).
$$
If we define $\mathcal H_1\cap\mathcal H_2:=\{h_1\cap h_2:h_1\in \mathcal H_1,h_2\in\mathcal H_2\}$, then
$$
\pi_{\mathcal H_1\cap\mathcal H_2}(n)\le\pi_{\mathcal H_1}(n)\cdot\pi_{\mathcal H_2}(n).
$$
&nbsp;

Now we look back at <u>Theorem 1</u> in this chapter, handling infinite $|\mathcal H|$.

> **Theorem 2**
>
> For domain $X$, sample distribution $D$ and hypotheses set $\mathcal H$, when $|S|=\mathcal O\br{\frac{1}{\eps}\br{\opn{VC}(X,\mathcal H)\log\frac{1}{\eps}+\log\frac{1}{\delta}}}$, with probability not less than $1-\delta$, for all $h$ with $\text{err}_h(S)=0$, there is $\opn{err}_h(D)<\eps$.

*→ Proof.* For a sampled $S$, let event
$$
A:\E h\in\mathcal H,~\opn{err}_h(S)=0\land\opn{err}_h(D)>\eps,\\
B:\E h\in\mathcal H,~\opn{err}_h(S)=0\land\opn{err}_h(S')>\frac{\eps}{2},
$$
where $S'$ is sampled like $S$. When $n=|S'|=|S|>\frac{8}{\eps}$, $\Pr[B\mid A]\ge\frac{1}{2}$. With this bound,
$$
\Pr(B)\ge\Pr(AB)=\Pr(B\mid A)\Pr(A)\ge\frac{\Pr(A)}{2}.
$$
We may bound $\Pr(B)$. Let's rephrase $B$ as "sample $S\cup S'$ first, randomly partition them into $S$ and $S'$, and finally check the condition". ..........
$$
\Pr(B)\le\pi_{\mathcal H}(2n)\br{1-\frac{\eps}{4}}^n\le\pi_{\mathcal H}(2n)\e^{-\frac{\eps}{4}n}\le\frac{\delta}{2}.
$$

&nbsp;

### Online Learning

Now we set foot on online learning, where data come as a flow. For example, for stock market prediction, we want to design an algorithm to calculate the proper decision of day $t+1$, according to experts' advice history of day $[1:t+1]$ and ground truth of day $[1:t]$, to reduce the accumulative loss.

As a benchmark, we consider \#mistakes we made versus #mistakes the optimal (in hindsight) expert made before $T$, and try to minimize the gap between them. Here comes a strategy:

- Assign weight $1$ to each expert;
- Half (or${}\x\alpha=\frac{1}{2}$) the weights of those who made a mistake;
- Choose the weighted majority for current day.

Note that the sum of weights $s\gets s\x0.75$ each time we made a mistake, while $s\ge 2^{-m}$, where $m$ is #mistakes the optimal (in hindsight) expert made. So
$$
n\br{\frac{3}{4}}^M\ge\frac{1}{2^{m}}\Ra \ln n-M\ln\frac{4}{3}\ge-m\ln 2\Ra M\le\frac{\ln n+m\ln 2}{\ln\frac{4}{3}}.
$$
We may adjust $\alpha$ to get a tighter bound.

In an antagonistic setting, we can smooth out the worst case by sampling our decision according to the sum of weights, instead of choosing the majority directly.

Given the ground truth, e.g. $\text{N}$, the probability we make mistake is $F_t$, then
$$
\Ex\l[\frac{s_t}{s_{t-1}}\r]=\frac{w_{\u{Y}}+(1-\eps)w_{\u{N}}}{w_{\u{Y}}+w_{\u{N}}}=1-\eps F_t,
$$
not depending on the ground truth's value. and
$$
s=n(1-\eps F_1)(1-\eps F_2)\cdots\Ra \ln s=\ln n+\sum_t\ln(1-\eps F_t)\le \ln n-\eps M.
$$
Therefore,
$$
M\le\frac{\ln n-m\ln(1-\eps)}{\eps}.
$$

### Nash Equilibrium

Here we just omit some preparatory description. The key is
$$
\min_{\bs p}\max_{\bs q} \bs p^\T V\bs q=\max_{\bs q}\min_{\bs p}\bs p^\T V\bs q,
$$
where $\u{LHS}\ge\u{RHS}$ is obvious, while the other side is rather tricky. We want to build a connection between this and the online learning algorithm. Intuitively, online learning algorithm offered us a way to eliminate the "first-player disadvantage", so we can apply it to bound $\u{LHS}\le\u{RHS}+0$.

Our algorithm to approximate the best strategy for loss matrix $V_{n\x m}$ is:

- $w_1(i)\gets 1$ for $i=1..n$;
- For $t=1..T$:
    - Sample $i_t$ to be $i$ w.p. proportional to $w_t(i)$, $\bs p_t\gets\u{onehot}(i_t)$;
    - $j_t\gets\arg\max_j V_{i_tj}$, $\bs q_t\gets\u{onehot}(j_t)$;
    - $w_{t+1}(i_t)\gets w_i(i_t)\e^{-\eps V_{i_tj_t}}$.
- $\bs p=\frac{1}{T}\sum\bs p_t$, $\bs q=\frac{1}{T}\sum \bs q_t$.

With online learning's conclusion, we can bound that
$$
\min_{\bs p^*}\max_{\bs q^*}\bs p^{*\T}V\bs q^*\le\max_{\bs q^*}\bs p^\T V\bs q^*\le \bs p^\T V\bs q\\
{{}\color{red}\le} \min_{\bs p^*}\bs p^{*\T} V\bs q+\mathcal O\br{\frac{1}{\sqrt{T}}}\le\max_{\bs q^*}\min_{\bs p^*}\bs p^{*\T}V\bs q+\mathcal O\br{\frac{1}{\sqrt T}}.
$$

### Boosting

Let's consider a binary classification problem here. The datapoints are $\{(\dat x_i,y_i)\}_{i=1}^n$.

Weak learner: a leaner whose average accuracy $\ge\frac{1}{2}+\gamma$, where $\gamma$ is a small positive number.

Assume we have an oracle $\mathscr O$ who takes a distribution $D$ over $\seq{\dat x}1n$ and yields a weak learner $h_D$. Our target is to construct a perfect learner with $\mathscr O$.

- $w_1(i)\gets 1$ for $i=1..n$;
- For $t=1..T$:
    - $h_t\gets\mathscr O\br{\br{\frac{w_t(i)}{\sum w_t(i)}}_i}$;
    - For $i=1..n$:
        - If $h_t(i)\neq y_i$, $w_{t+1}(i)\gets w_t(i)\x\alp$ ($\alp$ is a constant factor to choose).
- $h\gets\opn{maj}\{\seq h1t\}$.

If $h$ makes mistake on one datapoint, the weight of it $\ge\alpha^{\frac{T}{2}}$, while the total weight is $S=n(\alpha(0.5-\gamma)+(0.5+\gamma))^T$. Set $\alpha=\frac{1+2\gamma}{1-2\gamma}$, then $S=n(1+2\gamma)^T$. So $(1-4\gamma^2)^{\frac{T}{2}}\ge\frac{1}{n}$ gives the bound $T\ge\frac{2\ln n}{\ln\frac{1}{1-4\gamma^2}}$.

From a min-max perspective, let's consider a loss matrix $V_{m\x n}$. Each row corresponds to a learner $h_i$ while each column corresponds to a datapoint $\dat x_j$. We know that
$$
\A\bs q,~\E\bs p,~\bs p^\T V\bs q\le\frac{1}{2}-\gamma\Ra\max_{\bs q}\min_{\bs p}\bs p^\T V\bs q=\min_{\bs p}\max_{\bs q}\bs p^\T V\bs q\le\frac{1}{2}-\gamma.
$$
Therefore, there must exist a $\bs p^*$, s.t.
$$
\A\bs q,~\bs p^{*\T} V\bs q\le\frac{1}{2}-\gamma.
$$
So the weighted majority of $h_i$'s output proportional to $\bs p^*$ must be true, or an one-hot $\bs q$ violates the property.

### Perception Algorithm

Recall that an linear classifier with parameter $\dat w$ predicts the label of $\dat x_t$ as $\opn{sign}((\dat w\mid \dat x_t))$. Here we introduce Hinge loss:
$$
\u{Hinge}(\dat w,\dat x_t):=\CAS{
	0,&(\dat w\mid\dat x_t)y_t\ge 1;\\
	1-(\dat w\mid\dat x_t)y_t,&(\dat w\mid \dat x_t)y_t<1.
}
$$
Say the optimal classifier $\dat w^*$ minimized the total Hinge loss (differs from *Linear Classifier* section, where we assumed $y_t(\dat x_t\mid\dat w^*)\ge 1$, or total Hinge loss is $0$). We can replay the proof at *Linear Classifier* section but with a different upper bound:
$$
(\dat w_t\mid \dat w^*)\le m-\sum_{i=1}^t\opn{Hinge}(\dat w^*,\dat x_i).
$$
The lower bound remains the same:
$$
(\dat w_{t+1}\mid\dat w_{t+1})\le(\dat w_t\mid\dat w_t)+r^2.
$$
Assume the update (mistake) time is $m$, then
$$
\sqrt mr\|\dat w^*\|\ge\|\dat w_m\|\|\dat w^*\|\ge m-\sum_{i=1}^m\opn{Hinge}(\dat w^*,\dat x_i)\\
\Ra \sum_{i=1}^m\opn{Hinge}(\dat w^*,\dat x_i)\ge m-\sqrt mr\|\dat w^*\|.
$$

### Streaming Algorithm

A classical problem is weighted sampling in a stream. Let $a_1,a_2,\cdots,a_t,\cdots$ be positive weights. We maintain current sum $s$ and current sample $x_t$, and when receiving $a_{t+1}$:
$$
s\gets s+a_{t+1},\\
x_t\gets a_{t+1}~\text{w.p.}~\frac{a_{t+1}}{s}.
$$
&nbsp;

Another one is majority maintenance. Let $\seq a1n\in[m]$, $n>2m$. We need to report the strict majority $k\in[m]$ if it exists, or $0$ otherwise. A memory lower bound should be $m~\u{bit}$, since if the latter half votes are all the same, we have to distinguish all $2^{m}-1$ subsets of votes that occur in the former half.

But we know how to bypass this bound: we don't require the algorithm to report $0$ when no strict majority exists. Now we maintain current "winner" and his "hit point" $(w,h)$, and when receiving $a_t$:
$$
(w,h)\gets\CAS{
	(w,h+1),&w=a_t;\\
	(w,h-1),&w\neq a_t,h\neq 0;\\
	(a_t,1),&w\neq a_t,h=0.
}
$$
Final $w$ will be reported. This algorithm can be easily extended to maintain all $\frac{m}{k}$-majority by maintaining $k$ pairs of $(w_i,h_i)$.

&nbsp;

Now let's consider distinct element counting problem. Let $\seq a1n\in[m]$. We need to report $\#\{\seq a1t\}$ for all $t$. The memory bound is $\mathcal O(m)$ obviously. But there is an elegant random algorithm to handle this.

Recall $\Ex_{X\sim\opn{Unif}([0,1])^k}[\min_i X_i]=\frac{1}{k+1}$ (I love its combinational meaning! You may imagine an elegant proof to it). We pick a hash function $h$ whose output are pairwise independent, and we maintain $v_t=\min_{i=1}^t h(a_i)$. As this pseudo-random value concentrate to $\frac{1}{c+1}$, we can estimate $c$ via $v_t$. Take $h(a_i)=(Aa_i+B)\bmod p$ where $A,B\sim\opn{Unif}(\Z_p)^2$ as an example, Chinses Remainder Theorem guarantees that $h$ is pairwise independent function.

> **Theorem 1**
>
> Let $d^*$ be the ground truth of $|\{\seq a1t\}|$, and then
> $$
> \Pr\l[\frac{d^*}{6}\le\frac{p}{v}\le 6d^*\r]\ge\frac{2}{3}-\frac{d^*}{p}.
> $$

*→ Proof.* We are to bound $v$ to $[\frac{p}{6d^*},\frac{6p}{d^*}]$. Let $\{\seq b1{d^*}\}=\{\seq a1t\}$, we can bound
$$
\Pr\l[v<\frac{p}{6d^*}\r]=\Pr\l[\E k~h(b_k)<\frac{p}{6d^*}\r]\le d^*\cdot\frac{1}{6d^*}=\frac{1}{6}.
$$
(Flooring or ceiling constants are ignored.)

For $\frac{6p}{d^*}<v$, we need to introduce a trick: we want to bound $\Pr\l[\A k~h(b_k)>\frac{6p}{d^*}\r]$ but $h(b_k)$ are merely pairwise independent. We may construct a sum of another random variable and use Chebyshev bound, which requires variant that only relies on pairwise independency. Here, let $Y_k=\mathbb 1_{h(b_k)\le 6p/d^*}$, we have
$$
\ALI{
	\Pr\l[\A k~h(b_k)>\frac{6p}{d^*}\r] &= \Pr\l[\sum_{i=1}^{d^*}Y_i=0\r]\\
	&\le \Pr\l[\abs{\sum Y_i-\Ex\l[\sum Y_i\r]}\ge\Ex\l[\sum Y_i\r]\r]\\
	&\le \frac{\sum\Var[Y_i]}{\Ex\l[\sum Y_i\r]^2}\\
	&\le \frac{\sum\Ex[Y_i]}{\Ex\l[\sum Y_i\r]^2}\\
	&= \frac{1}{d^*\Ex[Y_i]}\\
	&= \frac{1}{6}.
}
$$
&nbsp;

Now let's estimate the unbalance rate $\sum_c(\#\{i:a_i=c\})^2$ for $\{\seq a1n\}$. Like the method above, we take a hash function $h:[m]\to\{\pm 1\}$ whose outputs are pairwise independent. It is easy to check
$$
\Ex\bk{\br{\sum_{i=1}^n h(a_i)}^2}=\sum_c(\#\{i:a_i=c\})^2.
$$

### Matrix Sampling

We want to sketch the multiplication of two $n\x n$ matrix $A=\pmat{\bs a_1&\cdots&\bs a_n}$ and $B=\pmat{\bs b_1^\T\\\vdots\\\bs b_n^\T}$, where
$$
AB=\sum_{k=1}^n\bs a_k\bs b_k^\T.
$$
Obviously $n\bs a_k\bs b_k^\T$ where $k\gets\opn{Unif}([n])$ is just a unbiased estimation of $AB$, but it is not satisfactory (especially when $\bs a$ and $\bs b$ are sparse).

A generalization of this method is to pick $k$ from distribution $P$ over $[n]$ and output $\frac{1}{P(k)}\bs a_k\bs b_k^\T$. We should set $P$ properly to minimize the "variance" $\Ex[\|X-\Ex[X]\|_F^2]$. Since $\Ex[X]=AB$ is fixed, our goal is to minimize
$$
\mathcal L(\seq p1k,\lmd)=\sum_{k=1}^n\frac{1}{p_k}\|\bs a_k\bs b_k^\T\|_F^2+\lmd(1-p_1-\cdots-p_n),
$$
Therefore,
$$
\frac{\part\mathcal L}{\part p_k}=-\frac{\|\bs a_k\bs b_k^\T\|_F^2}{p_k^2}-\lmd=0\Ra p_k\propto\|\bs a_k\|\|\bs b_k\|.
$$
For implementation simplicity we set $p_k\propto\|a_k\|^2$, and then we have
$$
\Ex[\|X-\Ex[X]\|_F^2]=\|A\|_F^2\|B\|_F^2.
$$
If we pick $s$ instead of $1$ sample,
$$
\Ex\bk{\l\|\frac{\sum X_i}{s}-\Ex[X]\r\|_F^2}=\frac{\|A\|_F^2\|B\|_F^2}{s}.
$$
However it works just on low-rank matrices. $A=B=\bs 1$ can easily make us sad :(

&nbsp;

Let's go on to sketch just a matrix $A$. An intuitive method is to write $A=A\x\bs 1$ and perform the sketch above. But, $\bs 1$ is full ranked, frustrate us again :(

Now, our goal is to find a "pseudo-identity matrix" $P$ s.t. $A\approx AP$.

With the sampling method above, we may pick $s$ rows of $A$, say $\{\seq r1s\}$, and scale them to form $R$, s.t. $A^\T A\approx R^\T R$. Specifically we have a bound
$$
\Ex\l[\l\|A^\T A-R^\T R\r\|_F^2\r]\le\frac{\|A\|_F^4}{s}.
$$
Let the space $\mathcal R=\lang \seq r1s\rang$, we set $P$ to make $P|_{\mathcal R}=\id$ and $P|_{\mathcal R^\perp}=\bs 0$, which means $PR^\T y=R^\T y$ for all $y$ and $Px=0$ for all other vector $x$. An easy construction is $P=R^\T(RR^\T)^{-1}R$ where $(RR^\T)^{-1}$ is the Moore-Penrose inversion of $RR^\T$.

Let's bound the spectrum norm of $A-AP$ (Note for matrix $A$, $\|A\|_2$ means its spectrum norm):
$$
\ALI{	
	\max_{\|v\|_2=1}\|(A-AP)v\|_2^2 &= \max_{\|v\|_2=1}\|(A-AP)(v'+v'')\|_2^2\\
	&= \max_{v''\in\mathcal R^\perp,\|v''\|_2\le 1}\|Av''\|_2^2\\
	&= \max_{v''\in\mathcal R^\perp,\|v''\|_2\le 1}|v''^\T(A^\T A-R^\T R)v''|\\
	&\le \|A^\T A-R^\T R\|_2^2.
}
$$
Finally we sketch $AP$ to get $X$ of $t$ rows. Now
$$
\|X-A\|_2^2\le 2(\|X-AP\|_2^2+\|AP-A\|_2^2)
$$
is bounded successfully.

### Phase Transition of Random Graph

A random graph $\mathcal G(n,p)$ is a graph of $n$ vertexes where each edge $(u,v)$ occurs w.p. $p$ independently.

For a predicate $P$, $\Pr[P(\mathcal G(n,p))]$ usually owns a phase transition point. E.g. $P(G):G~\text{contains a ternary cycle}$, and we have
$$
\Ex[P(\mathcal G(n,p))]=\binom{n}{3}p^3\sim (np)^3.
$$
Its threshold turns out to be $p^*(n)=\frac{1}{n}$ (which means, when $p\ll p^*$, $\Pr[\cdots]\to 0$ and vise versa).

Let's go through the $p\gg p^*(n)$ part.
$$
\ALI{
	\Pr[\#\{\text{ternary cycle}\}=0] &\le \Pr[|\#-\Ex[\#]|\ge\Ex[\#]]\\
	&\le \frac{\Var\bk{\sum_{i,j,k}\mathbb 1_{ijk}}}{\Ex\bk{\sum_{i,j,k}\mathbb 1_{ijk}}^2}\\
	&\le \frac{\sum_{i,j,k}\Ex[\mathbb 1_{ijk}]+\sum_{i,j,k,i',j',k'}\opn{Cov}[\mathbb 1_{ijk},\mathbb 1_{i'j'k'}]}{(np)^6}\\
	&\sim \frac{(np)^3+n^4p^5}{(np)^6}\to 0.
}
$$