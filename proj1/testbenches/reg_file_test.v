//testbench for register file

`timescale 100ns/1ns // time-unit = 100 ns, precision = 1 ns

module reg_file_test;
  reg clk, wren;
  reg [4:0] rr1, rr2, wr;
  reg [31:0] wd;
  wire [31:0] rd1, rd2;

  reg_file TEST(clk, wren, wd, rr1, rr2, wr, rd1, rd2);

  initial begin
  $display("wren, wd, rr1, rr2, wr, rd1, rd2");
  clk = 1; // clock in test bench
  end

  always
  #0.50 clk = ~clk;

  always @(posedge clk) begin
  $display("%h, %h, %h,  %h,  %h,  %h,  %h", wren, wd, rr1, rr2, wr, rd1, rd2);
  end

  initial begin
    #0 wren = 1;
    wr = 5'h0;
    wd = 32'h10; //write h10
    rr1 = 5'h0; //rd1 is 32'h10
    rr2 = 5'h0; //rd2 is 32'h10
    #1 wren = 1;
    wr = 5'h1;
    wd = 32'hffaa7788; //write hffaa7788
    rr1 = 5'h0; //rd1 is 32'h10
    rr2 = 5'h1; //rd2 is 32'hffaa7788
    #1 wren = 0;
    wr = 5'h1;
    wd = 32'hffaa7788; //do not write anything
    rr1 = 5'h2; //rd1 is 32'h0
    rr2 = 5'h1; //rd2 is 32'hffaa7788
    #1;
    $stop;
  end
endmodule
