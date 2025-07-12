`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 22:20:55
// Design Name: 
// Module Name: Decode_Stage
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


module Decode_Stage(input wire [31:0] InstrD, PCD, PCPlus4D, ResultW,
                    input wire [4:0] RdW,
                    input wire CLK, RegWriteW,FlushE,
                    output wire [4:0] Rs1D,Rs2D,
                    output reg [31:0] RD1E,RD2E,PCE,ImmExtE,PCPlus4E,
                    output reg [4:0] Rs1E, Rs2E, RdE,
                    output reg [10:0] controlE,
                    output reg [2:0] funct3E);
wire RegWriteD,MemWriteD,JumpD,BranchD,ALUSrcD;
wire [1:0] ResultSrcD,ImmSrcD;
wire [3:0] ALUControlD; 
wire [31:0] RD1,RD2,ImmExtD;
Register_file Rf(InstrD[19:15],InstrD[24:20],RdW,ResultW,CLK,RegWriteW,RD1,RD2);
Sign_Extend Ext(InstrD[31:7],ImmSrcD,ImmExtD);
Controller C(InstrD[6:0],InstrD[14:12],InstrD[30],ALUControlD,ImmSrcD,ResultSrcD,MemWriteD,ALUSrcD,RegWriteD,BranchD,JumpD);
assign Rs1D = InstrD[19:15], Rs2D = InstrD[24:20];
initial
begin
RD1E <= 32'b0; RD2E <= 32'b0; PCE <= 32'b0; ImmExtE<= 32'b0; PCPlus4E <= 32'b0;
Rs1E <= 5'b0; Rs2E <= 5'b0; RdE <= 5'b0; controlE <= 11'b00000000000;
end
always @(posedge CLK)
begin
RD1E <= RD1; RD2E <= RD2; PCE <= PCD; Rs1E <= InstrD[19:15];
Rs2E <= InstrD[24:20]; RdE <= InstrD[11:7]; ImmExtE <= ImmExtD; funct3E <= InstrD[14:12];
PCPlus4E <= PCPlus4D; controlE <= {RegWriteD, ResultSrcD, MemWriteD, JumpD, BranchD, ALUControlD, ALUSrcD};
if(FlushE)
begin
RD1E <= 32'd0; RD2E <= 32'd0; PCE <= 32'd0; Rs1E <= 5'd0;
Rs2E <= 5'd0; RdE <= 5'd0; ImmExtE <= 32'd0; 
PCPlus4E <= 32'd0; controlE <= 11'd0; funct3E <= 3'd0;
end
end
endmodule
