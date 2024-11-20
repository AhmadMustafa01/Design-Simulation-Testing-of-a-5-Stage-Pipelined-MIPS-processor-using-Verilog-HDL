`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
  input clk,
  input [4:0] inOpcode,
  input [31:0] inData1,
  input [31:0] inData2,
  input [31:0] inData3,
  input inData4,
  input [1:0] inData5,
  input [1:0] inData6,
  output reg [31:0] outOpcode,
  output reg [31:0] outData1,
  output reg [31:0] outData2,
  output reg [31:0] outData3,
  output reg outData4,
  output reg [1:0] outData5,
  output reg [1:0] outData6
);
  always @(posedge clk) begin
    outOpcode <= inOpcode;
    outData1 <= inData1;
    outData2 <= inData2;
    outData3 <= inData3;
    outData4 <= inData4;
    outData5 <= inData5;
    outData6 <= inData6;
  end
endmodule

