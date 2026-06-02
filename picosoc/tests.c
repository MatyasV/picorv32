#include <stdint.h>
#include <stdbool.h>
#if defined(__has_include)
#  if __has_include("perf.h")
#    include "perf.h"
#  endif
#endif

#ifdef ICEBREAKER
#  define MEM_TOTAL 0x20000 /* 128 KB */
#else
#  error "Set -DICEBREAKER when compiling this C source file"
#endif

// a pointer to this is a null pointer, but the compiler does not
// know that because "sram" is a linker symbol from sections.lds.
extern uint32_t sram;

#define reg_spictrl (*(volatile uint32_t*)0x02000000)
#define reg_uart_clkdiv (*(volatile uint32_t*)0x02000004)
#define reg_uart_data (*(volatile uint32_t*)0x02000008)
#define reg_leds (*(volatile uint8_t*)0x03000000)
#define reg_7seg (*(volatile uint8_t*)0x03000001)

#define RUN_TEST(test) run_test(test, #test)

// --------------------------------------------------------

extern uint32_t flashio_worker_begin;
extern uint32_t flashio_worker_end;

void flashio(uint8_t *data, int len, uint8_t wrencmd)
{
	uint32_t func[&flashio_worker_end - &flashio_worker_begin];

	uint32_t *src_ptr = &flashio_worker_begin;
	uint32_t *dst_ptr = func;

	while (src_ptr != &flashio_worker_end)
		*(dst_ptr++) = *(src_ptr++);

	((void(*)(uint8_t*, uint32_t, uint32_t))func)(data, len, wrencmd);
}

#ifdef ICEBREAKER
void set_flash_qspi_flag()
{
	uint8_t buffer[8];

	// Read Configuration Registers (RDCR1 35h)
	buffer[0] = 0x35;
	buffer[1] = 0x00; // rdata
	flashio(buffer, 2, 0);
	uint8_t sr2 = buffer[1];

	// Write Enable Volatile (50h) + Write Status Register 2 (31h)
	buffer[0] = 0x31;
	buffer[1] = sr2 | 2; // Enable QSPI
	flashio(buffer, 2, 0x50);
}

void set_flash_mode_spi()
{
	reg_spictrl = (reg_spictrl & ~0x007f0000) | 0x00000000;
}

void set_flash_mode_dual()
{
	reg_spictrl = (reg_spictrl & ~0x007f0000) | 0x00400000;
}

void set_flash_mode_quad()
{
	reg_spictrl = (reg_spictrl & ~0x007f0000) | 0x00240000;
}

void set_flash_mode_qddr()
{
	reg_spictrl = (reg_spictrl & ~0x007f0000) | 0x00670000;
}

void enable_flash_crm()
{
	reg_spictrl |= 0x00100000;
}
void *memcpy(void *aa, const void *bb, long n) {
	char *a = aa;
	const char *b = bb;
	while (n--) *(a++) = *(b++);
	return aa;
}
#endif

void setup_picosoc(void){
	reg_uart_clkdiv = 104; // ~115200 baud @ 12 MHz
	reg_leds = 0x00;
	set_flash_qspi_flag();
	set_flash_mode_quad();
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

void print_stats(uint32_t cycles, uint32_t instns, uint32_t hits, uint32_t misses, const char *test_name) {
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

        uint32_t cpi_times_10 = 0, tmp = 0;
        for(uint32_t i = 0; i < 10; i++) tmp += cycles;
        while (tmp >= instns) { tmp -= instns; cpi_times_10++; }

        uint32_t cpi_whole = 0, cpi_frac = 0;
        while (cpi_times_10 >= 10) { cpi_times_10 -= 10; cpi_whole++; }
        cpi_frac = cpi_times_10;

        print_str("Results for "); print_str(test_name);
        print_str("\r\nrdcycle:   ");  print_dec(cycles);
        print_str("\r\nrdinstret: ");  print_dec(instns);
        print_str("\r\nCPI:       ");
        print_dec(cpi_whole);
        reg_uart_data = '.';
        print_dec(cpi_frac);
        print_str("\r\nHits:      ");  print_dec(hits);
        print_str("\r\nMisses:    ");  print_dec(misses);
        print_str("\r\nTotal:     ");  print_dec(total);
        print_str("\r\nMiss rate: ");

        print_dec(whole_pct);
        reg_uart_data = '.';
        if (frac_pct < 10) reg_uart_data = '0';
        print_dec(frac_pct);
        print_str("%\r\n\r\n");
    }
}

#define ARRAY_SIZE 100
unsigned char run_workload() {
    unsigned char numbers[ARRAY_SIZE] = {
        142,  87, 213,  42, 119,   8, 176,  54, 231,  99,
         12, 165,  74, 201,  33, 150,  88, 245,  19, 111,
        182,  63, 137,  95, 222,   4, 158,  81, 209,  47,
        126,  71, 194,  28, 147, 252,  91,  16, 115, 170,
         58, 239,  83, 132,   2, 205,  67, 149, 226,  38,
        104, 188,  51, 161,  94, 242,  11, 123,  79, 217,
        134,  45, 173,  89, 250,  23, 155,  61, 199, 108,
         31, 140, 212,  76,   7, 185,  53, 167, 234,  92,
        121,  14, 203,  69, 152,  41, 228,  85, 114, 191,
         26, 179,  60, 247,  97, 136,   5, 221,  73, 162
    };

    int i, j, temp;
    // Outer loop tracks the number of passes
    for (i = 0; i < ARRAY_SIZE - 1; i++) {
        // Inner loop performs the adjacent comparisons
        // The last i elements are already in place
        for (j = 0; j < ARRAY_SIZE - i - 1; j++) {
            if (numbers[j] > numbers[j + 1]) {
                // Swap numbers
                temp = numbers[j];
                numbers[j] = numbers[j + 1];
                numbers[j + 1] = temp;
            }
        }
    }

    return numbers[ARRAY_SIZE - 1]; // 0xFC = 252
}

unsigned char run_workload_timed() {
    uint32_t cycles_begin, cycles_end;
	uint32_t instns_begin, instns_end;
    uint32_t hits = 0, misses = 0;
    
#ifdef PERF_H
    cache_counters_reset();
#endif

	__asm__ volatile ("rdcycle %0" : "=r"(cycles_begin));
	__asm__ volatile ("rdinstret %0" : "=r"(instns_begin));

    unsigned char x = run_workload();

	__asm__ volatile ("rdcycle %0" : "=r"(cycles_end));
	__asm__ volatile ("rdinstret %0" : "=r"(instns_end));

#ifdef PERF_H
    hits   = REG_CACHE_HIT_COUNT;
    misses = REG_CACHE_MISS_COUNT;
#endif

    print_stats(cycles_end - cycles_begin, instns_end - instns_begin, hits, misses, "run_workload");

    return x;
}

void run_test(void test(void), const char *test_name) {
    uint32_t cycles_begin, cycles_end;
	uint32_t instns_begin, instns_end;
    uint32_t hits = 0, misses = 0;
    
#ifdef PERF_H
    cache_counters_reset();
#endif

	__asm__ volatile ("rdcycle %0" : "=r"(cycles_begin));
	__asm__ volatile ("rdinstret %0" : "=r"(instns_begin));

    test();
        
	__asm__ volatile ("rdcycle %0" : "=r"(cycles_end));
	__asm__ volatile ("rdinstret %0" : "=r"(instns_end));

#ifdef PERF_H
    hits   = REG_CACHE_HIT_COUNT;
    misses = REG_CACHE_MISS_COUNT;
#endif

    print_stats(cycles_end - cycles_begin, instns_end - instns_begin, hits, misses, test_name);
}


void test_empty_loop() {
    for(int i = 0; i < 10000; i++);
}

void test_single_loop() {
    uint32_t a = 0;
    for(int i = 0; i < 10000; i++) {
        a++;
    }
}

void test_transpose_nested() {
    int32_t s = 0;
    int a[100][100], b[100][100];
    for(int i = 0; i < 100; i++) {
        for(int j = 0; j < 100; j++) {
            b[i][j] = a[j][i];
        }
    }
}

uint32_t fib(int n) {
    if(n <= 1) return n;
    return fib(n - 1) + fib(n - 2);
}

void test_recursive() {
    fib(18);
}

void test_large_switch() {
    uint32_t j = 0;
    for(uint32_t i = 0; i < 10000; i++) {
        switch (j) {
            case (0): j += 0; break;
            case (1): j += 1; break;
            case (2): j += 2; break;
            case (3): j += 3; break;
            case (4): j += 4; break;
            case (5): j += 5; break;
            case (6): j += 6; break;
            case (7): j += 7; break;
            case (8): j += 8; break;
            case (9): j += 9; break;
            case (10): j += 10; break;
            case (11): j += 11; break;
            case (12): j += 12; break;
            case (13): j += 13; break;
            case (14): j += 14; break;
            case (15): j += 15; break;
            case (16): j += 16; break;
            case (17): j += 17; break;
            case (18): j += 18; break;
            case (19): j += 19; break;
            case (20): j += 20; break;
            case (21): j += 21; break;
            case (22): j += 22; break;
            case (23): j += 23; break;
            case (24): j += 24; break;
            case (25): j += 25; break;
            case (26): j += 26; break;
            case (27): j += 27; break;
            case (28): j += 28; break;
            case (29): j += 29; break;
            case (30): j += 30; break;
            case (31): j += 31; break;
            case (32): j += 32; break;
            case (33): j += 33; break;
            case (34): j += 34; break;
            case (35): j += 35; break;
            case (36): j += 36; break;
            case (37): j += 37; break;
            case (38): j += 38; break;
            case (39): j += 39; break;
            case (40): j += 40; break;
            case (41): j += 41; break;
            case (42): j += 42; break;
            case (43): j += 43; break;
            case (44): j += 44; break;
            case (45): j += 45; break;
            case (46): j += 46; break;
            case (47): j += 47; break;
            case (48): j += 48; break;
            case (49): j += 49; break;
            case (50): j += 50; break;
            case (51): j += 51; break;
            case (52): j += 52; break;
            case (53): j += 53; break;
            case (54): j += 54; break;
            case (55): j += 55; break;
            case (56): j += 56; break;
            case (57): j += 57; break;
            case (58): j += 58; break;
            case (59): j += 59; break;
            case (60): j += 60; break;
            case (61): j += 61; break;
            case (62): j += 62; break;
            case (63): j += 63; break;
            case (64): j += 64; break;
            case (65): j += 65; break;
            case (66): j += 66; break;
            case (67): j += 67; break;
            case (68): j += 68; break;
            case (69): j += 69; break;
            case (70): j += 70; break;
            case (71): j += 71; break;
            case (72): j += 72; break;
            case (73): j += 73; break;
            case (74): j += 74; break;
            case (75): j += 75; break;
            case (76): j += 76; break;
            case (77): j += 77; break;
            case (78): j += 78; break;
            case (79): j += 79; break;
            case (80): j += 80; break;
            case (81): j += 81; break;
            case (82): j += 82; break;
            case (83): j += 83; break;
            case (84): j += 84; break;
            case (85): j += 85; break;
            case (86): j += 86; break;
            case (87): j += 87; break;
            case (88): j += 88; break;
            case (89): j += 89; break;
            case (90): j += 90; break;
            case (91): j += 91; break;
            case (92): j += 92; break;
            case (93): j += 93; break;
            case (94): j += 94; break;
            case (95): j += 95; break;
            case (96): j += 96; break;
            case (97): j += 97; break;
            case (98): j += 98; break;
            case (99): j += 99; break;
        }
        if(j >= 100) j -= 100;
    }
}

void test_bubble_sort() {
    run_workload();
}


void main()
{
    setup_picosoc();
    print_str("Start of benchmarks\r\n\r\n");
    
    RUN_TEST(test_empty_loop);
    RUN_TEST(test_single_loop);
    RUN_TEST(test_bubble_sort);
    RUN_TEST(test_transpose_nested);
    RUN_TEST(test_recursive);
    RUN_TEST(test_large_switch);

    unsigned char leds_value = 0x02;
    while (1) {
        reg_7seg = run_workload(); // display
        reg_leds = leds_value;
        leds_value = leds_value ^ 0x02; // toggle LED1
    }

}
