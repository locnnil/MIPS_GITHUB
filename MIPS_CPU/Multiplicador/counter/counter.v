module counter(
	input clk, load, sh, 
	output reg [4:0]k
);


always @(posedge clk)
begin
	if (load)
	begin
		k <= 0;
	end
	else begin
		if (sh == 1) begin
			k <= k+1;
		end
	end
end

endmodule
