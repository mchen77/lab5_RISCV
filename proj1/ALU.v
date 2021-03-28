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
  input [4:0] opcode
  );

  assign zero = (Y == 32'd0) ? 1'b1 : 1'b0;

//  always@(*) begin
//    case(opcode)
//      5'b00111: begin    // AND
//			Y = A & B;
//      end
//      5'b00110: begin    // OR
//			Y = A | B;
//      end
//      5'b00000: begin		// ADD
//			Y = A + B;
//      end
//      5'b10000: begin		// SUB
//			Y = A - B;
//      end
//		5'b01000: begin		// MUL
//			Y = A * B;
//		end
//		5'b00001: begin		// SLLI
//			Y = A << B;
//		end
//		default: Y = A + B;
//    endcase
//  end

	assign Y = (opcode == 5'b00111) ? A & B: 
						(opcode == 5'b00110) ? A | B:
						(opcode == 5'b00000) ? A + B:
						(opcode == 5'b10000) ? A - B:
						(opcode == 5'b01000) ? A * B:
						(opcode == 5'b00001) ? A << B:
						A + B;
endmodule
