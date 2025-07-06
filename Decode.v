`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2025 19:34:37
// Design Name: 
// Module Name: Decode
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


module Decode(input wire [31:0] InstrD, ResultW, PCF, PCPlus4F,
              input wire [5:0] RdW,
              input wire [1:0] ImmSrcD,
              input wire CLK,RegWriteW,
              output wire [31:0] PCD, Rs1D, Rs2D, RdD, ImmExtD, PCPlus4D, RD1, RD2);
Register_file RF(InstrD[19:15],InstrD[24:20],RdW,ResultW,CLK,RegWriteW,RD1,RD2); 
Sign_Extend Extend(InstrD[31:7],ImmExtD);
assign PCD = PCF;
assign Rs1D = InstrD[19:15];
assign Rs2D = InstrD[24:20];
assign RdD = InstrD[11:7];
assign PCPlus4D = PCPlus4F;
endmodule
