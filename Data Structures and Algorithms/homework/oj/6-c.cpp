/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 5e4;
int n, m;

struct DSU {
    int fa[MAXN + 5], siz[MAXN + 5];

    void init() {
        std::iota(fa + 1, fa + n + 1, 1);
        std::fill(siz + 1, siz + n + 1, 1);
    }

    int top(const int u) {
        return u == fa[u] ? u : fa[u] = top(fa[u]);
    }

    bool unite(int u, int v) {
        if ((u = top(u)) == (v = top(v))) return false;
        if (siz[u] < siz[v]) std::swap(u, v);
        return siz[fa[v] = u] += siz[v], true;
    }
} dsu;

int main() {
    for (int T = 1; std::cin >> n >> m && (n || m); ++T) {
        int ans = n;
        dsu.init();
        while (m--) {
            int a, b;
            std::cin >> a >> b;
            ans -= dsu.unite(a, b);
        }
        std::cout << "Case " << T << ": " << ans << '\n';
    }
    return 0;
}
