`timescale 1ns / 1ps

module sign_extend(
input [31:7] in_data,
input [1:0] ImmSrc,
output reg [31:0] Imm_Ext
);

localparam I = 0;
localparam S = 1;
localparam B = 2;
localparam J = 3;
//localparam U = 4;

always @(*)
begin
case (ImmSrc)
I: assign Imm_Ext = { {20{in_data[31]}}, in_data[31:20] }; //12-bit signed immediate
S: assign Imm_Ext = { {20{in_data[31]}}, in_data[31:25], in_data[11:7] }; //12-bit signed immediate
B: assign Imm_Ext = { {20{in_data[31]}}, in_data[7], in_data[30:25], in_data[11:8], 1'b0}; //13-bit signed immediate
J: assign Imm_Ext = { {12{in_data[31]}}, in_data[19:12] , in_data[20], in_data[30:21], 1'b0 }; //21-bit signed immediate
//U: assign Imm_Ext = { {12{in_data[31]}}, in_data[31:12]};
default: assign Imm_Ext = 32'b0; 
endcase
end
endmodule