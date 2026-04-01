/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef std::pair<int, int> pii;
#define fi first
#define se second

inline pii operator + (const pii& x, const pii& y) {
    return { x.fi + y.fi, x.se };
}

const int MAXN = 30, IINF = 0x3f3f3f3f;
int n, m, q;
std::string name[MAXN + 5];
std::pair<int, int> dis[MAXN + 5][MAXN + 5];
std::map<std::string, int> dict;

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n;
    rep (i, 1, n) std::cin >> name[i], dict[name[i]] = i;

    rep (i, 1, n) {
        rep (j, 1, n) {
            dis[i][j] = { (i != j) * IINF, 0 };
        }
    }

    std::cin >> m;
    rep (i, 1, m) {
        static std::string ubuf, vbuf;
        int u, v, d;
        std::cin >> ubuf >> vbuf >> d;
        u = dict[ubuf], v = dict[vbuf];
        dis[u][v] = std::min(dis[u][v], pii(d, v));
        dis[v][u] = std::min(dis[v][u], pii(d, u));
    }

    rep (w, 1, n) {
        rep (u, 1, n) if (u != w) {
            rep (v, 1, n) if (v != w && v != u) {
                dis[u][v] = std::min(dis[u][v], dis[u][w] + dis[w][v]);
            }
        }
    }

    std::cin >> q;
    while (q--) {
        static std::string ubuf, vbuf;
        std::cin >> ubuf >> vbuf;
        int u = dict[ubuf], v = dict[vbuf];
        while (u != v) {
            std::cout << name[u] << "->(";
            std::cout << dis[u][dis[u][v].se].fi << ")->";
            u = dis[u][v].se;
        }
        std::cout << vbuf << '\n';
    }
    return 0;
}
