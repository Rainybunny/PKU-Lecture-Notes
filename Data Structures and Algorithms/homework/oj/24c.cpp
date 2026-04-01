/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXL = 9, MAXN = 300, MAXQ = 5e5;

typedef long long ll;
typedef ll Map[MAXN + 5][MAXN + 5];

int n, q;
Map dis, buf[MAXL];
ll ans[MAXQ + 5];

struct Query { int s, t, id; };
std::vector<Query> qry[MAXN + 5];

void mapCopy(Map dst, Map src) {
    rep (i, 1, n) memcpy(dst[i] + 1, src[i] + 1, n << 3);
}

void floyd(int k) {
    rep (i, 1, n) if (i != k) {
        rep (j, 1, n) if (j != i && j != k) {
            dis[i][j] = std::min(dis[i][j], dis[i][k] + dis[k][j]);
        }
    }
}

void solve(int l, int r, int lev) {
    if (l == r) {
        for (auto [s, t, id] : qry[l]) {
            ans[id] = dis[s][t];
        }
        return ;
    }

    int mid = l + r >> 1;
    mapCopy(buf[lev], dis);

    rep (i, l, mid) floyd(i);
    solve(mid + 1, r, lev + 1);

    mapCopy(dis, buf[lev]);
    rep (i, mid + 1, r) floyd(i);
    solve(l, mid, lev + 1);

    mapCopy(dis, buf[lev]);
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> q;
    rep (i, 1, n) rep (j, 1, n) std::cin >> dis[i][j];
    rep (i, 1, q) {
        int s, t, p;
        std::cin >> s >> t >> p;
        qry[p].push_back({ s, t, i });
    }

    solve(1, n, 0);
    rep (i, 1, q) std::cout << ans[i] << '\n';
    return 0;
}
