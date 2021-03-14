// ENGN1640 Lab5
// Sultan & Michael
//
// RISCV testbench w/o memory

`timescale 100ns/1ns

module lab5_prog2_test ();
    reg CLOCK_50;
    reg [31:0] instr;
    wire [31:0] Y;
    wire [31:0] rd1,rd2;
    wire [31:0] out;

    lab05_for_test dut (CLOCK_50, instr, Y, rd1, rd2, out);

    always #0.5 CLOCK_50 = ~CLOCK_50;

    always @(posedge CLOCK_50) begin
        $display("%t instr=%h Y=%h rd1=%h rd2=%h out=%h",  $time, instr, Y, rd1, rd2, out);
    end

    initial begin
        CLOCK_50 = 1'b0;
    end

    initial begin
        #0;
        instr = 32'h00800293;
        #1;
        instr = 32'h00f00313;
        #1;
        instr = 32'h0062a023;
        #1;
        instr = 32'h005303b3;
        #1;
        instr = 32'h40530e33;
        #1;
        instr = 32'h03c384b3;
        #1;
        instr = 32'h00428293;
        #1;
        instr = 32'hffc2a903;
        #1;
        instr = 32'h41248933;
        #1;
        instr = 32'h00291913;
        #1;
        instr = 32'h0122a023;

        #1;

        $stop;
// 0x0050a023 // str instrs
// 0x00612223

    end


endmodule
