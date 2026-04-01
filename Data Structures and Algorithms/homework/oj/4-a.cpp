/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

std::string s, t;

bool check() {
    size_t p = 0;
    for (char c: s) {
        while (p < t.size() && t[p] != c) ++p;
        if (p == t.size()) return false;
        ++p;
    }
    return true;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    while (std::cin >> s >> t) std::cout << (check() ? "Yes\n" : "No\n");
    return 0;
}
