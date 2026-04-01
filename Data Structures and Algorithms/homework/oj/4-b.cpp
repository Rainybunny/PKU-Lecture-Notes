/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 1e6;
int n, bor[MAXN + 5];
char str[MAXN + 5];

void kmp() {
    int j = 0;
    rep (i, 2, n) {
        while (j && str[j + 1] != str[i]) j = bor[j];
        bor[i] = (j += str[j + 1] == str[i]);
    }
}

int main() {
    freopen("test.in", "r", stdin);
    while (~scanf("%[^\n]", str + 1) && strcmp(str + 1, ".")) {
        getchar(); // filter '\n'
        n = (int)strlen(str + 1), kmp();
        int peri = n - bor[n];
        if (n % peri) puts("1");
        else printf("%d\n", n / peri);
    }
    return 0;
}
