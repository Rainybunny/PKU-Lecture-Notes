/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

int main() {
    std::string buf;
    for (int T = 1; std::cin >> buf && buf[0] != '#'; ++T) {
        std::vector<int> stk = { 0 };
        int h1 = 0, h2 = 0, sum = 0;
        for (char c : buf) {
            if (c == 'u') sum -= stk.back(), stk.pop_back();
            else {
                ++sum, ++stk.back(), stk.push_back(0);
                h1 = std::max(h1, (int)stk.size() - 1);
                h2 = std::max(h2, sum);
            }
        }
        std::cout << "Tree " << T << ": " << h1 << " => " << h2 << '\n';
    }
    return 0;
}
