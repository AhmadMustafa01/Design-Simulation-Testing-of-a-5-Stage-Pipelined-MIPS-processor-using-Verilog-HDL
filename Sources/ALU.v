`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:30:39 AM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
input [31:0]data1,
input [31:0]data2,
input [2:0]sel,
output reg [31:0]out,
output reg zeroFG );

always @(*) begin
case(sel)
3'b000 : out=data1+data2;
3'b001 : out=data1-data2;
3'b010 : out=data1*data2;
3'b011 : out=data1&data2;
3'b100 : out=data1|data2;
3'b101 : out=~data1;
3'b110 : out=data1<<1;
3'b111 : out=data1>>1;
endcase
end
always @(*)
begin
if(out===31'b00000000000000000000000000000000)
begin 
zeroFG=1;
end 
if(out!=32'b00000000000000000000000000000000)
begin
zeroFG=0;
end
end    
endmodule
