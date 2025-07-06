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


module Sign_Extend(input wire [31:7] Instr, input wire [1:0] select, output wire [31:0] out);
assign out = (select == 2'b00) ?  {{20{Instr[31]}}, Instr[31:20]}:
             (select == 2'b01) ?  {{20{Instr[31]}}, Instr[31:25], Instr[11:7]}:
             (select == 2'b10) ?  {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0}:
             (select == 2'b11) ?  {{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0}:
             32'bx;
endmodule
