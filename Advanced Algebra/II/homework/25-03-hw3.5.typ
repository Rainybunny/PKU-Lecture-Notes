#import "/Documents/Templates/sping-math.typ": *

#show: dvdtyp.with(title: "A. Algebra Mid-term Exam 2023",
  author: "Rainybunny",
  accent: rgb("66CCFF"))

#set text(11pt, font:("Times New Roman", "Source Han Serif"))
#set par(justify: true, first-line-indent: 2em)
#show heading: it => {it;text()[#v(0.3em, weak: true)];text()[#h(0em)]}

#problem[
  设 $f$ 为整系数多项式, 证明若存在相异的整数 $a,b,c in ZZ$ 使得 $|f(a)|=|f(b)|=|f(c)|=1$, 则 $f$ 无整数根.
]

#solution[
  反证, 若 $f$ 存在根 $x_0 in ZZ$, 则 $f=(X-x_0)g$, 其中 $g$ 也是整系数多项式. 然而, $|f(a)|=1 => |a-x_0|=1$, 只有 $x_0-1$ 和 $x_0+1$ 两点满足条件, 不可能存在三点相异的 $a,b,c$, 矛盾.
]

#problem[
  写下域 $FF_2$ 上所有 $<=4$ 次的不可约首一多项式.
]

#solution[
  直接枚举即可. 注意 $X+1$ 使得更高次的多项式只能有奇数项, 需要枚举的范围是小的.

  $
    X, quad X+1; \
    X^2+X+1; \
    X^3+X^2+1, quad X^3+X+1; \
    X^4+X^3+1, quad X^4+X+1, quad X^4+X^3+X^2+X^2+1.
  $
]

#problem[
  设 $A,B in Mring(n, n, RR)$, 求证:

  (i) 设可逆矩阵 $S in Mring(n, n, RR)$ 具有极分解 $S=R V$, 使得 $A S = S B$ 且 $S^top A=B S^top$, 则 $A V=V B$.

  (ii) 设 $U in Mring(n, n, CC)$ 满足 $A U=U B$, 将 $U$ 按实部和虚部分解为 $U=C+"i"D$, 则 $A C = C B$ 而 $A D = D B$.

  (iii) 若存在酉矩阵 $U$ 使得 $B=U^(-1)A U$, 则存在正交矩阵 $V in Mring(n, n, RR)$ 使得 $B=V^(-1) A V$.
]

#solution[
  
  (i) 回忆 $R^2=S S^top$, 则
  $
    A S S^top = S B S^top = S S^top A => A R^2=R^2 A.
  $

  #tab 选取合适的基, 将 $R$ 视为对角矩阵且对角线全正, 设多项式 $f in RR[X]$, 考虑 $f$ 在 $R^2$ 的 $n$ 个对角元上的取值, Lagrange 插值法保证了存在不超过 $n$ 次的 $f$ 使得 $R=f(R^2).$

  因此, $A R^2=R^2 A => A f(R^2)=f(R^2)A => A R=R A$. 那么
  $
    A S = A R V = R A V = R V B = S B => A V = V B.
  $

  #tab (ii) 明显的.

  (iii) 条件给出酉矩阵 $U B = A U$ 并且 $B U^dagger = U^dagger A$, 根据 (ii), 设 $U=C+"i"D$, 那么 $C B=A C$ 并且 $C^top A = B C^top$, $D$ 同理. 由于 $det(C+t D)$ 是关于 $t$ 的非常数多项式, 总能取出 $S=C+t_0D$ 可逆, 再根据 (i) 就能取出 $B=V^(-1)A V$.
]

#problem[
  设 $H_1, H_2$ 为 Hermite $n times n$ 矩阵且均正定, $H_1-H_2$ 也正定, 求证 $H_2^(-1)-H_1^(-1)$ 也正定.
]

#solution[
  设 $C in Mring(n, n, CC)$ 可逆使得 $C^dagger H_1 C=bold(1)$, 那么
  $
    C^dagger (H_1-H_2)C=bold(1)-C^dagger H_2 C.
  $
  正定, 同时
  $
    C^(-1)(H_2^(-1)-H_1^(-1))C^(-dagger)=(C^dagger H_2 C)^(-1)-bold(1).
  $

  #tab 现在只需要证明, 若 $H$ 和 $bold(1)-H$ 正定, $H^(-1)-bold(1)$ 也正定. 将 $H$ 对角化为 $diag(seq(lambda,1,n))$, 则 $1-lambda_i>0=>lambda_i^(-1)-1>0$, 已然得证.
]

#problem[
  证明所有正定 Hermite 矩阵 $A in Mring(n, n, CC)$ 都能写成 $A=B^dagger B$ 的形式, 其中 $B$ 是上三角阵且对角元全正.
]

#solution[
  由正定性, $A$ 总能写为 $A=C^dagger C$, 其中 $C$ 可逆. Gram-Schmidt 正交化给出 $C=U R$, 其中 $U$ 是酉矩阵, $R$ 是上三角矩阵且对角全正. 这就有
  $
    A=C^dagger C=R^dagger U^dagger U R = R^dagger R.
  $
]

#problem[
  计算以下实矩阵的奇异值分解 $A=Q Sigma P^top$:
  $
    A=mat(-4,-6;3,-8).
  $
]

#solution[
  计算
  $
    A^top A=mat(25, ; , 100) => sigma_1=10, space sigma_2=5; quad v_1=mat(0;1), space v_2=mat(1;0).
  $
  则
  $
    w_1=1/sigma_1 A v_1=mat(-3/5;-4/5),quad w_2=1/sigma_2 A v_2=mat(-4/5;3/5).
  $
  结果是
  $
    Q=mat(-3/5,-4/5;-4/5,3/5), quad Sigma=mat(10;,5), quad P=mat(,1;1).
  $
]