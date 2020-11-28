module WriteBack(
	input RD, RM, CTRL_MEM,
	output RF
);

//mux
mux MUX(
.A(RD),
.B(RF),
.select(),
.out(RF)
);
//pll?

endmodule
