/*
 *  PicoSoC - A simple example SoC using PicoRV32
 *
 *  Copyright (C) 2017  Claire Xenia Wolf <claire@yosyshq.com>
 *
 *  Permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

`ifndef PICORV32_REGS
`ifdef PICORV32_V
`error "picosoc.v must be read before picorv32.v!"
`endif

`define PICORV32_REGS picosoc_regs
`endif

`ifndef PICOSOC_MEM
`define PICOSOC_MEM picosoc_mem
`endif

`ifndef SPIMEM_CACHE
`define SPIMEM_CACHE spimem_cache_direct_mapped
`endif

// this macro can be used to check if the verilog files in your
// design are read in the correct order.
`define PICOSOC_V

module picosoc (
	input clk,
	input resetn,

	output        iomem_valid,
	input         iomem_ready,
	output [ 3:0] iomem_wstrb,
	output [31:0] iomem_addr,
	output [31:0] iomem_wdata,
	input  [31:0] iomem_rdata,

	input  irq_5,
	input  irq_6,
	input  irq_7,

	output ser_tx,
	input  ser_rx,

	output flash_csb,
	output flash_clk,

	output flash_io0_oe,
	output flash_io1_oe,
	output flash_io2_oe,
	output flash_io3_oe,

	output flash_io0_do,
	output flash_io1_do,
	output flash_io2_do,
	output flash_io3_do,

	input  flash_io0_di,
	input  flash_io1_di,
	input  flash_io2_di,
	input  flash_io3_di
);
	parameter [0:0] BARREL_SHIFTER = 1;
	parameter [0:0] ENABLE_MUL = 1;
	parameter [0:0] ENABLE_DIV = 1;
	parameter [0:0] ENABLE_FAST_MUL = 0;
	parameter [0:0] ENABLE_COMPRESSED = 1;
	parameter [0:0] ENABLE_COUNTERS = 1;
	parameter [0:0] ENABLE_IRQ_QREGS = 0;

	parameter integer MEM_WORDS = 256;
	parameter [31:0] STACKADDR = (4*MEM_WORDS);       // end of memory
	parameter [31:0] PROGADDR_RESET = 32'h 0010_0000; // 1 MB into flash
	parameter [31:0] PROGADDR_IRQ = 32'h 0000_0000;

	reg [31:0] irq;
	wire irq_stall = 0;
	wire irq_uart = 0;

	always @* begin
		irq = 0;
		irq[3] = irq_stall;
		irq[4] = irq_uart;
		irq[5] = irq_5;
		irq[6] = irq_6;
		irq[7] = irq_7;
	end

	wire mem_valid;
	wire mem_instr;
	wire mem_ready;
	wire [31:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [3:0] mem_wstrb;
	wire [31:0] mem_rdata;

	wire spimem_ready;
	wire [31:0] spimem_rdata;

	wire spimem_cache_valid;
	wire spimem_cache_ready;
	wire [23:0] spimem_cache_addr;
	wire [31:0] spimem_cache_rdata;
	// --- Performance counter wires (connected to cache module outputs) ---
	wire [31:0] cache_hit_count;
	wire [31:0] cache_miss_count;

	// Address selects: firmware reads 0x0200000C for hits, 0x02000010 for misses
	// Writing to either address resets that counter to zero
	wire cache_hit_sel  = mem_valid && (mem_addr == 32'h 0200_000C);
	wire cache_miss_sel = mem_valid && (mem_addr == 32'h 0200_0010);

	// Pulse high for one cycle when firmware writes to those addresses
	wire hit_count_reset  = cache_hit_sel  && |mem_wstrb;
	wire miss_count_reset = cache_miss_sel && |mem_wstrb;

	reg ram_ready;
	wire [31:0] ram_rdata;

	assign iomem_valid = mem_valid && (mem_addr[31:24] > 8'h 01);
	assign iomem_wstrb = mem_wstrb;
	assign iomem_addr = mem_addr;
	assign iomem_wdata = mem_wdata;

	wire spimemio_cfgreg_sel = mem_valid && (mem_addr == 32'h 0200_0000);
	wire [31:0] spimemio_cfgreg_do;

	wire        simpleuart_reg_div_sel = mem_valid && (mem_addr == 32'h 0200_0004);
	wire [31:0] simpleuart_reg_div_do;

	wire        simpleuart_reg_dat_sel = mem_valid && (mem_addr == 32'h 0200_0008);
	wire [31:0] simpleuart_reg_dat_do;
	wire        simpleuart_reg_dat_wait;

	assign mem_ready = (iomem_valid && iomem_ready) || spimem_cache_ready || ram_ready || spimemio_cfgreg_sel ||
        simpleuart_reg_div_sel || (simpleuart_reg_dat_sel && !simpleuart_reg_dat_wait) ||
        cache_hit_sel || cache_miss_sel;   // <-- added

	assign mem_rdata = (iomem_valid && iomem_ready) ? iomem_rdata : spimem_cache_ready ? spimem_cache_rdata : ram_ready ? ram_rdata :
        spimemio_cfgreg_sel ? spimemio_cfgreg_do : simpleuart_reg_div_sel ? simpleuart_reg_div_do :
        simpleuart_reg_dat_sel ? simpleuart_reg_dat_do :
        cache_hit_sel  ? cache_hit_count  :   // <-- added
        cache_miss_sel ? cache_miss_count :   // <-- added
        32'h 0000_0000;
	
	picorv32 #(
		.STACKADDR(STACKADDR),
		.PROGADDR_RESET(PROGADDR_RESET),
		.PROGADDR_IRQ(PROGADDR_IRQ),
		.BARREL_SHIFTER(BARREL_SHIFTER),
		.COMPRESSED_ISA(ENABLE_COMPRESSED),
		.ENABLE_COUNTERS(ENABLE_COUNTERS),
		.ENABLE_MUL(ENABLE_MUL),
		.ENABLE_DIV(ENABLE_DIV),
		.ENABLE_FAST_MUL(ENABLE_FAST_MUL),
		.ENABLE_IRQ(1),
		.ENABLE_IRQ_QREGS(ENABLE_IRQ_QREGS)
	) cpu (
		.clk         (clk        ),
		.resetn      (resetn     ),
		.mem_valid   (mem_valid  ),
		.mem_instr   (mem_instr  ),
		.mem_ready   (mem_ready  ),
		.mem_addr    (mem_addr   ),
		.mem_wdata   (mem_wdata  ),
		.mem_wstrb   (mem_wstrb  ),
		.mem_rdata   (mem_rdata  ),
		.irq         (irq        )
	);

	`SPIMEM_CACHE spimem_cache (
		.clk           (clk),
		.resetn        (resetn),
		.mem_instr     (mem_instr),

		.cpu_valid     (mem_valid && !mem_wstrb && mem_addr >= 4*MEM_WORDS && mem_addr < 32'h 0200_0000),
		.cpu_ready     (spimem_cache_ready),
		.cpu_addr      (mem_addr[23:0]),
		.cpu_rdata     (spimem_cache_rdata),

		.spimem_valid  (spimem_cache_valid),
		.spimem_ready  (spimem_ready),
		.spimem_addr   (spimem_cache_addr),
		.spimem_rdata  (spimem_rdata),

		    // --- new: performance counter ports ---
    	.hit_count        (cache_hit_count),
    	.miss_count       (cache_miss_count),
    	.hit_count_reset  (hit_count_reset),
    	.miss_count_reset (miss_count_reset)

	);

	spimemio spimemio (
		.clk    (clk),
		.resetn (resetn),
		.valid  (spimem_cache_valid),
		.ready  (spimem_ready),
		.addr   (spimem_cache_addr),
		.rdata  (spimem_rdata),

		.flash_csb    (flash_csb   ),
		.flash_clk    (flash_clk   ),

		.flash_io0_oe (flash_io0_oe),
		.flash_io1_oe (flash_io1_oe),
		.flash_io2_oe (flash_io2_oe),
		.flash_io3_oe (flash_io3_oe),

		.flash_io0_do (flash_io0_do),
		.flash_io1_do (flash_io1_do),
		.flash_io2_do (flash_io2_do),
		.flash_io3_do (flash_io3_do),

		.flash_io0_di (flash_io0_di),
		.flash_io1_di (flash_io1_di),
		.flash_io2_di (flash_io2_di),
		.flash_io3_di (flash_io3_di),

		.cfgreg_we(spimemio_cfgreg_sel ? mem_wstrb : 4'b 0000),
		.cfgreg_di(mem_wdata),
		.cfgreg_do(spimemio_cfgreg_do)
	);

	simpleuart simpleuart (
		.clk         (clk         ),
		.resetn      (resetn      ),

		.ser_tx      (ser_tx      ),
		.ser_rx      (ser_rx      ),

		.reg_div_we  (simpleuart_reg_div_sel ? mem_wstrb : 4'b 0000),
		.reg_div_di  (mem_wdata),
		.reg_div_do  (simpleuart_reg_div_do),

		.reg_dat_we  (simpleuart_reg_dat_sel ? mem_wstrb[0] : 1'b 0),
		.reg_dat_re  (simpleuart_reg_dat_sel && !mem_wstrb),
		.reg_dat_di  (mem_wdata),
		.reg_dat_do  (simpleuart_reg_dat_do),
		.reg_dat_wait(simpleuart_reg_dat_wait)
	);

	always @(posedge clk)
		ram_ready <= mem_valid && !mem_ready && mem_addr < 4*MEM_WORDS;

	`PICOSOC_MEM #(
		.WORDS(MEM_WORDS)
	) memory (
		.clk(clk),
		.wen((mem_valid && !mem_ready && mem_addr < 4*MEM_WORDS) ? mem_wstrb : 4'b0),
		.addr(mem_addr[23:2]),
		.wdata(mem_wdata),
		.rdata(ram_rdata)
	);
endmodule

// This is a simple cache that forwards read requests from the CPU to the SPI flash.
module spimem_cache_foward (
	input clk,
	input resetn,

	input         cpu_valid, // request from CPU to read data
	input  [23:0] cpu_addr,	// address to read from
	input         spimem_ready, // SPI flash is ready with data
	input  [31:0] spimem_rdata, // data read from SPI flash
	
	output        cpu_ready, // data is ready to be read by the CPU
	output [31:0] cpu_rdata, // data read by the CPU
	output        spimem_valid, // request read from SPI flash
	output [23:0] spimem_addr, // address to read from SPI flash
);
	wire cache_hit = 1'b0;

	assign spimem_valid = cpu_valid;
	assign spimem_addr = cpu_addr;

	assign cpu_ready = cpu_valid && (cache_hit || spimem_ready);
	assign cpu_rdata = cache_hit ? 32'h 0000_0000 : spimem_rdata;
endmodule



module spimem_cache_direct_mapped #(
	parameter integer CACHE_SIZE = 8 // number of cache lines
	// TODO: parameter integer LINE_SIZE = 1  // number of words per cache line
) ( 
	input clk,
	input resetn,

	input         cpu_valid, // request from CPU to read data
	input  [23:0] cpu_addr,	// address to read from
	input         spimem_ready, // SPI flash is ready with data
	input  [31:0] spimem_rdata, // data read from SPI flash
	
	output reg       cpu_ready, // data is ready to be read by the CPU
	output reg [31:0] cpu_rdata, // data read by the CPU
	output  reg      spimem_valid, // request read from SPI flash
	output reg [23:0] spimem_addr, // address to read from SPI flash

	// --- new: performance counter outputs and reset inputs ---
    output reg  [31:0] hit_count,
    output reg  [31:0] miss_count,
    input  wire        hit_count_reset,
    input  wire        miss_count_reset
);
	// --- Cache storage arrays ---
    reg [23:0] cache_addr  [0:CACHE_SIZE-1];
    reg [31:0] cache_data  [0:CACHE_SIZE-1];
    reg        cache_valid [0:CACHE_SIZE-1];

    // --- Index and hit detection (combinational) ---
    // For 8 lines and 1 word per line:
    // cpu_addr[1:0] = byte offset within word (always 00 for instruction fetches)
    // cpu_addr[4:2] = 3-bit index selects which of the 8 lines to check
    // cpu_addr[23:5] = tag, stored to detect aliasing
    wire [2:0] index     = cpu_addr[4:2];
    wire       cache_hit = cache_valid[index] && (cache_addr[index] == cpu_addr);

    // --- Combinational outputs ---
    // These are assign-style but written as always @(*) so they work with reg ports
    always @(*) begin
        cpu_ready    = cpu_valid && (cache_hit || spimem_ready);
        cpu_rdata    = cache_hit ? cache_data[index] : spimem_rdata;
        spimem_valid = cpu_valid && !cache_hit;
        spimem_addr  = cpu_addr;
    end

    // --- Sequential logic: cache fill + counters ---
    integer i;
    always @(posedge clk) begin
        if (!resetn) begin
            // On reset: invalidate all cache lines and zero counters
            for (i = 0; i < CACHE_SIZE; i = i + 1)
                cache_valid[i] <= 1'b0;
            hit_count  <= 32'b0;
            miss_count <= 32'b0;

        end else begin

            // Firmware can reset counters by writing to their memory-mapped address
            if (hit_count_reset)  hit_count  <= 32'b0;
            if (miss_count_reset) miss_count <= 32'b0;

            // When a new request arrives from the CPU:
            if (cpu_valid) begin
                if (cache_hit) begin
                    // HIT: data already in cache, increment hit counter
                    // (cpu_ready and cpu_rdata are driven combinationally above)
                    hit_count <= hit_count + 1;

                end else if (spimem_ready) begin
                    // MISS + flash has responded: fill the cache line, increment miss counter
                    cache_addr[index]  <= cpu_addr;
                    cache_data[index]  <= spimem_rdata;
                    cache_valid[index] <= 1'b1;
                    miss_count <= miss_count + 1;
                end
            end

        end
    end

endmodule


module spimem_cache_fifo #(
	parameter integer CACHE_SIZE = 8, // number of cache lines
	parameter integer LINE_SIZE  = 1  // words per cache line (only 1 currently supported)
) (
	input clk,
	input resetn,

	input        cpu_valid,
	input [23:0] cpu_addr,
	input        mem_instr,
	input        spimem_ready,
	input [31:0] spimem_rdata,

	input wire        hit_count_reset,
	input wire        miss_count_reset,

	output reg        cpu_ready,
	output reg [31:0] cpu_rdata,
	output reg        spimem_valid,
	output reg [23:0] spimem_addr,

	output reg [31:0] hit_count,
	output reg [31:0] miss_count
);
	localparam FIFO_BITS = $clog2(CACHE_SIZE);

	reg [23:0] cache_addr  [0:CACHE_SIZE-1];
	reg [31:0] cache_data  [0:CACHE_SIZE-1];
	reg        cache_valid [0:CACHE_SIZE-1];
	reg [FIFO_BITS-1:0] fifo_head; // next line to evict

	// Fully associative hit detection: scan all lines
	reg        cache_hit;
	reg [31:0] hit_rdata;
	integer k;
	always @(*) begin
		cache_hit = 1'b0;
		hit_rdata = 32'h0;
		for (k = 0; k < CACHE_SIZE; k = k + 1)
			if (cache_valid[k] && (cache_addr[k] == cpu_addr)) begin
				cache_hit = 1'b1;
				hit_rdata = cache_data[k];
			end
	end

	always @(*) begin
		cpu_ready    = cpu_valid && (cache_hit || spimem_ready);
		cpu_rdata    = cache_hit ? hit_rdata : spimem_rdata;
		spimem_valid = cpu_valid && !cache_hit;
		spimem_addr  = cpu_addr;
	end

	integer i;
	always @(posedge clk) begin
		if (!resetn) begin
			for (i = 0; i < CACHE_SIZE; i = i + 1)
				cache_valid[i] <= 1'b0;
			fifo_head  <= 0;
			hit_count  <= 32'b0;
			miss_count <= 32'b0;

		end else begin

			if (hit_count_reset)  hit_count  <= 32'b0;
			if (miss_count_reset) miss_count <= 32'b0;

			if (cpu_valid) begin
				if (cache_hit) begin
					hit_count <= hit_count + 1;

				end else if (spimem_ready) begin
					// FIFO eviction: overwrite the oldest entry
					cache_addr [fifo_head] <= cpu_addr;
					cache_data [fifo_head] <= spimem_rdata;
					cache_valid[fifo_head] <= 1'b1;
					fifo_head  <= (fifo_head == CACHE_SIZE-1) ? 0 : fifo_head + 1;
					miss_count <= miss_count + 1;
				end
			end
		end
	end

endmodule

module spimem_cache_random #(
    parameter integer CACHE_SIZE = 8,   // number of cache lines
    parameter integer LINE_SIZE  = 1    // words per cache line
)(
    input clk,
    input resetn,


    input         cpu_valid, // request from CPU to read data
    output        cpu_ready, // data is ready to be read by the CPU
    input  [23:0] cpu_addr, // address to read from
    output [31:0] cpu_rdata, // data read by the CPU


    output        spimem_valid, // request read from SPI flash
    input         spimem_ready, // SPI flash is ready with data
    output [23:0] spimem_addr, // address to read from SPI flash
    input  [31:0] spimem_rdata, // data read from SPI flash

    input         mem_instr,
    input  wire   hit_count_reset,
    input  wire   miss_count_reset,
    output reg [31:0] hit_count,
    output reg [31:0] miss_count
);


    localparam integer CACHE_WORDS = CACHE_SIZE * LINE_SIZE;


    // Cache storage
    reg [31:0] cache_tag   [0:CACHE_SIZE-1];  // line tag (line address)
    reg [31:0] cache_data  [0:CACHE_WORDS-1];
    reg        cache_valid [0:CACHE_SIZE-1];


    // Fill state
    reg fill_active;
    reg [31:0] fill_tag;        // which memory block we are fetching
    reg [31:0] fill_index;      // which cache line we are writing into
    reg [31:0] fill_count;      // which word inside the line


    // Linear Feedback Shift Register (pseudo-random replacement)
    reg [31:0] lfsr;
    // Wire for the victim (making sure it is within range)
    wire [31:0] victim_index = lfsr % CACHE_SIZE;


    always @(posedge clk) begin
        if (!resetn)
            // LFSR can never be in 0 state as it will stay there
            lfsr <= 32'h1;
        else
            // These taps may look arbitary, but they ensure a max length sequence
            lfsr <= {lfsr[30:0], lfsr[31] ^ lfsr[21] ^ lfsr[1] ^ lfsr[0]};
    end


    // Address decode for input
    wire [31:0] cpu_word_addr = cpu_addr[23:2]; // As last two bits are byte position within word
    wire [31:0] cpu_line_addr = cpu_word_addr / LINE_SIZE; // Divide so all word addresses on the same line have the same line address
    wire [31:0] cpu_offset    = cpu_word_addr % LINE_SIZE; // Adress offset within a line


    // Cache lookup (FULL SEARCH)
    integer i;
    reg cache_hit;
    reg [31:0] hit_index;


    always @(*) begin
        cache_hit = 0;
        hit_index = 0;


        for (i = 0; i < CACHE_SIZE; i = i + 1) begin
            // Check if the line is valid and if the input line address is present
            if (cache_valid[i] && cache_tag[i] == cpu_line_addr) begin
                cache_hit = 1;
                hit_index = i;
            end
        end
    end


    // Start reading from flash if (no hit or flash not currently being read), given that cpu has requested a read
    wire start_fill = cpu_valid && !cache_hit && !fill_active;


    // Fill state helpers
    wire [31:0] fill_cur_tag    = fill_active ? fill_tag   : cpu_line_addr;
    wire [31:0] fill_cur_index  = fill_active ? fill_index : victim_index;
    wire [31:0] fill_cur_count  = fill_active ? fill_count : 0;


    wire [31:0] fill_cache_word =
        fill_cur_index * LINE_SIZE + fill_cur_count;
        // Where we are filling data IN


    wire [31:0] fill_mem_addr =
        (fill_cur_tag * LINE_SIZE + fill_cur_count);
        // Where we are reading FROM SPI flash


    // SPI interface
    assign spimem_valid = fill_active || start_fill; // Output sends request signal to SPI
    assign spimem_addr  = {fill_mem_addr[21:0], 2'b00}; // Output sends relevant adress


    // Main state machine
    always @(posedge clk) begin
        if (!resetn) begin
            fill_active <= 0;


            for (i = 0; i < CACHE_SIZE; i = i + 1)
                cache_valid[i] <= 0;

            hit_count  <= 32'b0;
            miss_count <= 32'b0;

        end else begin

            if (hit_count_reset)  hit_count  <= 32'b0;
            if (miss_count_reset) miss_count <= 32'b0;

            if (cpu_valid && cache_hit) hit_count <= hit_count + 1;

            // invalidate victim on miss start (so it can't accidentally be read from)
            if (start_fill)
                cache_valid[victim_index] <= 0;


            // SPI response
            if (spimem_valid && spimem_ready) begin


                cache_data[fill_cache_word] <= spimem_rdata;




                if (fill_cur_count == LINE_SIZE - 1) begin
                    // finish line fill
                    cache_tag[fill_cur_index]   <= fill_cur_tag;
                    cache_valid[fill_cur_index] <= 1;
                    fill_active <= 0;
                    miss_count  <= miss_count + 1;

                end else begin
                    // continue filling
                    fill_active <= 1;
                    fill_tag    <= fill_cur_tag;
                    fill_index  <= fill_cur_index;
                    fill_count  <= fill_cur_count + 1;
                end
            end


            // start fill
            else if (start_fill) begin
                fill_active <= 1;
                fill_tag    <= cpu_line_addr;
                fill_index  <= victim_index;
                fill_count  <= 0;
            end
        end
    end


    // CPU outputs
    assign cpu_ready =
        cpu_valid &&
        (cache_hit ||
        (spimem_valid && spimem_ready && fill_cur_count == LINE_SIZE - 1));


    assign cpu_rdata =
        cache_hit
            ? cache_data[hit_index * LINE_SIZE + cpu_offset]
            : (cpu_offset == fill_cur_count
                ? spimem_rdata
                : cache_data[fill_cache_word]);


endmodule

// Implementation note:
// Replace the following two modules with wrappers for your SRAM cells.

module picosoc_regs (
	input clk, wen,
	input [5:0] waddr,
	input [5:0] raddr1,
	input [5:0] raddr2,
	input [31:0] wdata,
	output [31:0] rdata1,
	output [31:0] rdata2
);
	reg [31:0] regs [0:31];

	always @(posedge clk)
		if (wen) regs[waddr[4:0]] <= wdata;

	assign rdata1 = regs[raddr1[4:0]];
	assign rdata2 = regs[raddr2[4:0]];
endmodule

module picosoc_mem #(
	parameter integer WORDS = 256
) (
	input clk,
	input [3:0] wen,
	input [21:0] addr,
	input [31:0] wdata,
	output reg [31:0] rdata
);
	reg [31:0] mem [0:WORDS-1];

	always @(posedge clk) begin
		rdata <= mem[addr];
		if (wen[0]) mem[addr][ 7: 0] <= wdata[ 7: 0];
		if (wen[1]) mem[addr][15: 8] <= wdata[15: 8];
		if (wen[2]) mem[addr][23:16] <= wdata[23:16];
		if (wen[3]) mem[addr][31:24] <= wdata[31:24];
	end
endmodule
