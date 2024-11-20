`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: Concatenate
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


module Concatenate (
  input [27:0] inputVector,
  input [3:0] inputNibble,
  output reg [31:0] outputVector
);
  always @(*)
  begin
    outputVector[27:0] = inputVector;
    outputVector[31:28] = inputNibble;
  end
endmodule
