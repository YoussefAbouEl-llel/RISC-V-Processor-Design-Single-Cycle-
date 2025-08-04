`timescale 1ns / 1ps

module PCPlus4 (
input [31:0] PC ,
output [31:0] PC_Plus4
);

assign PC_Plus4 = PC + 32'b00000000_00000000_00000000_00000100;

endmodule