# Cache Memory: From LUTRAM to BRAM

## Background: Two Ways to Store Data on an FPGA

An FPGA has two fundamentally different ways to implement memory:

### LUTRAM (LUT RAM)
Every logic cell on an FPGA contains a Look-Up Table (LUT) — a small block of logic that can be wired to compute any function. LUTs can alternatively be configured as tiny memory cells. Chaining many of them together gives you a RAM made entirely out of general-purpose logic fabric.

The key property of LUTRAM is that reads are **asynchronous** — you give it an address and the data comes back instantly, in the same clock cycle. This makes it simple to use, but it consumes the same LUT resources that all other logic on the chip competes for.

### BRAM (Block RAM, called EBR on the iCE40)
FPGAs also contain dedicated, purpose-built memory blocks. On the iCE40 UP5K used in this project, there are 30 of these blocks, each holding 4 Kbits, giving 120 Kbits of dedicated storage.

The key property of BRAM is that reads are **synchronous** — you register an address on a rising clock edge, and the data appears one clock cycle later. This one-cycle latency is the trade-off, but the benefit is that BRAM uses none of the general-purpose LUT fabric.

### Why This Matters

The iCE40 UP5K has only 5,280 LUTs in total, shared between the CPU, cache logic, UART, SPI controller, and everything else. A cache large enough to be useful — hundreds of lines of 32-bit words — can easily require tens of thousands of bits of storage. At that scale, LUTRAM would consume a significant fraction of the entire chip just for storage, leaving almost nothing for the actual logic. BRAM is the only practical choice for a large cache.

The challenge is that the synthesiser (Yosys) decides whether to use BRAM or LUTRAM based on how the Verilog is written. Getting it to reliably infer BRAM requires careful attention to a few specific patterns.

---

## Three Cache Implementations

### 1. `spimem_cache_direct_mapped_simple` — LUTRAM

This was the first working direct-mapped cache implementation. It is small and straightforward, but it maps entirely to LUTRAM for three reasons.

**Three separate arrays including a separate valid array:**
```verilog
reg [23:0] cache_addr  [0:CACHE_SIZE-1];
reg [31:0] cache_data  [0:CACHE_SIZE-1];
reg        cache_valid [0:CACHE_SIZE-1];
```

**A reset loop that writes every entry on startup:**
```verilog
always @(posedge clk) begin
    if (!resetn) begin
        for (i = 0; i < CACHE_SIZE; i = i + 1)
            cache_valid[i] <= 1'b0;
```

This reset loop is the critical problem. BRAM does not have a "reset all entries simultaneously" operation. When Yosys sees a loop that writes to every address of an array inside `always @(posedge clk)`, it converts the entire array to individual flip-flops (a process called `mem2reg`) because BRAM simply cannot do this. Once `cache_valid` becomes flip-flops, the hit-check logic depends on it, which pulls `cache_addr` and `cache_data` out of BRAM too.

**Asynchronous reads inside `always @(*)`:**
```verilog
always @(*) begin
    cpu_rdata    = cache_hit ? cache_data[index] : spimem_rdata;
    spimem_valid = cpu_valid && !cache_hit;
end
```

`always @(*)` means "recompute whenever any input changes" — this is combinational logic, which requires an asynchronous read. BRAM cannot serve data in the same cycle the address is presented, so Yosys is forced to use LUTRAM.

Even if the cache size were made large, the reset loop alone would prevent BRAM inference.

---

### 2. `spimem_cache_direct_mapped` — BRAM (inferred)

This was the second implementation, which fixed the issues in the simple version to allow Yosys to infer BRAM automatically.

**Two changes were made:**

**First — the valid bit was merged into the tag, and the reset loop was replaced with an `initial` block:**
```verilog
reg [TAG_BITS:0] cache_tag  [0:CACHE_SIZE-1];   // MSB = valid bit
reg [31:0]       cache_data [0:CACHE_WORDS-1];

integer init_i;
initial for (init_i = 0; init_i < CACHE_SIZE; init_i = init_i + 1)
    cache_tag[init_i] = 0;
```

An `initial` block sets the power-on value of the memory, which BRAM supports natively — the bitstream can pre-load BRAM contents at configuration time. This eliminates the runtime reset loop entirely, so Yosys no longer has to convert the array to flip-flops.

Merging the valid bit into the tag MSB also reduces the number of arrays from three to two, meaning the entire tag-and-valid check becomes a single read from one array.

**Second — a compact, narrowly-typed index was used:**
```verilog
wire [INDEX_BITS-1:0] index = cpu_line_addr[INDEX_BITS-1:0];

// For multi-word cache lines, the array address is exactly INDEX_BITS+LOG_LINE bits
wire [INDEX_BITS+LOG_LINE-1:0] wr_addr = {index, fill_count};
wire [INDEX_BITS+LOG_LINE-1:0] rd_addr = {index, cpu_offset[LOG_LINE-1:0]};
```

Yosys needs to see a clean, narrow address to map a memory to BRAM. A 32-bit wide index confuses the inference; an exactly `INDEX_BITS`-wide signal gives Yosys a clear picture of the memory's dimensions.

With a large enough cache (512+ lines), these two changes together allow Yosys to infer BRAM. However, because the reads are still technically asynchronous (`assign` statements), Yosys has to insert hidden bypass logic to make the async interface work on top of the BRAM. This is automatic, but it does consume some extra LUTs.

---

### 3. `spimem_cache_direct_mapped_1_cycle_hit` — BRAM (explicit, written by Che)

This module, written by Che, takes a different approach: rather than relying on Yosys to figure out BRAM inference, it explicitly embraces BRAM's synchronous nature. This gives a cleaner, more LUT-efficient result at the cost of one extra cycle of hit latency.

**The `ram_style` attribute forces BRAM unconditionally:**
```verilog
(* ram_style = "block" *) reg [TAG_BITS:0] cache_tag  [0:CACHE_SIZE-1];
(* ram_style = "block" *) reg [31:0]       cache_data [0:CACHE_WORDS-1];
```

This is a synthesis directive that tells Yosys: use block RAM, no matter what.

**The reads are explicitly synchronous:**
```verilog
reg [TAG_BITS:0] bram_tag_out;
reg [31:0]       bram_data_out;

always @(posedge clk) begin
    bram_tag_out  <= cache_tag[index];    // registered: data valid next cycle
    bram_data_out <= cache_data[rd_addr];
end
```

By moving the reads inside `always @(posedge clk)`, the Verilog directly describes what BRAM physically does — register an address, receive data one cycle later. No hidden bypass logic is needed.

**A wait state absorbs the one-cycle read latency:**
```verilog
reg bram_read_valid;

always @(posedge clk) begin
    if (cpu_valid && !bram_read_valid && !cpu_ready)
        bram_read_valid <= 1;
    else if (!cpu_valid || cpu_ready)
        bram_read_valid <= 0;
end

// Hit can only be evaluated after the BRAM has had one cycle to respond
wire cache_hit = bram_read_valid && bram_tag_out[TAG_BITS] && (bram_tag_out[TAG_BITS-1:0] == cpu_tag);
```

On cycle 0: the CPU presents an address; BRAM starts reading.  
On cycle 1: `bram_read_valid` goes high; the data is valid; hit or miss is determined.

A cache hit therefore costs one extra clock cycle compared to the async approach. This is the trade-off: cleaner BRAM inference and fewer LUTs, in exchange for one cycle of hit latency.

---

## Summary

| Module | BRAM? | How |
|---|---|---|
| `spimem_cache_direct_mapped_simple` | No — LUTRAM | Reset loop forces mem2reg; async reads in `always @(*)` |
| `spimem_cache_direct_mapped` | Yes — inferred | Reset loop removed; valid bit merged into tag; compact index |
| `spimem_cache_direct_mapped_1_cycle_hit` | Yes — explicit | `ram_style = "block"` attribute; synchronous reads; 1-cycle wait state |

The progression from `_simple` to `direct_mapped` to `_1_cycle_hit` represents an increasingly explicit and controlled approach to BRAM inference — from "it doesn't work at all" to "Yosys figures it out" to "we tell Yosys exactly what to do."
