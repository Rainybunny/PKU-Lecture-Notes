/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 2276360;
int n, m;
std::vector<int> adj[MAXN + 5];
std::mt19937 rng(20120712); // use a fixed seed here for data reproduction
std::bernoulli_distribution dtr(0.5);

int test() {
    static std::bitset<MAXN + 5> S;

    S.reset();
    rep (i, 1, n) if (dtr(rng)) S.set(i);

    int ret = 0;
    rep (u, 1, n) if (S.test(u)) {
        for (int v: adj[u]) if (!S.test(v)) {
            ++ret;
        }
    }
    return ret;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> m;
    rep (i, 1, m) {
        int u, v;
        std::cin >> u >> v;
        adj[u].push_back(v), adj[v].push_back(u);
    }

    int ans = 0;
    rep (T, 1, 5000) {
        int cur = test();
        std::cout << cur << '\n';
        ans = std::max(ans, cur);
        if (!(T % 100)) std::cerr << T << " trials\n";
    }
    std::cout << "Best result: " << ans << '\n';
    return 0;
}
