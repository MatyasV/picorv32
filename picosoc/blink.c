#include <stdint.h>
#include <stdbool.h>

#ifdef ICEBREAKER
#  define MEM_TOTAL 0x20000 /* 128 KB */
#elif HX8KDEMO
#  define MEM_TOTAL 0x200 /* 2 KB */
#else
#  error "Set -DICEBREAKER or -DHX8KDEMO when compiling firmware.c"
#endif

// a pointer to this is a null pointer, but the compiler does not
// know that because "sram" is a linker symbol from sections.lds.
extern uint32_t sram;

#define reg_spictrl (*(volatile uint32_t*)0x02000000)
#define reg_uart_clkdiv (*(volatile uint32_t*)0x02000004)
#define reg_uart_data (*(volatile uint32_t*)0x02000008)
#define reg_leds (*(volatile uint8_t*)0x03000000)
#define reg_7seg (*(volatile uint8_t*)0x03000001)

#define reg_cache_hit_count  (*(volatile uint32_t*)0x0200000C)
#define reg_cache_miss_count (*(volatile uint32_t*)0x02000010)

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
#endif

// --------------------------------------------------------

// Read the CPU cycle counter
static inline uint32_t rdcycle(void) {
    uint32_t c;
    __asm__ volatile ("rdcycle %0" : "=r"(c));
    return c;
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
    reg_uart_data = '\r'; reg_uart_data = '\n';
}

// Print a simple label string over UART
void print_str(const char *s) {
    while (*s) reg_uart_data = *s++;
}

void setup_picosoc(void){
	reg_uart_clkdiv = 104; // ~115200 baud @ 12 MHz
	reg_leds = 0x00;
	set_flash_qspi_flag();
	set_flash_mode_quad();
}

#define DELAY_K 10000

void main()
{
    setup_picosoc();

    // Reset cache counters before the benchmark
    reg_cache_hit_count  = 0;
    reg_cache_miss_count = 0;

    // Snapshot cycle count before
    uint32_t t0 = rdcycle();

    // --- Your benchmark: the blink loop ---
    for (int rep = 0; rep < 100; rep++) {
        for (int i = 0; i < DELAY_K; i++);
        reg_leds = 0x02;
        for (int i = 0; i < DELAY_K; i++);
        reg_leds = 0x00;
    }
    // --- End benchmark ---

    // Snapshot cycle count after
    uint32_t t1 = rdcycle();

    // Read cache counters
    uint32_t hits   = reg_cache_hit_count;
    uint32_t misses = reg_cache_miss_count;

    // Print results over UART
    uint32_t total = hits + misses;
    print_str("Cycles: ");  print_dec(t1 - t0);
    print_str("Hits:   ");  print_dec(hits);
    print_str("Misses: ");  print_dec(misses);
    print_str("Total:  ");  print_dec(total);

    // Miss rate as "XX.XX%" — no division operator (not available on rv32ic -nostdlib)
    // Strategy: compute floor(misses*100/total) for whole%, then floor(rem*100/total) for frac%
    print_str("Miss%:  ");
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

        print_dec(whole_pct);
        reg_uart_data = '.';
        if (frac_pct < 10) reg_uart_data = '0';
        print_dec(frac_pct);
        print_str("%\r\n");
    }

    // Blink to show we're done
    while (1) {
        reg_leds = 0x01;
        for (int i = 0; i < DELAY_K; i++);
        reg_leds = 0x00;
        for (int i = 0; i < DELAY_K; i++);
    }
}
