`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:50:07 AM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory( input in,
input [31:0]select,
input [31:0]data,
output reg [31:0]out);

reg [31:0]memory[31:0];

always @(*)
begin
if(in==0)
out=memory[select];
if(in==1)
memory[select]=data;
end         
endmodule
