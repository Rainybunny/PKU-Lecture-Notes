/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 1e5;
int n;
std::map<int, int> buc;

int parse(const std::string& s) {
    int res = 0;
    for (char c : s) {
        if (c == '-') continue;
        int dgt = 0;
        if (isdigit(c)) dgt = c ^ '0';
        else dgt = (c - 'A' - (c > 'Q')) / 3 + 2;
        res = res * 10 + dgt;
    }
    return res;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n;
    rep (i, 1, n) {
        std::string buf;
        std::cin >> buf;
        ++buc[parse(buf)];
    }

    bool any = false;
    for (auto [num, cnt] : buc) {
        if (cnt > 1) {
            any = true;
            std::cout << std::setw(3) << std::setfill('0') << num / 10000 << '-';
            std::cout << std::setw(4) << std::setfill('0') << num % 10000 << ' ';
            std::cout << cnt << '\n';
        }
    }

    if (!any) std::cout << "No duplicates.\n";
    return 0;
}
