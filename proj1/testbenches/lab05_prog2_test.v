// ENGN1640 Lab5
// Sultan & Michael
//
// RISCV testbench w/o memory

`timescale 100ns/1ns

module lab05_prog2_test();
    reg CLOCK_50;
    wire [31:0] instr;
    wire [10:0] PC;
    wire [10:0] PC_next, PC_plus, PC4;
    wire run;
    wire [31:0] Y, A, B, rd1, rd2;
    wire [7:0] ram_addr;
    wire [4:0] write_addr;
    wire [4:0] rom_addr;
    wire jump, ALUSrc;
    wire [31:0] wd;
    wire [1:0] aluop;

    lab05_for_test TEST(CLOCK_50, PC, Y, instr, PC_next, PC_plus,run, ram_addr, write_addr, jump, wd, ALUSrc, A, B, aluop, rd1, rd2, PC4, rom_addr);

    initial CLOCK_50 = 1'b1;

    always #0.5 CLOCK_50 = ~CLOCK_50;

    always @(posedge CLOCK_50) begin
        $display("%t PC=%h PC_next=%h PC_plus=%h PC4=%h Y=%h instr=%h run=%b ram_addr=%h write_addr=%h jump=%h wd=%h ALUSrc=%h A=%h B=%h aluop=%h rd1=%h rd2=%h rom_addr=%d",  $time,  PC, PC_next, PC_plus, PC4, Y, instr, run, ram_addr, write_addr, jump, wd, ALUSrc, A, B, aluop, rd1, rd2, rom_addr);
    end

    initial begin
        CLOCK_50 = 1'b0;
    end

    initial begin
        // #0;
        // instr = 32'h00800293;
        // #1;
        // instr = 32'h00f00313;
        // #1;
        // instr = 32'h0062a023;
        // #1;
        // instr = 32'h005303b3;
        // #1;
        // instr = 32'h40530e33;
        // #1;
        // instr = 32'h03c384b3;
        // #1;
        // instr = 32'h00428293;
        // #1;
        // instr = 32'hffc2a903;
        // #1;
        // instr = 32'h41248933;
        // #1;
        // instr = 32'h00291913;
        // #1;
        // instr = 32'h0122a023;
        // #1;

        #0;
        #1;
        #1;
        #1;
        #1;
        #1;
        #1;
        #1;
        #1;
        #1;
        #1;
        #1;

        $stop;
// 0x0050a023 // str instrs
// 0x00612223

    end


endmodule
