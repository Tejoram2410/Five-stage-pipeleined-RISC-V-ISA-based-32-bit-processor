`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2025 23:09:04
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(input wire [31:0] A,WD,
                   input wire WE,CLK,
                   output wire [31:0] RD);
reg [31:0] RAM [1023:0];
assign RD = RAM[A>>2];
initial
begin
RAM[0]<=32'h000005E8;
RAM[1]<=32'h0000067F;
end
always @(*)
begin
if(WE == 1'b1) RAM[A>>2]<=WD;
end
endmodule
