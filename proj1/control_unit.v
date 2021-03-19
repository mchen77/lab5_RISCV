// ENGN1640 LAB5
//	Sultan & Michael
//
//	control unit module

module control_unit(
	input 	[6:0] instr,
	output [1:0] aluop,
	output	Branch,
	output  MemRead,
	output  MemtoReg,
	output  MemWrite,
	output  ALUSrc,
	output  RegWrite//,
	//output reg  halt
);
assign Branch	  = (instr == 7'b0110011) ? 1'b0:
							  	(instr == 7'b0010011) ? 1'b0:
									(instr == 7'b0100011) ? 1'b0:
									(instr == 7'b0000011) ? 1'b0:
									(instr == 7'b1100011) ? 1'b1:
									(instr == 7'b1101111) ? 1'b1:
									(instr == 7'b1100111) ? 1'b1: 1'b0;
assign MemRead  = (instr == 7'b0110011) ? 1'b0:
									(instr == 7'b0010011) ? 1'b0:
									(instr == 7'b0100011) ? 1'b0:
									(instr == 7'b0000011) ? 1'b1:
									(instr == 7'b1100011) ? 1'b0:
									(instr == 7'b1101111) ? 1'b0:
									(instr == 7'b1100111) ? 1'b0: 1'b0;
assign MemtoReg = (instr == 7'b0110011) ? 1'b0:
									(instr == 7'b0010011) ? 1'b0:
									(instr == 7'b0100011) ? 1'b0:
									(instr == 7'b0000011) ? 1'b1:
									(instr == 7'b1100011) ? 1'b0:
									(instr == 7'b1101111) ? 1'b0:
									(instr == 7'b1100111) ? 1'b0: 1'b0;
assign MemWrite = (instr == 7'b0110011) ? 1'b0:
									(instr == 7'b0010011) ? 1'b0:
									(instr == 7'b0100011) ? 1'b1:
									(instr == 7'b0000011) ? 1'b0:
									(instr == 7'b1100011) ? 1'b0:
									(instr == 7'b1101111) ? 1'b0:
									(instr == 7'b1100111) ? 1'b0: 1'b0;
assign ALUSrc	  = (instr == 7'b0110011) ? 1'b0:
							 		(instr == 7'b0010011) ? 1'b1:
									(instr == 7'b0100011) ? 1'b1:
									(instr == 7'b0000011) ? 1'b1:
									(instr == 7'b1100011) ? 1'b0:
									(instr == 7'b1101111) ? 1'b0:
									(instr == 7'b1100111) ? 1'b1: 1'b0;
assign RegWrite = (instr == 7'b0110011) ? 1'b1:
									(instr == 7'b0010011) ? 1'b1:
									(instr == 7'b0100011) ? 1'b0:
									(instr == 7'b0000011) ? 1'b0:
									(instr == 7'b1100011) ? 1'b0:
									(instr == 7'b1101111) ? 1'b1:
									(instr == 7'b1100111) ? 1'b1: 1'b0;
assign aluop 		= (instr == 7'b0110011) ? 2'b10:
									(instr == 7'b0010011) ? 2'b11:
									(instr == 7'b0100011) ? 2'b00:
									(instr == 7'b0000011) ? 2'b00:
									(instr == 7'b1100011) ? 2'b01:
									(instr == 7'b1101111) ? 2'b01:
									(instr == 7'b1100111) ? 2'b00: 2'b00;

////make into assign statements
//	always@(*) begin
//	MemWrite = 1'b0;
//		case(instr)
//			7'b0110011: begin		// R-type
//				Branch 	= 1'b0;
//				MemRead 	= 1'b0;
//				MemtoReg = 1'b0;
//				MemWrite	= 1'b0;
//				ALUSrc	= 1'b0;	// 0-register, 1 imm_gen
//				RegWrite	= 1'b1;
//				aluop		= 2'b10;	// alu_control
//				//halt	= 1'b0;
//			end
//			7'b0010011: begin		// I-type
//				Branch 	= 1'b0;
//				MemRead 	= 1'b0;
//				MemtoReg = 1'b0;
//				MemWrite	= 1'b0;
//				ALUSrc	= 1'b1;	// 0-register, 1 imm_gen
//				RegWrite	= 1'b1;
//				aluop		= 2'b11;	// alu_control
//				//halt	= 1'b0;
//			end
//			7'b0100011: begin		// S-type
//				Branch 	= 1'b0;
//				MemRead 	= 1'b0;
//				MemtoReg = 1'b0;
//				MemWrite	= 1'b1;
//				ALUSrc	= 1'b1;	// 0-register, 1 imm_gen
//				RegWrite	= 1'b0;
//				aluop		= 2'b00;	// alu_control
//				//halt	= 1'b0;
//			end
//			7'b0000011: begin		// L-type
//				Branch 	= 1'b0;
//				MemRead 	= 1'b1;
//				MemtoReg = 1'b1;
//				MemWrite	= 1'b0;
//				ALUSrc	= 1'b1;	// 0-register, 1 imm_gen
//				RegWrite	= 1'b1;
//				aluop		= 2'b00;	// alu_control (ADD)
//				//halt	= 1'b0;
//			end
//			7'b1100011: begin		// B-type
//				Branch 	= 1'b1;
//				MemRead 	= 1'b0;
//				MemtoReg = 1'b0;
//				MemWrite	= 1'b0;
//				ALUSrc	= 1'b0;	// 0-register, 1 imm_gen
//				RegWrite	= 1'b0;
//				aluop		= 2'b01;	// alu_control
//				//halt	= 1'b0;
//			end
//			7'b1101111: begin		// JAL
//				Branch 	= 1'b1;
//				MemRead 	= 1'b0;
//				MemtoReg = 1'b0;
//				MemWrite	= 1'b0;
//				ALUSrc	= 1'b0;	// 0-register, 1 imm_gen
//				RegWrite	= 1'b1;
//				aluop		= 2'b01;	// alu_control
//				//halt	= 1'b0;
//			end
//			7'b1100111: begin		// JALR
//				Branch 	= 1'b1;
//				MemRead 	= 1'b0;
//				MemtoReg = 1'b0;
//				MemWrite	= 1'b0;
//				ALUSrc	= 1'b1;	// 0-register, 1 imm_gen
//				RegWrite	= 1'b1;
//				aluop		= 2'b00;	// alu_control
//				//halt	= 1'b0;
//			end
////			7'h7f: begin
////				Branch 	= 1'b0;
////				MemRead 	= 1'b0;
////				MemtoReg = 1'b0;
////				MemWrite	= 1'b0;
////				ALUSrc	= 1'b0;	// 0-register, 1 imm_gen
////				RegWrite	= 1'b0;
////				aluop		= 2'b00;	// alu_control
////				//halt	= 1'b1;
////			end
//			default: begin
//				Branch 	= 1'b0;
//				MemRead 	= 1'b0;
//				MemtoReg = 1'b0;
//				MemWrite	= 1'b0;
//				ALUSrc	= 1'b0;	// 0-register, 1 imm_gen
//				RegWrite	= 1'b0;
//				aluop		= 2'b00;	// alu_control
//				//halt	= 1'b1;
//			end
//		endcase
//	end

endmodule
