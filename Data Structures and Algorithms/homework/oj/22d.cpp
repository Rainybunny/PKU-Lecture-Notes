/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int L = 6, N = 16;
int llen, node, val[N], trs[N][10], f[2][L][N][2];
char lim[L + 1];

void build(int x) {
    char buf[L + 1];
    sprintf(buf, "%d", x);

    std::map<std::string, int> subs;
    subs[""] = node = val[0] = 0;
    int len = (int)strlen(buf);
    rep (i, 0, len - 1) {
        rep (j, i, len - 1) {
            std::string str(buf + i, buf + j + 1);
            if (!subs.count(str)) {
                subs[str] = ++node, val[node] = j - i + 1;
            }
        }
    }


    for (auto [str, id] : subs) {
        for (char c = '0'; c <= '9'; ++c) {
            auto nex = str + c;
            rep (i, 0, (int)nex.size()) {
                if (auto it = subs.find(nex.substr(i)); it != subs.end()) {
                    trs[id][c ^ '0'] = it->second;
                    break;
                }
            }
        }
    }
}

int wander() {
    memset(f, 0, sizeof f);

    rep (i, 0, llen - 1) {
        auto fcur = f[i & 1], fnex = f[~i & 1];

        // lay new number (here to filter prefix zero)
        if (!i) {
            ++fcur[0][trs[0][lim[i] - '0']][1];
            rep (c, 1, lim[i] - '0' - 1) ++fcur[0][trs[0][c]][0];
        } else {
            rep (c, 1, 9) ++fcur[0][trs[0][c]][0];
        }
        if (i == repi) break;

        // i->i+1
        rep (l, 0, L - 1) {
            rep (u, 0, node) {
                auto& [f0, f1] = fcur[l][u];
                if (l < val[u]) fcur[val[u]][u][0] += f0, fcur[val[u]][u][1] += f1;
                else {
                    rep (c, 0, 9) fnex[l][trs[u][c]][0] += f0;
                    rep (c, 0, lim[i + 1] - '0' - 1) fnex[l][trs[u][c]][0] += f1;
                    fnex[l][trs[u][lim[i + 1] - '0']][1] += f1;
                }
                f0 = f1 = 0;
            }
        }
    }

    auto fans = f[~llen & 1];
    int res = 0;
    rep (l, 0, L - 1) {
        rep (u, 0, node) {
            res += std::max(l, val[u]) * (fans[l][u][0] + fans[l][u][1]);
        }
    }
    return res;
}

int main() {
    scanf("%s", lim), llen = (int)strlen(lim);
    int n = atoi(lim);

    long long ans = 0;
    rep (x, 1, n) {
        build(x);
        ans += wander();
    }
    printf("%lld\n", ans);
    return 0;
}
