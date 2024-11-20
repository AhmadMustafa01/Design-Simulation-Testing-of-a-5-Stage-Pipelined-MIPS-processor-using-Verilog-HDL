`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
input clk,
input [31:0] instructionInput,
input [31:0] nextInstructionInput,
output reg [31:0] instructionOutput,
output reg [31:0] nextInstructionOutput
);
always @(posedge clk) begin
instructionOutput = instructionInput;
nextInstructionOutput = nextInstructionInput;
end
endmodule