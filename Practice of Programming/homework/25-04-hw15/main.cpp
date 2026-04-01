/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef __uint128_t u128;
typedef std::vector<int> Point;

const int MAXN = 3e3, WIDTH = 1 << 28;
int n, D, mtc[MAXN + 5];
Point P[MAXN + 5];
std::mt19937 rng((std::random_device())());
std::uniform_int_distribution<int> dtr(0, WIDTH - 1);

Point operator + (const Point& u, const Point& v) {
    Point ret(u);
    rep (i, 0, D - 1) ret[i] += v[i];
    return ret;
}

Point operator - (const Point& u, const Point& v) {
    Point ret(u);
    rep (i, 0, D - 1) ret[i] -= v[i];
    return ret;
}

double norm(const Point& u) {
    double ret = 0;
    rep (i, 0, D - 1) ret += (double)u[i] * u[i];
    return std::sqrt(ret);
}

u128 signs(const Point& u) {
    u128 ret = 0;
    rep (i, 0, D - 1) ret += u128(u[i] >= 0) << i;
    return ret;
}

int match(const Point& cor, const int wid, const std::vector<int>& inc) {
    if (inc.empty()) return 0;
    if (inc.size() == 1) return inc[0];
    if (wid == 1) {
        for (int i = 0; i < (int)inc.size() - 1; i += 2) {
            mtc[inc[i]] = inc[i + 1], mtc[inc[i + 1]] = inc[i];
        }
        return inc.size() & 1 ? inc.back() : 0;
    }

    Point mid(cor);
    std::map<u128, std::vector<int>> subs;
    rep (i, 0, D - 1) mid[i] += wid >> 1;
    for (int i: inc) subs[signs(P[i] - mid)].push_back(i);

    int mis = 0;
    for (const auto& [S, sub]: subs) {
        Point nex(cor);
        rep (i, 0, D - 1) nex[i] += (wid >> 1) * int(S >> i & 1);
        int up = match(nex, wid >> 1, sub);
        if (!mis) mis = up;
        else if (up) mtc[mis] = up, mtc[up] = mis, mis = 0;
    }
    return mis;
}

int main() {
    std::ios::sync_with_stdio(0), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> D;
    rep (i, 1, n) {
        P[i].resize(D);
        for (int& x: P[i]) std::cin >> x, x += int(1e8); // shift to [0,2e8]
    }

    Point cor(D);
    rep (i, 0, D - 1) cor[i] = -dtr(rng);
    std::vector<int> all(n);
    std::iota(all.begin(), all.end(), 1);
    match(cor, WIDTH << 1, all);

    rep (i, 1, n) std::cout << mtc[i] << "\n "[i < n];
    return 0;
}
