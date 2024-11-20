`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: MainModule
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


module MainModule(input clk, input reset);
// Declare meaningful wire variables
//wire regDest, regWrite, aluSrc, aluOp, memWrite, memToReg, beq, jump;
//wire [31:0] output;

// Instantiate DataPath module with meaningful connections
DataPath datapath(.clk(clk), .reset(reset));

// Instantiate ctrl module with meaningful connections
//ctrl control(.funcCode(output[5:0]), .opcode(output[31:26]), .jump(jump), .beq(beq), .memToReg(memToReg), .memWrite(memWrite), .aluOp(aluOp), .aluSrc(aluSrc), .regWrite(regWrite), .regDest(regDest));
endmodule

