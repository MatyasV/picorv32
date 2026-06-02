module spimem_cache_fully_associative #(
    parameter integer CACHE_SIZE = 8,   // number of cache lines
    parameter integer LINE_SIZE  = 1    // words per cache line
)(
    input clk,
    input resetn,

	input         cpu_valid, // request from CPU to read data
	output        cpu_ready, // data is ready to be read by the CPU
	input  [23:0] cpu_addr,	// address to read from
	output [31:0] cpu_rdata, // data read by the CPU

	output        spimem_valid, // request read from SPI flash
	input         spimem_ready, // SPI flash is ready with data
	output [23:0] spimem_addr, // address to read from SPI flash
	input  [31:0] spimem_rdata // data read from SPI flash
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

        end else begin

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