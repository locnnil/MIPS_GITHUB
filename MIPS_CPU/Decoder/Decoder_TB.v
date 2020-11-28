`timescale 1ns/100ps
module Decoder_TB();
	reg[15:0] in;
	wire [15:0] out;
	
	Decoder DUT(
		.in(in),
		.out(out)
	);
	
	integer i = 0;
		
	initial
		for (i=0; i<65536; i=i+1)
			#10 in = i;
	

endmodule