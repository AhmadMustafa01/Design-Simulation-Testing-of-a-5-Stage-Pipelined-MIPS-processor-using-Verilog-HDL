`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: TestMIPS
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


module TestMIPS();
  reg clk, reset;
  MIPS processor(clk);

  always #10 clk = ~clk;

  initial begin
    clk = 1;
    reset = 1;
    #10 reset = 0;
  end
endmodule
