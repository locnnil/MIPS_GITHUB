module InstDec(
	input [31:0] IF_OUT,
	input clk,rst,
	input WB, //WriteBack Mux result
	output [31:0] out_regA,
	output [31:0] out_regB,
	output [31:0] out_regCTRL,
	output [31:0] out_regIMM
);
wire [31:0] ctrl_out;
wire [31:0] regA;
wire [31:0] regB;
wire [31:0] ex_out;

// O ITALO É UM PUTA FASCISTA!

Control CTRL(
	 .instruction(IF_OUT),
	 .output_control(ctrl_out)
);

Register RA(
	.clk(clk),
	.rst(rst),
	.data_In(regB),
	.data_Out(out_regA)
);

Register RB(
	.clk(clk),
	.rst(rst),
	.data_In(regB),
	.data_Out(out_regB)
);

Register RCTRL(
	.clk(clk),
	.rst(rst),
	.data_In(ctrl_out),
	.data_Out(out_regCTRL)
);

registerFile RFile(
	.clk(clk),
	.rst(rst),
	.data_In(WB),
	.data_InReg(),
	.enable(),
	.data_OutRegA(),
	.data_OutRegB(),
	.regA(regA),
	.regB(regB)
);

extend EX(
	.clk(clk),
	.rst(rst),
	.data_In(IF_OUT),
	.data_Out(ex_out)
);

Register RIMM(
	.clk(clk),
	.rst(rst),
	.data_In(ex_out),
	.data_Out(out_regIMM)
);
endmodule
