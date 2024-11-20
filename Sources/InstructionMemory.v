`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:50:07 AM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory( 
input [1:0]select,
output reg[31:0]out);

reg [31:0]memory[3:0];

initial begin
memory[0]=32'b00000000000000010001000000000000;
memory[1]=32'b00000000000000000000000000000001;
memory[2]=32'b00000000000000000000000000000011;
memory[3]=32'b00000000000000000000000000000111;
end

always @(select)
begin
out=memory[select];
end
endmodule