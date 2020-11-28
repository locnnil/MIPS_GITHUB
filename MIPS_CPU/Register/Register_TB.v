`timescale 1ns/10ps

	module Register_TB;

	reg clk;
	reg rst;
	reg [31:0] data_In;
	wire [31:0] data_Out;

	Register DUT(
	
	.clk(clk),
	.data_In(data_In),
	.data_Out(data_Out),
	.rst(rst)

	);


	initial begin
		clk = 0;
		rst = 0;
		data_In = 0;
	end

	always begin
		#10 clk = ~clk;
	end

	always begin
		#14 data_In = data_In + 10;
	end

	initial
		#700 $stop;

endmodule