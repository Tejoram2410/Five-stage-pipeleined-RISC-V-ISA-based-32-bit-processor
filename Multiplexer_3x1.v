`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2025 14:10:39
// Design Name: 
// Module Name: Multiplexer_3x1
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


module Multiplexer_3x1(input wire [31:0] in1, input wire [31:0] in2, input wire [31:0] in3, input wire [1:0] sel, output wire [31:0] out);
assign out = (sel == 2'b00)?in1: 
             (sel == 2'b01)?in2:
             (sel == 2'b10)?in3:
             1'b0;
endmodule
