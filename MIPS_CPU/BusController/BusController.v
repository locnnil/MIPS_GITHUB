module BusController(
	input cs,
	input[31:0] dataIn,
	output[31:0] dataOut
);

	assign dataOut = (cs)? dataIn : 32'bz; 


endmodule