// ENGN1640 Lab5 RISC-V
// Sultan Daniels & Michael Chen
//
// main module for RISC-V processor

module lab05(
	input CLOCK_50

);

	wire [31:0] instr;
	wire clk;
	wire clk_shift;
	reg [7:0] PC;

	initial PC = 8'b0;

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
	wire [31:0] Y; // commented out for debug

	// reg_file
	wire [4:0] rr1 = instr[19:15];
	wire [4:0] rr2 = instr[24:20];
	wire [4:0] wr  = instr[11: 7];
	wire [31:0] rd1;
	wire [31:0] rd2;
	wire [31:0] wd;

	// imm_gen
	wire [31:0] out;

	// memory
	wire [31:0] mem_dout;
	wire [7:0]  mem_addr = Y[7:0];

	// module instantiations
	imm_gen ig (instr, out);

	control_unit ctrl (form_code, aluop, Branch, MemRead, MemtoReg,
						MemWrite, ALUSrc, RegWrite);

	reg_file rf (clk_shift, RegWrite, wd, rr1, rr2, wr, rd1, rd2);

	alu_control alu_ctrl(instr_split, aluop, aluopcode);

	alu a1 (Y, zero, A, B, aluopcode);

	// COMMENT OUT FOR TESTBENCH
	lab5_ram ram(mem_addr, clk, rd2, MemRead, MemWrite, mem_dout);

	// ROMS
	//rom_lab5 rom(PC, clk_shift, instr);
   rom_prog2 rom2(PC,	clk_shift, instr);
	//load_rom rom3(PC,	clk_shift, instr);
//  	rom_branch rom4(PC, clk_shift, instr);
	//rom_jal rom5(PC, clk_shift, instr);

	// PLL
	pll_lab5 pll(CLOCK_50, 1'b0, clk, clk_shift);

	// ALU logic
	assign A = rd1;						// first input to ALU
	assign B = (ALUSrc) ? out : rd2;	// second input to ALU, (1 imm_gen, 0 rd2)

	wire [31:0] data_interm;
	assign data_interm = (MemtoReg) ? mem_dout : Y;

	assign wd = (Branch & RegWrite) ? PC_plus: data_interm;

	wire [7:0] PC_next;
	wire [7:0] PC_offset;
	wire [7:0] PC_plus;
	// when we check for instr != 32'h7, it doesnt like it and doesnt print correctly
	reg halt;
	always @(posedge clk_shift) begin
		if (PC_plus == 32'h7f) begin
			halt <= 1'b1;
		end else begin
			halt <= 1'b0;
		end
	end
	always @(posedge clk) begin
		if (~halt) PC <= PC + PC_next; //PC_next works for branching, not prog2
	end

	// Branching control
	assign PC_plus = PC + 8'h4;
	assign PC_offset = (out << 1) + PC;
	assign PC_next = (to_branch && Branch) ? PC_offset : PC_plus; //if ALU output is zero -> branch

	//BRANCH control
	//instruction 12 is bne or beq
	wire to_branch; //branch condition
	assign to_branch = instr[12] ^ zero;

	//for jump and link, wd = PC + 4


endmodule
