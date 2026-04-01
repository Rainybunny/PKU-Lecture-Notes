/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 1e5;
int n, m, adj[MAXN + 5];

struct DSU {
    int fa[MAXN + 5], siz[MAXN + 5];

    void init() {
        std::iota(fa + 1, fa + n + 1, 1);
        std::fill(siz + 1, siz + n + 1, 1);
    }

    int top(const int u) {
        return u == fa[u] ? u : fa[u] = top(fa[u]);
    }

    void unite(int u, int v) {
        if ((u = top(u)) == (v = top(v))) return ;
        if (siz[u] < siz[v]) std::swap(u, v);
        siz[fa[v] = u] += siz[v];
    }
} R, S;

void work() {
    R.init(), S.init();
    memset(adj + 1, 0, n << 2);

    while (m--) {
        char op; int a, b;
        std::cin >> op >> a >> b;
        if (op == 'D') {
            R.unite(a, b);
            if (adj[a]) S.unite(adj[a], b);
            if (adj[b]) S.unite(a, adj[b]);
            adj[a] = b, adj[b] = a;
        } else {
            if (R.top(a) != R.top(b)) std::cout << "Not sure yet.\n";
            else std::cout << (S.top(a) == S.top(b)
                               ? "In the same gang.\n" : "In different gangs.\n");
        }
    }
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    int T;
    std::cin >> T;
    while (T--) {
        std::cin >> n >> m;
        work();
    }
    return 0;
}
