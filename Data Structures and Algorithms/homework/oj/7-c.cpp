/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

int n, m;
std::vector<int> deg;
std::vector<std::vector<int>> adj;
std::priority_queue<int, std::vector<int>, std::greater<int>> heap;

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> m;
    deg = std::vector<int>(n + 1);
    adj = std::vector<std::vector<int>>(n + 1);

    rep (i, 1, m) {
        int s, t;
        std::cin >> s >> t;
        adj[s].push_back(t), ++deg[t];
    }

    rep (i, 1, n) if (!deg[i]) heap.push(i);
    while (heap.size()) {
        int u = heap.top(); heap.pop();
        std::cout << 'v' << u << ' ';
        for (int v : adj[u]) {
            if (!--deg[v]) {
                heap.push(v);
            }
        }
    }
    std::cout << '\n';
    return 0;
}
