module mux (A, B, select, out);
	
	parameter DATA_WIDTH = 32;
	
	input [(DATA_WIDTH - 1):0] A, B;
	input select;
	
	output reg [(DATA_WIDTH - 1):0] out;

	always @ (A, B, select)
	begin
		if (select == 0) 
			out <= A;
		else 
			out <= B;
	end
		
endmodule 