`timescale 1ns/1ps

module picorv32_pcpi_div_tb;

	reg clk = 0;
	reg resetn = 0;

	reg         pcpi_valid;
	reg [31:0]  pcpi_insn;
	reg [31:0]  pcpi_rs1;
	reg [31:0]  pcpi_rs2;

	wire        pcpi_wr;
	wire [31:0] pcpi_rd;
	wire        pcpi_wait;
	wire        pcpi_ready;

	// DUT
	picorv32_pcpi_div dut (
		.clk(clk),
		.resetn(resetn),

		.pcpi_valid(pcpi_valid),
		.pcpi_insn(pcpi_insn),
		.pcpi_rs1(pcpi_rs1),
		.pcpi_rs2(pcpi_rs2),

		.pcpi_wr(pcpi_wr),
		.pcpi_rd(pcpi_rd),
		.pcpi_wait(pcpi_wait),
		.pcpi_ready(pcpi_ready)
	);

	always #5 clk = ~clk;

	// funct3 values
	localparam DIV  = 3'b100;
	localparam DIVU = 3'b101;
	localparam REM  = 3'b110;
	localparam REMU = 3'b111;

	task run_test;
		input [2:0] funct3;
		input [31:0] rs1;
		input [31:0] rs2;
		input [31:0] expected;

		begin
			@(posedge clk);

			pcpi_rs1   <= rs1;
			pcpi_rs2   <= rs2;
			pcpi_valid <= 1'b1;

			// RV32M instruction encoding
			pcpi_insn <= {
				7'b0000001, // funct7
				5'd0,       // rs2 field ignored by decoder
				5'd0,       // rs1 field ignored by decoder
				funct3,
				5'd0,
				7'b0110011
			};

			@(posedge clk);
			pcpi_valid <= 0;

			wait (pcpi_ready);

			if (pcpi_rd !== expected) begin
				$display("FAIL funct3=%b rs1=%0d rs2=%0d got=%0d expected=%0d",
					funct3, $signed(rs1), $signed(rs2),
					$signed(pcpi_rd), $signed(expected));
				$finish;
			end

			$display("PASS funct3=%b rs1=%0d rs2=%0d result=%0d",
				funct3, $signed(rs1), $signed(rs2),
				$signed(pcpi_rd));

			@(posedge clk);
		end
	endtask

	initial begin

		pcpi_valid = 0;
		pcpi_insn  = 0;
		pcpi_rs1   = 0;
		pcpi_rs2   = 0;

		repeat (5) @(posedge clk);
		resetn = 1;

		run_test(DIV,  100, 7, 14);
		run_test(DIVU, 100, 7, 14);
		run_test(REM,  100, 7, 2);
		run_test(REMU, 100, 7, 2);
		run_test(DIV,  -100, 7, -14);
		run_test(REM,  -100, 7, -2);
		run_test(DIV,  100, -7, -14);
		run_test(REM,  100, -7, 2);
		run_test(DIV,  -100, -7, 14);
		run_test(REM,  -100, -7, -2);

		$display("ALL TESTS PASSED");
		$finish;
	end

endmodule: picorv32_pcpi_div_tb