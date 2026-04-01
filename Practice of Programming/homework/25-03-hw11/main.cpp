/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef long long ll;

inline int sgn(const double x) {
    static const double ZERO = 1e-7;
    if (-ZERO < x && x < ZERO) return 0;
    return x < 0 ? -1 : 1;
}

struct Vector {
    double x, y;

    inline Vector operator - (const Vector& u) const {
        return { x - u.x, y - u.y };
    }

    inline double norm() const {
        return sqrt(x * x + y * y);
    }

    friend inline double dist(const Vector& u, const Vector& v) {
        return (u - v).norm();
    }

    inline bool operator < (const Vector& u) const {
        return sgn(x - u.x) ? x < u.x : !~sgn(y - u.y);
    }

    inline bool operator == (const Vector& u) const {
        return !(*this < u) && !(u < *this);
    }
};

const int MAXN = 1e5;
const double EPS = 0.01;
int n, m;
Vector P[MAXN + 5];

int main() {
    std::cin >> n;
    rep (i, 1, n) std::cin >> P[i].x >> P[i].y;

    double D = 0;
    rep (i, 2, n) D = std::max(D, dist(P[1], P[i]));

    double L = EPS * D / sqrt(2);
    rep (i, 1, n) P[i] = { floor(P[i].x / L), floor(P[i].y / L) };

    std::sort(P + 1, P + n + 1);
    m = int(std::unique(P + 1, P + n + 1) - P - 1);

    double ans = 0;
    rep (i, 1, m) {
        rep (j, i + 1, m) {
            ans = std::max(ans, dist(P[i], P[j]));
        }
    }
    std::cout << std::fixed << ans * L << '\n';
    return 0;
}
