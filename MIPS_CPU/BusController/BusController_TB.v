`timescale 1ns/10ps

module BusController_TB;

	reg cs;
	reg[31:0] dataIn;
	wire [31:0] dataOut;

	BusController DUT(
	//.clk(clk),
	.cs(cs),
	.dataIn(dataIn),
	.dataOut(dataOut)
	);

	initial begin
		cs = 0;
		dataIn = 0;
		#50 dataIn = 1;
		#50 dataIn = 0;
		cs = 1;
	end

	initial #1000 $stop;


	
endmodule 