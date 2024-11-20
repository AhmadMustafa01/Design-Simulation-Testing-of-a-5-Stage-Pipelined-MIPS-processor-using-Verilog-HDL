`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: DataPath
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


module DataPath(
  input clk,
  input Reset
);
  wire [31:0] outputMux4;
  wire regDest, regWrite, aluSrc, aluOp, memWrite, memToReg, beq, jump; 
  wire [31:0] pcOut, arfOut, instructionOut, brfOut, extOut, muxOut, aluOut, dataMemOut, mux2Out, add1Out, add2Out, concatOut, mux3Out;
  wire [4:0] rs, rt, rd, mux5Out;
  wire [5:0] functCode, opCode;
  wire [15:0] immediate;
  wire [25:0] jumpAddress;
  wire zeroFlag, pcSrc;
  wire [27:0] shiftOut;
  
  assign functCode = instructionOut[5:0];
  assign rs = instructionOut[25:21];
  assign rt = instructionOut[20:16];
  assign rd = instructionOut[15:11];
  assign opCode = instructionOut[31:26];
  assign immediate = instructionOut[15:0];
  assign jumpAddress = instructionOut[25:0];
  assign outputMux4 = Reset;

  ProgramCounter pc(.clk(clk), .reset(Reset), .in(outputMux4), .out(pcOut));
  
  ControlUnit control(.functCode(functCode), .opCode(opCode), .jump(jump), .beq(beq), .memToReg(memToReg), .memWrite(memWrite), .aluOp(aluOp), .aluSrc(aluSrc), .regWrite(regWrite), .regDest(regDest));
  
  InstructionMemory instrMem(.select(pcOut), .out(instructionOut));
  
  MUX5Bits2X1 mux5(.sel(regDest), .in1(rd), .in2(rt), .out(mux5Out));
  
  RegisterFile regFile(.dataIn(mux2Out), .data1(rs), .data2(rt), .writeData(rd), .writeEnable(regWrite), .outA(arfOut), .outB(brfOut));
  
  SignExtender signExtender(.in(immediate), .out(extOut));
  
  Mux32Bits2X1 mux32_1(.sel(aluSrc), .in1(extOut), .in2(brfOut), .out(muxOut));
  
  ALU alu(.data1(arfOut), .data2(muxOut), .op(aluOp), .out(aluOut), .zeroFlag(zeroFlag));
  
  DataMemory dataMem(.writeEnable(memWrite), .address(aluOut), .writeData(brfOut), .out(dataMemOut));
  
  Mux32Bits2X1 mux32_2(.sel(memToReg), .in1(dataMemOut), .in2(aluOut), .out(mux2Out));
  
  FullAdder32Bits adder1(.in1(4), .in2(pcOut), .sum(add1Out));
  
  ShiftLeft shift(.in(jumpAddress), .out(shiftOut));
  
  Concatenate concat(.in1(shiftOut), .in2(add1Out[31:28]), .out(concatOut));
  
  assign extOut = extOut << 2;
  
  FullAdder32Bits adder2(.in1(add1Out), .in2(extOut), .sum(add2Out));
  
  ANDGate andGate(beq, zeroFlag, pcSrc);
  
  Mux32Bits2X1 mux32_3(.sel(pcSrc), .in1(add2Out), .in2(add1Out), .out(mux3Out));
  
  Mux32Bits2X1 mux32_4(.sel(jump), .in1(concatOut), .in2(mux3Out), .out(outputMux4));
endmodule

