#include <stdio.h>
#include <assert.h>

/* P88 2.59 */
unsigned mix_byte(unsigned x, unsigned y) {
    return (x & 0xffu) | (y & ~0xffu);
}

/* P88 2.60 */
unsigned replace_byte(unsigned x, int i, unsigned char b) {
    unsigned mask = 0xffu << (i <<= 3);
    return (x & ~mask) | ((unsigned)b << i);
}

/* P91 2.71 */
typedef unsigned packed_t;

/*
    原有错误: 需要提取的 byte 是有符号的, 以 8 位补码的形式存储.
    然而代码中获取 byte = (word >> (bytenum << 3)) & 0xFF 后直接转为 int (32 位补码),
    不能正确地处理 byte 为负数 (最高 bit 为 1) 的情况.
 */
int xbyte(packed_t word, int bytenum) {
    bytenum = (3 ^ bytenum) << 3; // # {bit on right side}
    word <<= bytenum; // align the target byte to the hightest byte (with sign bit)
    return (int)word >> 24; // align to the lowest byte (arithmetically)
}

int main() {
    printf("%x\n", mix_byte(0x8abcdefu, 0x76543210u));

    printf("%x\n", replace_byte(0x12345678, 2, 0xab));
    printf("%x\n", replace_byte(0x12345678, 0, 0xab));

    printf("%d\n", xbyte(0x80ffc03f, 0));
    printf("%d\n", xbyte(0x80ffc03f, 1));
    printf("%d\n", xbyte(0x80ffc03f, 2));
    printf("%d\n", xbyte(0x80ffc03f, 3));

    // for (int x = __INT_MAX__ - 40; x < __INT_MAX__; ++x) {
    //     for (int y = x; y < __INT_MAX__; ++y) {
    //         for (int z = y; z < __INT_MAX__; ++z) {
    //             double dx = (double)x;
    //             double dy = (double)y;
    //             double dz = (double)z;
    //             if ((dx * dy) * dz != dx * (dy * dz)) {
    //                 printf("x=%d, y=%d, z=%d\n", x, y, z);
    //                 // return 0;
    //             }
    //         }
    //     }
    // }
    int x = (1ll << 31) - 12;
    int y = (1ll << 31) - 11;
    int z = (1ll << 31) - 11;
    double dx = (double)x;
    double dy = (double)y;
    double dz = (double)z;
    printf("%d\n", (dx * dy) * dz == dx * (dy * dz));
    return 0;
}
