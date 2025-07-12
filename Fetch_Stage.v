`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 22:19:41
// Design Name: 
// Module Name: Fetch_Stage
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


module Fetch_Stage(input wire CLK,StallF,StallD,FlushD,
                   input wire [1:0] PCSrcE,
                   input wire [31:0] PCTargetE,ALUResultE,
                   output reg [31:0] InstrD, PCD, PCPlus4D);
wire [31:0] PCF,PCPlus4F,PCF1,InstrF,PCJumpR;
wire N;
assign PCJumpR = {ALUResultE[31:1],1'b0};
Adder PCAdd4(PCF,32'd4,PCPlus4F);
Multiplexer_3x1 M1(PCPlus4F,PCTargetE,PCJumpR,PCSrcE,PCF1);
Register_Enable Program_Counter(PCF1,CLK,~StallF,PCF);
Instruction_Memory Imem(PCF,InstrF);
assign N = ~StallD;
initial
begin
InstrD <= 32'b0; PCD <= 32'b0; PCPlus4D <= 32'b0;
end
always @(posedge CLK)
begin
if(N)
begin
InstrD <= InstrF;
PCD <= PCF;
PCPlus4D <= PCPlus4F;
end
if(FlushD)
begin
InstrD <= 32'd0;
PCD <= 32'd0;
PCPlus4D <= 32'd0;
end
end
endmodule
