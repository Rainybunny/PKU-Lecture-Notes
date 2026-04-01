#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
    const long PAGE_SIZE = sysconf(_SC_PAGESIZE);
    if (PAGE_SIZE == -1) {
        perror("Failed to get page size");
        return 1;
    }

    FILE *fp = fopen("/proc/self/maps", "r");
    if (fp == NULL) {
        perror("Failed to open /proc/self/maps");
        return 1;
    }
    
    char line[1024];
    while (fgets(line, sizeof(line), fp)) {
        char perm[5];
        unsigned long start, end;
        if (sscanf(line, "%lx-%lx %4s", &start, &end, perm) == 3) {
            if (start >= 0x800000000000) continue; // x86-64 user space limit
            for (unsigned long addr = start; addr < end; addr += PAGE_SIZE) {
                printf("0x%lx %s\n", addr, perm);
            }
        }
    }
    fclose(fp);
    return 0;
}
