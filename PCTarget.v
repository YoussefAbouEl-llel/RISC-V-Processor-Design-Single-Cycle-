`timescale 1ns / 1ps

module PCTarget(
input [31:0] PC, 
input [31:0] Imm_Ext,
 
output [31:0] PC_Target

);

assign PC_Target = PC + Imm_Ext ;

endmodule