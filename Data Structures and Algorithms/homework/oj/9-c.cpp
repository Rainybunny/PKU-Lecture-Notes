/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 28;
int n;

struct LinearBase {
    int collapsed, bas[MAXN];

    LinearBase(): collapsed(0), bas{} {}

    bool contain(int x, bool insert) {
        rep (i, 0, n - 1) {
            if (x & 1 << i) {
                if (!bas[i]) {
                    if (insert) bas[i] = x;
                    return false;
                }
                x ^= bas[i];
            }
        }
        return collapsed += insert, true;
    }
};

int main() {
    int T;
    scanf("%d", &T);
    while (T--) {
        scanf("%d", &n);

        int goal = 0;
        rep (_, 0, 1) {
            rep (i, 0, n - 1) {
                int d;
                scanf("%d", &d), goal ^= d << i;
            }
        }

        int msk[MAXN] = {};
        for (int i, j; scanf("%d %d", &i, &j), i && j;) {
            msk[i - 1] |= 1 << j >> 1;
        }
        rep (i, 0, n - 1) msk[i] |= 1 << i;

        LinearBase B;
        rep (i, 0, n - 1) B.contain(msk[i], true);
        if (!B.contain(goal, false)) {
            puts("Oh,it's impossible~!!");
        } else {
            printf("%d\n", 1 << B.collapsed);
        }
    }
    return 0;
}
