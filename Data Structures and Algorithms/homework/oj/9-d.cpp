/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 512;
int n, pic[MAXN][MAXN];

struct Node { int r, c, len; };

int countRect(int ur, int uc, int dr, int dc) {
    int ret = pic[dr][dc];
    if (~--ur) ret -= pic[ur][dc];
    if (~--uc) ret -= pic[dr][uc];
    if (~ur && ~uc) ret += pic[ur][uc];
    return ret;
}

std::string encode() {
    std::string res;
    std::queue<Node> que;
    que.push({ 0, 0, n });
    while (que.size()) {
        auto [ur, uc, len] = que.front(); que.pop();
        int dr = ur + len - 1, dc = uc + len - 1;
        int inc = countRect(ur, uc, dr, dc);
        if (!inc || inc == len * len) {
            res += '0', res += char('0' ^ !!inc);
        } else {
            res += '1';
            len >>= 1;
            que.push({ ur, uc, len });
            que.push({ ur, uc + len, len });
            que.push({ ur + len, uc, len });
            que.push({ ur + len, uc + len, len });
        }
    }
    return res;
}

std::string bin2hex(const std::string& bin) {
    std::string res;
    for (int i = (int)bin.size() - 1; i >= 0; i -= 4) {
        int val = 0;
        rep (j, std::max(0, i - 3), i) {
            val = val << 1 | (bin[j] ^ '0');
        }
        res.push_back(char(val <= 9 ? '0' + val : 'A' + val - 10));
    }
    std::reverse(res.begin(), res.end());
    return res;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    int T;
    std::cin >> T;
    while (T--) {
        std::cin >> n;
        rep (i, 0, n - 1) {
            rep (j, 0, n - 1) {
                std::cin >> pic[i][j];
                if (i) pic[i][j] += pic[i - 1][j];
                if (j) pic[i][j] += pic[i][j - 1];
                if (i && j) pic[i][j] -= pic[i - 1][j - 1];
            }
        }
        std::cout << bin2hex(encode()) << '\n';
    }
    return 0;
}
