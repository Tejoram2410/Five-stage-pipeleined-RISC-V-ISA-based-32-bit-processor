`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2025 13:52:45
// Design Name: 
// Module Name: Controller
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


module Controller(input wire [6:0] op,
                  input wire [2:0] funct3,
                  input wire funct7,
                  output wire [2:0] ALUControl,
                  output wire [1:0] ImmSrc,ResultSrc,
                  output wire MemWrite,ALUSrc,RegWrite,Branch,Jump);
wire [1:0] ALUOp;
Main_Decoder MD(op,ImmSrc,ALUOp,ResultSrc,Branch,Jump,MemWrite,ALUSrc,RegWrite);
ALU_Decoder ALUD(op,funct3,ALUOp,funct7,ALUControl);
endmodule
