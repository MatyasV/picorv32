// perf.h — performance measurement helpers

#ifndef PERF_H
#define PERF_H

#include <stdint.h>

// Memory-mapped cache counter registers
// Reading returns current count; writing any value resets to zero
#define REG_CACHE_HIT_COUNT  (*(volatile uint32_t*)0x0200000C)
#define REG_CACHE_MISS_COUNT (*(volatile uint32_t*)0x02000010)

#define reg_uart_clkdiv (*(volatile uint32_t*)0x02000004)
#define reg_uart_data (*(volatile uint32_t*)0x02000008)

// Reset both counters
static inline void cache_counters_reset(void) {
    REG_CACHE_HIT_COUNT  = 0;
    REG_CACHE_MISS_COUNT = 0;
}


#endif
