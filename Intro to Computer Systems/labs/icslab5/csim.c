// 20120712

/**
 * @file csim.c
 * @brief Cache simulator, mocking csim-ref's behavior
 */

#include "cachelab.h"
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <assert.h>
#include <malloc.h>

/** report to stderr */
#define ERR_MSG(fmt, ...) fprintf(stderr, fmt, __VA_ARGS__)

typedef unsigned long long u64;
typedef unsigned char bool;
const bool false = 0, true = 1;

const char* HELP_INFO =
    "Usage: ./csim [-hv] -s <num> -E <num> -b <num> -t <file>\n"
    "Options:\n"
    "  -h         Print this help message.\n"
    "  -v         Optional verbose flag.\n"
    "  -s <num>   Number of set index bits.\n"
    "  -E <num>   Number of lines per set.\n"
    "  -b <num>   Number of block offset bits.\n"
    "  -t <file>  Trace file.\n"
    "\n"
    "Examples:\n"
    "  linux>  ./csim -s 4 -E 1 -b 4 -t traces/yi.trace\n"
    "  linux>  ./csim -v -s 8 -E 2 -b 4 -t traces/yi.trace";

/** global parameters, set by loadSimulator */
bool reqHelpInfo = false, reqVerboseInfo = false;
int cacheParam[3] = { -1, -1, -1 };
FILE *file = NULL;

/** Parsed information about a piece of memory access */
typedef struct {
    char type;
    u64 addr;
    int size;
} AccessInfo;

/** Simulation summary */
typedef struct {
    u64 hitCount, missCount, evictCount;
} Summary;

/**
 * @brief Read and parse the next memory access from file, omitting I
 * @return type='E' if EOF encountered, or normal access info
 */
AccessInfo nextAccess() {
    char buf[17];
    AccessInfo ai;
    while (fscanf(file, "%16s", buf) != EOF) {
        ai.type = buf[0];
        fscanf(file, "%llx,%d\n", &ai.addr, &ai.size);
        // ERR_MSG(" %c %llx,%d\n", ai.type, ai.addr, ai.size);
        if (buf[0] != 'I') return ai;
    }
    ai.type = 'E'; // eof mark
    return ai;
}

/**
 * @brief Report for currect access if reqVerboseInfo is ON
 */
void verboseReport(AccessInfo ai, bool hit, bool evt) {
    if (reqVerboseInfo) {
        printf("%c %llx,%d ", ai.type, ai.addr, ai.size);
        if (hit) puts("hit");
        else if (!evt) puts("miss");
        else puts("miss eviction");
    }
}

Summary simulate() {
    AccessInfo ai;
    // we just save (time -> u64, tag -> u64) for each cache line
    // since we don't need to store data actually
    // valid bit is not necessary since our timer starts from 1
    u64 *cache;
    int s = cacheParam[0], E = cacheParam[1], b = cacheParam[2];
    u64 mskS = (1ull << s) - 1;
    Summary summary = { 0, 0, 0 };
    u64 groupSize = E * 2;

    cache = malloc((E << s << 1) * sizeof(u64)); // E*(2^s) copies of (u64,u64) pairs
    assert(cache != NULL); // malloc failed; just assume it won't happen
    memset(cache, 0, (E << s << 1) * sizeof(u64)); // clear time and tag

    for (u64 timer = 1; ; ++timer) {
        ai = nextAccess();
        if (ai.type == 'E') return free(cache), summary; // free!
        summary.hitCount += ai.type == 'M'; // always hit when writing
    
        u64 addr = ai.addr;
        u64 gid = (addr >> b & mskS), lkey = addr >> b >> s;
        u64 *cacheLine = cache + gid * groupSize;

        bool hit = false;
        for (u64 i = 0; i < groupSize; i += 2) {
            if (cacheLine[i] && cacheLine[i + 1] == lkey) { // hit
                cacheLine[i] = timer, hit = true;
                break;
            }
        }
        if (hit) {
            ++summary.hitCount;
            verboseReport(ai, true, false);
            continue;
        }

        u64 earlyTime = cacheLine[0], earlyId = 0;
        for (u64 i = 2; i < groupSize; i += 2) {
            if (cacheLine[i] < earlyTime) { // find the earliest cached data
                earlyTime = cacheLine[earlyId = i];
            }
        }

        ++summary.missCount;
        cacheLine[earlyId] = timer, cacheLine[earlyId + 1] = lkey;
        if (!earlyTime) { // cold miss
            verboseReport(ai, false, false);
        } else {
            ++summary.evictCount;
            verboseReport(ai, false, true);
        }
    }
}

/**
 * @brief Set simulator's global parameters via command args
 * @return 0 if everything ok;
 *  1 if option unrecognized;
 *  2 if parameter illegal;
 *  3 if file not found;
 *  4 if parameter(s) unset.
 */
int loadSimulator(int argc, char** argv) {
    static const int OPT_N = 6;
    static const char* OPTIONS[6] = { "-h", "-v", "-s", "-E", "-b", "-t" };

    for (int i = 1; i < argc; ++i) {
        int id = 0;
        while (id < OPT_N && strcmp(OPTIONS[id], argv[i])) ++id;
        if (id == OPT_N) {
            ERR_MSG("%s: invalid option -- '%c'\n", argv[0], argv[i][0]);
            return 1;
        }

        if (id == 0) {
            reqHelpInfo = 1;
            continue;
        }

        if (id == 1) {
            reqVerboseInfo = 1;
            continue;
        }

        ++i;
        // now argv[i] should be a parameter (int or string)
        if (i == argc) {
            ERR_MSG("%s: Missing required command line argument\n", argv[0]);
            return 2;
        }

        if (id == 5) {
            file = fopen(argv[i], "r");
            if (file == NULL) {
                ERR_MSG("%s: No such file or directory\n", argv[0]);
                return 3;
            }
            continue;
        }

        // now argv[i] should be an int
        int val = 0;
        for (int j = 0; argv[i][j]; ++j) {
            char c = argv[i][j];
            if (!isdigit(c)) {
                // csim-ref think so
                ERR_MSG("%s: Missing required command line argument\n", argv[0]);
                return 2;
            }
            val = val * 10 + (c ^ '0');
        }
        cacheParam[id - 2] = val;
    }

    // params unset
    bool allSet = true;
    if (file == NULL) allSet = false;
    for (int i = 0; i < 3; ++i) {
        if (!~cacheParam[i]) {
            allSet = false;
        }
    }
    if (!allSet) {
        ERR_MSG("%s: Missing required command line argument\n", argv[0]); // csim-ref think so
        return 4;
    }

    return 0;
}

int main(int argc, char** argv) {
    int stat = loadSimulator(argc, argv);
    if (stat) reqHelpInfo = 1;
    if (reqHelpInfo) return puts(HELP_INFO), 0;

    Summary summary = simulate();
    printSummary(summary.hitCount, summary.missCount, summary.evictCount);
    fclose(file);
    return 0;
}
