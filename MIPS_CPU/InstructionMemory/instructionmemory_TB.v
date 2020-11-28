`timescale 1ns/10ps

module instructionmemory_TB;

	reg clock;
	reg[9:0] address;
	wire [31:0] data_out;

	instructionmemory DUT(
	.clock(clock),
	.address(address),
	.data_out(data_out)
	);

	initial 
	begin
		clock = 0;
		#60 address = 0;
		#60 address = 1;
		#60 address = 2;
		#60 address = 3;
		#60 address = 4;
		#60 address = 5;
		#60 address = 6;
		#60 address = 7;
		#60 address = 8;
		#60 address = 9;
	end

	initial #1000 $stop;

	always #20 clock = ~clock;
	
endmodule