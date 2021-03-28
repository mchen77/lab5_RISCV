//testbench for register ROM

`timescale 100ns/1ns // time-unit = 100 ns, precision = 1 ns

module reg_rom_tb;
reg [4:0] addr; //5 bit register address input
wire [31:0] q; //read data outputs
integer i;

  reg_rom TEST(addr, q);

  initial begin
  $display("t=%d, addr=%d, instr=%h", $time, addr, q);
  end

  initial begin
    for (i = 0; i < 32; i = i + 1)begin
      addr = i;
      #1;
    end
    $stop;
  end
endmodule
