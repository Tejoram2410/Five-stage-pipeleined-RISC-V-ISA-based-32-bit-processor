`timescale 1ns / 1ps

module test_bench;
reg clk;
microcontroller viggu(clk);
initial
begin
clk = 1'b0;
forever #5 clk <= ~clk;
end
endmodule
