/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

std::string reduce(const std::string& expr) {
    int top = 0, dep = (int)expr.size() + 1;
    for (char c : expr) {
        if (c == '(') ++top;
        else if (c == ')') --top;
        else dep = std::min(dep, top);
    }
    return expr.substr(dep, expr.size() - 2 * dep);
}

struct Expression {
    char op;
    int hgt;
    Expression *lef, *rig;

    ~Expression() { delete lef; delete rig; }

    Expression(const std::string& texpr) {
        int top = 0, apos = -1, bpos = -1;
        auto expr = reduce(texpr);
        rep (i, 0, (int)expr.size() - 1) {
            if (expr[i] == '(') ++top;
            else if (expr[i] == ')') --top;
            else if (!top && !isalpha(expr[i])) {
                (expr[i] == '+' || expr[i] == '-' ? apos : bpos) = i;
            }
        }
        if (~apos || ~bpos) {
            int p = ~apos ? apos : bpos;
            op = expr[p];
            lef = new Expression(expr.substr(0, p));
            rig = new Expression(expr.substr(p + 1, expr.size() - p - 1));
            hgt = std::max(lef->hgt, rig->hgt) + 1;
        } else {
            assert(expr.size() == 1);
            op = expr[0], hgt = 1;
            lef = rig = nullptr;
        }
    }

    int evaluate(std::map<char, int>& ev) const {
        if (isalpha(op)) return ev[op];
        int vl = lef->evaluate(ev), vr = rig->evaluate(ev);
        if (op == '+') return vl + vr;
        if (op == '-') return vl - vr;
        if (op == '*') return vl * vr;
        return vl / vr;
    }

    void travel(std::string& res) const {
        if (lef) lef->travel(res);
        if (rig) rig->travel(res);
        res.push_back(op);
    }

    void show(std::vector<std::string>& res, const int h, const int dr, const int dc) const {
        auto set = [&](int r, int c, const char v) {
            r += dr, c += dc;
            if ((int)res.size() <= r) res.resize(r + 1);
            if ((int)res[r].size() <= c) res[r].resize(c + 1, ' ');
            res[r][c] = v;
        };
        int mid = (1 << h >> 1) - 1;
        set(0, mid, op);
        if (lef && rig) {
            set(1, mid - 1, '/');
            set(1, mid + 1, '\\');
            lef->show(res, h - 1, 2 + dr, dc);
            rig->show(res, h - 1, 2 + dr, mid + 1 + dc);
        }
    }
};

int main() {
    std::string buf;
    std::cin >> buf;
    Expression expr(buf);

    std::string rev;
    expr.travel(rev);
    std::cout << rev << '\n';

    std::vector<std::string> layout;
    expr.show(layout, expr.hgt, 0, 0);
    for (const auto &str : layout) std::cout << str << '\n';

    int var;
    std::map<char, int> ev;
    std::cin >> var;
    while (var--) {
        char c; int v;
        std::cin >> c >> v;
        ev[c] = v;
    }
    std::cout << expr.evaluate(ev) << '\n';
    return 0;
}
