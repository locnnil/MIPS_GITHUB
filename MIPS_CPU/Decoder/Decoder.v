module Decoder(
	input [15:0] in,
	output reg[9:0] out
);
	
	wire [9:0] saidaTemp;
	
	dec7442 U1(
		.entrada({1'b0, in [15:13]}),
		.saida(saidaTemp)
	);
	
	integer i;
	always @ (*) begin
		for (i = 0; i < 10; i = i+1) begin
				out[i] = saidaTemp[i];
		end
	end

endmodule