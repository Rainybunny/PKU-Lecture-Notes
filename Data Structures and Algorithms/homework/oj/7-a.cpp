/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 26;
int n;

struct Edge {
    int w, u, v;
    inline bool operator < (const Edge& e) const { return w < e.w; }
};
std::vector<Edge> edge;

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

int kruskal() {
    int res = 0;
    dsu.init();
    std::sort(edge.begin(), edge.end());
    for (auto [w, u, v] : edge) {
        if (dsu.unite(u, v)) {
            res += w;
        }
    }
    return res;
}

int main() {
    std::cin >> n;
    rep (i, 1, n - 1) {
        char c; std::cin >> c;
        int u = c - 'A' + 1, k, w;
        std::cin >> k;
        while (k--) {
            std::cin >> c >> w;
            edge.push_back({ w, u, c - 'A' + 1 });
        }
    }
    std::cout << kruskal() << '\n';
    return 0;
}
