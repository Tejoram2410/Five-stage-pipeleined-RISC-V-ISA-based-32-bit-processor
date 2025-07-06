`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2025 14:04:07
// Design Name: 
// Module Name: DataPath
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


module DataPath(input wire CLK,
                input wire [2:0] ALUControl,
                input wire [1:0] ImmSrc,ResultSrc,
                input wire PCSrc,RegWrite,ALUSrc,MemWrite,
                output wire [31:0] Instr,
                output wire Zero);
wire [31:0] PCPlus4,PCTarget,PCNext,PC,Result,ImmExt,
            SrcA,SrcB,SrcBo,ALUResult,ReadData;
Adder PCAdd4(PC,32'd4,PCPlus4);
Multiplexer_2x1 M1(PCPlus4,PCTarget,PCSrc,PCNext);
Register Program_Counter(PCNext,CLK,PC);
Instruction_Memory Imem(PC,Instr);
Register_file Rf(Instr[19:15],Instr[24:20],Instr[11:7],Result,CLK,RegWrite,SrcA,SrcBo);
Sign_Extend Ext(Instr[31:7],ImmSrc,ImmExt);
Multiplexer_2x1 M2(SrcBo,ImmExt,ALUSrc,SrcB);
ALU Alu(SrcA,SrcB,ALUControl,ALUResult,Zero);
Adder PCAdd(PC,ImmExt,PCTarget);
Data_Memory dmem(ALUResult,SrcBo,MemWrite,CLK,ReadData);
Multiplexer_3x1 M3(ALUResult,ReadData,PCPlus4,ResultSrc,Result);
 
endmodule
