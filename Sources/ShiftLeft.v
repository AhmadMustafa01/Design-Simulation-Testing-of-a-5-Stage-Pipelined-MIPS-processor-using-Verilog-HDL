`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: ShiftLeft
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


module ShiftLeft (
  input [25:0] inputVector,
  output reg [27:0] outputVector
);
  always @(*)
  begin
    outputVector[1:0] = 2'b00;
    outputVector[27:2] = inputVector;
  end
endmodule
