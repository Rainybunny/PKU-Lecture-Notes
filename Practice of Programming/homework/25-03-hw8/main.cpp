/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef unsigned long long ull;

#define mix(h) ({                    \
    (h) ^= (h) >> 23;        \
    (h) *= 0x2127599bf4325c37ULL;    \
    (h) ^= (h) >> 47; })

ull fasthash64(ull v, ull seed) {
    const ull m = 0x880355f21e6d1965ULL;
    ull h = seed;
    h ^= mix(v);
    h *= m;
    return mix(h);
}

const int T = 200, MAXN = 1000;
int n, m, q;
std::mt19937_64 rng((std::random_device())());
ull seed[T], hval[MAXN + 1][T];

void init() {
    rep (i, 0, T - 1) seed[i] = rng();
}

double query(const int u, const int v) {
    int ans = 0;
    rep (i, 0, T - 1) ans += hval[u][i] == hval[v][i];
    return double(ans) / T;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> m >> q, init();

    rep (i, 1, n) {
        memset(hval[i], 0xff, sizeof hval[i]);
        rep (j, 1, m) {
            ull x;
            std::cin >> x;
            rep (k, 0, T - 1) {
                hval[i][k] = std::min(hval[i][k], fasthash64(x, seed[k]));
            }
        }
    }

    while (q--) {
        int i, j;
        std::cin >> i >> j;
        std::cout << std::fixed << query(i, j) << '\n';
    }
    return 0;
}
