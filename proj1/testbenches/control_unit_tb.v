// ENGN1640 LAB5
// contorl unit testbench

`timescale 100ns/1ns

module control_unit_tb();
    reg 	[6:0] instr;
	wire    [1:0] aluop;
	wire	Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;

    control_unit dut(
	.instr 	(instr),
    .aluop  (aluop),
    .Branch (Branch), 
    .MemRead (MemRead), 
    .MemtoReg (MemtoReg), 
    .MemWrite (MemWrite), 
    .ALUSrc (ALUSrc), 
    .RegWrite (RegWrite));


    initial begin
        $monitor("%t instr=%b aluop=%b Branch=%b MemRead=%b MemtoReg=%b MemWrite=%b ALUSrc=%b RegWrite=%b", 
                 $time, instr,aluop,Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite);

        #0;
        instr = 7'b0110011; // R-type
        #1;
        instr = 7'b0010011; // I-type
        #1;
        instr = 7'b0100011; // S-type
        #1;
        instr = 7'b0000011; // L-type
        #1;
        instr = 7'b1100011; // B-type
        #1;
        instr = 7'b0000000; // default
        #1;
        $stop;
        
    end


endmodule