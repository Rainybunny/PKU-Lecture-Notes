/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int N = 60;
int node, fa[N], ch[N][2];
char val[N];

int grow(const char c, const int p) {
    int u = ++node;
    fa[u] = p, val[u] = c, ch[p][!!ch[p][0]] = u, ch[u][0] = ch[u][1] = 0;
    return u;
}

void work() {
    std::string buf;
    int u = node = 0, dep = -1;
    while (std::cin >> buf && buf[0] != '0') {
        int d = (int)buf.size() - 1;
        while (d <= dep) u = fa[u], --dep;
        u = grow(buf.back(), u), ++dep;
    }

    std::function<void(int)> pretrav = [&](const int x) {
        if (val[x] != '*') std::cout << val[x];
        if (ch[x][0]) pretrav(ch[x][0]);
        if (ch[x][1]) pretrav(ch[x][1]);
    };

    std::function<void(int)> midtrav = [&](const int x) {
        if (ch[x][0]) midtrav(ch[x][0]);
        if (val[x] != '*') std::cout << val[x];
        if (ch[x][1]) midtrav(ch[x][1]);
    };

    std::function<void(int)> afttrav = [&](const int x) {
        if (ch[x][0]) afttrav(ch[x][0]);
        if (ch[x][1]) afttrav(ch[x][1]);
        if (val[x] != '*') std::cout << val[x];
    };

    pretrav(1), std::cout << '\n';
    afttrav(1), std::cout << '\n';
    midtrav(1), std::cout << '\n';
}

int main() {
    int T;
    std::cin >> T;
    while (T--) {
        work();
        if (T) std::cout << '\n';
    }
    return 0;
}
