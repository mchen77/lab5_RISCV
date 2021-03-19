module lab05(input CLOCK_5O);
	input CLOCK_50; //clock
	
	wire [6:0] form_code = instr[6:0];
	wire [1:0] aluop;
	wire	Branch;
	wire  MemRead;
	wire  MemtoReg;
	wire  MemWrite;
	wire  ALUSrc;
	wire RegWrite;
	
	control_unit cntrl(
	.instr (form_code),
	aluop .(aluop),
	output	Branch,
	output  MemRead,
	output  MemtoReg,
	output  MemWrite,
	output  ALUSrc,
	output  RegWrite//,
	//output reg  halt
);
endmodule
