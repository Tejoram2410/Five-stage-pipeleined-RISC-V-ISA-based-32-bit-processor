`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2025 23:16:37
// Design Name: 
// Module Name: Fetch
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


module Fetch(input wire CLK,
             input wire PCSrcM, 
             input wire StallF, 
             output wire [31:0] InstrF, PCPlus4F);
wire [31:0] PCi, PCF, PCBranchM;
Multiplexer_2x1 M(PCPlus4F,PCBranchM,PCSrcM,PCi);
Register PC(PCi,CLK,StallF,PCF);
Adder Add4(PCF,1'h4,PCPlus4F);
Instruction_Memory imem(PCF,InstrF);
endmodule
