module alu (A, B, option, out);

	parameter DATA_WIDTH = 32;
	
	input [(DATA_WIDTH - 1):0] A, B;
	input [1:0] option;
	
	output reg [(DATA_WIDTH - 1):0] out;

	always @ (A, B, option) 
	begin
		if (option == 2'b00 ) 
			out <= A + B;
		else if (option == 2'b01 ) 
			out <= A - B;
		else if (option == 2'b10 ) 
			out <= A & B;
		else  
			out <= A | B;
	end

endmodule 