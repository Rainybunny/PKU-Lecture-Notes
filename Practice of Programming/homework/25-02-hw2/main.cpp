/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef __uint128_t ui;
typedef unsigned long long ull;

const int MAXN = 100;
int n, m;
ui adj[MAXN + 5];
std::mt19937 rng(std::chrono::steady_clock().now().time_since_epoch().count());
std::bernoulli_distribution dtr(0.5);

int popcount(const ui x) {
    return __builtin_popcountll(x >> 64) + __builtin_popcountll(x & -1ull);
}

std::pair<int, ui> test() {
    ui S = 0;
    rep (i, 0, n - 1) S |= (ui)dtr(rng) << i;

    int ret = 0;
    rep (i, 0, n - 1) if (S >> i & 1) ret += popcount(adj[i] & ~S);
    return { ret, S };
}

void work() {
    scanf("%d %d", &n, &m);
    memset(adj, 0, n << 4);
    rep (i, 1, m) {
        int u, v;
        scanf("%d %d", &u, &v), --u, --v;
        adj[u] |= ui(1) << v, adj[v] |= ui(1) << u;
    }

    std::pair<int, ui> ans(0, 0);
    for (int T = 100; T--;) {
        ans = std::max(ans, test());
    }

    printf("%d\n", popcount(ans.second));
    rep (i, 0, n - 1) if (ans.second >> i & 1) printf("%d ", i + 1);
    putchar('\n');
}

int main() {
    int T;
    scanf("%d", &T);
    while (T--) work();
    return 0;
}
