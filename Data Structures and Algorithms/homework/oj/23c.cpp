/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 2e4, MAXM = 1e4;
int n, m, a[MAXM + 5];
std::string pat[MAXN + 5], txt[MAXM + 5];
std::vector<int> adj[MAXN + 5];
int ind[MAXN + 5];

int topoSortPatterns() {
    int ret = 0;
    std::queue<int> que;
    rep (i, 1, n) if (!ind[i]) que.push(i), ++ret;
    while (!que.empty()) {
        int u = que.front(); que.pop();
        for (int v : adj[u]) {
            if (!--ind[v]) {
                que.push(v); ++ret;
            }
        }
    }
    return ret;
}

bool solve() {
    std::unordered_map<std::string,int> mp;
    mp.reserve(n * 2);
    rep (i, 1, n) mp[pat[i]] = i;

    rep (i, 1, n) { adj[i].clear(); ind[i] = 0; }

    rep (i, 1, m) {
        const std::string &s = txt[i];
        int want = a[i];
        rep (j, 0, 2) {
            if (pat[want][j] != '?' && pat[want][j] != s[j]) {
                return false;
            }
        }

        std::array<char, 4> buf; buf[3] = '\0';
        rep (mask, 0, 7) {
            for (int j = 0; j < 3; ++j) {
                buf[j] = (mask >> j) & 1 ? '?' : s[j];
            }
            std::string t(buf.data());
            auto it = mp.find(t);
            if (it != mp.end()) {
                int pid = it->second;
                if (pid != want) {
                    adj[want].push_back(pid);
                }
            }
        }
    }

    rep (u, 1, n) {
        auto &v = adj[u];
        if (v.empty()) continue;
        sort(v.begin(), v.end());
        v.erase(std::unique(v.begin(), v.end()), v.end());
        for (int x : v) ++ind[x];
    }

    return topoSortPatterns() == n;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    int T;
    std::cin >> T;
    while (T--) {
        std::cin >> n >> m;
        rep (i, 1, n) std::cin >> pat[i];
        rep (i, 1, m) std::cin >> txt[i] >> a[i];
        std::cout << (solve() ? "YES\n" : "NO\n");
    }
    return 0;
}
