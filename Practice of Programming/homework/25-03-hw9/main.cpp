/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)
#define fi first
#define se second

typedef unsigned long long ull;
typedef std::pair<ull, int> pli;

const int MAXN = 1e5, M = 30, W = 64;
int n, q, sgm[M][W];
ull a[MAXN + 5];
pli seq[M][MAXN + 5];
std::mt19937 rng((std::random_device())());

inline ull apply(const int prm[W], const ull x) {
    ull r = 0;
    rep (i, 0, W - 1) r |= (x >> i & 1) << prm[i];
    return r;
}

void init() {
    rep (i, 0, M - 1) {
        std::iota(sgm[i], sgm[i] + W, 0);
        std::shuffle(sgm[i], sgm[i] + W, rng);
        rep (j, 1, n) seq[i][j] = { apply(sgm[i], a[j]), j };
        std::sort(seq[i] + 1, seq[i] + n + 1);
    }
}

pli querySeq(const int k, ull x) {
    x = apply(sgm[k], x);
    int i = std::lower_bound(seq[k] + 1, seq[k] + n + 1, pli(x, 0)) - seq[k];
    pli res(W, 1);
    if (i > 1) res = { __builtin_popcountll(seq[k][i - 1].fi ^ x), seq[k][i - 1].se };
    if (i <= n) res = std::min(res, { __builtin_popcountll(seq[k][i].fi ^ x), seq[k][i].se });
    return res;
}

inline pli query(const ull x) {
    pli ans(W, 1);
    rep (i, 0, M - 1) ans = std::min(ans, querySeq(i, x));
    return ans;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> q;
    rep (i, 1, n) std::cin >> a[i];

    init();

    while (q--) {
        ull x;
        std::cin >> x;
        std::cout << query(x).se << '\n';
    }
    return 0;
}
