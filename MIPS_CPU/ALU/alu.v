module alu #(parameter DATA_WIDTH = 32)(A, B, option, out);
	
	input [(DATA_WIDTH - 1):0] A, B;
	input [1:0] option;
	
	output reg [(DATA_WIDTH - 1):0] out;

	always @ (A, B, option) 
	begin

		// UL UL UL, tem que botar o default!!! #MEDEIRIN V-A-G-A-B-U-N-D-O
		case(option)begin
			2'b00: 		out <= A + B;
			2'b01: 		out <= A - B;
			2'b10:		out <= A & B;
			default: 	out <= A | B;
		endcase
		
	end

endmodule 