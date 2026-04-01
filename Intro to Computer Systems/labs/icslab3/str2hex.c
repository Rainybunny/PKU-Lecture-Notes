#include <stdio.h>

int main() {
    char buf[128];
    scanf("%s", buf);
    for (int i = 0; buf[i]; i++) {
        printf("%02x ", (unsigned char)buf[i]);
    }
    printf("00\n");
    return 0;
}