/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef unsigned long long ull;

const int MAXN = 1e6;
const ull BASE = 127;
int n;
char S[MAXN + 5], P[MAXN + 5];
ull hsh[MAXN + 5], pwr[MAXN + 5];

void init() {
    pwr[0] = 1;
    rep (i, 1, n) pwr[i] = pwr[i - 1] * BASE;
    rep (i, 1, n) hsh[i] = hsh[i - 1] * BASE + S[i];
}

inline ull getHash(int i, int len) {
    return hsh[i + len - 1] - hsh[i - 1] * pwr[len];
}

int main() {
    scanf("%s %s", S + 1, P + 1);
    n = (int)strlen(S + 1), init();

    int len = 1;
    while (P[n - len + 1] == '0') ++len;
    if (len == n + 1) {
        S[n + 1] = 'a'; // anything
        return puts(S + 1), 0;
    }

    int las = n - len + 1;
    per (i, las - 1, 1) {
        if (P[i] == '0') continue;
        int l = 0, r = len;
        while (l < r) {
            int mid = (l + r + 1) >> 1;
            if (getHash(i, mid) == getHash(las, mid)) l = mid;
            else r = mid - 1;
        }
        if (!(len = l)) return puts("-1"), 0;
    }

    ull key = getHash(las, len);
    rep (i, 1, n - len + 1) {
        if (P[i] == '1') continue;
        if (getHash(i, len) == key) return puts("-1"), 0;
    }

    S[las + len] = '\0'; // S.substr(las, len)
    puts(S + las);
    return 0;
}
