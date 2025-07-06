`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 17:15:06
// Design Name: 
// Module Name: Mic_pip_tb
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


module Mic_pip_tb();
reg clk;
Pipelined_Microprocessor mp(clk);
initial
begin
clk = 1'b0;
forever #5 clk <= ~clk;
end
endmodule
