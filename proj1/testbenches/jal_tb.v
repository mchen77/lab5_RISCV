// ENGN1640 Lab5
// SUltan & Michael
//
// RISCV testbench w/o memory

`timescale 100ns/1ns

module jal_tb ();
    reg CLOCK_50;
    reg [31:0] instr;
    wire [10:0] PC;
    wire [10:0] PC_next, PC_plus;
    wire run;
    wire [31:0] Y;

    lab05_for_test TEST(CLOCK_50, PC, Y, instr, PC_next, PC_plus,run);

    always #0.5 CLOCK_50 = ~CLOCK_50;

    always @(posedge CLOCK_50) begin
        $display("%t PC=%h PC_next=%h PC_plus=%h Y=%h instr=%h run=%b",  $time,  PC, PC_next, PC_plus,Y, instr, run);
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
        instr = 32'h00900113;
        #1;
        instr = 32'h00102023;
        #1;
        instr = 32'h0000007f;
        #1;
        
        $stop;

    end


endmodule
