# Changes from YosysHQ/picorv32

This document describes all modifications made to the original [YosysHQ/picorv32](https://github.com/YosysHQ/picorv32) repository.

---

## 1. SPI Flash Cache System (`picosoc/picosoc.v`)

The primary contribution. Four cache modules were added and inserted between the CPU and the SPI flash. The active module is selected at compile time via the `` `SPIMEM_CACHE `` macro (defaults to `spimem_cache_direct_mapped_hash`).

| Module | Policy | Notes |
|---|---|---|
| `spimem_cache_forward` | None (passthrough) | Baseline — every access goes to flash |
| `spimem_cache_direct_mapped_hash` | Direct-mapped | Index = hash of address bits; default |
| `spimem_cache_random` | Fully-associative, random eviction | LFSR-based victim selection |
| `spimem_cache_fifo` | Fully-associative, FIFO eviction | Ring-buffer pointer for eviction |

A fifth module (`spimem_cache_fully_associative`) lives separately in `picosoc/random.v` — an earlier prototype.

All modules share a uniform interface:
- **CPU side**: `cpu_valid/ready/addr/rdata`
- **Flash side**: `spimem_valid/ready/addr/rdata`
- **Performance counters**: `hit_count`, `miss_count`, plus reset wires

Both `CACHE_SIZE` (number of lines) and `LINE_SIZE` (words per line) are configurable parameters on every module.

---

## 2. Hardware Performance Counters (`picosoc/picosoc.v`, `picosoc/perf.h`)

Two 32-bit memory-mapped registers were added to the SoC address map:

| Address | Register |
|---|---|
| `0x0200000C` | Cache hit count |
| `0x02000010` | Cache miss count |

Reading either address returns the current count. Writing any value resets it to zero. `perf.h` exposes these as C macros:

```c
#define REG_CACHE_HIT_COUNT  (*(volatile uint32_t*)0x0200000C)
#define REG_CACHE_MISS_COUNT (*(volatile uint32_t*)0x02000010)

static inline void cache_counters_reset(void) { ... }
```

---

## 3. PicoRV32 CPU Changes (`picorv32.v`)

### FENCE instruction decoding
Added `instr_fence` register, decoded from opcode `7'b0001111`. Previously FENCE was not explicitly handled and would fall through silently.

### `decoded_rs2` width fix
Changed from `[regindex_bits-1:0]` to a fixed `[4:0]`. `rs2` is always a 5-bit field in the RISC-V instruction encoding, but `regindex_bits` is 4 for RV32E — this mismatch could cause incorrect decoding.

### `picorv32_pcpi_div` rewrite
The hardware divider co-processor was completely rewritten with a new **restoring division algorithm** — a shift-and-subtract approach that performs one bit per cycle over 32 cycles. Key improvements:

- The four operations (div/divu/rem/remu) are encoded as a 2-bit type rather than four one-hot registers, reducing LUT usage.
- A single 34-bit subtraction handles both the comparison and the update in one step.
- Supports `RISCV_FORMAL_ALTOPS` for formal verification.

The old implementation was preserved as `picorv32_pcpi_div1`.

---

## 4. PicoSoC CPU Configuration (`picosoc/picosoc.v`)

The `picorv32` instantiation was tuned for area efficiency on the iCE40 UP5K:

| Parameter | Before | After | Reason |
|---|---|---|---|
| `ENABLE_MULDIV` | single combined param | split into `ENABLE_MUL` / `ENABLE_DIV` / `ENABLE_FAST_MUL` | finer independent control |
| `ENABLE_COMPRESSED` | `1` | `0` | firmware uses RV32IM; no compressed instructions needed |
| `ENABLE_IRQ` | `1` | `0` | no interrupts used; removes IRQ logic entirely |
| `CATCH_MISALIGN` | `1` | `0` | benchmark code is well-formed; misalign-trap logic removed |
| `CATCH_ILLINSN` | `1` | `0` | no illegal-instruction traps needed |
| `ENABLE_COUNTERS64` | `1` | `0` | 32-bit cycle counter is sufficient (~286s at 15 MHz) |

---

## 5. Icebreaker Board (`picosoc/icebreaker.v`, `picosoc/icebreaker.pcf`)

### PLL clock generation
The 12 MHz board clock is now fed through an `SB_PLL40_PAD` to generate ~18.375 MHz (`DIVF=51, DIVQ=3`). The top-level port was renamed from `clk` to `clk_12mhz` to reflect this.

### 7-segment display (GB3-RISCV hardware)
New `seven_seg_ctrl` and `seven_seg_hex` modules were added to drive a two-digit hex display on PMOD 1A. The controller multiplexes between the two digits rapidly to create the illusion of both being lit simultaneously. Firmware controls the display via `gpio[15:8]`.

### LED pin remapping
LED pin assignments were updated to match the iCEBreaker v1.1a board revision.

### PCF pin assignments (`picosoc/icebreaker.pcf`)
Eight PMOD 1A pins added for the 7-segment display (`P1A1`–`P1A10`), and the clock pin renamed from `clk` to `clk_12mhz`.

---

## 6. Firmware (`picosoc/bench.c`, `picosoc/tests.c`, `picosoc/blink.s`)

- **`bench.c`**: Benchmark template using `perf.h` counters to measure cache hit/miss rates across different workloads.
- **`tests.c`**: Full test suite that runs on the iCEBreaker and exercises various CPU and memory access patterns.
- **`blink.s`**: Pre-compiled assembly firmware that blinks LEDs 100 times and prints hit/miss counts and miss-rate percentage over UART — written without libgcc division to avoid a dependency on that.

---

## 7. Testbenches (`tests/Testbenches/`)

- **`picorv32_pcpi_div.v`**: Standalone testbench for the new restoring divider. Exercises div/divu/rem/remu with various inputs including edge cases (divide-by-zero, signed overflow).
- **`spimem_cache_direct_mapped_tb.v`**: Tests the direct-mapped cache module in isolation, simulating both cache hits and misses against a mock SPI flash.

---

## 8. Build System (`picosoc/Makefile`)

- **Auto-detect toolchain**: Detects the GB3-RISCV lab compiler at `/usr/local/apps/GB3-RISCV/riscv32imc/bin/`, falling back to the standard `riscv32-unknown-elf-` prefix.
- **Firmware source changed**: From `firmware.c` to `tests.c` compiled to assembly (`tests.s`) first, then linked with `start.s`.
- **ISA flags changed**: From `-march=rv32ic` to `-march=rv32im` (multiply/divide enabled, compressed instructions removed).
- **Yosys DSP flag**: Added `-dsp` to `synth_ice40` to target iCE40 DSP blocks for multipliers.
- **nextpnr tuning**: Added `--seed 23` and updated `--freq` target; timing check updated from 12 MHz to 19.5 MHz.

---

## 9. Synthesis / P&R Log Files (`picosoc/log/`)

Log files from various cache configuration runs were committed for reference:

| Directory | Configuration |
|---|---|
| `DM64_16/` | Direct-mapped, 64 lines × 16 words |
| `DM128_8/` | Direct-mapped, 128 lines × 8 words |
| `DM128_16/` | Direct-mapped, 128 lines × 16 words |
| `DM256_1/` | Direct-mapped, 256 lines × 1 word |
| `DM256_2/` | Direct-mapped, 256 lines × 2 words |
| `icebreaker.log` / `icebreaker2.log` | Latest Yosys / nextpnr run |

---

## Summary

The project is a **cache performance study** for the iCEBreaker FPGA board. Three replacement policies (direct-mapped/hash, random, FIFO) were implemented and instrumented with hardware hit/miss counters readable from firmware. Secondary changes optimised the CPU configuration for the iCE40 UP5K (area reduction, PLL for higher clock speed) and added 7-segment display support for the GB3-RISCV lab hardware.
