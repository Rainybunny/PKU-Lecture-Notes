/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef long long ll;

const int MAXN = 2e5, BASE = 127, MOD = 1e9 + 7;
int n, clr[MAXN + 5], a[MAXN * 2 + 5], ord[MAXN * 2 + 5];
int msk[MAXN + 5], pwr[MAXN + 5], ipwr[MAXN + 5];
std::vector<int> buc[MAXN + 5];

inline int mul(const int u, const int v) { return (ll)u * v % MOD; }
inline void subeq(int& u, const int v) { (u -= v) < 0 && (u += MOD); }
inline int sub(int u, const int v) { return (u -= v) < 0 ? u + MOD : u; }
inline void addeq(int& u, const int v) { (u += v) >= MOD && (u -= MOD); }
inline int add(int u, const int v) { return (u += v) < MOD ? u : u - MOD; }
inline int mpow(int u, int v) {
    int ret = 1;
    for (; v; u = mul(u, u), v >>= 1) ret = mul(ret, v & 1 ? u : 1);
    return ret;
}

struct FenwickTree {
    int val[MAXN + 5];

    void add(int x, int k) {
        k = mul(k, pwr[x]);
        for (; x <= n; x += x & -x) addeq(val[x], k);
    }

    int sum(int x) const {
        int ret = 0;
        for (; x; x &= x - 1) addeq(ret, val[x]);
        return ret;
    }

    int hash(int l, int len) const {
        return mul(sub(sum(l + len - 1), sum(l - 1)), ipwr[l]);
    }
} T[2];

void init() {
    std::mt19937 rng(20120712);
    std::uniform_int_distribution<> dtr(1, MOD - 1);
    rep (i, 1, n) msk[i] = dtr(rng);

    pwr[0] = 1;
    rep (i, 1, n) pwr[i] = mul(BASE, pwr[i - 1]);
    ipwr[n] = mpow(pwr[n], MOD - 2);
    per (i, n - 1, 0) ipwr[i] = mul(ipwr[i + 1], BASE);

    rep (i, 1, n) {
        T[0].add(i, msk[i]);
        T[1].add(n - i + 1, msk[i]);
    }

    std::iota(clr + 1, clr + n + 1, 1);
    rep (i, 1, n) buc[i].push_back(i);
}

void merge(int x, int y) {
    x = clr[x], y = clr[y];
    if (buc[x].size() < buc[y].size()) std::swap(x, y);
    // x larger
    int dlt = sub(msk[x], msk[y]);
    for (int i : buc[y]) {
        clr[i] = x;
        T[0].add(i, dlt), T[1].add(n - i + 1, dlt);
    }
    size_t ori = buc[x].size();
    buc[x].resize(ori + buc[y].size());
    memcpy(buc[x].data() + ori, buc[y].data(), buc[y].size() << 2);
    buc[y].clear(), buc[y].shrink_to_fit();
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n;
    rep (i, 3, 2 * n - 1) std::cin >> a[i];

    init();

    std::iota(ord + 3, ord + 2 * n, 3);
    std::sort(ord + 3, ord + 2 * n, [](int i, int j) { return a[i] < a[j]; });

    ll ans = 0;
    rep (i, 3, 2 * n - 1) {
        int s = ord[i], w = a[s];
        int l0 = std::max(1, s - n), l1 = std::min(n, s - 1);
        int near = 0, far = (l1 - l0 + 1) >> 1;
        while (true) {
            int l = near + 1, r = far + 1; // drop last near
            while (l < r) {
                int mid = (l + r) >> 1;
                if (T[0].hash(l0, mid) != T[1].hash(n - l1 + 1, mid)) {
                    r = mid;
                } else {
                    l = mid + 1;
                }
            }
            if ((near = l) > far) break;
            ans += w, merge(l0 + near - 1, l1 - near + 1);
        }
    }

    std::cout << ans << '\n';
    return 0;
}
