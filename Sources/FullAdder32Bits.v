`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:45:05 AM
// Design Name: 
// Module Name: FullAdder32Bits
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


module FullAdder32Bits(input [31:0]in1,
input [31:0]in2,
output reg [31:0] sum);

always @(*)
begin
sum = in1 + in2;
end
endmodule

