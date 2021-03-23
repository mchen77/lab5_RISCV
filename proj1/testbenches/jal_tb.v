// ENGN1640 Lab5
// SUltan & Michael
//
// RISCV testbench w/o memory

`timescale 100ns/1ns

module lab5_tb ();
    reg CLOCK_50;
    reg [31:0] instr;
    wire [10:0] PC;
    wire [31:0] rd2;

    lab05_for_test TEST(CLOCK_50, PC, rd2, instr);

    always #0.5 CLOCK_50 = ~CLOCK_50;

    always @(posedge CLOCK_50) begin
        $display("%t PC=%h rd2=%h instr=%h",  $time,  PC, rd2, instr);
    end

    initial begin
        CLOCK_50 = 1'b0;
    end

    initial begin
        #0;
        instr = 32'h00500293;
        #1;
        instr = 32'h00500293;
        #1;
        instr = 32'h00c000ef;
        #1;
        instr = 32'h00900113;
        #1;
        instr = 32'h00102023;
        #1;
        instr = 32'h0000007f;
        #1;
        instr = 32'h00102623;
        #1;
        instr = 32'h00502223;
        #1;
        instr = 32'h00402203;
        #1;
        instr = 32'h00402423;
        #1;
        instr = 32'h00008067;
        #1;
        $stop;

    end


endmodule
