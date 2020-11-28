`timescale 1ns/10ps
module PC_TB;
	reg clk;
	reg rst;
	wire [9:0] pc_out;
	
PC DUT (
	.clk(clk),
	.rst(rst),
	.pc_out(pc_out)
);

initial begin
	clk = 1;
	rst = 1;
	#30 rst = 0;
	#200 $stop;
end
	
always	#5 clk = ~clk;		

endmodule 