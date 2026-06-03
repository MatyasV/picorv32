`timescale 1ns/1ps

module spimem_cache_direct_mapped_tb;

    // DUT inputs
    reg CLK;
    reg RESETN;
    reg CPU_VALID; // WE CAN JUST ASSUME THE CPU IS VALID FOR TB PURPOSES
  	reg [31:0] MEM_ADDR;
  	reg SPIMEM_READY;
  	reg [31:0] SPIMEM_RDATA;
  	reg MEM_INSTR;
  	reg HIT_COUNT_RESET;
  	reg MISS_COUNT_RESET;
  
  
     // DUT outputs
   	wire CPU_READY;
 	wire [31:0] CPU_RDATA;
  	wire SPIMEM_VALID;
  	wire [23:0] SPIMEM_ADDR;
  	wire [31:0] HIT_COUNT;
  	wire [31:0] MISS_COUNT;


    // Instantiate DUT
    spimem_cache_direct_mapped dut (
            .clk           (CLK),
            .resetn        (RESETN),
            .mem_instr	   (MEM_INSTR),
      		.cpu_valid     (CPU_VALID),
            .cpu_ready     (CPU_READY),
            .cpu_addr      (MEM_ADDR[23:0]),
            .cpu_rdata     (CPU_RDATA),

            .spimem_valid  (SPIMEM_VALID),
            .spimem_ready  (SPIMEM_READY),
            .spimem_addr   (SPIMEM_ADDR),
            .spimem_rdata  (SPIMEM_RDATA),

            .hit_count        (HIT_COUNT),
      		.miss_count       (MISS_COUNT),
            .hit_count_reset  (HIT_COUNT_RESET),
            .miss_count_reset (MISS_COUNT_RESET)

        );
  
    	// SIMULATE MEMORY
      reg [31:0] mem [0:65535];
      integer i;
      initial begin
          for(i=0;i<65536;i=i+1)
            mem[i] = 32'h00000000 + i; // Each memory just goes up from zero
    	end
  
  
  	initial begin
    	$dumpfile("wave.vcd");
    	$dumpvars(0, spimem_cache_direct_mapped_tb);
	end
  
    // Clock generation
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

  	// Simulate flash memory
    reg [2:0] delay;
    reg busy;

    always @(posedge CLK) begin
        if (!RESETN) begin
            SPIMEM_READY <= 0;
            delay <= 0;
            busy <= 0;
        end else begin

            // accept request (only once)
            if (SPIMEM_VALID && !busy) begin
                busy  <= 1;
                delay <= 6;   // Pick the #cycles for response
            end

            // wait period
            if (busy && delay != 0) begin
                delay <= delay - 1;
                SPIMEM_READY <= 0;
            end

            // respond
            if (busy && delay == 0) begin
              // Convert byte address to word address
              SPIMEM_RDATA <= mem[SPIMEM_ADDR >> 2];
                SPIMEM_READY <= 1;
                busy <= 0;
            end else begin
                SPIMEM_READY <= 0;
            end

        end
    end
  
    task automatic read_addr(input [31:0] addr);
      begin
        MEM_ADDR  = addr;
        CPU_VALID = 1;

        wait(CPU_READY);
        @(posedge CLK);

        $display("addr=%h data=%h hits=%0d misses=%0d",
                 addr, CPU_RDATA, HIT_COUNT, MISS_COUNT);

        CPU_VALID = 0;
        @(posedge CLK);
      end
    endtask
  
    initial begin

        // Initial state
      	CPU_VALID = 0; // Cpu presents request
        MEM_INSTR = 0; // Read operation
      	MEM_ADDR = 32'h00100000; // Set address to fetch
      	SPIMEM_READY = 0; // 0 in idle state
      	HIT_COUNT_RESET = 0; // We don't care about these
      	MISS_COUNT_RESET = 0;
      
    	RESETN = 0;
      	#10
      	RESETN = 1;
     	#10
      
      	read_addr(32'h00100000);
      	#100
      	// Try reading the next address
      	read_addr(32'h00100004);
      	#100
      	// Read a random address (simulates a jump)
      	read_addr(32'h0010052C);
      	#100
      
      	// Now read an address that evicts the first and try to read the first again
      	read_addr(32'h00101000);
      	#100
      	read_addr(32'h00100000);
      	#100
      
      	// Finally simulate sequential memory access
      	read_addr(32'h0010E000);
      	#100
      	read_addr(32'h0010E004);
      	#100
      	read_addr(32'h0010E008);
      	#100
      	// ETC CBA to read 8 words
      	read_addr(32'h0010E01F);
        #100
      	// Then next address is over a line away from previous fetch so should be a miss
      	read_addr(32'h0010E020);      
                  
      	#1000;
    	$finish;
     
    end

endmodule : spimem_cache_direct_mapped_tb