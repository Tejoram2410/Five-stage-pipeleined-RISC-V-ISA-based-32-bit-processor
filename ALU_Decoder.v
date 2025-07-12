`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2025 17:02:29
// Design Name: 
// Module Name: ALU_Decoder
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


module ALU_Decoder(input wire [6:0] op,
                   input wire [2:0] funct3,
                   input wire [1:0] ALUOp,
                   input wire funct7,
                   output reg [3:0] ALUControl);
always @(*)
begin
case(ALUOp)
2'b00: ALUControl = 4'b0000;
2'b01: ALUControl = 4'b0001;
2'b10:
  case(funct3)
  3'b000:
     case({op[5],funct7})
     2'b00,2'b01,2'b10: ALUControl = 4'b0000;
     2'b11: ALUControl = 4'b0001;
     endcase
  3'b001: ALUControl = 4'b0101;
  3'b010: ALUControl = 4'b1001;
  3'b011: ALUControl = 4'b1000;
  3'b100: ALUControl = 4'b0100;
  3'b101:
    case(funct7)
    1'b0: ALUControl = 4'b0110;
    1'b1: ALUControl = 4'b0111;
    endcase
  3'b110: ALUControl = 4'b0011;
  3'b111: ALUControl = 4'b0010;   
  endcase 
endcase
end
endmodule
