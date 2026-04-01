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

**1.** (P216 3.58)

&emsp;&emsp;*(本题在上次作业中提交过.)*

&emsp;&emsp;逐句翻译.

```c
long decode2(long x, long y, long z) {
    y -= z;
    x *= y;
    long ret = y;
    ret <<= 63;
    ret >>= 63;
    ret ^= x;
    return ret;
}
```

&nbsp;

**2.** (P217 3.59)

&emsp;&emsp;*(本题在上次作业中提交过.)*

&emsp;&emsp;对 $128$ 位整数 $x=2^{64}x_h+x_l$ 和 $y=2^{64}y_h+y_l$, 其乘法:
$$
p:=xy=2^{128}x_hy_h+2^{64}(x_hy_l+y_hx_l)+x_ly_l,
$$
因此 $p_l=x_ly_l\bmod 2^{64}$, $p_h=(x_hy_l+y_hx_l+(x_ly_l/2^{64}))\bmod 2^{64}$, 计算二者即可.

```assembly
; %rdi: *dest    %rsi: x    %rdx: y
store_prod:
	movq    %rdx, %rax       ; rax = y
	cqto                     ; rdx 填充为 rax 的符号位, rdx:rax == (int128_t)y
	movq    %rsi, %rcx       ; rcx = x
	sarq    $63, %rcx        ; rcx >>= 63 | 为 x 的符号位, rcx:rsi == (int128_t)x
	imulq   %rax, %rcx       ; rcx *= rax | rcx == x_h * y_l (mod 2^64)
	imulq   %rsi, %rdx       ; rdx *= rsi | rdx == y_h * x_l (mod 2^64)
	addq    %rdx, %rcx       ; rcx += rdx | rcx == x_h * y_l + y_h * x_l (mod 2^64)
	mulq    %rsi             ; rdx:rax = rsi * rax
	                         ; rax == x_l * y_l (mod 2^64) == p_l, rdx == x_l * y_l / 2^64
	addq    %rcx, %rdx       ; rdx += rcx | rdx == p_h
	movq    %rax, (%rdi)     ; *dest 的低 64 位 (p_l) 赋为 rax
	movq    %rdx, 8(%rdi)    ; 高 64 位 (p_h) 赋为 rdx
	ret
```

&nbsp;

**3.** (P217 3.60)

&emsp;&emsp;(A)

- `x`: `%rdi`;

- `n`: `%esi`, 后赋值给 `%ecx`;
- `result`: `%rax`;
- `mask`: `%rdx`.

&emsp;&emsp;(B) $1$ 和 $0$ (来自汇编 L3~L4);

&emsp;&emsp;(C) `mask != 0`, 即 `mask` (来自汇编 L12~L13);

&emsp;&emsp;(D) `mask = maks << n` (来自汇编 L10);

&emsp;&emsp;(E) `result |= x & mask` (来自汇编 L7~L9).

&emsp;&emsp;(F) 函数补全如下:

```c
long loop(long x, int n) {
    long result = 0;
    long mask;
    for (mask = 1; mask; mask = mask << n) {
        result |= x & mask;
    }
    return result;
}
```

&nbsp;

**4.** (P219 3.63)

```c
long switch_prob(long x, long n) {
    long result = x;
    switch (n) { // cased: 60..65
        case 60:
        case 62: // +0, +2
            result = x * 8;
            break;
        case 63: // +3
            result = x >> 3;
            break;
        case 64: // +4
            x *= 15;
        case 65: // +5
            x *= x;
        default: // 4005c3
            result = x + 75;
    }
    return result;
}
```

&nbsp;

**5.** (P221 3.66)

&emsp;&emsp;由汇编 L11~L16, `NR(n)` 存在 `%rdi` 中, `NC(n) * 8` 存在 `%r8` 中. 端详 L2~L10 可知
$$
\texttt{r8}=8(4n+1),\quad \texttt{rdi}=3n
$$
所以两个宏的定义形如

```c
#define NR(n) (3 * (n))
#define NC(n) (4 * (n) + 1)
```

&nbsp;

**6.** (P221 3.67)

&emsp;&emsp;(A)

```plain
          +104  +88              +64  +32  +24                     rsp
[HIGH ADDR] |    | --- strB r --- |    | z |     --- strA s ---     |
       frame↑begin                         | p=&z | a[1]=y | a[0]=x |
                                                                    | RET |
[WHEN PROCESS CALLED]         rdi                                  +8    rsp'
```

&emsp;&emsp;(B) 返回值 `strB r` 的地址 (空间分配于自己的栈帧上).

&emsp;&emsp;(C) 直接通过 `x(%rsp)` 访问 `eval` 栈帧中的 `str A`, 例如 `process` 中 `24(%rsp)` 访问了 `eval` 中的 `s.p`.

&emsp;&emsp;(D) 将 caller 传递的 `%rdi` 作为指向返回值 `r` 的指针进行修改.

&emsp;&emsp;(E) 图如上, 直接通过 `64(%rsp)` 等方式访问自己的栈帧.

&emsp;&emsp;(F) 传参时, 将结构体参数构造在 caller 的参数构造区 (类似 7+ 参数); 返回时, 由 caller 负责分配并提供返回值在自己栈帧的地址, callee 直接在相应内存上修改.

&nbsp;

**7.** (P223 3.68)

&emsp;&emsp;~~(现在才知道小测题是原题.)~~

&emsp;&emsp;由 `setVal` 的相关偏移量可知, `str2` 中 `int t: +8`, `long u: +32`; `str1` 中 `long y: +184`. 考虑相应基本类型的 alignment, 可知
$$
\CAS{
	5\le B\le 8,&(\text{by}~\texttt{t})\\
	9\le A\le 12,&(\text{by}~\texttt{u})\\
	45 \le AB\le 46.&(\text{by}~\texttt{y})
}
$$
因此有唯一解
$$
\CAS{
	A=9,\\
	B=5.
}
$$
