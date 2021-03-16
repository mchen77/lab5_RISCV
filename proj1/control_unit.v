// ENGN1640 LAB5
//	Sultan & Michael
//
//	control unit module

module control_unit(
	input 	[6:0] instr,
	output reg [1:0] aluop,
	output reg	Branch,
	output reg  MemRead,
	output reg  MemtoReg,
	output reg  MemWrite,
	output reg  ALUSrc,
	output reg  RegWrite
);


	always@(*) begin
		case(instr)
			7'b0110011: begin		// R-type
				Branch 	= 1'b0;
				MemRead 	= 1'b0;
				MemtoReg = 1'b0;
				MemWrite	= 1'b0;
				ALUSrc	= 1'b0;	// 0-register, 1 imm_gen
				RegWrite	= 1'b1;
				aluop		= 2'b10;	// alu_control
			end
			7'b0010011: begin		// I-type
				Branch 	= 1'b0;
				MemRead 	= 1'b0;
				MemtoReg = 1'b0;
				MemWrite	= 1'b0;
				ALUSrc	= 1'b1;	// 0-register, 1 imm_gen
				RegWrite	= 1'b1;
				aluop		= 2'b10;	// alu_control
			end
			7'b0100011: begin		// S-type
				Branch 	= 1'b0;
				MemRead 	= 1'b0;
				MemtoReg = 1'b0;
				MemWrite	= 1'b1;
				ALUSrc	= 1'b1;	// 0-register, 1 imm_gen
				RegWrite	= 1'b0;
				aluop		= 2'b00;	// alu_control
			end
			7'b0000011: begin		// L-type
				Branch 	= 1'b0;
				MemRead 	= 1'b1;
				MemtoReg = 1'b1;
				MemWrite	= 1'b0;
				ALUSrc	= 1'b1;	// 0-register, 1 imm_gen
				RegWrite	= 1'b1;
				aluop		= 2'b00;	// alu_control (ADD)
			end
			7'b1100011: begin		// B-type
				Branch 	= 1'b1;
				MemRead 	= 1'b0;
				MemtoReg = 1'b0;
				MemWrite	= 1'b0;
				ALUSrc	= 1'b0;	// 0-register, 1 imm_gen
				RegWrite	= 1'b0;
				aluop		= 2'b01;	// alu_control
			end
			7'b1101111: begin		// JAL
				Branch 	= 1'b1;
				MemRead 	= 1'b0;
				MemtoReg = 1'b0;
				MemWrite	= 1'b0;
				ALUSrc	= 1'b0;	// 0-register, 1 imm_gen
				RegWrite	= 1'b1;
				aluop		= 2'b01;	// alu_control
			end
			7'b1100111: begin		// JALR
				Branch 	= 1'b1;
				MemRead 	= 1'b0;
				MemtoReg = 1'b0;
				MemWrite	= 1'b0;
				ALUSrc	= 1'b1;	// 0-register, 1 imm_gen
				RegWrite	= 1'b1;
				aluop		= 2'b00;	// alu_control
			end
			7'b1111111: begin
				Branch 	= 1'b0;
				MemRead 	= 1'b0;
				MemtoReg = 1'b0;
				MemWrite	= 1'b0;
				ALUSrc	= 1'b0;	// 0-register, 1 imm_gen
				RegWrite	= 1'b0;
				aluop		= 2'b00;	// alu_control
			end
			default: begin
				Branch 	= 1'b0;
				MemRead 	= 1'b0;
				MemtoReg = 1'b0;
				MemWrite	= 1'b0;
				ALUSrc	= 1'b0;	// 0-register, 1 imm_gen
				RegWrite	= 1'b0;
				aluop		= 2'b00;	// alu_control
			end
		endcase
	end

endmodule
