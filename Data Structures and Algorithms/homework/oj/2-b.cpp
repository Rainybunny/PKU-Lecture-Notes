/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    int T;
    std::cin >> T;
    while (T--) {
        std::map<int, int> ans;
        for (int line = 0; line < 2;) {
            int coe, pwr;
            std::cin >> coe >> pwr;
            if (pwr >= 0) ans[pwr] += coe;
            else ++line;
        }

        std::vector<std::pair<int, int>> out;
        for (auto [p, c]: ans) if (c) out.emplace_back(c, p);
        std::reverse(out.begin(), out.end());
        rep (i, 0, (int)out.size() - 1) {
            std::cout << "[ " << out[i].first << ' '
                      << out[i].second << " ]" << "\n "[i < repi];
        }
    }

    return 0;
}
