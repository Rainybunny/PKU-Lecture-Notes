/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 1e5;
const double EPS = 0.15;
int n, q;
std::mt19937 rng((std::random_device())());

inline int pick(const std::vector<int>& vec) {
    return vec[std::uniform_int_distribution<>(0, (int)vec.size() - 1)(rng)];
}

struct Point {
    double x, y;
    inline double norm() const { return sqrt(x * x + y * y); }
    inline Point operator - (const Point& u) const { return { x - u.x, y - u.y }; }
    friend inline double dist(const Point& u, const Point& v) { return (u - v).norm(); }
} P[MAXN + 5];

struct DivTree {
    int rps;
    double ux, uy, wid;
    DivTree* child[4];
    std::vector<int> inc;

    DivTree(const double x, const double y, const double w, const std::vector<int>& buc):
    rps(pick(buc)), ux(x), uy(y), wid(w), child(), inc(buc) {
        if (buc.size() == 1) return ;

        std::vector<int> sub[4] = {};
        double spx = ux + 0.5 * wid, spy = uy + 0.5 * wid;
        for (int id: buc) {
            sub[(P[id].x > spx) << 1 | (P[id].y > spy)].push_back(id);
        }
        rep (i, 0, 3) if (sub[i].size()) {
            child[i] = new DivTree(ux + (i > 1) * 0.5 * wid,
                                   uy + (i & 1) * 0.5 * wid, 0.5 * wid, sub[i]);
        }
    }

    inline void query(const Point& Q, double& dis, int& id) const {
        double cur = dist(P[rps], Q);
        if (cur < dis) dis = cur, id = rps;
        else if (dis <= (1 + EPS) * (cur - M_SQRT2 * wid)) return ;
        for (const auto& son: child) if (son != nullptr) son->query(Q, dis, id);
    }
};

DivTree* tree;

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> q;
    rep (i, 1, n) std::cin >> P[i].x >> P[i].y;

    std::vector<int> all(n);
    std::iota(all.begin(), all.end(), 1);
    tree = new DivTree(0, 0, 1e6, all);

    for (double x, y; q--;) {
        std::cin >> x >> y;
        double dis = 1e9; int id = 0;
        tree->query({ x, y }, dis, id);
        std::cout << id << '\n';
    }
    return 0;
}
