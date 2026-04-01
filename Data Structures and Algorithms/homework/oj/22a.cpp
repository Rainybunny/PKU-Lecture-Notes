/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 1e6;
int n, m, c, a[MAXN + 5];
std::deque<int> smn, smx;

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> m >> c;
    rep (i, 1, n) std::cin >> a[i];

    bool any = false;
    rep (i, 1, n) {
        while (smn.size() && smn.front() <= i - m) smn.pop_front();
        while (smx.size() && smx.front() <= i - m) smx.pop_front();
        while (smn.size() && a[smn.back()] > a[i]) smn.pop_back();
        while (smx.size() && a[smx.back()] < a[i]) smx.pop_back();
        smn.push_back(i), smx.push_back(i);
        if (i >= m && a[smx.front()] - a[smn.front()] <= c) {
            any = true;
            std::cout << i - m + 1 << '\n';
        }
    }
    if (!any) std::cout << "NONE\n";
    return 0;
}
