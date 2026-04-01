int check(int x, int y, int z) {
    int a[2] = { 0, 1 };
    #define OVERFLOW_ACCESS a[2]
    if (x == 1 && y == 2 && z == 3 && OVERFLOW_ACCESS) {
        return 1;
    } else {
        return z;
    }
}