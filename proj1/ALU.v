// ENGN1640 LAB5
// RISC-V 
//
// ALU module

module alu
(
  output reg [31:0] Y,                      
  output zero,
  
  input [31:0] A,
  input [31:0] B,
  input [3:0] opcode
  );
  
  assign zero = (Y == 0) ? 1'b1 : 1'b0; 
  
  always@(*) begin
    case(opcode)
      4'b0000: begin    // AND
			Y = A & B;
      end
      4'b0001: begin    // OR
			Y = A | B;
      end
      4'b0010: begin		// ADD
			Y = A + B;
      end
      4'b0110: begin		// SUB
			Y = A - B;
      end
		4'b0111: begin		// MUL // is this opcode correct, no documentation on it
			Y = A * B;
		end
		default: Y = A + B;
    endcase
  end

endmodule
