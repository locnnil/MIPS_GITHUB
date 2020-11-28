module Memory(
	input RB,RD_, CTRL_EX,
	input clk, we,
	input [31:0] addr,
	input [31:0] data_in,
	output reg [31:0] data_out,
	input [15:0] in,
	output reg [9:0] out,
	input cs,
	input[31:0] dataIn,
	output[31:0] dataOut,
	output CTRL_WB,RM, RD

);

//addr memory
DataMemory DM(
	.clk(clk), 			  // clock da memoria
	.addr(addr), 		  // input de endereço
	.data_in(data_in),  // input de dados
	.we(we), 			  // write enable
	.data_out(data_out) // output de dados
);


// addr decoding

Decoder DEC(
	.in(in), //input [15:0]
	.out(out) //output reg[9:0]
);

//bus controller
BusController BC(
	.cs(cs),
	.dataIn(dataIn), // input[31:0]
	.dataOut(dataOut) // output[31:0]
);

endmodule
