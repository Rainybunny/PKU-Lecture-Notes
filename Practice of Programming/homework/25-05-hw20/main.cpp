/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef long double Float;
typedef std::vector<Float> Vector;

const int MAXN = 1e5, MAXD = 1e3, MAXM = 1e5;
int n, d, m;
std::mt19937 rng(std::random_device{}());
std::normal_distribution<Float> ndst(0, 1);

struct Element { int i, j; Float w; };
std::vector<Element> X;

Vector apply(const Vector& v) {
    assert((int)v.size() == d);
    Vector ret(n);
    for (auto [i, j, w]: X) ret[i] += v[j] * w;
    return ret;
}

Vector applyT(const Vector& v) {
    assert((int)v.size() == n);
    Vector ret(d);
    for (auto [i, j, w]: X) ret[j] += v[i] * w;
    return ret;
}

Vector normalize(Vector v) {
    Float sum = 0;
    for (auto x: v) sum += x * x;
    sum = std::sqrt(sum);
    if (sum == 0) return v;
    for (auto& x: v) x /= sum;
    return v;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> d >> m, X.resize(m);
    for (auto& [i, j, w]: X) std::cin >> i >> j >> w, --i, --j;

    Vector v(d);
    for (auto& x: v) x = ndst(rng);
    v = normalize(v);

    for (int T = 50; T--;) v = normalize(applyT(apply(v)));
    for (auto x: v) std::cout << std::fixed << std::setprecision(18) << x << '\n';
    return 0;
}
