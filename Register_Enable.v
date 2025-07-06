`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 13:17:10
// Design Name: 
// Module Name: Register_Enable
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


module Register_Enable(input wire [31:0] in,
                       input wire CLK, EN,
                       output reg [31:0] out);
initial
out<=32'd0;
always @(posedge CLK)
begin
if(EN)
out<=in;
end
endmodule
