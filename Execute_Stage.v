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


module Execute_Stage(input wire [31:0] RD1E,RD2E,PCE,ImmExtE,PCPlus4E,ALUResultMH,ResultW,
                     input wire [4:0] Rs1E,Rs2E,RdE,
                     input wire [9:0] controlE,
                     input wire [1:0] ForwardAE,ForwardBE,
                     input wire CLK,
                     output wire [31:0] PCTargetE,
                     output wire PCSrcE,
                     output reg [31:0] ALUResultM,WriteDataM,PCPlus4M,
                     output reg [4:0] RdM,
                     output reg [3:0] controlM);
wire [31:0] SrcAE,SrcBE,SrcBo,ALUResultE;
wire ZeroE;
Multiplexer_3x1 M4(RD1E,ResultW,ALUResultMH,ForwardAE,SrcAE);
Multiplexer_3x1 M5(RD2E,ResultW,ALUResultMH,ForwardBE,SrcBo);
Multiplexer_2x1 M2(SrcBo,ImmExtE,controlE[0],SrcBE);
ALU Alu(SrcAE,SrcBE,controlE[3:1],ALUResultE,ZeroE);
Adder PCAdd(PCE,ImmExtE,PCTargetE);
assign PCSrcE = controlE[5] | (controlE[4] & ZeroE);
initial
begin
ALUResultM <= 32'b0; WriteDataM <= 32'b0; PCPlus4M <= 32'b0;
RdM <= 5'b0; controlM <= 4'b0;
end
always @(posedge CLK)
begin
ALUResultM <= ALUResultE; WriteDataM <= SrcBo; PCPlus4M <= PCPlus4E;
RdM <= RdE; controlM <= {controlE[9:6]}; 
end
endmodule