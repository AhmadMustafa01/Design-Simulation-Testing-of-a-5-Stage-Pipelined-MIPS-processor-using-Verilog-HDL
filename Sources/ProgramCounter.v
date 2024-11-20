`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:30:39 AM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(
input clk,
input set,
input [31:0]in,
output reg [31:0]out );

reg initialize;                     // Initialization flag

  initial begin
    initialize = 0;                   // Initialize the flag to 0
  end

  always @(posedge clk) begin
    if (initialize)                   // If the initialization flag is set
      out = in;                       // Assign the input data to the output
    if (!initialize) begin            // If the initialization flag is not set
      initialize = 1;                 // Set the initialization flag
      out = 32'b00000000000000000000000000000000;   // Reset the output to all zeros
    end
  end
endmodule