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



**1.** (P88 2.59)

&emsp;&emsp;通过 `0xffu` 和 `~0xffu` 构造最低 byte 和其他 bytes 的掩码即可.

```c
unsigned mix_byte(unsigned x, unsigned y) {
    return (x & 0xffu) | (y & ~0xffu);
}
```

&nbsp;

**2.** (P88 2.60)

&emsp;&emsp;思路类似, 构造对应 byte 处的掩码.

```c
unsigned replace_byte(unsigned x, int i, unsigned char b) {
    unsigned mask = 0xffu << (i <<= 3);
    return (x & ~mask) | ((unsigned)b << i);
}
```

&nbsp;

**3.** (P91 2.71)

&emsp;&emsp;原有错误: 需要提取的 byte 是有符号的, 以 $8$ 位补码的形式存储. 然而代码中获取 `byte = (word >> (bytenum << 3)) & 0xFF` 后直接转为 `int` ($32$ 位补码), 不能正确地处理 byte 为负数 (即最高 bit 为 1) 的情况.

&emsp;&emsp;改正: 将目标 byte 先对齐到最高位, 利用算术右移特性处理负数.

```c
typedef unsigned packed_t;

int xbyte(packed_t word, int bytenum) {
    bytenum = (3 ^ bytenum) << 3;
    word <<= bytenum;
    return (int)word >> 24;
}
```

&nbsp;

**4.** (P93 2.86)

|        描述        |                      值                      |           十进制           |
| :----------------: | :------------------------------------------: | :------------------------: |
| 最小的正非规格化数 |               $1\x2^{-16445}$                | $\approx 3.65\x10^{-4951}$ |
|  最小的正规格化数  |               $1\x2^{-16382}$                | $\approx3.36\x10^{-4932}$  |
|   最大的规格化数   | $(2-2^{-63})\x2^{16383}=2^{16384}-2^{16320}$ | $\approx 1.19\x10^{4932}$  |

 &nbsp;

**5.** (P94 2.87)

|            描述            |  Hex   |         $M$         |  $E$  |       $V$       |             $D$              |
| :------------------------: | :----: | :-----------------: | :---: | :-------------: | :--------------------------: |
|            $-0$            | `8000` |         $0$         | $-14$ |      $-0$       |            $-0.0$            |
|      最小的 $>2$ 的值      | `4001` | $\frac{1025}{1024}$ |  $1$  | $1025\x2^{-9}$  |        $2.001953125$         |
|           $512$            | `6000` |         $1$         |  $9$  |      $512$      |           $512.0$            |
|      最大的非规格化数      | `03FF` | $\frac{1023}{1024}$ | $-14$ | $1023\x2^{-24}$ | $0.000060975551605224609375$ |
|           $-\oo$           | `FC00` |          /          |   /   |     $-\oo$      |            $-\oo$            |
| 十六进制表示为 `3BB0` 的数 | `3BB0` |  $\frac{123}{64}$   | $-1$  |  $123\x2^{-7}$  |         $0.9609375$          |

&nbsp;

**6.** (P95 2.89)

&emsp;&emsp;(A) 正确. 由于 `double` 具有 $52>31$ 个小数位, `x == dx` 总是成立, `(float)x` 和 `(float)dx` 都是 `float` 能表达的最接近数值 $x$ 的值.

&emsp;&emsp;(B) 错误. 右侧 `int` 减法可能溢出.

&emsp;&emsp;(C) 正确. $|x+y|,|y+z|,|x+y+z|\le|x|+|y|+|z|<2^{40}$, `double` 能够存储运算过程中的所有真实值.

&emsp;&emsp;(D) 错误. $x=y=2^{31}-11$, $z=2^{31}-12$.

&emsp;&emsp;(E) 错误. $x=z=0$, `NaN == NaN` 为 `false`.

&nbsp;

**7.** (P216 3.58)

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

**8.** (P217 3.59)

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

