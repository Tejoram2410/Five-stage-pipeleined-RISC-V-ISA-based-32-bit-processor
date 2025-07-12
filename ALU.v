`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2025 20:08:23
// Design Name: 
// Module Name: ALU
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


module ALU(input wire [31:0] SrcA,SrcB,
           input wire [3:0] ALUControl,
           output wire [31:0] ALUResult,
           output Zero,Sign,Slt);
wire signed [31:0] sSrcA = SrcA;
assign ALUResult = (ALUControl === 4'b0000)?SrcA + SrcB:
                   (ALUControl === 4'b0001)?SrcA - SrcB:
                   (ALUControl === 4'b0010)?SrcA & SrcB:
                   (ALUControl === 4'b0011)?SrcA | SrcB:
                   (ALUControl === 4'b0100)?SrcA ^ SrcB:
                   (ALUControl === 4'b0101)?SrcA << SrcB:
                   (ALUControl === 4'b0110)?SrcA >> SrcB:
                   (ALUControl === 4'b0111)?(sSrcA >>> SrcB):
                   (ALUControl === 4'b1000)?(SrcA < SrcB):
                   (ALUControl === 4'b1001)?($signed(SrcA) < $signed(SrcB)):
                   32'h00000000; 
assign Zero = (ALUResult === 1'b0) ? 1'b1 : 1'b0;
assign Sign = ALUResult[31];
assign Slt = (SrcA < SrcB);
endmodule
