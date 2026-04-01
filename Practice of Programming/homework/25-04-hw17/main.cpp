/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef long long ll;
typedef std::vector<ll> Point;

const int MAXN = 1e5;
int D, n, m;
ll R, wid;
Point P[MAXN + 5];
std::mt19937_64 rng((std::random_device())());

Point operator - (const Point& u, const Point& v) {
    Point ret(u);
    rep (i, 0, D - 1) ret[i] -= v[i];
    return ret;
}

inline ll sqr(const ll x) {
    return (ll)x * x;
}

struct Trie {
    int dim, cnt;
    std::unordered_map<ll, Trie*> child;
    Trie(const int d): dim(d), cnt(0) {}

    void insert(const int id) {
        ++cnt;
        if (dim == D) return ;
        if (!child.count(P[id][dim] / wid)) {
            child[P[id][dim] / wid] = new Trie(dim + 1);
        }
        child[P[id][dim] / wid]->insert(id);
    }

    int count(const Point& Q, const ll dif = 0) {
        if (dif > R * R) return 0;
        if (dim == D) return cnt;

        int id = Q[dim] / wid, ret = 0;
        if (auto it = child.find(id); it != child.end()) {
            ret += it->second->count(Q, dif);
        }
        if (auto it = child.find(id - 1); it != child.end()) {
            ret += it->second->count(Q, dif + sqr(Q[dim] - id * wid + 1));
        }
        if (auto it = child.find(id + 1); it != child.end()) {
            ret += it->second->count(Q, dif + sqr((id + 1) * wid - Q[dim]));
        }
        return ret;
    }
};
Trie* trie = new Trie(0);

int main() {
    std::ios::sync_with_stdio(0), std::cin.tie(0), std::cout.tie(0);

    std::cin >> D >> n >> m >> R, wid = 3 * R;

    // ah?
    if (15 * R >= 4e9) {
        rep (i, 1, m) std::cout << n << '\n';
        return 0;
    }

    std::uniform_int_distribution<ll> dtr(0, wid - 1);
    Point shf(D);
    rep (i, 0, D - 1) shf[i] = -dtr(rng);

    rep (i, 1, n) {
        P[i].resize(D);
        for (ll& x: P[i]) std::cin >> x;
        P[i] = P[i] - shf;
    }

    rep (i, 1, n) trie->insert(i);

    while (m--) {
        Point Q(D);
        for (ll& x: Q) std::cin >> x;
        Q = Q - shf;
        std::cout << trie->count(Q) << '\n';
    }
    return 0;
}
