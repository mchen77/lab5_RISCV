//intermediate generator module
//takes in all 32 bits of instructions
//outputs the 12 bit immediate based on I-type or SB-type or S-type

module imm_gen(instr, out);
  input [31:0] instr; //32 bit instruction
  output reg [31:0] out;

  wire [6:0] opcode = instr[6:0];
  always @(*) begin
    case(opcode)
    7'b0010011: out <= {{20{instr[31]}}, instr[31:20]}; //I-type
    7'b0100011: out <= {{20{instr[31]}}, instr[31:25], instr[11:7]}; //S-type
    7'b1100011: out <= {{20{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8]}; //SB type
    7'b1101111: out <= {{12{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21]}; // JAL
    7'b1100111: out <= {{20{instr[31]}}, instr[31:20]}; // JALR
	  7'b0000011: out <= {{20{instr[31]}}, instr[31:20]}; //L-type
    default: out <= 32'd0;
	 endcase
 end

endmodule
