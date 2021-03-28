//register file module

module reg_rom(clk, addr, q);
  input clk; //clock port
  input [4:0] addr; //5 bit register address input
  output [31:0] q; //read data outputs

  reg [31:0] file [31:0]; //32 registers 32bits wide

   initial begin
	
//	//jal
//	file[0] = 32'h00500293;
//file[1] = 32'h00500293;
//file[2] = 32'h00c000ef;
//file[3] = 32'h00900113;
//file[4] = 32'h00102023;
//file[5] = 32'h00102623;
//file[6] = 32'h0000007f;
//file[7] = 32'h00502223;
//file[8] = 32'h00402203;
//file[9] = 32'h00402423;
//file[10] = 32'h00008067;
//file[11] =  32'h0;
//file[12] =  32'h0;
//file[13] =  32'h0;
//file[14] =  32'h0;
//file[15] =  32'h0;
//file[16] =  32'h0;
//file[17] =  32'h0;
//file[18] =  32'h0;
//file[19] =  32'h0;
//file[20] =  32'h0;
//file[21] =  32'h0;
//file[22] =  32'h0;
//file[23] =  32'h0;
//file[24] =  32'h0;
//file[25] =  32'h0;
//file[26] =  32'h0;
//file[27] =  32'h0;
//file[28] =  32'h0;
//file[29] =  32'h0;
//file[30] =  32'h0;
//file[31] =  32'h0;

	
	
//	//factorial
//	file[0] = 32'h00c00513;
//file[1] = 32'h008000ef;
//file[2] = 32'h00a02023;
//file[3] = 32'h0000007f;
//file[4] = 32'hff810113;
//file[5] = 32'h00112223;
//file[6] = 32'h00a12023;
//file[7] = 32'hfff50513;
//file[8] = 32'h00051863;
//file[9] = 32'h00100513;
//file[10] = 32'h00810113;
//file[11] = 32'h00008067;
//file[12] = 32'hfe1ff0ef;
//file[13] = 32'h00050293;
//file[14] = 32'h00012503;
//file[15] = 32'h00412083;
//file[16] = 32'h00810113;
//file[17] = 32'h02550533;
//file[18] = 32'h00008067;
//file[19] =  32'h0;
//file[20] =  32'h0;
//file[21] =  32'h0;
//file[22] =  32'h0;
//file[23] =  32'h0;
//file[24] =  32'h0;
//file[25] =  32'h0;
//file[26] =  32'h0;
//file[27] =  32'h0;
//file[28] =  32'h0;
//file[29] =  32'h0;
//file[30] =  32'h0;
//file[31] =  32'h0;

	
	
	//prog2
file[0] = 32'h00800293;
file[1] = 32'h00f00313;
file[2] = 32'h0062a023;
file[3] = 32'h005303b3;
file[4] = 32'h40530e33;
file[5] = 32'h03c384b3;
file[6] = 32'h00428293;
file[7] = 32'hffc2a903;
file[8] = 32'h41248933;
file[9] = 32'h00291913;
file[10] = 32'h0122a023;
file[11] =  32'h0000007f;
file[12] =  32'h0;
file[13] =  32'h0;
file[14] =  32'h0;
file[15] =  32'h0;
file[16] =  32'h0;
file[17] =  32'h0;
file[18] =  32'h0;
file[19] =  32'h0;
file[20] =  32'h0;
file[21] =  32'h0;
file[22] =  32'h0;
file[23] =  32'h0;
file[24] =  32'h0;
file[25] =  32'h0;
file[26] =  32'h0;
file[27] =  32'h0;
file[28] =  32'h0;
file[29] =  32'h0;
file[30] =  32'h0;
file[31] =  32'h0;

  end

  assign q = file[addr];

endmodule