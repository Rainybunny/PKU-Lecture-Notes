/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int W = 1e9;
int n = 5e5;
std::mt19937 rng(std::random_device{}());
std::uniform_int_distribution<> dst(0, W);

int main() {
    printf("%d\n", n);
    rep (i, 1, n) {
        printf("0 %d %d\n", dst(rng), dst(rng));
    }
    return 0;
}
