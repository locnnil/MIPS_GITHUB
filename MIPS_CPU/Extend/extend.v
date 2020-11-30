module extend(
	input clk,
	input rst,
	input[15:0] data_In,
	output reg[31:0] data_Out
); 

always @ (posedge clk) begin
	if(rst)
		data_Out <= 0;
	else begin
		if(data_In[15] == 0)
			data_Out <= {16'd0, data_In}; //estende 16 bits para 0
		else
			data_Out <= {16'hFFFF, data_In}; //estende 16 bits para 1
			
	end
end

endmodule 
