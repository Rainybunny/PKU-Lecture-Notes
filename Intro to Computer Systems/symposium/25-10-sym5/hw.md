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

**1.** (P327 4.47)

&emsp;&emsp;(A)

```c
void bubble(long *data, long count) {
    long *p, *last;
    for (last = data + count - 1; last > data; last--) {
        for (p = data; p < last; p++) {
            if (*(p + 1) < *p) {
                long t = *(p + 1);
                *(p + 1) = *p;
                *p = t;
            }
        }
    }
}
```

&emsp;&emsp;(B)

```assembly
# Execution begins at address 0 
    .pos 0
    irmovq stack, %rsp      # Set up stack pointer
    call main       # Execute main program
    halt            # Terminate program 

bubble:
    rrmovq %rsi, %r8
    addq %r8, %r8
    addq %r8, %r8
    addq %r8, %r8
    addq %rdi, %r8
    irmovq $-8, %rsi
    addq %r8, %rsi      ; leaq -8(%rdi, %rsi, 8), %rsi
    jmp .L2
.L3:
    irmovq $8, %r8
    addq %r8, %rax      ; addq $8, %rax
.L5:
    rrmovq %rax, %r8
    subq %rsi, %r8      ; cmpq %rsi, %rax
    jge .L7             ; jnb .L7
    ; ----
    mrmovq 8(%rax), %rdx
    mrmovq (%rax), %rcx
    rrmovq %rdx, %r8
    subq %rcx, %r8      ; cmpq %rcx, %rdx
    jge .L3
    rmmovq %rcx, 8(%rax)
    rmmovq %rdx, (%rax)
    ; ----
    jmp .L3
.L7:
    irmovq $8, %r8
    subq %r8, %rsi      ; subq $8, %rsi
.L2:
    rrmovq %rsi, %r8
    subq %rdi, %r8      ; cmpq %rdi, %rsi
    jle .L8             ; jbe .L8
    rrmovq %rdi, %rax
    jmp .L5
.L8:
    ret

main:
    irmovq $56, %r8
    subq %r8, %rsp      ; subq $56, %rsp
    irmovq $3, %r8
    rmmovq %r8, (%rsp)
    irmovq $1, %r8
    rmmovq %r8, 8(%rsp)
    irmovq $4, %r8
    rmmovq %r8, 16(%rsp)
    irmovq $1, %r8
    rmmovq %r8, 24(%rsp)
    irmovq $5, %r8
    rmmovq %r8, 32(%rsp)
    irmovq $9, %r8
    rmmovq %r8, 40(%rsp) ; sort [3, 1, 4, 1, 5, 9]
    rrmovq %rsp, %rdi
    irmovq $6, %rsi
    call bubble
    irmovq $0, %rax
    irmovq $56, %r8
    addq %r8, %rsp
    ret

# See sorted array at 0x0fc0..0x0fe8

# Stack starts here and grows to lower addresses
    .pos 0x1000
stack:
```

&nbsp;

**2 & 3.** (P327 4.48, 4.49)

&emsp;&emsp;将 <u>1.</u> 中以下代码段

```assembly
    ; ----
    mrmovq 8(%rax), %rdx
    mrmovq (%rax), %rcx
    rrmovq %rdx, %r8
    subq %rcx, %r8      ; cmpq %rcx, %rdx, %r8 = %rdx - %rcx
    jge .L3
    rmmovq %rcx, 8(%rax)
    rmmovq %rdx, (%rax)
    ; ----
```

替换为

```assembly
    mrmovq 8(%rax), %rdx
    mrmovq (%rax), %rcx
    rrmovq %rdx, %r8
    rrmovq %rcx, %r9     ; +
    subq %rcx, %r8
    cmovl %rdx, %r9      ; %r9 = min(%rdx, %rcx)
    xorq %rcx, %rdx
    xorq %r9, %rdx       ; %rdx = %rdx ^ %rcx ^ %r9
    rmmovq %rdx, 8(%rax)
    rmmovq %r9, (%rax)
```



