/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef std::pair<int, int> pii;

const int MAXN = 10;
int n, dis[MAXN + 5][MAXN + 5];
pii ord[MAXN * (MAXN - 1) / 2 + 5];

struct Point {
    int x, y, z;
} A[MAXN + 5];

inline int sqr(const int x) {
    return x * x;
}

inline int dist2(const Point& u, const Point& v) {
    return sqr(u.x - v.x) + sqr(u.y - v.y) + sqr(u.z - v.z);
}

int main() {
    scanf("%d", &n);
    rep (i, 1, n) scanf("%d %d %d", &A[i].x, &A[i].y, &A[i].z);

    int cnt = 0;
    rep (i, 1, n) {
        rep (j, i + 1, n) {
            ord[++cnt] = { i, j }, dis[i][j] = dist2(A[i], A[j]);
        }
    }

    std::sort(ord + 1, ord + cnt + 1,
        [&](const pii& u, const pii& v) -> bool {
            int d = dis[u.first][u.second] - dis[v.first][v.second];
            return d ? d > 0 : u < v;
        }
    );

    rep (i, 1, cnt) {
        auto [p, q] = ord[i];
        printf("(%d,%d,%d)-(%d,%d,%d)=%.2f\n",
               A[p].x, A[p].y, A[p].z, A[q].x, A[q].y, A[q].z, sqrt(dis[p][q]));
    }
    return 0;
}
