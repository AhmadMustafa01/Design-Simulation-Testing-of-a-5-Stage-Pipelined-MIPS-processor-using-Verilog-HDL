`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:46:40 AM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit( 
input [5:0]FC,
input [5:0]Opcode,
output reg Jump,
output reg BEQ,
output reg memToReg,
output reg memWrite,
output reg [2:0]ALUOp,
output reg ALUSrc,
output reg RegWrite,
output reg RegDest );

always @(*)
begin
case(Opcode)
6'b000000 : begin
Jump=0;BEQ=0;memToReg=0;memWrite=0;ALUSrc=0;RegWrite=1;RegDest=1; 
case(FC)
6'b000000 : ALUOp=3'b010;
6'b100010 : ALUOp=3'b110;
6'b100100 : ALUOp=3'b000;
6'b100101 : ALUOp=3'b001;
endcase
end
6'b100011 : begin
Jump=0;BEQ=0;memToReg=1;memWrite=0;ALUSrc=1;RegWrite=1;RegDest=0;ALUOp=3'b010; 
 end
6'b101011 : begin
Jump=0;BEQ=0;memToReg=0;memWrite=1;ALUSrc=1;RegWrite=0;RegDest=0;ALUOp=3'b010; 
 end 
6'b000100 : begin
Jump=0;BEQ=1;memToReg=0;memWrite=0;ALUSrc=0;RegWrite=0;RegDest=0;ALUOp=3'b010; 
 end
6'b101011 : begin
Jump=1;BEQ=0;memToReg=0;memWrite=0;ALUSrc=0;RegWrite=0;RegDest=0;ALUOp=3'b010; 
 end    
endcase
end
endmodule
