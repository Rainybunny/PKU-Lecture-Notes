# Python 3.13.2
import numpy as np # version 2.2.2
import pulp # version 3.1.1
from sys import stderr

np.random.seed(0)
N = 1200
EPS = 1e-4
LOSS = 0.001

def compress(Ar: np.ndarray, x: np.ndarray):
    br = Ar @ x

    # solving xr = argmin \|x\|_1, s.t. A_r @ x = br
    lp = pulp.LpProblem("Compressive Sensing", pulp.LpMinimize)
    varX = pulp.LpVariable.dicts("x", range(N))
    varY = pulp.LpVariable.dicts("y", range(N))

    lp += pulp.lpSum([varY[i] for i in range(N)])
    for i in range(N):
        lp += varY[i] + varX[i] >= 0
        lp += varY[i] - varX[i] >= 0
    for i in range(br.shape[0]):
        lp += pulp.lpSum([Ar[i, j] * varX[j] for j in range(N)]) - br[i] == 0

    lp.solve(pulp.PULP_CBC_CMD(msg=False, options=[
        '-randomSeed', '0',
        '-threads', '8',
        '-preprocess', 'on',
        '-heur', '0.05',
        '-passp', '100',
    ]))
    assert lp.status == pulp.LpStatusOptimal, f"Failed. Status: {lp.status}"
    xr = np.empty((N,))
    for var in lp.variables():
        if var.name[0] == 'x':
            xr[int(var.name[2:])] = var.varValue
    return br, xr

cache = {}

def errorTest(A: np.ndarray, x: np.ndarray, r: int):
    if r in cache: return cache[r]

    Ar = A[:r, :]
    print(f"Testing r = {r}... ", file=stderr, end="")
    stderr.flush()
    _, xr = compress(Ar, x)

    err = np.sum(np.abs(xr - x))
    print(f"error = {err:.6f}", file=stderr)
    cache[r] = err
    return err

with open('tree.txt', 'r') as f:
    lines = f.readlines()
    x = np.concatenate([np.array(list(map(lambda c: ord(c) - 48, row.strip()))) for row in lines])

    assert len(x) == N
    print(f"Task 1: n = {N}, k = {np.sum(x)}, ratio = {np.sum(x) / N:.6f}")

    A = np.random.randn(N, N)
    def test(r): return errorTest(A, x, r)
    print(f"Task 2: r = 600, error = {test(600):.6f}")

    lef, rig = 1, N
    while lef < rig:
        mid = (lef + rig) // 2
        if test(mid) <= LOSS: rig = mid
        else: lef = mid + 1
    rstar = lef
    print(f"Task 3: r* = {rstar}")

    print("Task 4: errors ", end="")
    for dx in range(-10, 3):
        print(f"{test(rstar + dx):.6f} ", end="")
    print()
