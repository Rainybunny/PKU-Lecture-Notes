/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

int operId(char c) {
    const char* TABLE = "()+-*/";
    rep (i, 0, 6) if (c == TABLE[i]) return i;
    return -1;
}

int evaluate(std::string expr) {
    std::stack<int> num, opr;
    expr = '(' + expr + ')'; // activate outmost evaluation

    auto perform = [&]() {
        int o = opr.top(); opr.pop();
        int y = num.top(); num.pop();
        int x = num.top(); num.pop();
        assert(2 <= o && o <= 5);
        if (o == 2) num.push(x + y);
        else if (o == 3) num.push(x - y);
        else if (o == 4) num.push(x * y);
        else num.push(x / y);
    };

    rep (i, 0, (int)expr.size() - 1) {
        if (isdigit(expr[i])) {
            int x = expr[i] ^ '0';
            while (i + 1 <= repi && isdigit(expr[i + 1])) {
                x = x * 10 + (expr[++i] ^ '0');
            }
            num.push(x);
        } else if (int f = operId(expr[i]); !f) {
            opr.push(f);
        } else if (f == 1) {
            while (opr.size() && opr.top()) perform();
            opr.pop();
        } else {
            while (opr.size() && opr.top() / 2 >= f / 2) perform();
            opr.push(f);
        }
    }
    return num.top();
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    int T;
    std::cin >> T;
    while (T--) {
        std::string expr;
        std::cin >> expr;
        std::cout << evaluate(expr) << '\n';
    }
    return 0;
}
