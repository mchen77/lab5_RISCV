// ENGN1640 Lab5 RISC-V
// Sultan Daniels & Michael Chen
// 
// main module for RISC-V processor

module lab05(clk, wren, wd, rr1, rr2, wr, rd1, rd2);
	input clk, wren; //clock and write enable ports
	input [5:0] rr1, rr2, wr; //5 bit register address inputs
	input [31:0] wd; //data to write
	output [31:0] rd1, rd2; //read data outputs
  
	wire	[32:0]	Y;
	wire 				zero;
	reg 	[32:0]	A, B;
	reg	[3:0]		opcode;
	
	reg_file r1(clk, wren, wd, rr1, rr2, wr, rd1, rd2);
	
	alu a1 (
		.Y 			(Y),                      
		.zero			(zero),
		.A				(A),
		.B				(B),
		.opcode		(opcode)
	);
	
	
endmodule
	