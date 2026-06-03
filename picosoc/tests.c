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
	// reg_uart_clkdiv = 104; // ~115200 baud @ 12 MHz
	reg_uart_clkdiv = 130; // ~115200 baud @ 15 MHz
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

uint32_t div(uint32_t n, uint32_t d) {
    return n / d;
    // uint32_t q = 0;
    // while (n >= d) { n -= d; q++; }
    // return q;
}

uint32_t mod(uint32_t n, uint32_t d) {
    return n % d;
    // while (n >= d) n -= d;
    // return n;
}

void print_stats(uint32_t cycles, uint32_t instns, uint32_t hits, uint32_t misses, const char *test_name) {
    // Print results over UART
    uint32_t total = hits + misses;
    if (total == 0) {
        print_str("N/A\r\n");
    } else {
        print_str("Results for "); print_str(test_name);
        print_str("\r\nrdcycle:   ");  print_dec(cycles);
        print_str("\r\nrdinstret: ");  print_dec(instns);
        print_str("\r\nCPI:       ");
        print_dec(div(cycles, instns));
        print_str(".");
        print_dec(mod(div(cycles * 10, instns), 10));
        print_str("\r\nHits:      ");  print_dec(hits);
        print_str("\r\nMisses:    ");  print_dec(misses);
        print_str("\r\nTotal:     ");  print_dec(total);
        print_str("\r\nMiss rate: ");
        print_dec(div(misses * 100, total));
        reg_uart_data = '.';
        uint32_t frac_pct = mod(div(misses * 1000, total), 10);
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
    test(); // warm up cache

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

 
static void test_tiny_loop(void)
{
    uint32_t acc = 0;
    for (uint32_t i = 0; i < 100000; i++) {
        acc += i;
    }
}
 
static void medium_body(uint32_t *acc, uint32_t i)
{
    /* ~64 instructions of padding via repeated cheap ops */
    uint32_t a = *acc;
    a += i;       a ^= (i << 1);  a += (i >> 1);  a ^= (i * 3);
    a += i;       a ^= (i << 2);  a += (i >> 2);  a ^= (i * 5);
    a += i;       a ^= (i << 3);  a += (i >> 3);  a ^= (i * 7);
    a += i;       a ^= (i << 4);  a += (i >> 4);  a ^= (i * 9);
    a += i;       a ^= (i << 5);  a += (i >> 5);  a ^= (i * 11);
    a += i;       a ^= (i << 6);  a += (i >> 6);  a ^= (i * 13);
    a += i;       a ^= (i << 7);  a += (i >> 7);  a ^= (i * 15);
    a += i;       a ^= (i << 8);  a += (i >> 8);  a ^= (i * 17);
    *acc = a;
}
 
static void test_medium_loop(void)
{
    uint32_t acc = 1;
    for (uint32_t i = 0; i < 2000; i++) {
        medium_body(&acc, i);
    }
}
 
#define DEFINE_BLOCK(N)                                         \
static uint32_t block_##N(uint32_t x, uint32_t i) {            \
    x ^= (i * (N+1));  x += (i >> (N & 7));                    \
    x ^= (i * (N+3));  x += (i >> ((N+1) & 7));               \
    x ^= (i * (N+5));  x += (i >> ((N+2) & 7));               \
    x ^= (i * (N+7));  x += (i >> ((N+3) & 7));               \
    return x; }
 
DEFINE_BLOCK(0)  DEFINE_BLOCK(1)  DEFINE_BLOCK(2)  DEFINE_BLOCK(3)
DEFINE_BLOCK(4)  DEFINE_BLOCK(5)  DEFINE_BLOCK(6)  DEFINE_BLOCK(7)
DEFINE_BLOCK(8)  DEFINE_BLOCK(9)  DEFINE_BLOCK(10) DEFINE_BLOCK(11)
DEFINE_BLOCK(12) DEFINE_BLOCK(13) DEFINE_BLOCK(14) DEFINE_BLOCK(15)
 
static void test_large_loop(void)
{
    uint32_t x = 0xDEADBEEF;
    for (uint32_t i = 0; i < 500; i++) {
        x = block_0(x,i);  x = block_1(x,i);  x = block_2(x,i);  x = block_3(x,i);
        x = block_4(x,i);  x = block_5(x,i);  x = block_6(x,i);  x = block_7(x,i);
        x = block_8(x,i);  x = block_9(x,i);  x = block_10(x,i); x = block_11(x,i);
        x = block_12(x,i); x = block_13(x,i); x = block_14(x,i); x = block_15(x,i);
    }
}

static uint32_t branch_tree(uint32_t x, uint32_t depth)
{
    if (depth == 0) return x;
    if (x & 1)      x = x * 3 + 1;
    else            x = x >> 1;
    if (x & 2)      goto label_a;
    x ^= 0xDEAD;
    goto label_b;
label_a:
    x += 0xBEEF;
label_b:
    if (x & 4)      x = (x << 5) | (x >> 27);
    if (x & 8)      x -= 0x1234;
    if (x & 16)     x ^= 0xABCD;
    if (x & 32)     x += 0x5678;
    return branch_tree(x, depth - 1);
}
 
static void test_irregular_branch(void)
{
    uint32_t x = 0xFEDCBA98u;
    for (uint32_t i = 0; i < 5000; i++) {
        x = branch_tree(x + i, 8);
    }
}
 
static uint32_t callee_a(uint32_t x){ return x ^ 0xA1B2C3D4u; }
static uint32_t callee_b(uint32_t x){ return x + 0x11223344u; }
static uint32_t callee_c(uint32_t x){ return (x >> 7) | (x << 25); }
static uint32_t callee_d(uint32_t x){ return x * 0x08040201u; }
 
static uint32_t caller(uint32_t x, uint32_t n)
{
    for (uint32_t i = 0; i < n; i++) {
        x = callee_a(x);
        x = callee_b(x);
        x = callee_c(x);
        x = callee_d(x);
    }
    return x;
}
 
static void test_nested_call(void)
{
    uint32_t x = 0x9ABCDEF0u;
    for (uint32_t i = 0; i < 500; i++) {
        x = caller(x, 40);
    }
}

#define INSTRUCTION(padding) __asm__ volatile ( \
    "j 1f\n\t"                               \
    ".rept " #padding "\n\t"                 \
    "nop\n\t"                                \
    ".endr\n\t"                              \
    "1:\n\t"                                 \
    : : :                                    \
);

#define REP2(x) x x
#define REP4(x) REP2(x) REP2(x)
#define REP8(x) REP4(x) REP4(x)
#define REP16(x) REP8(x) REP8(x)
#define REP32(x) REP16(x) REP16(x)
#define REP64(x) REP32(x) REP32(x)
#define REP128(x) REP64(x) REP64(x)
#define REP256(x) REP128(x) REP128(x)
#define REP512(x) REP256(x) REP256(x)
#define REP1024(x) REP512(x) REP512(x)
#define REP2048(x) REP1024(x) REP1024(x)

static void test_cold_sweep_16(void)
{
    REP16(INSTRUCTION(0))
}

static void test_cold_sweep_128(void)
{
    REP128(INSTRUCTION(0))
}

static void test_cold_sweep_512(void)
{
    REP512(INSTRUCTION(0))
}
static void test_cold_sweep_1024(void)
{
    REP1024(INSTRUCTION(0))
}
static void test_cold_sweep_2048(void)
{
    REP2048(INSTRUCTION(0))
}

static void test_cold_sweep_16_padding(void)
{
    REP16(INSTRUCTION(15))
}

static void test_cold_sweep_64_padding(void)
{
    REP64(INSTRUCTION(15))
}

static void test_cold_sweep_128_padding(void)
{
    REP128(INSTRUCTION(15))
}


static void test_cold_sweep_256_padding(void)
{
    REP256(INSTRUCTION(15))
}



static void test_bubble_sort(void)
{
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
}

void test_quick_sort() {
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

    // Quick sort implementation
    void quick_sort(int low, int high) {
        if (low < high) {
            int pivot = numbers[high];
            int i = low -1;
            for (int j = low; j < high; j++) {
                if (numbers[j] < pivot) {
                    i++;
                    // Swap numbers[i] and numbers[j]
                    unsigned char temp = numbers[i];
                    numbers[i] = numbers[j];
                    numbers[j] = temp;
                }
            }
            // Swap numbers[i +1] and numbers[high]
            unsigned char temp = numbers[i +1];
            numbers[i +1] = numbers[high];
            numbers[high] = temp;

            int pi = i +1;
            quick_sort(low , pi -1);
            quick_sort(pi +1 , high);
        }
    }

    quick_sort(0 , ARRAY_SIZE -1);
}

void main()
{
    setup_picosoc();
    print_str("Start of benchmarks\r\n\r\n");
    RUN_TEST(test_bubble_sort);
    RUN_TEST(test_quick_sort);
    RUN_TEST(test_tiny_loop);
    RUN_TEST(test_medium_loop);
    RUN_TEST(test_large_loop);
    RUN_TEST(test_nested_call);
    RUN_TEST(test_irregular_branch);
    RUN_TEST(test_cold_sweep_16);
    RUN_TEST(test_cold_sweep_128);
    RUN_TEST(test_cold_sweep_512);
    RUN_TEST(test_cold_sweep_1024);
    RUN_TEST(test_cold_sweep_2048);
    RUN_TEST(test_cold_sweep_16_padding);
    RUN_TEST(test_cold_sweep_64_padding);
    RUN_TEST(test_cold_sweep_128_padding);
    RUN_TEST(test_cold_sweep_256_padding);
    
    unsigned char leds_value = 0x02;
    while (1) {
        reg_7seg = run_workload(); // display
        reg_leds = leds_value;
        leds_value = leds_value ^ 0x02; // toggle LED1
    }

}
