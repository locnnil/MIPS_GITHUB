module Control#(
	parameter DATA_WIDTH = 31
)(
	instruction,
	output_control
);


input [DATA_WIDTH:0] instruction;
output [DATA_WIDTH:0] output_control;

reg			wr, cs;
reg			ctl_mux_reg;
reg			ctl_mux_alu;
reg [2:0]	alu_control;
reg [5:0]	op;
reg [4:0]	rs;
reg [4:0]	rt;
reg [4:0]	rd;
reg [5:0]	code;
reg			erf;



/*				GRUPO 02 	= 0010
				GRUPO 02+1	= 0011
			
				GRUPO+1   rs	 rt      offset
		LW 		000011  ?????  ????? ????????????????		memoria pra registro
		
				GRUPO+2	  rs	 rt		 offset		
		SW 		000100  ?????  ????? ????????????????		registro pra memoria
		
				GRUPO    rs    rt    rd    10  FUNÇÃO
		ADD 	000010 ????? ????? ????? 01010 100000	rd = rs + rt	32
		SUB 	000010 ????? ????? ????? 01010 100010	rd = rs - rt	34
		MUL 	000010 ????? ????? ????? 01010 110010					50	
		AND 	000010 ????? ????? ????? 01010 100100					36
		OR 		000010 ????? ????? ????? 01010 100101					37
*/

	always @(instruction) begin

			op = instruction[31:26];
			rs = instruction[25:21];
			rt = instruction[20:16];
			code = instruction[5:0];
			erf = 1;
			
		if(op == 6'b000010) begin
			case(code)
				6'd32:   alu_control = 3'b001;		//ADD
				6'd34:   alu_control = 3'b010;		//SUB
				6'd36:   alu_control = 3'b011;		//AND
				6'd37: 	 alu_control = 3'b100;		//OR
				default: alu_control = 3'b101;		//MUL
			endcase
			
			cs = 0;
			wr = 0;
			ctl_mux_alu = 0;
			ctl_mux_reg = 0;
			rd = instruction[15:11];

		end
		
		if(op == 6'b000011) begin // LW (LOAD WORD)
			alu_control = 3'd1;     
			ctl_mux_alu = 1;     
			ctl_mux_reg = 1;     
			cs = 1; 
			wr = 0;              
			rd = rt;
		end
		
		if(op == 6'b000100) begin // SW (STORE WORD)
			alu_control = 3'd1;    
			ctl_mux_alu = 1;   
			ctl_mux_reg = 1;    
			cs = 1; 
			wr = 1;            
			erf = 0;
			rd = rt;
		end
		
	end
	
	assign output_control = {{9'b0}, {erf}, {rs}, {rt}, {rd}, {ctl_mux_alu}, {alu_control}, {cs}, {wr}, {ctl_mux_reg}}; 
	//           0000_0000_00 | enable_RFile | rs     | rt     | rd     | crl_mux_alu | alu_control | cs  | wr  | crl_mux_reg
	//            [31:23]     |    [22]     |[21:17]  |[16:12] | [11:7] |     [6]     |    [5:3]    | [2] | [1] |   [0]
	//				9               1            5       5        5           1             3          1    1        1   
endmodule
	