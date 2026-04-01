// 20120712

/*
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include <stdio.h>
#include "cachelab.h"
#include "contracts.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

void transpose_simple(int M, int N, int A[N][M], int B[M][N]);

// Declarations of specialized transpose functions
void transpose_32_32(int M, int N, int A[N][M], int B[M][N]);
void transpose_64_64(int M, int N, int A[N][M], int B[M][N]);
void transpose_60_68(int M, int N, int A[N][M], int B[M][N]);

/*
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. The REQUIRES and ENSURES from 15-122 are included
 *     for your convenience. They can be removed if you like.
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N]) {
    if (M == 32 && N == 32) {
        transpose_32_32(M, N, A, B);
    } else if (M == 64 && N == 64) {
        transpose_64_64(M, N, A, B);
    } else if (M == 60 && N == 68) {
        transpose_60_68(M, N, A, B);
    } else {
        transpose_simple(M, N, A, B);
    }
}

/*
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started.
 */

 /*
  * trans - A simple baseline transpose function, not optimized for the cache.
  */
char transpose_simple_desc[] = "Simple row-wise scan transpose";
void transpose_simple(int M, int N, int A[N][M], int B[M][N]) {
    int i, j, tmp;

    REQUIRES(M > 0);
    REQUIRES(N > 0);

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}

char transpose_32_32_desc[] = "Specialized transpose for 32x32 matrix";
void transpose_32_32(int M, int N, int A[N][M], int B[M][N]) {
    REQUIRES(M == 32);
    REQUIRES(N == 32);

    // s = 5, E = 1, b = 5 => 32 bytes == 8 ints, 32 groups
    // miss <= 300

    int i, j, k, a0, a1, a2, a3, a4, a5, a6, a7;

    // 8*8 blocking with packed loads/stores
    for (i = 0; i < N; i += 8) {
        for (j = 0; j < M; j += 8) {
            for (k = i; k < i + 8; k++) {
                a0 = A[k][j];
                a1 = A[k][j + 1];
                a2 = A[k][j + 2];
                a3 = A[k][j + 3];
                a4 = A[k][j + 4];
                a5 = A[k][j + 5];
                a6 = A[k][j + 6];
                a7 = A[k][j + 7];

                B[j][k] = a0;
                B[j + 1][k] = a1;
                B[j + 2][k] = a2;
                B[j + 3][k] = a3;
                B[j + 4][k] = a4;
                B[j + 5][k] = a5;
                B[j + 6][k] = a6;
                B[j + 7][k] = a7;
            }
        }
    }


    ENSURES(is_transpose(M, N, A, B));
}

char transpose_64_64_desc[] = "Specialized transpose for 64x64 matrix";
void transpose_64_64(int M, int N, int A[N][M], int B[M][N]) {
    REQUIRES(M == 64);
    REQUIRES(N == 64);

    // s = 5, E = 1, b = 5 => 32 bytes == 8 ints, 32 groups
    // miss < 1300
    // (i,j) -> (i+1,j), addr bit 0..7 (64*4) won't change
    // => 4=2^2 rows at a time

    int i, j, k, a0, a1, a2, a3, a4, a5, a6, a7;

    // 8*8 blocking, 4*4 sub-blocking transfer
    for (i = 0; i < 64; i += 8) {
        for (j = 0; j < 64; j += 8) {
            // A[i:i+7, j:j+7] =: (A_11 & A_12 \\ A_21 & A_22)
            // B[j:j+7, i:i+7] =: (B_11 & B_12 \\ B_21 & B_22)

            // B_11 <- A_11^T, B_12 <- A_12^T
            // B_12 as a temporary buffer to utilize cached A_12
            for (k = 0; k < 4; k++) {
                a0 = A[i + k][j + 0];
                a1 = A[i + k][j + 1];
                a2 = A[i + k][j + 2];
                a3 = A[i + k][j + 3];
                a4 = A[i + k][j + 4];
                a5 = A[i + k][j + 5];
                a6 = A[i + k][j + 6];
                a7 = A[i + k][j + 7];

                B[j + 0][i + k] = a0;
                B[j + 1][i + k] = a1;
                B[j + 2][i + k] = a2;
                B[j + 3][i + k] = a3;
                B[j + 0][i + k + 4] = a4;
                B[j + 1][i + k + 4] = a5;
                B[j + 2][i + k + 4] = a6;
                B[j + 3][i + k + 4] = a7;
            }

            // B_21 <- B_12, B_12 <- A_21^T
            for (k = 0; k < 4; k++) {
                a0 = B[j + k][i + 4];
                a1 = B[j + k][i + 5];
                a2 = B[j + k][i + 6];
                a3 = B[j + k][i + 7];
                a4 = A[i + 4][j + k];
                a5 = A[i + 5][j + k];
                a6 = A[i + 6][j + k];
                a7 = A[i + 7][j + k];

                B[j + k][i + 4] = a4;
                B[j + k][i + 5] = a5;
                B[j + k][i + 6] = a6;
                B[j + k][i + 7] = a7;
                B[j + k + 4][i + 0] = a0;
                B[j + k + 4][i + 1] = a1;
                B[j + k + 4][i + 2] = a2;
                B[j + k + 4][i + 3] = a3;
            }

            // B_22 <- A_22^T
            for (k = 4; k < 8; k++) {
                a0 = A[i + k][j + 4];
                a1 = A[i + k][j + 5];
                a2 = A[i + k][j + 6];
                a3 = A[i + k][j + 7];
                B[j + 4][i + k] = a0;
                B[j + 5][i + k] = a1;
                B[j + 6][i + k] = a2;
                B[j + 7][i + k] = a3;
            }
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}

char transpose_60_68_desc[] = "Specialized transpose for 60x68 matrix";
void transpose_60_68(int M, int N, int A[N][M], int B[M][N]) {
    REQUIRES(M == 60);
    REQUIRES(N == 68);

    // s = 5, E = 1, b = 5 => 32 bytes == 8 ints, 32 groups
    // miss < 1600
    // 60 = 0b111100, 60 * 4 = 111 | 10000
    // A(i,j) -> A(i+1,j), gid -> gid + 0b0111
    // B(i,j) -> B(i+1,j), gid -> gid + 0b1001
    // no annoying conflict with group id, just mix trans_32_32 and 4*4 blocking

    int i, j, k, a0, a1, a2, a3, a4, a5, a6, a7;

    for (i = 0; i < 64; i += 8) {
        for (j = 0; j < 56; j += 8) {
            for (k = i; k < i + 8; k++) {
                a0 = A[k][j];
                a1 = A[k][j + 1];
                a2 = A[k][j + 2];
                a3 = A[k][j + 3];
                a4 = A[k][j + 4];
                a5 = A[k][j + 5];
                a6 = A[k][j + 6];
                a7 = A[k][j + 7];

                B[j][k] = a0;
                B[j + 1][k] = a1;
                B[j + 2][k] = a2;
                B[j + 3][k] = a3;
                B[j + 4][k] = a4;
                B[j + 5][k] = a5;
                B[j + 6][k] = a6;
                B[j + 7][k] = a7;
            }
        }
    }

    for (j = 0; j < M; j += 4) {
        for (k = 64; k < 68; k++) {
            a0 = A[k][j];
            a1 = A[k][j + 1];
            a2 = A[k][j + 2];
            a3 = A[k][j + 3];
            B[j][k] = a0;
            B[j + 1][k] = a1;
            B[j + 2][k] = a2;
            B[j + 3][k] = a3;
        }
    }

    for (i = 0; i < N - 4; i += 4) {
        for (k = i; k < i + 4; k++) {
            a0 = A[k][56];
            a1 = A[k][56 + 1];
            a2 = A[k][56 + 2];
            a3 = A[k][56 + 3];
            B[56][k] = a0;
            B[56 + 1][k] = a1;
            B[56 + 2][k] = a2;
            B[56 + 3][k] = a3;
        }
    }

    ENSURES(is_transpose(M, N, A, B));
}



/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc);

    /* Register any additional transpose functions */
}

/*
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

