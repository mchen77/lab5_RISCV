// ENGN1640 LAB5
// RISC-V
//
// ALU module

module ALU
(
  output wire signed [31:0] Y,
  output zero,

  input signed [31:0] A,
  input signed [31:0] B,
  input signed [31:0] mult,
  input [4:0] opcode
  );

  assign zero = (Y == 32'd0) ? 1'b1 : 1'b0;

  assign Y = (opcode == 5'b00111) ? A & B: 
	 			 (opcode == 5'b00110) ? A | B:
				 (opcode == 5'b00000) ? A + B:
				 (opcode == 5'b10000) ? A - B:
				 (opcode == 5'b01000) ? mult:
				 (opcode == 5'b00001) ? A << B:
				 A + B;
endmodule
