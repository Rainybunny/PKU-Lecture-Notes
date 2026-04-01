/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 3e3;
int n;
unsigned int seed;
std::mt19937 rng(std::chrono::steady_clock().now().time_since_epoch().count());
auto p01 = std::bind(std::bernoulli_distribution(0.5), rng);

typedef std::vector<int> Vector;

struct Matrix {
    int mat[MAXN + 5][MAXN + 5];
    inline int* operator [] (const int k) { return mat[k]; }
    inline Vector operator () (const Vector& v) {
        std::vector<int> r(n);
        rep (i, 0, n - 1) {
            rep (j, 0, n - 1) {
                r[i] += mat[i][j] * v[j]; // maybe overflow here for C(v)
            }
        }
        return r;
    }
} A, B, C;

int randint(const unsigned int &seed) {
    static unsigned int x = seed;
    x = (x * 23333LL + 23327) % 1000000007;
    return x % 20 - 10;
}

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> seed;
    rep (i, 0, n - 1) rep (j, 0, n - 1) std::cin >> C[i][j];

    rep (i, 0, n - 1) {
        rep (j, 0, n - 1) {
            A[i][j] = randint(seed);
            B[i][j] = randint(seed);
        }
    }

    std::vector<int> v(n);
    for (int T = 15; T--;) {
        for (int& x: v) x = p01();
        if (A(B(v)) != C(v)) return std::cout << "NO\n", 0;
    }
    std::cout << "YES\n";
    return 0;
}
