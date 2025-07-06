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
           input wire [2:0] ALUControl,
           output wire [31:0] ALUResult,
           output Zero);
assign ALUResult = (ALUControl === 3'b000)?SrcA + SrcB:
                   (ALUControl === 3'b001)?SrcA - SrcB:
                   (ALUControl === 3'b010)?SrcA & SrcB:
                   (ALUControl === 3'b011)?SrcA | SrcB:
                   (ALUControl === 3'b100)?SrcA ^ SrcB:
                   (ALUControl === 3'b101)?SrcA << SrcB:
                   (ALUControl === 3'b110)?SrcA >> SrcB:
                   (ALUControl === 3'b111)?(SrcA >>> SrcB):
                   32'h00000000; 
                   
assign Zero = (ALUResult === 1'b0) ? 1'b1 : 1'b0;
endmodule
