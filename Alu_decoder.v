`timescale 1ns / 1ps

module Alu_decoder (
  input [1:0] ALUOp,
  input [2:0] Funct3,
  input Funct7_5,
  input opcode_5,

  output reg [2:0] ALU_control
);

always @(*) 
begin
  casex (ALUOp)
    2'b00: ALU_control = 3'b000; // (add) lw, sw
    2'b01: ALU_control = 3'b001; // (sub) beq
    2'b10: 
    begin
      casex ({Funct3, opcode_5, Funct7_5})
        5'b00000: ALU_control = 3'b000; // add
        5'b00001: ALU_control = 3'b000; // add
        5'b00010: ALU_control = 3'b000; // add
        5'b00011: ALU_control = 3'b001; // sub
        5'b010xx: ALU_control = 3'b101; // slt
        5'b110xx: ALU_control = 3'b011; // or
        5'b111xx: ALU_control = 3'b010; // and
        5'b00110: ALU_control = 3'b110; // sll
        5'b10010: ALU_control = 3'b100; // XOR
        5'b101x0: ALU_control = 3'b111; // srl
        default: ALU_control = 3'bxxx; //3'bxxx
      endcase
    end
    default: ALU_control = 3'bxxx; //3'bxxx
  endcase
end

endmodule
