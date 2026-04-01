/*+Rainybunny+*/

#include "rank.h"
#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

std::mt19937 rng(std::chrono::steady_clock().now().time_since_epoch().count());

int rnk(int n, double p) {
    static const int N = 5e3;
    std::uniform_int_distribution dtr(1, n);
    static int ary[N];
    int idx = (int)round(ceil(p * N)) - 1;
    idx = std::max(0, std::min(N - 1, idx)); // ?
    rep (i, 0, N - 1) ary[i] = query(dtr(rng));
    std::nth_element(ary, ary + idx, ary + N);
    return ary[idx];
}
