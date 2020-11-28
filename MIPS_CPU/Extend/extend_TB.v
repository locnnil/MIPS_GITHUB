`timescale 1ns/10ps

module extend_TB();
 reg clk;
 reg [15:0] data_In;
 wire [31:0] data_Out;
 
 
 extend DUT (
 .clk(clk),
 .data_In(data_In),
 .data_Out(data_Out)
 );
 
 integer i;

initial begin
	 data_In = 1;
end


always begin
	#10 clk = ~clk;
end


always begin
	for (i=0; i<=20; i=i+1) begin
		#40 data_In = data_In + 10;
	end
end


initial
 #1000 $stop;
 
endmodule
