`timescale 1ns/10ps

module alu_TB;

	reg [31:0] A, B;
	reg [1:0] option;
	wire [31:0] out;
	
	// Disponibilizando o DUT(Device-Under-Test)
	alu DUT (
	.A(A),
	.B(B),
	.option(option),
	.out(out)
	);
	
	initial 
	begin
		A = 100;
		B = 20;
		#05 option = 2'b00;// A + B - ADD
		#15 option = 2'b01;// A - B - SUB
		#15 B = 2;
		#15 option = 2'b10; // A & B - AND
		#15 option = 2'b11; // A | B - OR
	end
	
	initial #100 $stop;

endmodule 