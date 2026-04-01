/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 2e5;
int n, a[MAXN + 5];

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n;
    rep (i, 1, n) std::cin >> a[i];
    rep (i, 1, n) {
        int t;
        std::cin >> t, a[i] -= t;
    }

    std::sort(a + 1, a + n + 1);

    long long ans = 0;
    for (int i = 1, j = n; i <= n; ++i) {
        while (j && a[j] + a[i] > 0) --j;
        if (j < i) ans += i - j - 1;
    }
    std::cout << ans << '\n';
    return 0;
}
