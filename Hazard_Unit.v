`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 23:59:52
// Design Name: 
// Module Name: Hazard_Unit
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


module Hazard_Unit(input wire [4:0] Rs1D,Rs2D,Rs1E,Rs2E,RdE,RdM,RdW,
                   input wire PCSrcE,ResultSrcE,RegWriteM,RegWriteW,
                   output wire StallF,StallD,FlushD,FlushE,
                   output wire [1:0] ForwardAE,ForwardBE);
wire lwStall;
assign ForwardAE = (((Rs1E == RdM) & RegWriteM) & (Rs1E != 5'd0)) ? 2'b10:
                   (((Rs1E == RdW) & RegWriteW) & (Rs1E != 5'd0)) ? 2'b01: 2'b00;
assign ForwardBE = (((Rs2E == RdM) & RegWriteM) & (Rs2E != 5'd0)) ? 2'b10:
                   (((Rs2E == RdW) & RegWriteW) & (Rs2E != 5'd0)) ? 2'b01: 2'b00;
assign FlushD = PCSrcE;
assign lwStall = ResultSrcE & ((Rs1D ==  RdE) | (Rs2D == RdE));
assign StallF = lwStall;
assign StallD = lwStall;
assign FlushE = lwStall | PCSrcE;

endmodule
