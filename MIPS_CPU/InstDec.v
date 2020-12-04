module InstDec #(
	parameter DATA_WIDTH = 31
)(
	input [DATA_WIDTH:0] IF_OUT,
	input clk,rst,
	input WB, //WriteBack Mux result
	output [DATA_WIDTH:0] out_regA,
	output [DATA_WIDTH:0] out_regB,
	output [DATA_WIDTH:0] out_regCTRL,
	output [DATA_WIDTH:0] out_regIMM
);
wire [DATA_WIDTH:0] ctrl_out;
wire [DATA_WIDTH:0] regA;
wire [DATA_WIDTH:0] regB;
wire [DATA_WIDTH:0] ex_out;


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

RegisterFile RFile(
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

Extend EX(
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
