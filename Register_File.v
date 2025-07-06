`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2025 23:45:28
// Design Name: 
// Module Name: Sign_Extend
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


module Register_file(input wire [4:0] A1,A2,A3,
                     input wire [31:0] WD3,
                     input wire clk,
                     input wire WE3,
                     output wire [31:0] RD1,RD2);
reg [31:0] mem [31:0];
initial mem[0] = 32'd0;
assign RD1 = mem[A1];
assign RD2 = mem[A2];
always @(negedge clk)
if(WE3) mem[A3]<=WD3;
endmodule

