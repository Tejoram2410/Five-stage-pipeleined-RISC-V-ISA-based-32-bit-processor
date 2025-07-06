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


module MemWrite_Stage(input wire [31:0] ALUResultM,WriteDataM,RdM,PCPlus4M,
                      input wire [3:0] controlM,
                      input wire CLK,
                      output wire [31:0] ALUResultMH,
                      output reg [31:0] ALUResultW,ReadDataW,PCPlus4W,
                      output reg [4:0] RdW,
                      output reg [2:0] controlW);
wire [31:0] ReadDataM;
Data_Memory dmem(ALUResultM,WriteDataM,controlM[0],CLK,ReadDataM);
assign ALUResultMH = ALUResultM;
initial
begin
ALUResultW <= 32'b0; ReadDataW <= 32'b0; PCPlus4W <= 32'b0;
RdW <= 5'b0; controlW <= 3'b0;
end
always @(posedge CLK)
begin
ALUResultW <= ALUResultM; ReadDataW <= ReadDataM; PCPlus4W <= PCPlus4M;
RdW <= RdM; controlW <= controlM[3:1];
end
endmodule