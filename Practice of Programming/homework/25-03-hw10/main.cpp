/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef std::vector<double> Vector;

const int MAXN = 1e4, K = 2, T = 35, MAXD = 64;
int D, n, q;
Vector P[MAXN];
std::mt19937 rng((std::random_device())());
std::bernoulli_distribution distr(0.5);

inline Vector readVct() {
    int sum = 0;
    std::vector<int> vec(D);
    for (int& x: vec) std::cin >> x, sum += x * x;
    double nrm = 1 / sqrt(sum);
    Vector ret(D);
    rep (i, 0, D - 1) ret[i] += vec[i] * nrm;
    return ret;
}

void fmt(Vector& vec) {
    for (int stp = 1; stp < D; stp <<= 1) {
        for (int j = 0; j < D; j += stp << 1) {
            rep (k, j, (j | stp) - 1) {
                double x = vec[k] + vec[k + stp], y = vec[k] - vec[k + stp];
                vec[k] = x, vec[k + stp] = y;
            }
        }
    }
    double inv = 1 / sqrt(D);
    for (double& x: vec) x *= inv;
}

struct LSH {
    int H[3][MAXD];

    LSH() {
        for (auto& h: H) {
            for (int& x: h) {
                x = 1 - 2 * distr(rng);
            }
        }
    }

    inline int operator () (const Vector& vec) const {
        Vector tmp(vec);
        for (const auto& h: H) {
            rep (i, 0, D - 1) tmp[i] *= h[i];
            fmt(tmp);
        }
        for (double& x: tmp) x = fabs(x);
        return int(std::max_element(tmp.begin(), tmp.end()) - tmp.begin());
    }
};

struct HashOper {
    LSH R[K];

    inline int operator () (const Vector& vec) const {
        int ret = 0;
        rep (i, 0, K - 1) ret = ret * MAXD + R[i](vec);
        return ret;
    }
} G[T];

std::vector<int> ref[T][1 << (K * 6)];

void init() {
    rep (i, 0, T - 1) {
        rep (j, 0, n - 1) {
            ref[i][G[i](P[j])].push_back(j);
        }
    }
}

inline double dist(const Vector& A, const Vector& B) {
    double ret = 0;
    rep (i, 0, D - 1) ret += (A[i] - B[i]) * (A[i] - B[i]);
    return sqrt(ret);
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> D >> n >> q;
    rep (i, 0, n - 1) P[i] = readVct();

    init();

    while (q--) {
        auto Q = readVct();
        int ans = 0;
        double dis = dist(P[0], Q);
        rep (i, 0, T - 1) {
            auto& tar = ref[i][G[i](Q)];
            if (tar.size() > 10) tar.resize(10);
            for (int k: tar) {
                double tdis = dist(P[k], Q);
                if (tdis < dis) ans = k, dis = tdis;
            }
        }
        std::cout << ans << '\n';
    }
    return 0;
}
