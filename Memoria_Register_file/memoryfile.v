module memoryfile #(
	parameter data_WIDTH = 32 ,
	parameter ADDR_WIDTH = 16 
)(
clk,
address, // address_0 Input
dataIn, // data_0 bi-directional
dataOut, // data_0 bi-directional
we // Write Enable/Read Enable
);

//--------------Input Ports-----------------------
input [ADDR_WIDTH-1:0] address;
input we ;
input clk;
//--------------Inout Ports-----------------------
input [data_WIDTH-1:0] dataIn ;
output reg [data_WIDTH-1:0] dataOut ;
//--------------Internal variables----------------

reg [data_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];


always @ (posedge clk)
begin

    if (we) mem[address] <= dataIn;
    else dataOut <= mem[address];
    
end

endmodule

