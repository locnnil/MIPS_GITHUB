`timescale 1ns/100ps

module multiplicador_TB();

	reg clk,start;
	reg [15:0] multiplicando, multiplicador;
	wire [31:0] produto;
	
	multiplicador DUT(
		.start(start),
		.clk(clk),
		.multiplicando(multiplicando),
		.multiplicador(multiplicador),
		.produto(produto)		
	);
	
	initial clk = 0;
	initial start = 0;
	initial begin
	# 5  start = 1;
	# 10 start = 0;
	end
	
	initial begin
		multiplicando <= 2;
		multiplicador <= 3;
		
		# 500
		
		multiplicando <= 65535;
		multiplicador <= 65535;
		
	
	end
	
	initial #5000 $stop;
		
		
	
	always #20 clk = ~clk;
	
endmodule