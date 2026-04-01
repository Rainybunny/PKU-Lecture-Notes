/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 50;
int n;
std::string str[MAXN + 5];

typedef std::vector<std::set<char>> Regular;

Regular compile(const std::string& s) {
    Regular res;
    rep (i, 0, (int)s.size() - 1) {
        std::set<char> buc;
        if (s[i] == '[') {
            while (s[++i] != ']') buc.insert(tolower(s[i]));
        } else {
            buc.insert(tolower(s[i]));
        }
        res.emplace_back(buc);
    }
    return res;
}

bool match(const Regular& reg, const std::string s) {
    if (reg.size() != s.size()) return false;
    rep (i, 0, (int)reg.size() - 1) {
        if (!reg[i].count(tolower(s[i]))) {
            return false;
        }
    }
    return true;
}

int main() {
    std::cin >> n;
    rep (i, 1, n) std::cin >> str[i];

    std::string temp;
    std::cin >> temp;
    auto reg = compile(temp);
    rep (i, 1, n) {
        if (match(reg, str[i])) {
            std::cout << i << ' ' << str[i] << '\n';
        }
    }
    return 0;
}
