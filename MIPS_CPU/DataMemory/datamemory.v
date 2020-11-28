module DataMemory (
	clk, 			// clock da memoria
	addr, 		// input de endereço
	data_in, 	// input de dados 
	we, 			// write enable
	data_out);	// output de dados 
		
	//----- Parametros -----	
	
	parameter SIZE = 32;			// tamanho da palavra 
	parameter MEM_SIZE = 1024;	// tamanho da memória 
	parameter OFFSET = 4'hA00; // Offset do grupo 2: (2*500)h = A00h 
	
	//----- Portas In -----
	
	input clk, we;
	input [SIZE - 1 : 0] addr;
	input [SIZE - 1 : 0] data_in;
	
	//----- Portas Out -----
	
	output reg [SIZE - 1 : 0] data_out;
	
	//----- Variaveis Internas -----
	
	reg[SIZE - 1 : 0] MemDados [0 : MEM_SIZE - 1];	// memoria de 1024 endereços com tamanho de 32 bits para cada palavra
	
	
	//----- Alocação da Memória -----
	integer i;
	
	initial begin
		//limpa toda a memória
		for (i = 0; i <  MEM_SIZE - 1; i = i+1) begin
			MemDados[i] = 0;
		end
		
		//aloca valores A=2001, B=4001, C=5001 e D=3001 (todos em decimal)
		MemDados[OFFSET+0] = 2001; //A
		MemDados[OFFSET+1] = 4001; //B
		MemDados[OFFSET+2] = 5001; //C
		MemDados[OFFSET+3] = 3001; //D
		
	end
	
	//----- Código -----
	
	always @(posedge clk) begin
		if(we == 1)
			MemDados[addr] <= data_in;
		else
		if (we == 0)
			data_out <= MemDados[addr];
	end
	
endmodule