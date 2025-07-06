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


module WriteBack_Stage(input wire [31:0] ALUResultW,ReadDataW,PCPlus4W,
                       input wire [2:0] controlW,
                       output wire [31:0] ResultW,
                       output wire RegWriteW);
Multiplexer_3x1 M3(ALUResultW,ReadDataW,PCPlus4W,controlW[1:0],ResultW);
assign RegWriteW = controlW[2];
endmodule