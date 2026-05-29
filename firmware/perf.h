// perf.h — performance measurement helpers
// Include this in whatever firmware file runs your benchmark

#ifndef PERF_H
#define PERF_H

#include <stdint.h>

// Read PicoRV32's built-in hardware cycle counter
static inline uint32_t rdcycle(void) {
    uint32_t c;
    __asm__ volatile ("rdcycle %0" : "=r"(c));
    return c;
}

// Memory-mapped cache counter registers
// Reading returns current count; writing any value resets to zero
#define REG_CACHE_HIT_COUNT  (*(volatile uint32_t*)0x0200000C)
#define REG_CACHE_MISS_COUNT (*(volatile uint32_t*)0x02000010)

// Reset both counters (call this just before your benchmark starts)
static inline void cache_counters_reset(void) {
    REG_CACHE_HIT_COUNT  = 0;
    REG_CACHE_MISS_COUNT = 0;
}

#endif
