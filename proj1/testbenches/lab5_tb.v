// ENGN1640 Lab5
// SUltan & Michael
//
// RISCV testbench w/o memory

`timescale 100ns/1ns

module lab5_tb ();
    reg CLOCK_50;
    reg [31:0] instr;
    wire [31:0] Y;
    wire [31:0] rd1,rd2;
    wire [31:0] out;

    lab05 dut (CLOCK_50, instr, Y, rd1, rd2, out);

    always #0.5 CLOCK_50 = ~CLOCK_50;

    always @(posedge CLOCK_50) begin
        $display("%t instr=%h Y=%h rd1=%h, rd2=%h, out=%h",  $time, instr, Y, rd1, rd2, out);
    end

    initial begin
        CLOCK_50 = 1'b0;
    end

    initial begin
        #0; 
        instr = 32'h00000093;
        #1;
        instr = 32'h01000113;
        #1;
        instr = 32'h06400193;
        #1;
        instr = 32'h00800213;
        #1;
        instr = 32'h002082b3;
        #1;
        instr = 32'h00418333;
        #1;

        $stop;
// 0x0050a023 // str instrs
// 0x00612223     

    end


endmodule