module adder(
	input [16:0] opA,
	input [16:0] opB,
	output reg [32:0] soma
);

always @(*) begin
	soma = opA + opB;
end

endmodule