module lab05(clk, wren, wd, rr1, rr2, wr, rd1, rd2);
	input clk, wren; //clock and write enable ports
  input [5:0] rr1, rr2, wr; //5 bit register address inputs
  input [31:0] wd; //data to write
  output [31:0] rd1, rd2; //read data outputs
	
	reg_file(clk, wren, wd, rr1, rr2, wr, rd1, rd2);
	
endmodule
	