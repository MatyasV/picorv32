// perf.h — performance measurement helpers
// Include this in whatever firmware file runs your benchmark

#ifndef PERF_H
#define PERF_H

#include <stdint.h>

// Memory-mapped cache counter registers
// Reading returns current count; writing any value resets to zero
#define REG_CACHE_HIT_COUNT  (*(volatile uint32_t*)0x0200000C)
#define REG_CACHE_MISS_COUNT (*(volatile uint32_t*)0x02000010)

#define reg_uart_clkdiv (*(volatile uint32_t*)0x02000004)
#define reg_uart_data (*(volatile uint32_t*)0x02000008)

// Reset both counters (call this just before your benchmark starts)
static inline void cache_counters_reset(void) {
    REG_CACHE_HIT_COUNT  = 0;
    REG_CACHE_MISS_COUNT = 0;
}

// Print a 32-bit number over UART as decimal (no divide/modulo needed)
void print_dec(uint32_t v) {
    static const uint32_t powers[] = {
        1000000000, 100000000, 10000000, 1000000,
        100000, 10000, 1000, 100, 10, 1
    };
    int printing = 0;
    for (int i = 0; i < 10; i++) {
        uint32_t p = powers[i];
        int d = 0;
        while (v >= p) { v -= p; d++; }
        if (d || printing || i == 9) {
            reg_uart_data = '0' + d;
            printing = 1;
        }
    }
}

// Print a simple label string over UART
void print_str(const char *s) {
    while (*s) reg_uart_data = *s++;
}

void print_stats(uint32_t cycles, uint32_t instns, uint32_t hits, uint32_t misses) {
    // Print results over UART
    uint32_t total = hits + misses;
    if (total == 0) {
        print_str("N/A\r\n");
    } else {
        // whole percent: accumulate misses*100 via addition, then subtract total repeatedly
        uint32_t acc = 0;
        for (uint32_t j = 0; j < 100; j++) acc += misses;
        uint32_t whole_pct = 0;
        while (acc >= total) { acc -= total; whole_pct++; }
        // acc is now the remainder; frac: floor(acc*100/total)
        uint32_t acc2 = 0;
        for (uint32_t j = 0; j < 100; j++) acc2 += acc;
        uint32_t frac_pct = 0;
        while (acc2 >= total) { acc2 -= total; frac_pct++; }

        print_str("\r\nrdcycle:   ");  print_dec(cycles);
        print_str("\r\nrdinstret: ");  print_dec(instns);
        print_str("\r\nHits:      ");  print_dec(hits);
        print_str("\r\nMisses:    ");  print_dec(misses);
        print_str("\r\nTotal:     ");  print_dec(total);
        print_str("\r\nMiss rate: ");

        print_dec(whole_pct);
        reg_uart_data = '.';
        if (frac_pct < 10) reg_uart_data = '0';
        print_dec(frac_pct);
        print_str("%\r\n");
    }
}

#endif
