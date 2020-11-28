module PC(
	clk, 			//clock da memoria	
	rst, 			//sinal de reset
	pc_out		//output do contador
	);

	//----- Portas In -----

	input clk, rst;
	
	//----- Portas Out -----
	
	output [9:0] pc_out; // A mempória de programa possui 1kword logo 2^10 = 1024
	
	//----- Registro -----
	
	reg [9:0] reg_pc; // A mempória de programa possui 1kword logo 2^10 = 1024

	//----- Código -----
	
	always@(posedge clk or posedge rst)
	begin 
		if(rst)
			reg_pc <= 0; 	
		else
			reg_pc <= reg_pc + 1'b1; //Anda um endereço a cada clock
	end

	assign pc_out = reg_pc;

endmodule
	
