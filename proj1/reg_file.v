//register file module

module reg_file(clk, wren, wd, rr1, rr2, wr, rd1, rd2);
  input clk, wren; //clock and write enable ports
  input [4:0] rr1, rr2, wr; //5 bit register address inputs
  input [31:0] wd; //data to write
  output reg [31:0] rd1, rd2; //read data outputs

  reg [31:0] file [31:0]; //32 registers 32bits wide
  integer i;
   initial begin
   for (i = 0; i < 32; i = i+1) begin
     file[i] = 8'd0;
     end
   end

  //read data logic
  always @(posedge clk) begin
    rd1 <= file[rr1];
    rd2 <= file[rr2];
  end

  //write data Logic
  always @(posedge clk) begin
    if (wren) begin
      file[wr] <= wd;
    end
  end


endmodule
