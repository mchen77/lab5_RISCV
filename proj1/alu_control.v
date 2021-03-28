// ENGN1640 Lab5

module alu_control (
	input 		[4:0] instr_split,	// {instr[30],instr[25], instr[14:12] (funct3)}
	input 		[1:0] aluop,
	output wire 	[4:0] aluopcode
);

//	always@(*) begin
//		case(aluop)
//			2'b00: begin		// S-type (add)
//				aluopcode = 5'b00000;
//			end
//			2'b01: begin		// B-type (sub)
//				aluopcode = 5'b10000;
//			end
//			2'b10: begin		// R-type (funct3 business)
//				aluopcode = instr_split;
//			end
//			2'b11: begin		// I-type (funct3 business)
//				aluopcode = {2'b0, instr_split[2:0]};
//			end
//			default: aluopcode = instr_split;
//		endcase
//
//	end

assign aluopcode = (aluop == 2'b00) ? 5'b00000: (aluop == 2'b01) ? 5'b10000:
							(aluop == 2'b10) ? instr_split: 
							(aluop == 2'b11) ? {2'b0, instr_split[2:0]}:
							5'b00000;
	
endmodule
