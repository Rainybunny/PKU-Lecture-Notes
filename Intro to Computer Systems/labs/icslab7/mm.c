/*
 * mm.c
 *
 * Rainybunny 20120712
 * 
 * Dynamic memory allocator implementation.
 * The design uses segregated free lists with first-fit strategy.
 * Each free block contains two 4-byte offsets
 * to the previous and next free blocks.
 * | UNKNOWN -  FOOTER | -> high   -|- payload(header)==payload(footer)
 * | ................. |           -|  =: byte-offset(HEADER, FOOTER)
 * | nxt_off - prv_off |           -| 
 * | HEADER  - UNKNOWN | -> low
 *
 * Each allocated block contains only the header.
 * | UNKNOWN - ....... | -> high
 * | ................. |
 * | HEADER  - UNKNOWN | -> low
 * 
 * The header/footer structure (4 bytes):
 * | size (high 29b) | UNUSED (1b) | S_PREV (1b) | S_THIS (1b) |
 * S_PREV: whether the previous block is allocated (1 if allocated)
 * S_THIS: whether this block is allocated (1 if allocated)
 * payload(header/footer) == 8 * size + 4 (bytes), where size>=1
 */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <limits.h>

#include "mm.h"
#include "memlib.h"

/* If you want debugging output, use the following macro.  When you hand
 * in, remove the #define DEBUG line. */

// #define DEBUG

#ifdef DEBUG
// # define VERBOSE
# define MESSAGE(...) fprintf(stderr, __VA_ARGS__)
#else
# define MESSAGE(...) ((void)0)
#endif

/**
 * Verbose message macro; VERBOSE might be defined if DEBUG is on
 */
#ifdef VERBOSE
# define V_MESSAGE(...) MESSAGE(__VA_ARGS__)
#else
# define V_MESSAGE(...) ((void)0)
#endif

/* do not change the following! */
#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif /* def DRIVER */

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(p) (((size_t)(p) + (ALIGNMENT-1)) & ~0x7)

void mm_checkheap(int lineno);

#ifdef DEBUG
/**
 * REQUIRE: check a statement and exit if false
 */
#   define REQUIRE(statement, msg, ...) \
        do { \
            if (!(statement)) { \
                MESSAGE("\n=== Fatal (line %d) ===\n" msg "\n", \
                        __LINE__, ##__VA_ARGS__); \
                exit(1); \
            } \
        } while(0)
#   define CHECK_HEAP() mm_checkheap(__LINE__)
#else
#   define REQUIRE(statement, msg, ...) ((void)0)
#   define CHECK_HEAP() ((void)0)
#endif

typedef unsigned char u8;
typedef int i32;
typedef unsigned int u32;
typedef unsigned long u64;
#define WORD sizeof(u32)
#define DWORD sizeof(u64)

/**
 * State bits in block header/footer
 * S_THIS: whether this block is allocated (1 if allocated)
 * S_PREV: whether the previous block is allocated (1 if allocated)
 */
#define S_THIS 1
#define S_PREV 2

static int in_heap(const void *p);
void mm_checkheap(int lineno);

/**
 * Requires @p ptr is not (void *)-1 to ensure a successful syscall
 */
#define REQ_NOERR(ptr) \
    REQUIRE(ptr != (void *)-1, "Memory allocation failed: %p", ptr)

/**
 * Requires @p ptr is in heap
 */
#define REQ_INHEAP(ptr) \
    REQUIRE(in_heap(ptr), "Pointer not in heap: %p", ptr)

/**
 * Requires @p hdr is a valid block header
 */
#define REQ_HEAD(hdr) \
    REQUIRE((u64)(hdr) % ALIGNMENT == WORD, "Header not aligned: %p", hdr)

/**
 * Requires @p ftr is a valid block footer
 */
#define REQ_FOOT(ftr) \
    REQUIRE((u64)(ftr) % ALIGNMENT == 0, "Footer not aligned: %p", ftr)

/**
 * Requires state bits to be valid
 * @param put bits to set
 * @param keep bits to keep
 */
#define REQ_SMASK(put, keep) \
    do { \
        REQUIRE(put <= 3, "State bits out of range: %u", put); \
        REQUIRE(keep <= 3, "State bits out of range: %u", keep); \
        REQUIRE(!((put) & (keep)), \
                "State bits conflict: %u & %u", put, keep); \
    } while (0)

/**
 * Requires @p asize is a valid block size
 * all variables named asize, except those specified, should satisfy this
 */
#define REQ_ASIZE(asize) \
    REQUIRE(asize >= 12 && (asize) % ALIGNMENT == WORD, \
            "Block size not aligned: %zu", asize)

/**
 * Requires @p hdr is a free block header
 */
#define REQ_FREE(hdr) \
    REQUIRE(!(state(hdr) & S_THIS), "Block not free: %p", hdr)

/**
 * Get the payload size from block header/footer
 * @note REQ_ASIZE(payload(bdr)) holds
 */
static inline size_t payload(void *bdr) {
    return (*(u32*)bdr & ~(u32)7) | 4;
}

/**
 * Set the byte-offset from @p from to @p to
 * If @p to is NULL, set offset to INT_MIN
 */
static inline void setOffset(i32 *from, void *to) {
    i32 offset = INT_MIN;
    if (to != NULL) offset = (i32)((u64)to - (u64)from);
    *from = offset;
}

/**
 * Get the target pointer from the byte-offset @p off
 * If @p off is INT_MIN, return NULL
 */
static inline void *target(i32 *off) {
    if (*off == INT_MIN) return NULL;
    return (void*)off + *off;
}

/**
 * Get the state bits from block header/footer
 */
static inline u8 state(void *bdr) {
    return *(u8*)bdr & 7;
}

/**
 * Get references to current FREE block's list links (prev and next)
 */
static inline i32 *prev(void *hdr) {
    REQ_HEAD(hdr);
    REQ_FREE(hdr);
    return (i32*)(hdr + WORD);
}

/**
 * Get references to current FREE block's list links (prev and next)
 */
static inline i32 *next(void *hdr) {
    REQ_HEAD(hdr);
    REQ_FREE(hdr);
    return (i32*)(hdr + DWORD);
}

/**
 * Reach the footer from header.
 * @note REQ_FREE(hdr) should hold
 */
static inline void *head2foot(void *hdr) {
    REQ_HEAD(hdr);
    REQ_FREE(hdr);
    return hdr + payload(hdr);
}

/**
 * Reach the header from footer.
 * @note REQ_FREE(ftr) should hold
 */
static inline void *foot2head(void *ftr) {
    REQ_FOOT(ftr);
    REQ_FREE(ftr);
    return ftr - payload(ftr);
}

/**
 * Set the block header/footer boundary info
 * @param bdr pointer to header/footer
 * @param asize adjusted size (or (size_t)-1 to keep original size)
 * @param put state bits to set
 * @param keep state bits to keep
 */
static inline void setBoundary(void *bdr, size_t asize, u8 put, u8 keep) {
    if (asize == (size_t)-1) {
        asize = payload(bdr); // keep the original size
        // skip validation
        // because -1 will be used to fill dirty bound
        // (for the prologue/epilogue block)
    } else {
        REQ_ASIZE(asize);
    }
    REQ_SMASK(put, keep);
    *(u32*)bdr = (u32)(asize & ~(size_t)7) | (state(bdr) & keep) | put;
}

#define SEG_LISTS_NUM 15

void **SEG_LISTS;

/**
 * Get the seglist index for a given adjusted size.
 * Ranges here are chosen according to the distribution of trace requests.
 * I tried to change the implementation to many other forms, but it turns out
 * that simply if-else does the best.
 */
static inline size_t getSeglistId(size_t asize) {
    // small sizes have finer granularity, and are adjusted based on statistics
    if (asize <= 24) return 0;
    if (asize <= 32) return 1;
    if (asize <= 64) return 2;
    if (asize <= 80) return 3;

    // from here we simply double the size
    if (asize <= 120) return 4;
    if (asize <= 240) return 5;
    if (asize <= 480) return 6;
    if (asize <= 960) return 7;
    if (asize <= 1920) return 8;
    if (asize <= 3840) return 9;
    if (asize <= 7680) return 10;
    if (asize <= 15360) return 11;
    if (asize <= 30720) return 12;
    if (asize <= 61440) return 13;
    return 14;
}

/**
 * Adjust the requested size to block size.
 * @return adjusted size
 * @note REQ_ASIZE(return value) holds
 */
static inline size_t adjustSize(size_t want) {
    size_t asize = 0;
    if (want <= 12) asize = 12;
    else asize = ((want + 3) & ~(size_t)7) | 4;
    REQ_ASIZE(asize);
    return asize;
}

/**
 * Find a free block using first-fit strategy
 * @return pointer to block header, or NULL if not found
 */
static inline void *firstFit(size_t asize) {
    for (size_t idx = getSeglistId(asize); idx < SEG_LISTS_NUM; idx++) {
        void *head = SEG_LISTS[idx];
        while (head != NULL) {
            if (payload(head) >= asize) {
                return head;
            }
            head = target(next(head));
        }
    }
    return NULL;
}

/**
 * Insert a free block into the front of corresponding seglist
 */
static inline void insertList(void *hdr) {
    REQ_HEAD(hdr);
    REQ_FREE(hdr);
    int id = getSeglistId(payload(hdr));
    void *head = SEG_LISTS[id];
    setOffset(prev(hdr), NULL);
    setOffset(next(hdr), head);
    if (head != NULL) setOffset(prev(head), hdr);
    SEG_LISTS[id] = hdr;
}

/**
 * Erase a free block from its seglist
 */
static inline void eraseList(void *hdr) {
    REQ_HEAD(hdr);
    REQ_FREE(hdr);
    void **head = SEG_LISTS + getSeglistId(payload(hdr));
    void *prv = target(prev(hdr)), *nxt = target(next(hdr));
    if (prv != NULL) setOffset(next(prv), nxt);
    else *head = nxt;
    if (nxt != NULL) setOffset(prev(nxt), prv);
}

/**
 * Do all allocation preparations on this block,
 * including splitting if necessary.
 * @note This method does NOT erase this block from any free list.
 *  If such operation is needed, it should be done before calling this method.
 */
static inline void offerBlock(void *hdr, size_t asize) {
    REQ_HEAD(hdr);
    REQ_FREE(hdr);
    REQ_ASIZE(asize);

    size_t whole = payload(hdr);
    if (whole - asize >= DWORD + 2 * WORD) { // split
        size_t remain = whole - asize;
        setBoundary(hdr, asize, S_THIS, S_PREV);
        void *nhdr = hdr + WORD + asize;
        REQ_HEAD(nhdr);
        setBoundary(nhdr, remain - WORD, S_PREV, 0);
        setBoundary(head2foot(nhdr), remain - WORD, S_PREV, 0);
        insertList(nhdr);
    } else { // do not split
        setBoundary(hdr, whole, S_THIS, S_PREV);
        void *nhdr = hdr + WORD + whole;
        REQ_HEAD(nhdr);
        if (nhdr <= mem_heap_hi()) {
            setBoundary(nhdr, (size_t)-1, S_PREV, S_THIS);
        }
    }
}

/**
 * Coalesce free blocks around @p hdr and return the new block header.
 * @note 1) The coalesced block is not inserted into any free list
 *  and should be immediately inserted or offered.
 * @note 2) As a result,
 *  CHECK_HEAP() should be called after insertion or offering.
 */
static inline void *coalesce(void *hdr) {
    REQ_HEAD(hdr);
    size_t whole = WORD + payload(hdr);
    if (!(state(hdr) & S_PREV)) { // previous one is free
        void *phdr = foot2head(hdr - WORD);
        REQ_HEAD(phdr);
        REQ_FREE(phdr);
        eraseList(phdr);
        hdr = phdr;
        whole += WORD + payload(phdr);
    }
    void *nhdr = hdr + whole;
    if (nhdr <= mem_heap_hi() && !(state(nhdr) & S_THIS)) { // next one is free
        REQ_HEAD(nhdr);
        REQ_FREE(nhdr);
        eraseList(nhdr);
        whole += WORD + payload(nhdr);
    }
    size_t pay = whole - WORD; // -header, footer is counted in payload
    setBoundary(hdr, pay, S_PREV, 0);
    setBoundary(head2foot(hdr), pay, S_PREV, 0);
    return hdr;
}

/**
 * Extend the heap by at least @p asize bytes
 * and return the new free block header.
 * @note REQ_ASIZE(asize) holds
 */
static inline void *extendHeap(size_t asize) {
    // lift the size to reduce the number of sbrk calls
    if (asize < 4096 - WORD) asize = 4096 - WORD;
    void *ehdr = mem_sbrk((int)(asize + WORD)) - WORD;
    REQ_NOERR(ehdr);
    REQ_HEAD(ehdr);
    // ehdr is previously allocated and maintained
    // so it's S_PREV mask is correct, we should keep it
    // but footer(ehdr) should be assigned newly
    setBoundary(ehdr, asize, 0, S_PREV);
    setBoundary(head2foot(ehdr), asize, state(ehdr), 0);
    setBoundary(head2foot(ehdr) + WORD, (size_t)-1, S_THIS, 0);
    return coalesce(ehdr);
}

/**
 * Power-lifting certain sizes to reduce fragmentation.
 * Based on statistical result on traces.
 */
static inline size_t powerLift(size_t size) {
    if (size >= 120 && size < 128) return 128;
    if (size >= 448 && size < 512) return 512;
    if (size >= 1000 && size < 1024) return 1024;
    if (size >= 2000 && size < 2048) return 2048;
    return size;
}

/*
 * Initialize: return -1 on error, 0 on success.
 */
int mm_init(void) {
    // Always align SEG_LISTS to ALIGNMENT
    size_t shift = (ALIGNMENT - (size_t)mem_heap_lo()) % ALIGNMENT;
    void *lo = mem_sbrk((int)(SEG_LISTS_NUM * DWORD + DWORD + shift));
    REQ_NOERR(lo);
    REQUIRE(lo == mem_heap_lo(),
            "Heap is not empty at initialization: %p vs %p",
            lo, mem_heap_lo());
    SEG_LISTS = (void**)(mem_heap_lo() + shift);
    // Initialize seglists
    memset(SEG_LISTS, 0, SEG_LISTS_NUM * DWORD);

    // Initialize prologue block (also current epilogue block)
    void *hdr = (void*)SEG_LISTS + SEG_LISTS_NUM * DWORD + WORD;
    REQ_HEAD(hdr);
    // S_PREV should be on as the prologue block
    // S_THIS should be on as the epilogue block
    setBoundary(hdr, (size_t)-1, S_PREV | S_THIS, 0);
    CHECK_HEAP();
    return 0;
}

/*
 * malloc
 */
void *malloc(size_t size) {
    V_MESSAGE("malloc request: %zu\n", size);
    if (!size) return NULL;
    size_t asize = adjustSize(powerLift(size));
    void *offer = firstFit(asize);
    if (offer == NULL) {
        offer = extendHeap(asize); // won't be in seglists
    } else {
        eraseList(offer);
    }
    offerBlock(offer, asize);
    CHECK_HEAP();
    return offer + WORD; // return pointer to payload
}

/*
 * free
 */
void free(void *ptr) {
    V_MESSAGE("free request: %p\n", ptr);
    if (ptr == NULL) return ;
    void *hdr = ptr - WORD;
    REQ_HEAD(hdr);
    setBoundary(hdr, (size_t)-1, 0, S_PREV);
    void *nhdr = head2foot(hdr) + WORD;
    if (nhdr <= mem_heap_hi()) {
        REQ_HEAD(nhdr);
        setBoundary(nhdr, (size_t)-1, 0, S_THIS); // unset S_PREV
    }
    hdr = coalesce(hdr);
    insertList(hdr);
    CHECK_HEAP();
}

/*
 * realloc - you may want to look at mm-naive.c
 */
void *realloc(void *oldptr, size_t size) {
    REQUIRE(oldptr != NULL || size != 0,
            "realloc with oldptr == NULL and size == 0");
    if (oldptr == NULL) return malloc(size);
    if (size == 0) return free(oldptr), NULL;
    V_MESSAGE("realloc request: %p, %zu\n", oldptr, size);
    size_t asize = adjustSize(size);
    void *oldhdr = oldptr - WORD;
    REQ_HEAD(oldhdr);
    size_t oldsize = payload(oldhdr);
    if (asize <= oldsize) {
        setBoundary(oldhdr, (size_t)-1, 0, S_PREV); // as if it were just freed
        offerBlock(oldhdr, asize);
    } else {
        void *newptr = malloc(size);
        if (newptr == NULL) return NULL;
        memcpy(newptr, oldptr, oldsize);
        free(oldptr);
        oldptr = newptr;
    }
    return oldptr;
}

/*
 * calloc - you may want to look at mm-naive.c
 * This function is not tested by mdriver, but it is
 * needed to run the traces.
 */
void *calloc(size_t nmemb, size_t size) {
    size_t bytes = nmemb * size;
    void *newptr;
    newptr = malloc(bytes);
    if (newptr == NULL) return NULL;
    memset(newptr, 0, bytes);
    return newptr;
}


/*
 * Return whether the pointer is in the heap.
 * May be useful for debugging.
 */
static int in_heap(const void *p) {
    return p <= mem_heap_hi() && p >= mem_heap_lo();
}

/*
 * Return whether the pointer is aligned.
 * May be useful for debugging.
 */
static int aligned(const void *p) {
    return (size_t)ALIGN(p) == (size_t)p;
}

/**
 * Check the heap for consistency. It checks:
 *  1. Prologue blocks:
 *      a. All seglist heads are NULL or valid block headers
 *      b. Prologue block header has S_PREV bit on to block any coalescing
 *  2. Coalescing & states:
 *      a. Headers/Footers are valid (then payload should be valid too)
 *      b. No two consecutive free blocks
 *      c. S_PREV bits are consistent
 *      d. Header and footer info match for free blocks
 *  3. Epilogue block:
 *      a. Epilogue block is at the expected position
 *      b. Epilogue block header has S_THIS bit on to block any coalescing
 *      c. S_PREV bit is consistent
 *  4. Segregated free lists:
 *      a. All blocks in seglists are valid free block headers
 *      b. All blocks are in the correct seglists
 *      c. Prev and next links are consistent
 *      d. Free block count and payload size match those in heap
 *
 * If any inconsistency is found,
 * the function will print a fatal error message and exit.
 * 
 * @note If VERBOSE is not defined, this function will run silently;
 *  If DEBUG is not defined, this function is not allowed to be called;
 *  Therefore, we should call macro CHECK_HEAP() in other places
 *  instead of mm_checkheap().
 */
void mm_checkheap(int lineno) {
#ifndef DEBUG
    fprintf(stderr, "mm_checkheap called in non-debug mode, "
            "which is not allowed.\n");
    exit(1);
#endif
    V_MESSAGE("\n--- Heap check at line %d ---\n", lineno);

    void *ptr = mem_heap_lo();
    ptr = (void*)ALIGN(ptr);

    V_MESSAGE("* Prologue block checking...");
    for (int i = 0; i < SEG_LISTS_NUM; i++) {
        if (SEG_LISTS[i] != NULL) {
            REQ_HEAD(SEG_LISTS[i]);
        }
    }
    ptr += SEG_LISTS_NUM * DWORD + WORD;
    REQ_HEAD(ptr);
    REQUIRE(state(ptr) & S_PREV, "Prologue block S_PREV bit not set");
    V_MESSAGE("\t\t\tPassed.\n");

    int last_free = 0;
    size_t free_blocks = 0, free_payload = 0;
    V_MESSAGE("* Coalescing blocks & block states checking...");
    while (ptr + WORD < mem_heap_hi() + 1) {
        REQ_HEAD(ptr);
        REQUIRE(!(state(ptr) & 0b100),
                "Reserved state bits set in block: %p", ptr);
        REQUIRE(last_free == !(state(ptr) & S_PREV),
                "Inconsistent S_PREV bit in block: %p", ptr);
        size_t asize = payload(ptr);
        REQ_ASIZE(asize);
        if (state(ptr) & S_THIS) {
            last_free = 0;
        } else {
            free_blocks++;
            free_payload += asize;
            REQUIRE(!last_free, "Two consecutive free blocks found: %p and %p",
                    foot2head(ptr - WORD), ptr);
            last_free = 1;
            REQUIRE(*(u32*)head2foot(ptr) == *(u32*)ptr,
                    "Header & footer info mismatch in free block: %p [%u, %u]",
                    ptr, *(u32*)ptr, *(u32*)head2foot(ptr));
        }
        ptr += asize + WORD;
    }
    V_MESSAGE("\tPassed.\n");

    V_MESSAGE("* Epilogue block checking...");
    REQUIRE(ptr + WORD == mem_heap_hi() + 1,
            "Epilogue block not at expected position: %p vs %p",
            ptr + WORD, mem_heap_hi() + 1);
    REQ_HEAD(ptr);
    REQUIRE(last_free == !(state(ptr) & S_PREV),
            "Inconsistent S_PREV bit in epilogue block: %p", ptr);
    REQUIRE(state(ptr) & S_THIS,
            "Epilogue block S_THIS bit not set: %p", ptr);
    V_MESSAGE("\t\t\tPassed.\n");

    size_t listed_free = 0, listed_payload = 0;
    V_MESSAGE("* Segregated free lists checking...");
    for (int idx = 0; idx < SEG_LISTS_NUM; idx++) {
        void *head = SEG_LISTS[idx], *last = NULL;
        while (head != NULL) {
            REQ_INHEAP(head);
            REQ_HEAD(head);
            REQ_FREE(head);
            if (last != NULL) {
                REQUIRE(target(prev(head)) == last,
                        "Inconsistent prev link in seglist %d: %p vs %p",
                        idx, target(prev(head)), last);
            }
            size_t asize = payload(head);
            REQUIRE(getSeglistId(asize) == (size_t)idx,
                    "Block %p in wrong list %d (size %zu)", head, idx, asize);
            listed_free++;
            listed_payload += asize;
            last = head;
            head = target(next(head));
        }
    }
    REQUIRE(free_blocks == listed_free,
            "Free block count mismatch: heap %zu vs list %zu",
            free_blocks, listed_free);
    REQUIRE(free_payload == listed_payload,
            "Free payload size mismatch: heap %zu vs list %zu",
            free_payload, listed_payload);
    V_MESSAGE("\t\tPassed.\n");
    V_MESSAGE("--- Heap check passed ---\n\n");
}
