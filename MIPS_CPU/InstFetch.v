module InstFetch(
	input clk, rst,
	output [31:0] IF_OUT //Saída do Instruction Fetch
);

wire [9:0] pco;
wire [9:0] instmem;

PC pc(
	.clk(clk),
	.rst(rst),
	.pc_out(pco)
);

instructionmemory IM(
	.clk(clk),
	.address(pco),
	.data_out(instmem)
);

Register RINST(
	.clk(clk),
	.rst(rst),
	.data_In(instmem),
	.data_Out(IF_OUT)
);

endmodule


