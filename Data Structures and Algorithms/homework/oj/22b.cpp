/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXK = 1e5;
int k, pwr[MAXK + 5];
std::bitset<MAXK * 2 + 1> f[2];

int main() {
    scanf("%d", &k);
    while (~k & 1) k >>= 1;
    while (!(k % 5)) k /= 5;

    int cnt = 0;
    pwr[0] = 1;
    do {
        ++cnt, pwr[cnt] = pwr[cnt - 1] * 10 % k;
    } while (pwr[cnt] != 1);

    rep (i, 0, cnt - 1) f[0].set(pwr[i]);
    for (int ans = 1; ; ++ans) {
        if (f[~ans & 1][0]) return printf("%d\n", ans), 0;
        f[ans & 1].reset();
        rep (i, 0, cnt - 1) f[ans & 1] |= f[~ans & 1] << pwr[i];
        f[ans & 1] |= f[ans & 1] >> k;
    }
    return 0;
}
