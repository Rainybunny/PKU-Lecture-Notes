/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef long long ll;

const int MAXN = 2e4;
int n, a[MAXN + 5];

ll solve(const int l, const int r) {
    if (l == r) return 0;
    int mid = l + r >> 1;
    ll ret = solve(l, mid) + solve(mid + 1, r);

    static int tmp[MAXN + 5];
    int i = l, j = mid + 1, k = l;
    while (i <= mid && j <= r) {
        if (a[i] <= a[j]) tmp[k++] = a[i++];
        else ret += mid - i + 1, tmp[k++] = a[j++];
    }
    while (i <= mid) tmp[k++] = a[i++];
    while (j <= r) tmp[k++] = a[j++];
    memcpy(a + l, tmp + l, (r - l + 1) << 2);
    return ret;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    while (std::cin >> n && n) {
        rep (i, 1, n) std::cin >> a[i];
        std::cout << solve(1, n) << '\n';
    }
    return 0;
}
