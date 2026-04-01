/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 39;
int ans[MAXN][MAXN];

int main() {
    int n;
    scanf("%d", &n), n = 2 * n - 1;
    int r = n >> 1, c = r, num = (n * n + 1) >> 1;

    ans[n - 1][0] = -1; // mark
    rep (_, 1, n * n) {
        assert(0 <= r && r < n);
        assert(0 <= c && c < n);
        assert(ans[r][c] <= 0);

        // printf("set %d %d to %d\n", r, c, num);
        ans[r][c] = num;
        num = num % (n * n) + 1;

        int tr = (r + n - 1) % n, tc = (c + 1) % n;
        if (ans[tr][tc]) r = (r + 1) % n;
        else r = tr, c = tc;
    }

    rep (i, 0, n - 1) {
        rep (j, 0, n - 1) {
            printf("%d%c", ans[i][j], "\n "[j < repj]);
        }
    }
    return 0;
}
