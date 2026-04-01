#include <stdio.h>

void bubble(long *data, long count) {
    long *p, *last;
    for (last = data + count - 1; last > data; last--) {
        for (p = data; p < last; p++) {
            if (*(p + 1) < *p) {
                long t = *(p + 1);
                *(p + 1) = *p;
                *p = t;
            }
        }
    }
}

int main() {
    long arr[] = { 3, 1, 4, 1, 5, 9 };
    long count = 6;
    long ok = 1;
    bubble(arr, count);
    
    // for (long i = 1; i < count; i++) {
    //     if (arr[i - 1] > arr[i]) {
    //         ok = 0;
    //     }
    // }
    // putchar(ok + '0');
    return 0;
}