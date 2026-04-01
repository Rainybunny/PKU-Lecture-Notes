#include <cstdio>

int iterate_4per(int f(int), int n, int x) {
    switch (n & 3) {
        case 3: x = f(x);
        case 2: x = f(x);
        case 1: x = f(x);
        default: ;
    }
    n >>= 2;
    for (int i = 1; i <= n; ++i) {
        x = f(f(f(f(x))));
    }
    return x;
}

int iterate_8per(int f(int), int n, int x) {
    switch (n & 7) {
        case 7: x = f(x);
        case 6: x = f(x);
        case 5: x = f(x);
        case 4: x = f(x);
        case 3: x = f(x);
        case 2: x = f(x);
        case 1: x = f(x);
        default: ;
    }
    n >>= 3;
    for (int i = 1; i <= n; ++i) {
        x = f(f(f(f(x))));
        x = f(f(f(f(x))));
    }
    return x;
}

int main() {
    auto f = [](int x) -> int { return x + 1; };
    printf("%d\n", iterate_8per(f, 10, 0));
    return 0;
}