module instructionmemory(clk, address, data_out);

	// aux
	parameter DATA_WIDTH = 32, ADDR_WIDTH = 10;
	integer i;
	// input ports
	input clk;
	input[(ADDR_WIDTH - 1):0] address; // pc
	//output ports
	output reg[(DATA_WIDTH - 1):0] data_out; // instruction
	// inst_mem
	reg [(DATA_WIDTH - 1):0] inst_mem [0:(2**ADDR_WIDTH - 1)];

	initial
	begin
		/*ARRUMAR COMENTÁRIO:*/
		
		/*							6		  5	  5				16
		//					Grupo+1(3)	  rs	  rt			  offset
		inst_mem[0]  <= 32'b000011_00000_11110_0000_0000_0000_0000; // load word
		//					Grupo+2(4)	  rs	  rt			  offset
		inst_mem[1]  <= 32'b000011_00000_10000_0000_0000_0000_0001; // store word
		//							6		 5	  	  5	  5	  5	   6
		//					  Grupo(2)	 rs	  rt	  rd	  10	  num
		inst_mem[2]  <= 32'b000100_00001_10001_00000_01010_100000; // add
		inst_mem[3]  <= 32'b000100_00001_10001_00000_01010_100010; // subtract
		inst_mem[4]  <= 32'b000100_00001_10001_00000_01010_110010; // Mul
		inst_mem[5]  <= 32'b000100_00001_10001_00000_01010_100100; // and
		inst_mem[6]  <= 32'b000100_00001_10001_00000_01010_100101; // or */

		//load A
		inst_mem[0] <= 32'b000011_10000_00000_0000101000000000;
		// instrução LW, carregar A, no memoria[0] e transferir seu valor para o registro[0] do register file
		
		//load B
		inst_mem[1] <= 32'b000011_10000_00001_0000101000000001;
		// instrução LW, carregar B, no memoria[1] e transferir seu valor para o registro[1] do register file
	
		// load C
		inst_mem[2] <= 32'b000011_10000_00010_0000101000000010;
		// instrução LW, carregar C, no memoria[2] e transferir seu valor para o registro[2] do register file
		
		// load D
		inst_mem[3] <= 32'b000011_00011_00011_0000101000000011;
		// instrução LW, carregar D, no memoria[3] e transferir seu valor para o registro[3] do register file

		//load A para evitar pipeline hazzard
		inst_mem[4] <= 32'b000011_10000_00100_0000101000000000;
		// instrução LW, carregar A, no memoria[0] e transferir seu valor para o registro[4] do register file
		
		//load A para evitar pipeline hazzard
		inst_mem[5] <= 32'b000011_10000_00101_0000101000000000;
		// instrução LW, carregar A, no memoria[0] e transferir seu valor para o registro[5] do register file
		
		//load A para evitar pipeline hazzard
		inst_mem[6] <= 32'b000011_10000_00110_0000101000000000;
		// instrução LW, carregar A, no memoria[0] e transferir seu valor para o registro[6] do register file

		// multiplicando: A * B
		inst_mem[7] <= 32'b000010_00000_00001_00111_01010_110010;
		// instrução MUL, multiplica o valor de A (registro[0]) pelo valor de B(Registro[1]) e salva no registro[7]

		//Soma C + D
		inst_mem[8] <= 32'b000010_00010_00011_01000_01010_100010;
		//instrução ADD, adiciona o valor de C (registro[2]) com o valor de D(Registro[3]) e salva no registro[8]

		//Subtrai (A*B) - (C*D)
		inst_mem[9] <= 32'b000010_00100_00101_01001_01010_100010;
		// instrução SUB de (A*B) (registro[4]) e (C+D) (registro[5]) e salva no registro[9]			
	end

	always @ (posedge clk)
		 data_out <= inst_mem[address];

endmodule
