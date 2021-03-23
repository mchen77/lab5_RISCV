module lab05(CLOCK_50);
   input CLOCK_50;

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			ALUSrc;			// From ctrl of control_unit.v
   wire			Branch;			// From ctrl of control_unit.v
   wire			MemRead;		// From ctrl of control_unit.v
   wire			MemWrite;		// From ctrl of control_unit.v
   wire			MemtoReg;		// From ctrl of control_unit.v
   wire			RegWrite;		// From ctrl of control_unit.v
   wire signed [31:0]	Y;			// From a1 of ALU.v
   wire [1:0]		aluop;			// From ctrl of control_unit.v
   wire [4:0]		aluopcode;		// From aluctrl of alu_control.v
   wire [31:0]		out;			// From ig of imm_gen.v
   wire [31:0]		q;			// From ram of lab5_ram.v
   wire [31:0]		rd1;			// From rf of reg_file.v
   wire [31:0]		rd2;			// From rf of reg_file.v
   wire			zero;			// From a1 of ALU.v
   // End of automatics

   wire [31:0] 		instr;     // isntruction from ROM
	wire [6:0]			form_code = instr[6:0];
   wire [7:0] 			address;   // address to RAM
   wire 					halt;      // HALT flag
   reg  [10:0] 		PC;        // PC current
   wire [10:0]			PC_next;   // PC next to be latched
	wire [10:0]			PC_plus;   // PC + 4
   wire [10:0]			PC_offset; // PC offset for branching
	wire 					to_branch; // branch condition
   wire [31:0] 		wd;        // write data for reg_file
   wire [31:0] 		A;         // ALU input A
   wire [31:0] 		B;         // ALU input B

   wire 		outclk_0; // PLL output clock
   wire 		outclk_1; // PLL output clock shifted

	parameter R = 7'b0110011, I = 7'b0010011, S = 7'b0100011, L = 7'b0000011,
				 B_type = 7'b1100011, JAL = 7'b1101111, JALR = 7'b1100111;
	wire run;
	assign run = ((form_code != R) & (form_code != I) & (form_code != S) & (form_code != L) & (form_code != B_type) & (form_code != JAL) & (form_code != JALR)) ? 1'b0: 1'b1;

	always @(posedge outclk_0) begin
	  if (run)
	  PC <= PC_next;//PC_next; //PC_next works for branching, not prog2
	end

	assign PC_plus = PC + 11'h4;
	assign PC_offset = (form_code == JALR) ? Y[10:0]: (out << 1) + PC;
	assign PC_next = ((to_branch & Branch) | (form_code == JAL)) ? PC_offset : PC_plus; //if ALU output is zero -> branch
	assign to_branch = instr[12] ^ zero;


   assign A = rd1;
   assign B = (ALUSrc) ? out : rd2;  // 1 = immediate, 0 = rd2

   wire [31:0] regData; //either memory or alu data
   assign regData = (MemtoReg) ? q : Y;

   assign wd = (form_code == JAL | form_code == JALR) ? {{22{PC_plus[10]}}, PC_plus}: regData; //write data

   control_unit ctrl (/*AUTOINST*/
		      // Outputs
		      .aluop		(aluop[1:0]),
		      .Branch		(Branch),
		      .MemRead		(MemRead),
		      .MemtoReg		(MemtoReg),
		      .MemWrite		(MemWrite),
		      .ALUSrc		(ALUSrc),
		      .RegWrite		(RegWrite),
		      // Inputs
		      .instr		(instr[6:0]));

   /* reg_file AUTO_TEMPLATE(
    .clk (outclk_1),
    .rr1 (instr[19:15]),
    .rr2 (instr[24:20]),
    .wr  (instr[11:7]),
    .wren (RegWrite),
    );*/
   reg_file rf (/*AUTOINST*/
		// Outputs
		.rd1			(rd1[31:0]),
		.rd2			(rd2[31:0]),
		// Inputs
		.clk			(outclk_1),		 // Templated
		.wren			(RegWrite),		 // Templated
		.rr1			(instr[19:15]),		 // Templated
		.rr2			(instr[24:20]),		 // Templated
		.wr			(instr[11:7]),		 // Templated
		.wd			(wd[31:0]));

   /*ALU AUTO_TEMPLATE(
    .opcode (aluopcode[4:0]),
    );*/
   ALU a1 (/*AUTOINST*/
	   // Outputs
	   .Y				(Y[31:0]),
	   .zero			(zero),
	   // Inputs
	   .A				(A[31:0]),
	   .B				(B[31:0]),
	   .opcode			(aluopcode[4:0]));	 // Templated

   /*alu_control AUTO_TEMPLATE(
    .instr_split  ({instr[30], instr[25], instr[14:12]}),
    );*/
   alu_control aluctrl (/*AUTOINST*/
			// Outputs
			.aluopcode	(aluopcode[4:0]),
			// Inputs
			.instr_split	({instr[30], instr[25], instr[14:12]}), // Templated
			.aluop		(aluop[1:0]));

   imm_gen ig (/*AUTOINST*/
	       // Outputs
	       .out			(out[31:0]),
	       // Inputs
	       .instr			(instr[31:0]));

   /*lab5_ram AUTO_TEMPLATE(
    .clock (outclk_0),
    .rden  (MemRead),
    .wren  (MemWrite),
    .data  (rd2),
    .address (Y[7:0]),
    )*/
   lab5_ram ram (/*AUTOINST*/
		 // Outputs
		 .q			(q[31:0]),
		 // Inputs
		 .address		(Y[7:0]),		 // Templated
		 .clock			(outclk_0),		 // Templated
		 .data			(rd2),			 // Templated
		 .rden			(MemRead),		 // Templated
		 .wren			(MemWrite));		 // Templated

   /*rom_lab5 AUTO_TEMPLATE(
   //  .clock (outclk_1),
   //  .address (PC[9:2]),
   //  .q (instr[31:0]),);*/
//   rom_lab5 rom1(/*AUTOINST*/
//    		 // Outputs
//    		 .q			(instr[31:0]),
//    		 // Inputs
//    		 .address		(PC[9:2]),
//    		 .clock			(outclk_1));

   /*rom_prog2 AUTO_TEMPLATE(
     .clock (outclk_1),
     .address (PC[9:2]),
     .q (instr[31:0]),
   );*/
//   rom_prog2 rom2(/*AUTOINST*/
//		  // Outputs
//		  .q			(instr[31:0]),
//		  // Inputs
//    	.address		(PC[9:2]),
//		  .clock		(outclk_1));

   /*load_rom AUTO_TEMPLATE(
     .clock (outclk_1),
     .address (PC[9:2]),
     .q (instr[31:0]),
    );*/
//   load_rom rom3 (/*AUTOINST*/
//		  // Outputs
//		  .q			(instr[31:0]),
//		  // Inputs
//		  .address		(PC[9:2]),
//		  .clock		(outclk_1));

   /*rom_branch AUTO_TEMPLATE(
    .clock (outclk_1),
    .address (PC[9:2]),
    .q (instr[31:0]),
   );*/
//   rom_branch rom4(/*AUTOINST*/
//		   // Outputs
//		   .q			(instr[31:0]),		 // Templated
//		   // Inputs
//		   .address		(PC[9:2]),		 // Templated
//		   .clock		(outclk_1));		 // Templated

   /*rom_jal AUTO_TEMPLATE(
    .clock (outclk_1),
    .address (PC[9:2]),
    .q (instr[31:0]),
    );*/
//   rom_jal rom5 (/*AUTOINST*/
//		 // Outputs
//		 .q			(instr[31:0]),		 // Templated
//		 // Inputs
//		 .address		(PC[9:2]),		 // Templated
//		 .clock			(outclk_1));		 // Templated

   /*factorial AUTO_TEMPLATE(
    .clock (outclk_1),
    .address (PC[9:2]),
    .q (instr[31:0]),
    );*/
   factorial rom6 (/*AUTOINST*/
		   // Outputs
		   .q			(instr[31:0]),		 // Templated
		   // Inputs
		   .address		(PC[9:2]),		 // Templated
		   .clock		(outclk_1));		 // Templated

   /*pll_lab5 AUTO_TEMPLATE(
    .refclk (CLOCK_50),
    .rst (1'b0),)*/
   pll_lab5 p1 (/*AUTOINST*/
		// Outputs
		.outclk_0		(outclk_0),
		.outclk_1		(outclk_1),
		// Inputs
		.refclk			(CLOCK_50),		 // Templated
		.rst			(1'b0));			 // Templated

endmodule
