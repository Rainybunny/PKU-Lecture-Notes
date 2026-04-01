/*+Rainybunny+*/

#include <bits/stdc++.h>

#define rep(i, l, r) for (int i = l, rep##i = r; i <= rep##i; ++i)
#define per(i, r, l) for (int i = r, per##i = l; i >= per##i; --i)

const int MAXN = 6e4, MAXD = 300, MAXM = MAXD * 15;
int n, d, m, row[MAXN], sgn[MAXN];
std::mt19937 rng(std::random_device{}());

struct Matrix {
    int n, m;
    std::vector<std::vector<double>> mat;

    Matrix(int n_, int m_): n(n_), m(m_) {
        mat.resize(n);
        rep (i, 0, n - 1) mat[i].resize(m);
    }

    std::vector<double>& operator [] (const int k) { return mat[k]; }
    const std::vector<double>& operator [] (const int k) const { return mat[k]; }

    Matrix operator * (const Matrix& u) const {
        assert(m == u.n);
        Matrix ret(n, u.m);
        rep (i, 0, n - 1) {
            rep (k, 0, m - 1) {
                const double t = mat[i][k];
                rep (j, 0, u.m - 1) ret[i][j] += t * u[k][j];
            }
        }
        return ret;
    }

    Matrix transpose() const {
        Matrix ret(m, n);
        rep (i, 0, n - 1) rep (j, 0, m - 1) ret[j][i] = mat[i][j];
        return ret;
    }

    Matrix perturb() const {
        std::uniform_real_distribution<> dltD(-1e-9, 1e-9);
        Matrix ret(n, m);
        rep (i, 0, n - 1) rep (j, 0, m - 1) ret[i][j] = mat[i][j] + dltD(rng);
        return ret;
    }

    // assuming *this is invertible
    Matrix invert() const {
        assert(n == m);
        Matrix tmp(*this), ret(n, n);
        rep (i, 0, n - 1) ret[i][i] = 1;
        rep (i, 0, n - 1) {
            int p = i;
            rep (k, i + 1, n - 1) {
                if (fabs(tmp[p][i]) < fabs(tmp[k][i])) {
                    p = k;
                }
            }
            if (i != p) std::swap(tmp[i], tmp[p]), std::swap(ret[i], ret[p]);
            double inv = 1 / tmp[i][i];
            rep (j, i + 1, n - 1) {
                double coe = -inv * tmp[j][i];
                rep (k, i, n - 1) tmp[j][k] += coe * tmp[i][k];
                rep (k, 0, n - 1) ret[j][k] += coe * ret[i][k];
            }
        }
        per (i, n - 1, 0) {
            double inv = 1 / tmp[i][i];
            rep (j, 0, i - 1) {
                double coe = -inv * tmp[j][i];
                rep (k, 0, n - 1) ret[j][k] += coe * ret[i][k];
            }
            rep (j, 0, n - 1) ret[i][j] *= inv;
        }
        return ret;
    }
};

int main() {
    std::ios::sync_with_stdio(false), std::cin.tie(0), std::cout.tie(0);

    std::cin >> n >> d, m = MAXM;

    std::uniform_int_distribution<> rowD(0, m - 1);
    std::bernoulli_distribution sgnD(0.5);
    rep (i, 0, n - 1) row[i] = rowD(rng), sgn[i] = sgnD(rng) ? -1 : 1;
    
    Matrix hatX(m, d), hatY(m, 1);
    rep (i, 0, n - 1) {
        int l, y;
        std::cin >> l;
        while (l--) {
            int p, v;
            std::cin >> p >> v, --p; // X(i,p)=v => S(j,i) * X(i,p) -> (S*X)(j,p)
            hatX[row[i]][p] += sgn[i] * v;
        }
        std::cin >> y;
        hatY[row[i]][0] += sgn[i] * y;
    }

    auto&& w = (hatX.transpose() * hatX).perturb().invert() * (hatX.transpose() * hatY);
    std::cout << std::fixed << std::setprecision(6);
    rep (i, 0, d - 1) std::cout << w[i][0] << "\n "[i < repi];
    return 0;
}
