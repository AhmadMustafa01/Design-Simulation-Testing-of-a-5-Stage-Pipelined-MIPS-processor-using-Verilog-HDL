`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:30:39 AM
// Design Name: 
// Module Name: SignExtender
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


module SignExtender( input [15:0]in,output reg [31:0]out );
always @(*)
begin
if(in[15]==1'b0)
begin
out=32'b00000000000000000000000000000000;
end
if(in[15]==1'b1)
begin
out=32'b11111111111111110000000000000000;
end
out=out+in;
end
endmodule
