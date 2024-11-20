`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:30:39 AM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(input [31:0]Din,input [4:0]Data1,input [4:0]Data2,input [4:0]Write_data,input write,output reg [31:0]outA,output reg [31:0]outB );
reg [31:0]mem[31:0];
initial begin
mem[1]=32'b00000000000000000000000000000001;
mem[2]=32'b00000000000000000000000000000010;
end
always @(*)begin
if(write==1)
begin
mem[Write_data]=Din;
end
outA=Data1;
outB=Data2;
end    
endmodule
