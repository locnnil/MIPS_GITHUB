module multiplicador(
	input [15:0] multiplicando,
	input [15:0] multiplicador,
	input start,clk,
	output[31:0] produto,
	output idle,done
);
	wire load, m, sh, ad;
	wire [4:0] k;
	wire [7:0] final;
	
	acc ACC(
		.multiplicador(load),
		.adder(adder),
		.load(load), 
		.sh(sh), 
		.ad(ad), 
		.clk(clk),
		.final(final)
	);

	counter COUNTER(
		.clk(clk), 
		.load(load),
		.k(k)
	);



	controller CONTROL(
		.done(done), 
		.k(k), 
		.m(m), 
		.sh(sh), 
		.load(load),
		.ad(ad), 
		.start(start), 
		.clk(clk),
		.mult1(multiplicador),
		.mult2(multiplicando),
		.produto(produto)
	);

	adder ADDER(
		.opA(multiplicando),
		.opB(multiplicador),
		.soma(soma)
	);

	assign saida = produto [31:0];

endmodule
