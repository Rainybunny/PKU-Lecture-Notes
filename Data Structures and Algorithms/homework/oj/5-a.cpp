/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

typedef std::pair<int, int> pii;
std::map<int, pii> tree;
std::vector<int> pre, mid, aft;
std::map<int, int> ocr;

std::vector<int> readVector() {
    std::string buf;
    std::vector<int> res;
    std::getline(std::cin, buf);
    std::stringstream ss(buf);
    for (int val; ss >> val; res.push_back(val));
    return res;
}

int build(const int l, const int r) {
    if (l > r) return -1;
    int p = l, op = ocr[mid[l]];
    rep (i, l + 1, r) if (ocr[mid[i]] > op) op = ocr[mid[p = i]];
    tree[mid[p]] = { build(l, p - 1), build(p + 1, r) };
    return mid[p];
}

void travel(const int u) {
    pre.push_back(u);
    auto ch = tree[u];
    if (~ch.first) travel(ch.first);
    if (~ch.second) travel(ch.second);
}

int main() {
    mid = readVector(), aft = readVector();
    rep (i, 0, (int)aft.size() - 1) ocr[aft[i]] = i;
    travel(build(0, (int)mid.size() - 1));
    for (int u : pre) std::cout << u << ' ';
    std::cout << '\n';
    return 0;
}
