`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 12:01:17 PM
// Design Name: 
// Module Name: Mux5Bits2x1
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


module MUX5Bits2X1(
input sel,
input [4:0]in1,
input [4:0]in2,
output reg[4:0]out);

always@(*)
begin
case(sel)
1'b0 :out=in1;
1'b1 :out=in2;
endcase
end
endmodule
