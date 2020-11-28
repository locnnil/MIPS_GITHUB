`timescale 1ns/100ps

module dec7742_TB();
	reg[3:0] entrada;
	reg [9:0] saida;
	
	dec7442 DUT(
		.entrada(entrada),
		.saida(saida)
	);
	
	integer i = 0;

	initial
		for (i = 0; i < 10; i = i+1)
			#10 entrada = i;
			
endmodule
	
