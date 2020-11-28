`timescale 1ns/10ps
module Control_TB;

reg [31:0] instruction;
wire [31:0] output_control;

/*	
	grupo    rt   rs    rd   (10)   tipo	
	000100 00001 00010 00101 01010 100000
	000100 00011 00100 00110 01010 100000
	000100 00101 00110 00111 01010 100010

	grupo+1   rt    rs       offset 			
	000101 00000 00001 0000000000000001
	000101 00000 00010 0000000000000010
	000101 00000 00011 0000000000000011
	000101 00000 00100 0000000000000100
*/


Control DUT(
	.instruction(instruction),
	.output_control(output_control)
);

initial begin

	#10 instruction = 32'b000101_00000_00000_0000_0000_0000_0000; 	//lw $s0,0($s0), carrega A, da memoria[0] para o registro[0] do register file
	#10 instruction = 32'b000101_00001_00001_0000_0000_0000_0000; 	//lw $s1,0($s1), carrega B, da memoria[1] para o registro[1] do register file
   #10 instruction = 32'b000101_00010_00010_0000_0000_0000_0000; 	//lw $s2,0($s2), carrega C, da memoria[2] para o registro[2] do register file
   #10 instruction = 32'b000101_00011_00011_0000_0000_0000_0000; 	//lw $s3,0($s3), carrega D, da memoria[3] para o registro[3] do register file 
	 
	#10 instruction = 32'b000100_00000_00000_00000_01010_000000;	//NOP
	#10 instruction = 32'b000100_00000_00001_00100_01010_110010;  	//mul $s0,$s1,$s4, multiplica registro[0] pelo registro[1] e salva na memoria[4]
	#10 instruction = 32'b000100_00000_00000_00000_01010_000000;	//NOP	 
	#10 instruction = 32'b000100_00010_00011_00101_01010_100000;  	//add $s2,$s3,$s5, soma registro[2] com registro[3] e salva na memoria[5]
	#10 instruction = 32'b000100_00000_00000_00000_01010_000000;	//NOP
	    
	#10 instruction = 32'b000110_00100_00100_0000_0000_0000_0000;	//sw do mul
	#10 instruction = 32'b000100_00000_00000_00000_01010_000000;	//NOP
	#10 instruction = 32'b000110_00101_00101_0000_0000_0000_0000;	//sw do add  
	#10 instruction = 32'b000100_00000_00000_00000_01010_000000;  //NOP
	#10 instruction = 32'b000100_00000_00000_00000_01010_000000;	//NOP
	 
	#10 instruction = 32'b000101_00100_00100_0000_0000_0000_0000; //lw $s4,$0($s4), carrega (A*B), da memoria[4] para o registro[4]
	#10 instruction = 32'b000101_00101_00101_0000_0000_0000_0000; //lw $s5,0($s5), carrega (A+B), da memoria[5] para o registro[5]
	 
	#10 instruction = 32'b000100_00000_00000_00000_01010_000000;	//NOP
	#10 instruction = 32'b000100_00000_00000_00000_01010_000000;	//NOP
	#10 instruction = 32'b000100_00000_00000_00000_01010_000000;	//NOP
	
	#10 instruction = 32'b000100_00100_00101_00110_01010_100010;	//sub $s6,$s4,$s5, subtrai s5(C+D) do s4(A*B) e salva em s6
	#10 $stop; 
	
end

endmodule