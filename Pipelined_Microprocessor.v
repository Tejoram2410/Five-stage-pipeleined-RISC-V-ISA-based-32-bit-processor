`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 16:31:36
// Design Name: 
// Module Name: Pipelined_Microprocessor
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


module Pipelined_Microprocessor(input wire CLK);
wire StallF,StallD,FlushD,RegWriteW,FlushE;
wire [1:0] PCSrcE,ForwardAE,ForwardBE;
wire [2:0] controlW;
wire [3:0] controlM;
wire [4:0] RdW,Rs1E,Rs2E,RdE,RdM,Rs1D,Rs2D;
wire [10:0] controlE;
wire [2:0] funct3E;
wire [31:0] PCTargetE,InstrD,PCD,PCPlus4D,ResultW,RD1E,RD2E,PCE,ImmExtE,PCPlus4E,ALUResultMH,ALUResultM,WriteDataM,PCPlus4M,ALUResultW,ReadDataW,PCPlus4W,ALUResultE;
Fetch_Stage F(CLK,StallF,StallD,FlushD,PCSrcE,PCTargetE,ALUResultE,InstrD,PCD,PCPlus4D);
Decode_Stage D(InstrD,PCD,PCPlus4D,ResultW,RdW,CLK,RegWriteW,FlushE,Rs1D,Rs2D,RD1E,RD2E,PCE,ImmExtE,PCPlus4E,Rs1E,Rs2E,RdE,controlE,funct3E);
Execute_Stage E(RD1E,RD2E,PCE,ImmExtE,PCPlus4E,ALUResultMH,ResultW,Rs1E,Rs2E,RdE,funct3E,controlE,ForwardAE,ForwardBE,CLK,PCTargetE,ALUResultE,PCSrcE,ALUResultM,WriteDataM,PCPlus4M,RdM,controlM);
MemWrite_Stage M(ALUResultM,WriteDataM,RdM,PCPlus4M,controlM,CLK,ALUResultMH,ALUResultW,ReadDataW,PCPlus4W,RdW,controlW);
WriteBack_Stage W(ALUResultW,ReadDataW,PCPlus4W,controlW,ResultW,RegWriteW);
Hazard_Unit H(Rs1D,Rs2D,Rs1E,Rs2E,RdE,RdM,RdW,controlE[8],controlM[3],RegWriteW,StallF,StallD,FlushD,FlushE,ForwardAE,ForwardBE,PCSrcE);
endmodule
