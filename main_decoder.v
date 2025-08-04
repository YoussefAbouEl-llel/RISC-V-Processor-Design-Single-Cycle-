module main_decoder(

input [6:0] opcode,

output reg Branch,
output reg [1:0] ResultSrc,
output reg MemWrite,
output reg ALUSrc,
output reg RegWrite,
output reg [1:0] ALUOp,
output reg [1:0] ImmSrc,
output reg jump

);


localparam R_type = 7'b0110011 ; //51
localparam I_type = 7'b0000011 ; //3 for lw , lb
localparam I_type_Alu = 7'b0010011 ; //19 for addi , ssli  , srai
localparam B_type = 7'b1100011 ; //99
localparam S_type = 7'b0100011 ; //35
localparam j_type = 7'b1101111 ; //111

always@(*)
begin
  case (opcode)
  R_type: 
  begin
    RegWrite = 1;
    ImmSrc = 2'bxx; // No immediate
    ALUSrc = 0;
    MemWrite = 0;
    ResultSrc = 2'b00;
    Branch = 0;
    ALUOp = 2'b10; // R-type
    jump = 0;
  end

    I_type: 
  begin
    RegWrite = 1;
    ImmSrc = 2'b00; // immediate
    ALUSrc = 1;
    MemWrite = 0;
    ResultSrc = 2'b01;
    Branch = 0;
    ALUOp = 2'b00; // I-type
    jump = 0;
  end

  I_type_Alu: 
  begin
    RegWrite = 1;
    ImmSrc = 2'b00; // immediate
    ALUSrc = 1;
    MemWrite = 0;
    ResultSrc = 2'b00;
    Branch = 0;
    ALUOp = 2'b10; // I-type
    jump = 0;
  end

  B_type: 
  begin
    RegWrite = 0;
    ImmSrc = 2'b10;
    ALUSrc = 0;
    MemWrite = 0;
    ResultSrc = 2'bxx; 
    Branch = 1;
    ALUOp = 2'b01; // B-type
    jump = 0;
  end

  S_type: 
  begin
    RegWrite = 0;
    ImmSrc = 2'b01; // immediate
    ALUSrc = 1;
    MemWrite = 1;
    ResultSrc = 2'bxx; // No result to write back 
    Branch = 0;
    ALUOp = 2'b00; // S-type
    jump = 0;
  end

    j_type: 
  begin
    RegWrite = 1;
    ImmSrc = 2'b11; // No immediate
    ALUSrc = 1'bx; 
    MemWrite = 0;
    ResultSrc = 2'b10;
    Branch = 0;
    ALUOp = 2'bxx; // Jump type
    jump = 1;
  end

    default: 
    begin
    RegWrite = 0;
    ImmSrc = 2'b00;
    ALUSrc = 0;
    MemWrite = 0;
    ResultSrc = 2'b00;
    Branch = 0;
    ALUOp = 2'b00;
    jump = 0;
    end
  endcase
end

endmodule