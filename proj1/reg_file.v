//register file module

module reg_file(clk, wren, wd, rr1, rr2, wr, rd1, rd2);
  input clk, wren; //clock and write enable ports
  input [4:0] rr1, rr2, wr; //5 bit register address inputs
  input [31:0] wd; //data to write
  output [31:0] rd1, rd2; //read data outputs

  reg [31:0] file [31:0]; //32 registers 32bits wide
  integer i;
   initial begin
	file[0] = 32'h0;
	file[1] = 32'h0;
	file[2] = 32'hff;
   for (i = 3; i < 32; i = i+1) begin
     file[i] = 32'b0;
     end
   end

  //should be combinational
  assign rd1 = file[rr1];
  assign rd2 = file[rr2];

  //write data Logic
  always @(posedge clk) begin
    if (wren) begin
      if(wr != 5'h0) begin
        file[wr] <= wd;
      end
    end
  end


endmodule
