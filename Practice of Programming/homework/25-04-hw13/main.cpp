/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef long long ll;

const int MAXN = 1e5;
const double EPS = 0.9, DINF = 1e18;
int n;

inline ll sqr(const int x) {
    return (ll)x * x;
}

struct Vector {
    int x, y, z;
    Vector() {}
    Vector(int x_, int y_, int z_): x(x_), y(y_), z(z_) {}
    inline Vector operator + (const Vector& u) const {
        return { x + u.x, y + u.y, z + u.z };
    }
    inline Vector operator - (const Vector& u) const {
        return { x - u.x, y - u.y, z - u.z };
    }
    inline double norm() const {
        return sqrt(sqr(x) + sqr(y) + sqr(z));
    }
    inline int signs() const {
        return (x >= 0) << 2 | (y >= 0) << 1 | (z >= 0);
    }
    friend inline double dist(const Vector& u, const Vector& v) {
        return (u - v).norm();
    }
} P[MAXN + 5];

inline int pick(const std::vector<int>& vec) {
    static std::mt19937 rng((std::random_device())());
    return vec[std::uniform_int_distribution<>(0, (int)vec.size() - 1)(rng)];
}

struct CubicTree {
    int wid, rps, siz;
    Vector top;
    CubicTree* child[8];

    CubicTree(const int wid_, const Vector& top_, const std::vector<int>& inc):
    wid(wid_), rps(pick(inc)), siz((int)inc.size()), top(top_), child {} {
        if (wid == 1) return ;

        int hlf = wid >> 1;
        std::vector<int> div[8] = {};
        Vector spt = top + Vector(hlf, hlf, hlf);
        for (int i: inc) div[(P[i] - spt).signs()].push_back(i);

        rep (i, 0, 7) if (div[i].size()) {
            Vector ntop = top;
            if (i >> 2) ntop.x += hlf;
            if (i >> 1 & 1) ntop.y += hlf;
            if (i & 1) ntop.z += hlf;
            child[i] = new CubicTree(hlf, ntop, div[i]);
        }
    }

    friend double dist(const CubicTree* A, const CubicTree* B) {
        ll dx = std::min({ sqr(A->top.x - B->top.x), sqr(A->top.x + A->wid - B->top.x),
            sqr(A->top.x - B->top.x - B->wid), sqr(A->top.x + A->wid - B->top.x - B->wid) });
        ll dy = std::min({ sqr(A->top.y - B->top.y), sqr(A->top.y + A->wid - B->top.y),
            sqr(A->top.y - B->top.y - B->wid), sqr(A->top.y + A->wid - B->top.y - B->wid) });
        ll dz = std::min({ sqr(A->top.z - B->top.z), sqr(A->top.z + A->wid - B->top.z),
            sqr(A->top.z - B->top.z - B->wid), sqr(A->top.z + A->wid - B->top.z - B->wid) });
        return sqrt(dx + dy + dz);
    }

    friend double match(const CubicTree* A, const CubicTree* B) {
        if (A->siz == 1 && B->siz == 1) {
            return A->rps == B->rps ? DINF : dist(P[A->rps], P[B->rps]);
        }
        if (A->wid < B->wid) std::swap(A, B);
        if (A->wid <= EPS * dist(A, B)) return DINF;

        double ret = DINF;
        for (auto ch: A->child) {
            if (ch != nullptr) {
                ret = std::min(ret, match(ch, B));
            }
        }
        return ret;
    }
};

CubicTree* tree;

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n;
    rep (i, 1, n) std::cin >> P[i].x >> P[i].y >> P[i].z;

    std::vector<int> all(n);
    std::iota(all.begin(), all.end(), 1);
    tree = new CubicTree(1 << 30, { 0, 0, 0 }, all);

    std::cout << std::fixed << std::setprecision(2) << match(tree, tree) << '\n';
    return 0;
}
