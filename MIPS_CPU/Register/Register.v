module Register #(
	parameter DATA_WIDTH = 31
)
(
	input clk,
	input rst,
	input[DATA_WIDTH:0] data_In,
	output reg[DATA_WIDTH:0] data_Out
);


always @ (posedge clk) begin
	if(rst)
		data_Out <= 0;
	else
		data_Out <= data_In;
end

endmodule
