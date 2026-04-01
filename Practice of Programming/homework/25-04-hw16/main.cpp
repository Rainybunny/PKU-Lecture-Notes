/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef unsigned long long ull;
typedef std::vector<int> Point;

const int MAXN = 2e4, WIDTH = 1 << 27;
int n, D;
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

ull signs(const Point& u) {
    ull ret = 0;
    rep (i, 0, D - 1) ret += ull(u[i] >= 0) << i;
    return ret;
}

namespace MST {

struct Edge {
    int u, v;
    double w;
    bool operator < (const Edge& e) const {
        return w < e.w;
    }
};
std::vector<Edge> edges;

int fa[MAXN + 5];

inline int top(int x) {
    return fa[x] == x ? x : fa[x] = top(fa[x]);
}

inline bool unite(int x, int y) {
    if ((x = top(x)) == (y = top(y))) return false;
    return fa[x] = y, true;
}

inline void kruskal() {
    std::sort(edges.begin(), edges.end()), std::iota(fa + 1, fa + n + 1, 1);
    for (auto [u, v, w]: edges) if (unite(u, v)) std::cout << u << ' ' << v << ' ' << '\n';
}

} // namespace MST

void divide(const Point& cor, const int wid, const std::vector<int>& inc) {
    if (inc.size() <= 1) return ;
    if (wid == 1) {
        rep (i, 1, (int)inc.size() - 1) {
            MST::edges.push_back({ inc[0], inc[i], norm(P[inc[0]] - P[inc[i]]) });
        }
        return ;
    }

    Point mid(cor);
    std::unordered_map<ull, std::vector<int>> subs;
    rep (i, 0, D - 1) mid[i] += wid >> 1;
    for (int x: inc) subs[signs(P[x] - mid)].push_back(x);

    for (const auto& [S, sub]: subs) {
        Point nex(cor);
        rep (i, 0, D - 1) nex[i] += (wid >> 1) * int(S >> i & 1);
        divide(nex, wid >> 1, sub);
    }

    if (subs.size() > 1) {
        rep (i, 1, (int)inc.size() - 1) {
            MST::edges.push_back({ inc[0], inc[i], norm(P[inc[0]] - P[inc[i]]) });
        }
    }
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> D;
    rep (i, 1, n) {
        P[i].resize(D);
        for (int& x: P[i]) std::cin >> x;
    }
    
    std::vector<int> all(n);
    std::iota(all.begin(), all.end(), 1);

    rep (T, 1, 10) {
        Point cor(D);
        rep (i, 0, D - 1) cor[i] = -dtr(rng);
        divide(cor, WIDTH << 1, all);
    }

    MST::kruskal();
    return 0;
}
