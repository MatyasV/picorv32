# Performance Counters and Results Display

## What Was Measured

Two types of counters were used to evaluate cache performance:

**Cache hit/miss counters** — hardware registers inside the cache that count every hit and miss as the CPU runs. These give the miss rate.

**CPU cycle and instruction counters** — built-in RISC-V counters (`rdcycle`, `rdinstret`) that count clock cycles elapsed and instructions retired. These give CPI (cycles per instruction).

---

## Hardware Hit/Miss Counters

Each cache module contains two 32-bit registers — `hit_count` and `miss_count` — that increment on every cache access:

```verilog
output reg [31:0] hit_count,
output reg [31:0] miss_count

// Inside the cache always block:
if (cpu_valid && cache_hit)  hit_count  <= hit_count + 1;
if (cpu_valid && spimem_ready && !cache_hit) miss_count <= miss_count + 1;
```

To make these readable by firmware, they were wired into the SoC's memory map at fixed addresses in `picosoc.v`:

```verilog
wire cache_hit_sel  = mem_valid && (mem_addr == 32'h 0200_000C);
wire cache_miss_sel = mem_valid && (mem_addr == 32'h 0200_0010);

// Writing to either address resets that counter to zero
wire hit_count_reset  = cache_hit_sel  && |mem_wstrb;
wire miss_count_reset = cache_miss_sel && |mem_wstrb;

// Reading returns the current count
assign mem_rdata = ...
    cache_hit_sel  ? cache_hit_count  :
    cache_miss_sel ? cache_miss_count : ...
```

This means the counters behave like memory locations from the CPU's perspective — read them to get the count, write to them to reset to zero. No special instructions needed.

---

## Firmware Interface (`perf.h`)

A small header file was written to expose these registers to C firmware cleanly:

```c
#define REG_CACHE_HIT_COUNT  (*(volatile uint32_t*)0x0200000C)
#define REG_CACHE_MISS_COUNT (*(volatile uint32_t*)0x02000010)

static inline void cache_counters_reset(void) {
    REG_CACHE_HIT_COUNT  = 0;
    REG_CACHE_MISS_COUNT = 0;
}
```

In the benchmark, the pattern is: reset the counters, run the workload, read back the results:

```c
cache_counters_reset();

__asm__ volatile ("rdcycle   %0" : "=r"(cycles_begin));
__asm__ volatile ("rdinstret %0" : "=r"(instns_begin));

// ... run workload ...

__asm__ volatile ("rdcycle   %0" : "=r"(cycles_end));
__asm__ volatile ("rdinstret %0" : "=r"(instns_end));

hits   = REG_CACHE_HIT_COUNT;
misses = REG_CACHE_MISS_COUNT;
```

`rdcycle` and `rdinstret` are standard RISC-V instructions that read the CPU's built-in cycle and instruction counters directly.

---

## Displaying Results (UART)

Results were printed over UART to a connected computer after each benchmark run. The `print_stats` function outputs CPI and miss rate as decimal values, calculated without using division from libgcc (to avoid a compiler dependency):

```
Results for run_workload
rdcycle:   12048
rdinstret: 8431
CPI:       1.4
Hits:      3201
Misses:    847
Total:     4048
Miss rate: 20.9%
```
