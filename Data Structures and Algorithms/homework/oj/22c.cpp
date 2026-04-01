/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef long long ll;

const int MAXN = 2500, MAXL0 = 1e3, MOD = 1e9 + 7;
int n, sum[MAXN + 5], pre[MAXL0 + 5];
ll len[MAXN + 5];
std::pair<int, ll> info[MAXN + 5];
std::map<ll, int> rec[MAXN + 5];

inline int sub(int x, int y) { return (x -= y) < 0 ? x + MOD : x; }
inline int add(int x, int y) { return (x += y) < MOD ? x : x - MOD; }

int query(int id, ll rig) {
    if (rig + 1 == len[id]) return sum[id]; // whole
    if (!id) return pre[rig];
    auto it = rec[id].find(rig);
    if (it != rec[id].end()) return it->second;

    int ret = 0;
    auto [a, b] = info[id];
    if (a >= 0) { // ADD string
        if (rig < len[a]) ret = query(a, rig);
        else ret = add(sum[a], query((int)b, rig - len[a]));
    } else { // SUB string
        a = -a - 1, ret = query(a, b + rig);
        // this branch will be recorded perfectly
        if (b) ret = sub(ret, query(a, b - 1));
    }

    return rec[id][rig] = ret;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::string str;
    std::cin >> n >> str;
    len[0] = (int)str.size(), pre[0] = str[0];
    rep (i, 1, (int)len[0] - 1) pre[i] = add(pre[i - 1], str[i]);
    sum[0] = pre[len[0] - 1];

    rep (i, 1, n - 1) {
        std::cin >> str;
        if (str[0] == 'A') {
            int a, b;
            std::cin >> a >> b;
            info[i] = { a, b };
            len[i] = len[a] + len[b];
            sum[i] = add(sum[a], sum[b]);
        } else {
            int a; ll b, c;
            std::cin >> a >> b >> c;
            info[i] = { -a - 1, b }; // 666
            len[i] = c - b;
            sum[i] = sub(query(a, c - 1), b ? query(a, b - 1) : 0);
        }
    }

    std::cout << sum[n - 1] << '\n';
    return 0;
}
