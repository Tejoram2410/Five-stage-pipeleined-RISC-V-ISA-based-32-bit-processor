`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 13:33:49
// Design Name: 
// Module Name: RC
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


module RC(input wire [31:0] in,
          input wire CLK, CLR,
          output reg [31:0] out);
initial
out<=32'd0;
always @(posedge CLK)
begin
out<=in;
if(CLR)
out<=32'd0;
end
endmodule
