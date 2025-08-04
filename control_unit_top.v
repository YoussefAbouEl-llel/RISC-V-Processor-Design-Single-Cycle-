`timescale 1ns / 1ps

module control_unit_top(
  input [6:0] opcode,
  input [2:0] Funct3,
  input Funct7_5,
  input zeroo,

  output PCSrc,
  output [1:0] ResultSrc,
  output MemWrite,
  output [2:0] ALUControl,
  output ALUSrc,
  output [1:0] ImmSrc,
  output RegWrite
);

wire Jump ; 
wire Branch ; 
wire [1:0] ALUOp ;

main_decoder main_decoder_inst (

  .opcode(opcode),
  .Branch(Branch),
  .ResultSrc(ResultSrc),
  .MemWrite(MemWrite),
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite),
  .ALUOp(ALUOp),
  .ImmSrc(ImmSrc),
  .jump(Jump)
  
);

Alu_decoder alu_decoder_inst (
  .ALUOp(ALUOp),
  .Funct3(Funct3),
  .Funct7_5(Funct7_5),
  .opcode_5(opcode[5]),
  .ALU_control(ALUControl)
);

PCSrc pc_src_inst (
  .zeroo(zeroo),
  .Branch(Branch),
  .jump(Jump),
  .PCSrc(PCSrc)
);

endmodule