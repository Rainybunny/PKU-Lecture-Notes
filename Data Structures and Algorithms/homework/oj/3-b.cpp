/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

int n;
std::vector<int> stk;
std::vector<std::pair<bool, int>> ans;

bool solve() {
    int rem = 1;
    rep (i, 1, n) {
        int x;
        std::cin >> x;
        if (!(1 <= x && x <= n)) return false;
        while (rem <= x) ans.emplace_back(0, rem), stk.push_back(rem++);
        if (stk.back() != x) return false;
        ans.emplace_back(1, x), stk.pop_back();
    }
    return true;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n;
    if (!solve()) std::cout << "NO\n";
    else {
        for (auto [op, x]: ans) {
            std::cout << (op ? "POP " : "PUSH ") << x << '\n';
        }
    }
    return 0;
}
