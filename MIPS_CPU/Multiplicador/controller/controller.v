module controller ( m, clk, start, k, final, mult1, mult2,load, sh, ad, produto, done);
	
	input m, clk, start; 
	input [15:0] mult1, mult2;
	input [4:0] k;
	input [31:0] final;
	output reg load, sh, ad;
	reg [15:0] b;
	reg [31:0] a;
	output reg [31:0] produto;
	output reg done;

	reg [1:0] estado = 2'b00;
	
	always @ (posedge clk) begin
		case (estado)
		
		2'b00: begin
			if (start) begin
				a <= {16'b0, mult1};
				b <= mult2;
				load <= 1;
				done <= 0;
				sh <= 0;
				ad <= 0;
				estado <= 2'b01;		
			end			
		end
		
		2'b01: begin
			sh <= 0;
			load <= 0;
			if (m) begin
				ad <= 1;
				estado <= 2'b10;
			end
			if (!m) begin
				ad <= 0;
				estado <= 2'b10;			
			end
		end
		
		2'b10: begin
			if (k == 5'b10001) begin
				produto <= final;
				estado <= 2'b00;
				done <= 1;
			end
			else begin 
				ad <= 0;
				sh <= 1;
				estado <= 2'b01;
			end
		end
	
	endcase
	
end
		

endmodule