`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2025 23:22:02
// Design Name: 
// Module Name: Main_Decoder
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


module Main_Decoder(input wire [6:0] op,
                    output wire [1:0] ImmSrc,ALUOp,ResultSrc,
                    output wire Branch,Jump,MemWrite,ALUSrc,RegWrite);
reg [10:0] control;
assign {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = control;
always @(*)
begin
case(op)
7'b0000011 : control = 11'b10010010000;
7'b0100011 : control = 11'b00111000000;
7'b0110011 : control = 11'b10000000100;
7'b1100011 : control = 11'b01000001010;
7'b0010011 : control = 11'b10010000100;
7'b1101111 : control = 11'b11100100001;
default : control = 11'b00000000000;
endcase
end
endmodule
