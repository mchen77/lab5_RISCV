// ENGN1640 Lab5 RISC-V
// Sultan Daniels & Michael Chen
//
// main module for RISC-V processor

module lab05(
	input CLOCK_50,
	input [31:0] instr,
	output [31:0] Y	// debug
);
	// input clk, wren; //clock and write enable ports
	// input [5:0] rr1, rr2, wr; //5 bit register address inputs
	// input [31:0] wd; //data to write
	// output [31:0] rd1, rd2; //read data outputs


	// control_unit
	wire [6:0] form_code = instr[6:0];
	wire [1:0] aluop;	// 2-bits opcode to determine format (R,S, B-type)
	wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;

	// alu_control
	wire [4:0] instr_split = {instr[30],instr[25], instr[14:12]};
	wire [4:0] aluopcode;		// ALU opcode controller to determine function

	// alu
	wire [31:0] A;
	wire [31:0] B;
	wire zero;			// zero flag for branching
	// wire [31:0] Y; // commented out for debug

	// reg_file
	wire [4:0] rr1 = instr[19:15];
	wire [4:0] rr2 = instr[24:20];
	wire [4:0] wr  = instr[11: 7];
	wire [31:0] rd1;
	wire [31:0] rd2;

	// imm_gen
	wire [31:0] out;

	// memory
	wire [31:0] mem_dout;
	wire [7:0]  mem_addr = Y[7:0];

	// module instantiations
	imm_gen ig (instr, out);

	control_unit ctrl (form_code, aluop, Branch, MemRead, MemtoReg,
						MemWrite, ALUSrc, RegWrite);

	reg_file rf (CLOCK_50, RegWrite, Y, rr1, rr2, wr, rd1, rd2);

	alu_control alu_ctrl(instr_split, aluop, aluopcode);

	alu a1 (Y, zero, A, B, aluopcode);

	//COMMENT OUT FOR TESTBENCH
	//lab5_ram ram(mem_addr, CLOCK_50, rd2, MemWrite, mem_dout);


	// ALU logic
	assign A = rd1;						// first input to ALU
	assign B = (ALUSrc) ? out : rd2;	// second input to ALU, (1 imm_gen, 0 rd2)

	assign wd = (MemtoReg) ? mem_dout : Y;

endmodule
