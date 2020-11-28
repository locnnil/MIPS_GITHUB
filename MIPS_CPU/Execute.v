module Execute(
	input RA,RB,IMM,CTRL_ID,
	input clk, rst, clkmulti,
	output RD_out,RB_out, CTRL_EX
);

wire [15:0] multiplicador;
wire [31:0] produto;

mux mux_RB(
	.A(RB),
	.B(IMM),
	.select(),
	.out(wrb)
);

wire [15:0] wrb;

multiplicador MULT(
	.multiplicando(RA),
	.multiplicador(wrb),
	.st(),
	.clk(clkmulti),
	.produto(produto),
	.idle(),
	.done()
);

alu ALU(
	.A(RA),
	.B(RB),
	.option(),
	.out(alu_out)
);

wire [31:0] alu_out;

mux mux_RD (
	.A(alu_out),
	.B(produto),
	.select(),
	.out(wrd)
);

wire [31:0] wrd;

Register RD(
	.clk(clk),
	.rst(rst),
	.data_In(RD),
	.data_Out(RD_out)
);

Register _RB(
	.clk(clk),
	.rst(rst),
	.data_In(RB),
	.data_Out(RB_out)
);

endmodule
