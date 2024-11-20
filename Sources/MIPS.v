`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 11:00:39 AM
// Design Name: 
// Module Name: MIPS
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


module MIPS (input clk);
  wire carry;
  wire [31:0] output4; // Output of EX_MEM
  wire [31:0] output32mux1, PCout, IMout, outputADDER;
  reg check;
  reg out;

  initial begin
    check = 0;
    out = 0;
  end

  always @(posedge clk) begin
    if (check > 1) begin
      out = 1;
    end
    else begin
      check = check + 1;
    end
  end

  assign carry = out & carry;

  MUX5Bits2X1 mux1(.sel(carry), .in1(outputADDER), .in2(output4), .out(output32mux1));

  ProgramCounter pc(.clk(clk), .set(1), .in(output32mux1), .out(PCout));

  InstructionMemory instructionMemory(.select(PCout), .out(IMout));

  FullAdder32Bits adder1(.in1(PCout), .in2(4), .sum(outputADDER));

  // IF/ID part
  wire [4:0] output1; // Output of MEM_WB
  wire [1:0] output4; // Output of MEM_WB
  wire [2:0] aluOp;
  wire jump, beq, memToReg, memWrite, aluSrc, regWrite, regDest;
  wire [31:0] outputIF, outputID, signOut, outputA, outputB, output32mux3;

  IF_ID if_id(.clk(clk), .in1(outputADDER), .in2(IMout), .out1(outputIF), .out2(outputID));

  ControlUnit control(.FC(outputID), .Opcode(outputID[31:26]), .Jump(jump), .BEQ(beq), .memToReg(memToReg), .memWrite(memWrite),
               .ALUOp(aluOp), .ALUSrc(aluSrc), .RegWrite(regWrite), .RegDest(regDest));

  RegisterFile registerFile(.Din(output1), .Data1(outputID[25:21]), .Data2(outputID[20:16]), .Write_data(output32mux3),
                            .write(output4[0]), .outA(outputA), .outB(outputB));

  SignExtender signExtender(.in(outputID[15:0]), .out(signOut));

  // ID/EX
  wire zero;
  wire [31:0] output3, output4, output5, output6, outputADDER2, outputALU, outputMux1, outputMux2, output32mux2;
  wire [4:0] outputRs, output1, output2, EX, output5mux;
  wire [1:0] M, WB, a, b; // a, b are the Forwarding unit output for mux

  ID_EX id_ex(.clk(clk), .inRs(outputID[25:21]), .in1(outputID[15:11]), .in2(outputID[20:16]), .in3(signOut),
              .in4(outputB), .in5(outputA), .in6(outputIF), .Jump(jump), .BEQ(beq), .memToReg(memToReg),
              .memWrite(memWrite), .ALUOp(aluOp), .ALUSrc(aluSrc), .RegWrite(regWrite), .RegDest(regDest),
              .outRs(outputRs), .out1(output1), .out2(output2), .out3(output3), .out4(output4), .out5(output5),
              .out6(output6), .out7(EX), .out8(M), .out9(WB));

  assign output3 = output3 << 2;

  FullAdder32Bits adder2(.in1(output6), .in2(output3), .sum(outputADDER2));

  // Mux for input data in ALU call in the last
  MUX5Bits2X1 mux2(.sel(EX[0]), .in1(outputMux2), .in2(output3), .out(output32mux2));

  ALU alu(.data1(outputMux1), .data2(output32mux2), .sel(EX[4:2]), .out(outputALU), .zeroFG(zero));

  MUX5Bits2X1 mux3(.sel(EX[1]), .in1(output2), .in2(output1), .out(output5mux));

  // EX/MEM
  wire [4:0] output1;
  wire [31:0] output2, output3, outputDM;
  wire output_5;
  wire [1:0] output6, output7;

  EX_MEM ex_mem(.clk(clk), .in1(output5mux), .in2(output4), .in3(outputALU), .in4(outputADDER2), .in5(zero),
                .in6(M), .in7(WB), .out1(output1), .out2(output2), .out3(output3), .out4(output4), .out5(output_5),
                .out6(output6), .out7(output7));

  
  assign carry = output5&output6[0];

  DataMemory dataMemory(.in(output6[1]), .select(output3), .data(output2), .out(outputDM));

  // MEM/WB
  wire [31:0] output2, output3;

  MEM_WB mem_wb(.in1(output1), .in2(output3), .in3(outputDM), .in4(output7), .out1(output1), .out2(output2),
                .out3(output3), .out4(output4));

  MUX5Bits2X1 mux4(.sel(output4[1]), .in1(output2), .in2(output3), .out(output32mux3));

  // Forwarding Unit function call
  ForwardingUnit forwardingUnit(.Id_Ex_Rs(outputRs), .Id_Ex_Rt(output2), .Ex_RegWrite(output7), .Mem_RegWrite(output4),
                                .Ex_Rd(output1), .Mem_Rd(output1), .A(a), .B(b));

  // Mux For ALU input data 1 and 2
  Mux4X1 mux5(.sel(a), .in1(output_5), .in2(output32mux3), .in3(output3), .out(outputMux1));

  Mux4X1 mux6(.sel(b), .in1(output4), .in2(output32mux3), .in3(output3), .out(outputMux2));
  
endmodule