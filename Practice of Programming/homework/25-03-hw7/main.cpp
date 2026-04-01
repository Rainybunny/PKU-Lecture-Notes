/*+Rainybunny+*/

#include "streaming.h"
#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef std::pair<int, int> pii;
typedef unsigned long long u64;

#define mix(h) ({                    \
            (h) ^= (h) >> 23;        \
            (h) *= 0x2127599bf4325c37ULL;    \
            (h) ^= (h) >> 47; })

u64 fasthash64(u64 v, u64 seed) {
    const uint64_t m = 0x880355f21e6d1965ULL;
    u64 h = seed;
    h ^= mix(v);
    h *= m;
    return mix(h);
}

const double EPS = 1e-3;
const int M = 5e3, C = 20;
const int D_SEED = M - C, D_BEST = D_SEED - 100;
const int D_K = D_BEST - 1, D_CNT = D_K - 1, D_SIZ = D_CNT - 1, LEN = D_SIZ;

int bucketId(u64 v, int id) {
    return fasthash64(v, Get(D_SEED + id)) % LEN;
}

void init(int k) {
    Set(D_K, k);
    std::mt19937 rng(std::chrono::steady_clock().now().time_since_epoch().count());
    rep (i, 0, C - 1) Set(D_SEED + i, rng());
}

int query(int x, int dlt) {
    int ret = 0x3f3f3f3f;
    rep (i, 0, C - 1) {
        int id = bucketId(x, i), c = Get(id) + dlt;
        ret = std::min(ret, c), Set(id, c);
    }
    return ret;
}

void add(int x) {
    int cnt = Get(D_CNT), k = Get(D_K);
    Set(D_CNT, cnt + 1);
    if (query(x, 1) >= (cnt + k - 1) / k) {
        int siz = Get(D_SIZ);
        rep (i, D_BEST, D_BEST + siz - 1) if (x == Get(i)) return ;
        // printf("%d!\n", x);
        Set(D_BEST + siz, x), Set(D_SIZ, ++siz);
    }
}

std::vector<int> report() {
    std::vector<int> ans;
    int cnt = Get(D_CNT), k = Get(D_K);
    rep (i, D_BEST, D_BEST + Get(D_SIZ) - 1) {
        // printf("%d: %d\n", x, query(x, 0));
        int x = Get(i);
        if (query(x, 0) >= (cnt + k - 1) / k) ans.push_back(x);
    }
    return ans;
}