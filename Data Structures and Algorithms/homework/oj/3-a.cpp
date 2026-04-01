/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 1e6;
int n, k, a[MAXN + 5], ans[MAXN + 5];

void slide(bool cmp(int, int)) {
    static int head, tail, que[MAXN + 5];
    head = 1, tail = 0;
    rep (i, 1, n) {
        while (head <= tail && cmp(a[i], a[que[tail]])) --tail;
        que[++tail] = i;
        while (que[head] <= i - k) ++head;
        if (i >= k) ans[i - k + 1] = a[que[head]];
    }
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> k;
    rep (i, 1, n) std::cin >> a[i];

    slide([](int x, int y) { return x < y; });
    rep (i, 1, n - k + 1) std::cout << ans[i] << "\n "[i < repi];
    slide([](int x, int y) { return x > y; });
    rep (i, 1, n - k + 1) std::cout << ans[i] << "\n "[i < repi];
    return 0;
}
