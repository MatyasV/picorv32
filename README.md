# Description of files
## `./picorv32.v`
- `module picorv32_pcpi_fast_div`
- `module picorv32_pcpi_div` - modified version of the division module
## `./picosoc/picosoc.v`
Contains all cache variants implemented:
- `module spimem_cache_forward`
- `module spimem_cache_direct_mapped_simple`
- `module spimem_cache_direct_mapped`
- `module spimem_cache_direct_mapped_hash`
- `module spimem_cache_direct_mapped_1_cycle_hit`
- `module spimem_cache_random`
- `module spimem_cache_fifo`

## `./picosoc/icebreaker.v`
- Code for faster clock rate
## `./picosoc/tests.c`
- Benchmark containing a set of tests

## `./picosoc/bench.c`
- Secret benchmark for our team

## `./picosoc/binaries/`
Contains the `icebreaker.bin` using different caches
- File name rule: `[cache type]_[#lines]_[#words/line]_[clock rate].bin`


## `./picosoc/test_results/`
Contains the test results (`test.c`) using different caches
- File name rule: `[cache type]_[#lines]_[#words/line]_[clock rate].log`


## `./picosoc/log/`
Contains synthesizer report using different caches
- File name rule: `[cache type]_[#lines]_[#words/line]_[clock rate].log`

## `./picosoc/Testbenches`
- `picorv32_pcpi_div.v` - testbench for division module
- `spimem_cache_direct_mapped_tb.v` - testbench for cache module