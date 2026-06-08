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
    // reg_uart_clkdiv = 160; // ~115200 baud @ 18.375 MHz

	reg_leds = 0x00;
	set_flash_qspi_flag();
	set_flash_mode_quad();
}

// Print a 32-bit number over UART as decimal (no divide/modulo needed)
void print_dec(uint32_t v) {
    const uint32_t powers[] = {
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
    // return n / d;
    uint32_t q = 0;
    while (n >= d) { n -= d; q++; }
    return q;
}

uint32_t mod(uint32_t n, uint32_t d) {
    // return n % d;
    while (n >= d) n -= d;
    return n;
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


void test_empty_loop(void)
{
    uint32_t acc = 0;
    for (uint32_t i = 0; i < 100000; i++);
}

void test_tiny_loop(void)
{
    uint32_t acc = 0;
    for (uint32_t i = 0; i < 100000; i++) {
        acc += i;
    }
}
 
void medium_body(uint32_t *acc, uint32_t i)
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
 
void test_medium_loop(void)
{
    uint32_t acc = 1;
    for (uint32_t i = 0; i < 2000; i++) {
        medium_body(&acc, i);
    }
}
 
#define DEFINE_BLOCK(N)                                         \
uint32_t block_##N(uint32_t x, uint32_t i) {            \
    x ^= (i * (N+1));  x += (i >> (N & 7));                    \
    x ^= (i * (N+3));  x += (i >> ((N+1) & 7));               \
    x ^= (i * (N+5));  x += (i >> ((N+2) & 7));               \
    x ^= (i * (N+7));  x += (i >> ((N+3) & 7));               \
    return x; }
 
DEFINE_BLOCK(0)  DEFINE_BLOCK(1)  DEFINE_BLOCK(2)  DEFINE_BLOCK(3)
DEFINE_BLOCK(4)  DEFINE_BLOCK(5)  DEFINE_BLOCK(6)  DEFINE_BLOCK(7)
DEFINE_BLOCK(8)  DEFINE_BLOCK(9)  DEFINE_BLOCK(10) DEFINE_BLOCK(11)
DEFINE_BLOCK(12) DEFINE_BLOCK(13) DEFINE_BLOCK(14) DEFINE_BLOCK(15)
 
void test_large_loop(void)
{
    uint32_t x = 0xDEADBEEF;
    for (uint32_t i = 0; i < 500; i++) {
        x = block_0(x,i);  x = block_1(x,i);  x = block_2(x,i);  x = block_3(x,i);
        x = block_4(x,i);  x = block_5(x,i);  x = block_6(x,i);  x = block_7(x,i);
        x = block_8(x,i);  x = block_9(x,i);  x = block_10(x,i); x = block_11(x,i);
        x = block_12(x,i); x = block_13(x,i); x = block_14(x,i); x = block_15(x,i);
    }
}

#define ARRAY_SIZE 100
void test_bubble_sort(void)
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

void test_quick_sort(void) {
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


void test_branch_heavy(void)
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

    int i, state;
    state = 0; // Carry-over state to defeat basic hardware branch prediction

    for (i = 0; i < ARRAY_SIZE; i++) {
        // Unpredictable branches driven by the scattered array values
        if (numbers[i] < 64) {
            // Tier 2 branch dependent on historical state
            if (state == 0) {
                numbers[i] = numbers[i] >> 1;
                state = 1;
            } else {
                numbers[i] = numbers[i] + 10;
                state = 2;
            }
        } else if (numbers[i] < 128) {
            // Jump table to scatter instruction pointers
            switch (numbers[i] % 3) {
                case 0: 
                    numbers[i] = numbers[i] * 2; 
                    break;
                case 1: 
                    numbers[i] = numbers[i] - 5; 
                    break;
                case 2: 
                    state = 0; 
                    break;
            }
        } else if (numbers[i] < 192) {
            // Bitwise conditions linked to state
            if ((numbers[i] ^ state) & 0x01) {
                numbers[i] = ~numbers[i];
            } else {
                numbers[i] = numbers[i] ^ 0xAA;
            }
        } else {
            // Complex nested conditions
            if (i % 2 == 0) {
                state = (state + 1) % 4;
            } else {
                state = 0;
            }
        }
    }
}

#define JUMP(padding) __asm__ volatile ( \
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

void test_consecutive_instruction(void) {
    uint32_t x = 7, y = 3;
    uint32_t a[256];
    REP256(
        a[x & 255] = x * y;
        x++;
        y ^= x;
    )
}

void test_small_if_chain(void) {
    int x = -1;
    if(x == 0) {
        x += 1;
    } else if(x == 1) {
        x += 2;
    } else if(x == 2) {
        x += 3;
    } else if(x == 3) {
        x += 4;
    } else if(x == 4) {
        x += 5;
    } else if(x == 5) {
        x += 6;
    } else if(x == 6) {
        x += 7;
    } else if(x == 7) {
        x += 8;
    } else if(x == 8) {
        x += 9;
    } else if(x == 9) {
        x += 10;
    } else if(x == 10) {
        x += 11;
    } else if(x == 11) {
        x += 12;
    } else if(x == 12) {
        x += 13;
    } else if(x == 13) {
        x += 14;
    } else if(x == 14) {
        x += 15;
    } else if(x == 15) {
        x += 16;
    } else {
        x = -1;
    }
}

void test_large_if_chain(void) {
    int x = -1;
    if(x == 0) {
        REP16(x++;)
    } else if(x == 1) {
        REP16(x++;)
    } else if(x == 2) {
        REP16(x++;)
    } else if(x == 3) {
        REP16(x++;)
    } else if(x == 4) {
        REP16(x++;)
    } else if(x == 5) {
        REP16(x++;)
    } else if(x == 6) {
        REP16(x++;)
    } else if(x == 7) {
        REP16(x++;)
    } else if(x == 8) {
        REP16(x++;)
    } else if(x == 9) {
        REP16(x++;);
    } else if(x == 10) {
        REP16(x++;);
    } else if(x == 11) {
        REP16(x++;);
    } else if(x == 12) {
        REP16(x++;);
    } else if(x == 13) {
        REP16(x++;);
    } else if(x == 14) {
        REP16(x++;);
    } else if(x == 15) {
        REP16(x++;);
    } else if(x == 16) {
        REP16(x++;);
    } else if(x == 17) {
        REP16(x++;);
    } else if(x == 18) {
        REP16(x++;);
    } else if(x == 19) {
        REP16(x++;);
    } else if(x == 20) {
        REP16(x++;);
    } else {
        REP16(x++;);
    }
}

void f99(void) { }
void f98(void) { f99(); }
void f97(void) { f98(); }
void f96(void) { f97(); }
void f95(void) { f96(); }
void f94(void) { f95(); }
void f93(void) { f94(); }
void f92(void) { f93(); }
void f91(void) { f92(); }
void f90(void) { f91(); }

void f89(void) { f90(); }
void f88(void) { f89(); }
void f87(void) { f88(); }
void f86(void) { f87(); }
void f85(void) { f86(); }
void f84(void) { f85(); }
void f83(void) { f84(); }
void f82(void) { f83(); }
void f81(void) { f82(); }
void f80(void) { f81(); }

void f79(void) { f80(); }
void f78(void) { f79(); }
void f77(void) { f78(); }
void f76(void) { f77(); }
void f75(void) { f76(); }
void f74(void) { f75(); }
void f73(void) { f74(); }
void f72(void) { f73(); }
void f71(void) { f72(); }
void f70(void) { f71(); }

void f69(void) { f70(); }
void f68(void) { f69(); }
void f67(void) { f68(); }
void f66(void) { f67(); }
void f65(void) { f66(); }
void f64(void) { f65(); }
void f63(void) { f64(); }
void f62(void) { f63(); }
void f61(void) { f62(); }
void f60(void) { f61(); }

void f59(void) { f60(); }
void f58(void) { f59(); }
void f57(void) { f58(); }
void f56(void) { f57(); }
void f55(void) { f56(); }
void f54(void) { f55(); }
void f53(void) { f54(); }
void f52(void) { f53(); }
void f51(void) { f52(); }
void f50(void) { f51(); }

void f49(void) { f50(); }
void f48(void) { f49(); }
void f47(void) { f48(); }
void f46(void) { f47(); }
void f45(void) { f46(); }
void f44(void) { f45(); }
void f43(void) { f44(); }
void f42(void) { f43(); }
void f41(void) { f42(); }
void f40(void) { f41(); }

void f39(void) { f40(); }
void f38(void) { f39(); }
void f37(void) { f38(); }
void f36(void) { f37(); }
void f35(void) { f36(); }
void f34(void) { f35(); }
void f33(void) { f34(); }
void f32(void) { f33(); }
void f31(void) { f32(); }
void f30(void) { f31(); }

void f29(void) { f30(); }
void f28(void) { f29(); }
void f27(void) { f28(); }
void f26(void) { f27(); }
void f25(void) { f26(); }
void f24(void) { f25(); }
void f23(void) { f24(); }
void f22(void) { f23(); }
void f21(void) { f22(); }
void f20(void) { f21(); }

void f19(void) { f20(); }
void f18(void) { f19(); }
void f17(void) { f18(); }
void f16(void) { f17(); }
void f15(void) { f16(); }
void f14(void) { f15(); }
void f13(void) { f14(); }
void f12(void) { f13(); }
void f11(void) { f12(); }
void f10(void) { f11(); }

void f9(void)  { f10(); }
void f8(void)  { f9(); }
void f7(void)  { f8(); }
void f6(void)  { f7(); }
void f5(void)  { f6(); }
void f4(void)  { f5(); }
void f3(void)  { f4(); }
void f2(void)  { f3(); }
void f1(void)  { f2(); }
void f0(void)  { f1(); }


void test_deep_call_chain(void) {
    f0();
}

void main()
{
    setup_picosoc();
    for(int i = 0; i < 5; i++) {
        REP2048(JUMP(0)JUMP(0)) // Small delay for my bash script to start reading UART output after reset
    }
    print_str("Start of benchmarks\r\n\r\n");

    // Tests for replacement policies for 8-word cache
    RUN_TEST(test_bubble_sort);
    RUN_TEST(test_quick_sort);
    RUN_TEST(test_empty_loop);
    RUN_TEST(test_tiny_loop);
    RUN_TEST(test_medium_loop);
    RUN_TEST(test_large_loop);
    RUN_TEST(test_branch_heavy);

    // Tests for line size for 2048-word cache
    RUN_TEST(test_consecutive_instruction);
    RUN_TEST(test_deep_call_chain);
    RUN_TEST(test_small_if_chain);
    RUN_TEST(test_large_if_chain);
    unsigned char leds_value = 0x02;
    while (1) {
        for(int i = 0; i < 10000; i++);
        reg_7seg = 0x23;
        reg_leds = leds_value;
        leds_value = leds_value ^ 0x02; // toggle LED1
    }

}
