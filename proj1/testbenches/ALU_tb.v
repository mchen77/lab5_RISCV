// ENGN1640 Lab5
// RISCV
// ALU Testbench

`timescale 100ns/1ns

module alu_tb();

	wire 	[31:0] 	Y;                      
	wire 			zero;
	
	reg 	[31:0] 	A;
	reg 	[31:0] 	B;
	reg 	[3:0] 	opcode;
  
	alu dut (
			.Y					(Y),                      
			.zero				(zero),
			.A					(A),
			.B					(B),
			.opcode				(opcode)
	);
  
	initial begin
		$monitor("%t op=%b A=%d B=%d Y=%d zero=%b", $time, opcode, A, B, Y, zero);

		#0;
		opcode = 4'b0000; 	// AND
		A = 32'h0005;
		B = 32'h0004;		// 32'h0004
		#1;
		opcode = 4'b0001;	// OR
		A = 32'h0007;
		B = 32'h0008;		// 32'h000f
	 	#1;
		opcode = 4'b0010;	// ADD
		A = 32'h0005;
		B = 32'h0004;		// 32'h0009
		#1;
		opcode = 4'b0110;	// SUB
		A = 32'h0009;
		B = 32'h0004;		// 32'h0005
		#1;
		opcode = 4'b0110;	// SUB w/ zero
		A = 32'h0007;
		B = 32'h0007;		// 32'h0000, zero = 1
		#1;
		opcode = 4'b0111;	// MUL
		A = 32'h0003;
		B = 32'h0004;		// 32'h000c
		#1;
		$stop;

	end
endmodule