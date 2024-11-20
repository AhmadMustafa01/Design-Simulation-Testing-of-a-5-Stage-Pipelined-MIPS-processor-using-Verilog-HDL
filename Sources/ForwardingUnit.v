`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: ForwardingUnit
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


module ForwardingUnit(
  input [4:0] Id_Ex_Rs,
  input [4:0] Id_Ex_Rt,
  input Ex_RegWrite,
  input Mem_RegWrite,
  input [4:0] Ex_Rd,
  input [4:0] Mem_Rd,
  output reg [1:0] A,
  output reg [1:0] B
);
  reg isForwardingA;
  reg isForwardingB;

  always @(*) begin
    isForwardingA = 0;
    isForwardingB = 0;

    if (Ex_RegWrite == 1 && Ex_Rd != 5'b00000 && Ex_Rd == Id_Ex_Rs) begin
      A = 2'b10;
      isForwardingA = 1;
    end

    if (Ex_RegWrite == 1 && Ex_Rd != 5'b00000 && Ex_Rd == Id_Ex_Rt) begin
      B = 2'b10;
      isForwardingB = 1;
    end

    if (Mem_RegWrite == 1 && Ex_Rd != 5'b00000 && Ex_Rd == Id_Ex_Rs) begin
      A = 2'b01;
      isForwardingA = 1;
    end

    if (Mem_RegWrite == 1 && Ex_Rd != 5'b00000 && Ex_Rd == Id_Ex_Rt) begin
      B = 2'b01;
      isForwardingB = 1;
    end

    if (isForwardingA == 0) begin
      A = 2'b00;
    end

    if (isForwardingB == 0) begin
      B = 2'b00;
    end
  end
endmodule

