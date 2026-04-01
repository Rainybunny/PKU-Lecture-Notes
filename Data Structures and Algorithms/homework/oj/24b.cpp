/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef long long ll;

const int MAXN = 1e5;
int n, a[MAXN + 5], b[MAXN + 5];

ll manhattanSum(int* const ary) {
    static int tmp[MAXN + 5];
    memcpy(tmp + 1, ary + 1, n << 2);
    std::sort(tmp + 1, tmp + n + 1);

    ll ret = 0;
    rep (i, 1, n) ret += (2 * i - n - 1ll) * tmp[i];
    return ret;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n;
    rep (i, 1, n) std::cin >> a[i];
    rep (i, 1, n) std::cin >> b[i];

    ll sum = manhattanSum(a) + manhattanSum(b);
    rep (i, 1, n) {
        int x = a[i], y = b[i];
        a[i] = x + y, b[i] = x - y;
    }
    ll cheby = manhattanSum(a) + manhattanSum(b);

    std::cout << (sum * 2 - cheby) << '\n';
    return 0;
}
