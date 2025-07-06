`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2025 22:49:47
// Design Name: 
// Module Name: Multiplexer_2x1
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


module Multiplexer_2x1(input wire [31:0] in1, input wire [31:0] in2, input wire sel, output wire [31:0] out);
assign out = (sel == 1'b0) ? in1 : in2;
endmodule
