`timescale 1ns/10ps

module mux_TB;

	reg [31:0] A, B;
	reg select;
	wire [31:0] out;
	
	mux DUT (
	.A(A),
	.B(B),
	.select(select),
	.out(out)
	);
	
	initial 
	begin
		A = 0;
		B = 0;
		select = 0;
		#20 A = 7;
		#20 select = 1;
		#20 B = 42;
	end
	
	initial #100 $stop;

endmodule 