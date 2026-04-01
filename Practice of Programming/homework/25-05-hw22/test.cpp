/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef __int128_t L;
typedef __uint128_t UL;
typedef long long ll;
typedef unsigned long long ull;

const int MOD = 1e9 + 7;
std::mt19937_64 rng(std::random_device{}());
std::uniform_int_distribution<ll> dst(2, MOD - 1);

inline int mul(const int& u, const int& v) {
    return int((ll)u * v % MOD);
}

inline int mpow(int u, ll v) {
    int ret = 1;
    v %= MOD - 1;
    while (v) {
        if (v & 1) ret = mul(ret, u);
        if (v >>= 1) u = mul(u, u);
    }
    return ret;
}

struct Sparse {
    const ll R;
    ll cnt; L sum; int fp;

    Sparse(): R(dst(rng)), cnt(0), sum(0), fp(0) {}

    inline void update(const ll x, const int k) {
        cnt += k, sum += (L)k * x;
        fp = int((fp + (ll)k * mpow(R, x) + MOD) % MOD);
    }

    inline std::pair<ll, int> recover() const {
        if (cnt == 0) return { 0, 0 };
        if (sum % cnt) return { -1, -1 };
        ll res = ll(sum / cnt);
        if (mul(cnt, mpow(R, res)) == fp) return { res, cnt };
        else return { -1, -1 };
    }
};

struct Hash {
    const ull MASK;
    Hash(): MASK(rng()) {}
    inline int operator () (ll x, const int R) const {
        x = ll((L(x ^ MASK) * 23333 + 23327) % MOD);
        return int(x % R);
    }
};

struct KSparse {
    const int K, T;
    std::vector<Hash> hash;
    std::vector<std::vector<Sparse>> recs;

    KSparse(): K(3), T(2),
        hash(T), recs(T, std::vector<Sparse>(2 * K)) {}

    inline void update(const ll x, const int k) {
        rep (i, 0, T - 1) {
            recs[i][hash[i](x, 2 * K)].update(x, k);
        }
    }

    inline std::vector<std::pair<ll, int>> recover() const {
        std::vector<std::pair<ll, int>> ret;
        rep (i, 0, T - 1) {
            rep (j, 0, 2 * K - 1) {
                auto rec = recs[i][j].recover();
                if (rec.second > 0) ret.emplace_back(rec);
            }
        }
        std::sort(ret.begin(), ret.end());
        ret.resize(std::unique(ret.begin(), ret.end()) - ret.begin());
        ret.shrink_to_fit();
        return ret;
    }
};

const int W = 30, BASE = 2'000'000'011;
const double EPS = 1;
int n;
KSparse kspr[W + 1];
Sparse chks[W + 1];

double diam(const std::vector<std::pair<ll, int>> vec, const int k) {
    const double wid = EPS * (1 << k);
    std::vector<std::pair<double, double>> pnt(vec.size());
    rep (i, 0, (int)vec.size() - 1) {
        pnt[i] = { vec[i].first / BASE * wid, vec[i].first % BASE * wid };
    }
    double ret = 0;
    rep (i, 0, (int)pnt.size() - 1) {
        auto [x, y] = pnt[i];
        rep (j, 1, repi - 1) {
            auto [s, t] = pnt[j];
            ret = std::max(ret, (x - s) * (x - s) + (y - t) * (y - t));
        }
    }
    return sqrt(ret);
}

int main() {
    freopen("large.in", "r", stdin);
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n;
    rep (i, 1, n) {
        int op, x, y;
        std::cin >> op >> x >> y, op = !op - op;
        // std::cerr << i << "?\n";
        rep (k, 0, W) {
            int idx = (int)floor(x / (EPS * (1 << k)));
            int idy = (int)floor(y / (EPS * (1 << k)));
            ll key = (ll)idx * BASE + idy;
            kspr[k].update(key, op), chks[k].update(key, op);
        }
        if (!(i % 10000)) std::cerr << "done " << i << '\n';
    }

    rep (k, 0, W) {
        std::cerr << k << "?\n";
        auto res = kspr[k].recover();
        if (res.size() > k) continue;
        for (auto [x, c]: res) chks[k].update(x, -c);
        if (!chks[k].recover().second) {
            std::cout << std::fixed << std::setprecision(6) << diam(res, k) << '\n';
            return 0;
        }
    }

    assert(false);
    return 0;
}
