`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.02.2025 22:03:14
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(input wire [31:0] PCF, output wire [31:0] RD);
reg [31:0] RAM [1023:0];
//assign RAM[0] = 32'hFFC4A303;
//initial 
//begin
//$readmemh("instruction.hex",RAM);
//end
assign RD = RAM[PCF>>2];
initial
begin
RAM[0]<=32'h00500293;  
RAM[1]<=32'h00600313;  
RAM[2]<=32'h00000393;   
RAM[3]<=32'h00000e13;     
RAM[4]<=32'h005e0e33;
RAM[5]<=32'h00138393;
RAM[6]<=32'hfe731ce3;
RAM[7]<=32'h00000000;
RAM[8]<=32'h00000000;
RAM[9]<=32'h00000000;
RAM[10]<=32'h00000000;
RAM[11]<=32'h00000000;
end
endmodule



