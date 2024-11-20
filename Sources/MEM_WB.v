`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
input clk,
input [4:0] in1,
input [31:0] in2,
input [31:0] in3,
input [1:0] in4,
output reg [4:0] out1,
output reg [31:0] out2,
output reg [31:0] out3,
output reg [1:0] out4
);
always @(posedge clk) begin
out1 = in1;
out2 = in2;
out3 = in3;
out4 = in4;
end
endmodule

