#include <linux/types.h>
#include <stdio.h>
#include <malloc.h>

static inline __u64 rdtscp() {
    __u32 lo, hi;
    __asm__ __volatile__ (
        "rdtscp":"=a"(lo),"=d"(hi)
    );
    return (__u64)hi << 32 | lo;
}

void combine4(data_t *d, int N, data_t *dest) {
    long i;
    data_t t = IDENT;
    for (i = 0; i < N; i++)
        t = t OP d[i];
    *dest = t;
}

void combine_2x1(data_t *d, int N, data_t *dest) {
    long limit = N - 1;
    data_t x = IDENT;
    long i;
    for (i = 0; i < limit; i+=2) {
        x = (x OP d[i]) OP d[i+1];
    }
    for (; i < N; i++) {
        x = x OP d[i];
    }
    *dest = x;
}

void combine_2x1a(data_t *d, int N, data_t *dest) {
    long limit = N - 1;
    data_t x = IDENT;
    long i;
    for (i = 0; i < limit; i+=2) {
        x = x OP (d[i] OP d[i+1]);
    }
    for (; i < N; i++) {
        x = x OP d[i];
    }
    *dest = x;
}

void combine_2x2(data_t *d, int N, data_t *dest) {
    long limit = N - 1;
    data_t x0 = IDENT;
    data_t x1 = IDENT;
    long i;
    for (i = 0; i < limit; i+=2) {
        x0 = x0 OP d[i];
        x1 = x1 OP d[i+1];
    }
    for (; i < N; i++) {
       x0 = x0 OP d[i];
    }
    *dest = x0 OP x1;
}

double cpe_test(void (*func)(data_t *, int, data_t *)) {
    static const int HEAD = 10, SIZE = 1 << 20;
    static data_t *d = NULL, dest;
    if (d == NULL) {
        d = malloc(SIZE * sizeof(data_t));
        for (int i = 0; i < SIZE; i++)
            d[i] = i + 1;
    }

    __u64 start, end;
    start = rdtscp();
    func(d, HEAD, &dest);
    end = rdtscp();
    __u64 head = end - start;
    start = rdtscp();
    func(d, SIZE, &dest);
    end = rdtscp();
    __u64 total = end - start;
    return (double)(total - head) / (SIZE - HEAD);
}

int main() {
    printf("CPE combine4:     %f\n", cpe_test(combine4));
    printf("CPE combine_2x1:  %f\n", cpe_test(combine_2x1));
    printf("CPE combine_2x1a: %f\n", cpe_test(combine_2x1a));
    printf("CPE combine_2x2:  %f\n", cpe_test(combine_2x2));
    return 0;
}
