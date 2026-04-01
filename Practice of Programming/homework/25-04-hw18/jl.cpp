/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef std::vector<double> Point;

const int N = 1e3, T = 60, D = 784, C = 5;
std::mt19937 rng((std::random_device())());
std::normal_distribution<double> dtr(0, 1);
double emax[T], eavg[T];
Point P[N];

Point operator + (const Point& u, const Point& v) {
    Point ret(u);
    rep (i, 0, (int)u.size() - 1) ret[i] += v[i];
    return ret;
}

Point operator - (const Point& u, const Point& v) {
    Point ret(u);
    rep (i, 0, (int)u.size() - 1) ret[i] -= v[i];
    return ret;
}

double norm(const Point& u) {
    double ret = 0;
    rep (i, 0, (int)u.size() - 1) ret += (double)u[i] * u[i];
    return std::sqrt(ret);
}

std::pair<double, double> jlTest(const int m) {
    double sqm = 1 / sqrt(m);
    std::vector<Point> G(m);
    rep (i, 0, m - 1) {
        G[i].resize(D);
        for (double& x: G[i]) x = dtr(rng);
    }

    auto f = [&](const Point& x)->Point {
        Point ret(m);
        rep (i, 0, m - 1) {
            ret[i] = sqm * std::inner_product(x.begin(), x.end(), G[i].begin(), 0);
        }
        return ret;
    };

    Point Q[N];
    rep (i, 0, N - 1) Q[i] = std::move(f(P[i]));

    double em = 0, ea = 0;
    rep (i, 0, N - 1) {
        rep (j, i + 1, N - 1) {
            double e = fabs(norm(Q[i] - Q[j]) - norm(P[i] - P[j])) / norm(P[i] - P[j]);
            em = std::max(em, e), ea += e;
        }
    }
    ea /= (N * (N - 1) / 2);
    return { em, ea };
}

int main() {
    freopen("data.txt", "r", stdin);
    rep (i, 0, N - 1) {
        P[i].resize(D);
        for (double& x: P[i]) std::cin >> x;
    }

    rep (i, 0, T - 1) {
        printf("testing %d\n", (i + 1) * 5);
        rep (j, 1, C) {
            auto [em, ea] = jlTest((i + 1) * 5);
            emax[i] += em, eavg[i] += ea;
        }
        emax[i] /= C, eavg[i] /= C;
    }

    freopen("result.txt", "w", stdout);
    rep (i, 0, T - 1) printf("%f%c", emax[i], "\n "[i + 1 < T]);
    rep (i, 0, T - 1) printf("%f%c", eavg[i], "\n "[i + 1 < T]);
    return 0;
}
