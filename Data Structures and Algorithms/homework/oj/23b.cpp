/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 2e5;
int n, m, cnt[MAXN + 5];
std::vector<int> ban[MAXN + 5];
bool vis[MAXN + 5];

int solve() {
    int res = 0;
    rep (s, 1, n) {
        if (vis[s]) continue;

        ++res;

        int siz = 1;
        memset(cnt + 1, 0, n << 2); // m/n times at most, O(m)
        for (int u : ban[s]) ++cnt[u];
        vis[s] = true;

        std::list<int> out;
        rep (i, 1, n) if (i != s) out.push_back(i);
        for (bool any = true; any; ) {
            any = false;
            for (auto it = out.begin(); it != out.end(); ++it) {
                int x = *it;
                if (cnt[x] < siz) {
                    ++siz, vis[x] = true;
                    for (int u : ban[x]) ++cnt[u];
                    out.erase(it), any = true;
                    break;
                }
                // reach here ~ 2m times
            }
        }
    }
    return res - 1;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> m;
    rep (i, 1, m) {
        int u, v;
        std::cin >> u >> v;
        ban[u].push_back(v), ban[v].push_back(u);
    }

    std::cout << solve() << '\n';
    return 0;
}
