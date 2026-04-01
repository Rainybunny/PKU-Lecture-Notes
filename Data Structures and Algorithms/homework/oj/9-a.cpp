/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

namespace Trie {

const int MAXN = 1e4, MAXND = 1.5e5;
int node = 1, ch[MAXND][26], ref[MAXND];
std::string dict[MAXN + 5];

void insert(const int id, const std::string& word) {
    int u = 1;
    for (char c : word) {
        int& v = ch[u][c - 'a'];
        if (!v) v = ++node;
        u = v;
    }
    dict[ref[u] = id] = word;
}

int query(const std::string& word) {
    int u = 1;
    for (char c : word) {
        if (!(u = ch[u][c - 'a'])) {
            return 0;
        }
    }
    return ref[u];
}

void collect(int u, const char* ptr, bool able, std::vector<int>& buc) {
    if (!*ptr && !able && ref[u]) return (void)buc.push_back(ref[u]);
    if (*ptr && ch[u][*ptr - 'a']) { // keep
        collect(ch[u][*ptr - 'a'], ptr + 1, able, buc);
    }
    if (able && *ptr) {
        collect(u, ptr + 1, false, buc); // delete
        rep (c, 'a', 'z') {
            if (c != *ptr && ch[u][c - 'a']) { // change
                collect(ch[u][c - 'a'], ptr + 1, false, buc);
            }
        }
    }
    if (able) {
        rep (c, 'a', 'z') {
            if (ch[u][c - 'a']) { // insert
                collect(ch[u][c - 'a'], ptr, false, buc);
            }
        }
    }
}

} // namespace Trie


int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    int cnt = 0;
    std::string word;
    while (std::cin >> word && word[0] != '#') Trie::insert(++cnt, word);

    while (std::cin >> word && word[0] != '#') {
        if (Trie::query(word)) {
            std::cout << word << " is correct\n";
            continue;
        }

        std::vector<int> buc;
        Trie::collect(1, word.c_str(), true, buc);
        std::sort(buc.begin(), buc.end());
        buc.resize(std::unique(buc.begin(), buc.end()) - buc.begin());
        std::cout << word << ':';
        for (int id : buc) std::cout << ' ' << Trie::dict[id];
        std::cout << '\n';
    }
    return 0;
}
