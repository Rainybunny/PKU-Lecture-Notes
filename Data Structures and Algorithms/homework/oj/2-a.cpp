/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

int main() {
    std::string s, t;
    while (std::cin >> s >> t) {
        int p = int(std::max_element(s.begin(), s.end()) - s.begin());
        s = s.substr(0, p + 1) + t + s.substr(p + 1);
        std::cout << s << '\n';
    }
    return 0;
}
