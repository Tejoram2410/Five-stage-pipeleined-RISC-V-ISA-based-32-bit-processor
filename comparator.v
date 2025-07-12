`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.07.2025 12:08:09
// Design Name: 
// Module Name: comparator
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


module ControllerE(input wire [10:0] controlE,
                  input wire [2:0] funct3E,
                  input wire ZeroE, SignE, SltE,
                  output wire [1:0] PCSrcE);
assign PCSrcE = (funct3E == 3'b000) ? (controlE[10] & controlE[6] & controlE[0]) ? {controlE[6],~controlE[6]} : (controlE[6] | (controlE[5] & ZeroE)) :
                (funct3E == 3'b001) ? (controlE[6] | (controlE[5] & ~ZeroE)):
                (funct3E == 3'b100) ? (controlE[6] | (controlE[5] &  SignE)):
                (funct3E == 3'b101) ? (controlE[6] | (controlE[5] & ~SignE)):
                (funct3E == 3'b110) ? (controlE[6] | (controlE[5] &  SltE)):
                (funct3E == 3'b111) ? (controlE[6] | (controlE[5] & ~SltE)):
                1'b0;
endmodule
