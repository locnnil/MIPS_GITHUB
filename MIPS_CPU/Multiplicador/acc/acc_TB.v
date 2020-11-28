`timescale 1ns/10ps
module acc_TB();

	reg [3:0] multiplicador;
	reg [4:0] adder;
	wire load, sh, ad, clk;
	reg [7:0] produto;
	
	acc DUT(
		.multiplicador(multiplicador),
		.adder(adder),
		.load(load),
		.sh,(sh),
		.ad(ad),
		.clk(clk),
		.produto(produto)
	);
	
	initial begin
		clk = 0;
		
		
	end