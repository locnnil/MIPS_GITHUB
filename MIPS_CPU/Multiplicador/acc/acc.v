module acc(
	input [3:0] multiplicador,
	input [4:0] adder,
	input load, sh, ad, clk,
	output reg [7:0] final
);

	reg [8:0] accumulator;

always @ (posedge clk) begin
	if (load ==1) begin
		accumulator <= multiplicador;
		accumulator[7:4] <= adder;
	end
	
	else if (sh == 1) begin
		accumulator <= accumulator >> 1;
	end
	
	else if (ad == 1) begin
		accumulator <= adder + accumulator[8:5];
	end
	
	final <= accumulator[7:0];
	
end	
endmodule