module cpu(
	input clk, rst
);

InstFetch IF(
	.clk(clk), 
	.rst(rst),
	.IF_OUT(if_out)
);

wire [31:0] if_out;

InstDec ID(
	.IF_OUT(if_out),
	.clk(clk),
	.rst(rst),
	.WB(rf), //WriteBack Mux result
	.out_regA(out_regA),
	.out_regB(out_regB),
	.out_regCTRL(out_regCTRL),
	.out_regIMM(out_regIMM)
);

wire [15:0] out_regA;
wire [15:0] out_regB;
wire [31:0] out_regCTRL;
wire [31:0] out_regIMM;

Execute EX(
	.RA(out_regA),
	.RB(out_regB),
	.IMM(out_regIMM),
	.CTRL_ID(out_regCTRL),
	.clk(clk),
	.clkmulti(clkmulti),
	.rst(rst),
	.RD_out(rd), 
	.RB_out(rb), 
	.CTRL_EX(ctrl)
);

//declarar pll e add clkmulti
wire [31:0]rd;
wire [31:0]rb;
wire [31:0]ctrl;

Memory MEM(
	.RB(rb), 
	.RD_(rd), 
	.CTRL_EX(ctrl),
	.CTRL_WB(ctrl_wb),
	.RM(rm),
	.RD(wrd)
);

wire [31:0]ctrl_wb;
wire [31:0]rm;
wire [31:0]wrd;

WriteBack WB(
	.RD(wrd), 
	.RM(rm), 
	.CTRL_MEM(ctrl_wb),
	.RF(rd)
);

wire [31:0]rf;

endmodule
