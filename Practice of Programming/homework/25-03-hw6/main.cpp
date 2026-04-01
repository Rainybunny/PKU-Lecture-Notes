/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef std::array<int, 3> Point;
typedef std::pair<int, std::vector<Point>> Sketch;

const int MAXN = 1e5, K = 25, M = 500;
const double EPS = 0.1;
int n, q;
double r0;
Point A[MAXN + 5], C;
Sketch skt[K + 1];
std::mt19937 rng(std::chrono::steady_clock().now().time_since_epoch().count());

double dist(const Point& u, const Point& v) {
    double ret = 0;
    rep (i, 0, 2) ret += double(u[i] - v[i]) * (u[i] - v[i]);
    return sqrt(ret);
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> q;
    rep (i, 1, n) std::cin >> A[i][0] >> A[i][1] >> A[i][2];

    C = A[std::uniform_int_distribution(1, n)(rng)];
    rep (i, 1, n) r0 += dist(A[i], C);
    r0 = EPS * r0 / n;

    rep (i, 1, n) {
        double d = dist(A[i], C);
        if (d <= r0) ++skt[0].first, skt[0].second.emplace_back(A[i]);
        else { // (r0 2^k, r0 2^{k+1}]
            int k = 64 - __builtin_clzll((unsigned long long)floor(d / r0));
            ++skt[k].first, skt[k].second.emplace_back(A[i]);
        }
    }

    rep (i, 0, K) {
        if (skt[i].first > M) {
            std::shuffle(skt[i].second.begin(), skt[i].second.end(), rng);
            skt[i].second.resize(M);
        }
    }

    while (q--) {
        Point P;
        std::cin >> P[0] >> P[1] >> P[2];

        double ans = 0;
        rep (i, 0, K) if (skt[i].first) {
            double lev = 0;
            for (const auto& Q: skt[i].second) lev += dist(P, Q);
            ans += lev * skt[i].first / (double)skt[i].second.size();
        }
        std::cout << std::fixed << std::setprecision(12) << ans << '\n';
    }
    return 0;
}
