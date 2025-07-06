`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2025 21:51:28
// Design Name: 
// Module Name: microcontroller
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


module microcontroller(input wire CLK);
wire [31:0] Instr;
wire [2:0] ALUControl;
wire [1:0] ResultSrc,ImmSrc;
wire Zero,PCSrc,MemWrite,ALUSrc,RegWrite;
Controller C(Instr[6:0],Instr[14:12],Instr[30],Zero,ALUControl,ImmSrc,ResultSrc,PCSrc,MemWrite,ALUSrc,RegWrite);
DataPath D(CLK,ALUControl,ImmSrc,ResultSrc,PCSrc,RegWrite,ALUSrc,MemWrite,Instr,Zero);
endmodule
