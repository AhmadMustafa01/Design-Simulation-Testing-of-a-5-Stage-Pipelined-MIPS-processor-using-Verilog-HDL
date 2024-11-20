`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
  input clk,
  input [4:0] rsInput,
  input [4:0] rtInput,
  input [4:0] rdInput,
  input [31:0] immInput,
  input [31:0] signExtInput,
  input [31:0] branchTargetInput,
  input [31:0] aluSrcInput,
  input jumpInput,
  input beqInput,
  input memToRegInput,
  input memWriteInput,
  input [2:0] aluOpInput,
  input regWriteInput,
  input regDestInput,
  output reg [4:0] rsOutput,
  output reg [4:0] rtOutput,
  output reg [4:0] rdOutput,
  output reg [31:0] immOutput,
  output reg [31:0] signExtOutput,
  output reg [31:0] branchTargetOutput,
  output reg [31:0] aluSrcOutput,
  output reg jumpOutput,
  output reg beqOutput,
  output reg memToRegOutput,
  output reg memWriteOutput,
  output reg [2:0] aluOpOutput,
  output reg regWriteOutput,
  output reg regDestOutput
);
  always @(posedge clk) begin
    rsOutput = rsInput;
    rtOutput = rtInput;
    rdOutput = rdInput;
    immOutput = immInput;
    signExtOutput = signExtInput;
    branchTargetOutput = branchTargetInput;
    aluSrcOutput = aluSrcInput;
    jumpOutput = jumpInput;
    beqOutput = beqInput;
    memToRegOutput = memToRegInput;
    memWriteOutput = memWriteInput;
    aluOpOutput = aluOpInput;
    regWriteOutput = regWriteInput;
    regDestOutput = regDestInput;
  end
endmodule
