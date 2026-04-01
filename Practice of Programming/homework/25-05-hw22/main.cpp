/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef long long ll;
typedef std::pair<int, int> pii;
typedef unsigned long long ull;

const int MOD = 1e9 + 7;
const int K = 101, T = 5;
std::mt19937_64 rng(std::random_device{}());
std::uniform_int_distribution<ll> dst(2, MOD - 1);

struct Hash {
    const ull MASK;
    Hash(): MASK(rng()) {}
    inline int operator () (ull x, const int R = MOD) const {
        x ^= MASK;
        x ^= x << 13, x ^= x >> 17, x ^= x << 5;
        // x = x * 23333ull + 23327;
        return x % R;
    }
};

struct Sparse {
    const Hash H;
    int cnt, fp;
    ll sum;

    inline int getfp(const int x, const int k) const {
        return (ll)k * H(x) % MOD;
    }

    inline void update(const int x, const int k) {
        cnt += k, sum += (ll)k * x, fp = (fp + (ll)k * H(x)) % MOD;
    }

    inline pii recover() const {
        if (cnt == 0) return { 0, 0 };
        if (sum % cnt) return { -1, -1 };
        int res = int(sum / cnt);
        if ((getfp(res, cnt) + MOD) % MOD == (fp + MOD) % MOD) return { res, cnt };
        else return { -1, -1 };
    }
};

struct PSparse {
    Sparse xspr, yspr;
    inline void update(const int x, const int y, const int k) {
        xspr.update(x, k), yspr.update(y, k);
    }
    inline std::pair<pii, int> recover() const {
        auto xr = xspr.recover(), yr = yspr.recover();
        if (!~xr.second || !~yr.second) return { pii(0, 0), -1 };
        else return { pii(xr.first, yr.first), xr.second };
    }
};

struct KSparse {
    Hash hash[T];
    PSparse recs[T][2 * K];

    inline void update(const int x, const int y, const int k) {
        rep (i, 0, T - 1) {
            recs[i][hash[i](x * (ll)(1e9 + 7) + y, 2 * K)].update(x, y, k);
        }
    }

    inline std::vector<std::pair<pii, int>> recover() const {
        std::vector<std::pair<pii, int>> ret;
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

const int W = 30;
const double EPS = 0.1;
int n;
KSparse kspr[W + 1];
PSparse chks[W + 1];

double diam(const std::vector<std::pair<pii, int>> vec) {
    ll ret = 0;
    rep (i, 0, (int)vec.size() - 1) {
        auto [x, y] = vec[i].first;
        rep (j, i + 1, repi) {
            auto [s, t] = vec[j].first;
            ret = std::max(ret, ll(x - s) * (x - s) + ll(y - t) * (y - t));
        }
    }
    return sqrt(ret);
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n;
    rep (i, 1, n) {
        int op, x, y;
        std::cin >> op >> x >> y, op = !op - op;
        rep (k, 3, W) {
            int wid = (int)std::max(1., EPS * (1 << k));
            int idx = x / wid, idy = y / wid;
            kspr[k].update(idx, idy, op), chks[k].update(idx, idy, op);
        }
    }

    rep (k, 3, W) {
        auto res = kspr[k].recover();
        if (res.size() > K) continue;
        // for (auto [p, c]: res) {
        //     std::cerr << p.first << ' ' << p.second << " | " << c << '\n';
        // }
        for (auto [p, c]: res) chks[k].update(p.first, p.second, -c);
        if (!chks[k].recover().second) {
            int wid = (int)std::max(1., EPS * (1 << k));
            std::cout << std::fixed << std::setprecision(6) << diam(res) * wid << '\n';
            return 0;
        }
    }

    assert(false);
    return 0;
}