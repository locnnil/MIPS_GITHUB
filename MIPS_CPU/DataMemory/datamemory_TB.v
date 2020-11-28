`timescale 1ns/10ps
module DataMemory_TB;
	reg clk;
	reg [31:0] addr;
	wire [31:0] data_out;
	reg [31:0] data_in;
	reg we;
	
DataMemory DUT(
	.clk(clk),
	.addr(addr),
	.data_out(data_out),
	.data_in(data_in),
	.we(we)
);

initial begin
	clk = 1;
	we = 0;
	addr = 0;
	data_in = 1;
	//data_in = 100;
	//#10	we = 0;
	#10	addr = 1;
	#10	addr = 2;
	#10	addr = 3;
	#20	we = 1;
	
	#10 	addr = 1;
	#10	addr = 2;
			data_in = 10;

	#10 	we = 0;
	#10 	addr = 3;
	#10	addr = 0;
	#10	addr = 2;

end
	
always #5 clk = ~clk;
	
initial
#200 $stop;	
	

endmodule