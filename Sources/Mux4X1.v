`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: Mux4X1
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


module Mux4X1(
  input [1:0] sel,
  input [31:0] in1,
  input [31:0] in2,
  input [31:0] in3,
  output reg [31:0] out
);
  always @(*)
  begin
    case (sel)
      2'b00: out = in1;
      2'b01: out = in2;
      2'b10: out = in3; 
    endcase
  end
endmodule

