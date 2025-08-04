`timescale 1ns / 1ps

module Risk_V_tb(
);
    reg clk;
    reg reset_n;
    
    
    wire PCSrc;
    wire [1:0] ResultSrc;
    wire MemWrite;
    wire [2:0] ALUControl;
    wire ALUSrc;
    wire [1:0] ImmSrc;
    wire RegWrite;
    wire zeroo;
      
    wire [31:0] Imm_Ext;
    wire [31:0] PC;
    wire [31:0] PC_Target;
    wire [31:0] PC_Plus4;
    wire [31:0] PC_Next;
    
    
    wire [31:0] Instr;
    
    wire [31:0] SrcA;
    wire [31:0] SrcB;
    wire [31:0] WriteData;
    wire [31:0] ReadData;
    wire [31:0] ALUResult;
    wire [31:0] Result;
    
    control_unit_top control_unit(
    
        .PCSrc(PCSrc),
        .ResultSrc(ResultSrc),
        .MemWrite(MemWrite),
        .ALUControl(ALUControl),
        .ALUSrc(ALUSrc),
        .ImmSrc(ImmSrc),
        .RegWrite(RegWrite),
        .zeroo(zeroo),
        
        .opcode(Instr[6:0]),
        .Funct3(Instr[14:12]),
        .Funct7_5(Instr[30])
    );
    
    PCPlus4 pc_plus4(
        .PC(PC),
        .PC_Plus4(PC_Plus4)
    );
    
    PCTarget pc_target(
        .PC(PC),
        .Imm_Ext(Imm_Ext),
        .PC_Target(PC_Target)
    );
    
    Instruction_Memory Instruction_Memory_inst(
        .addr(PC),
        .data(Instr)
    );
    
    reg_file reg_file_inst(
    
        .clk(clk),
        .write_en(RegWrite),
        .r_addr0(Instr[19:15]),
        .r_addr1(Instr[24:20]),
        .w_addr(Instr[11:7]),
        .w_data(Result),
        .r_data0(SrcA),
        .r_data1(WriteData)
    );
    
    sign_extend sign_extend_inst(
        .in_data(Instr[31:7]),
        .ImmSrc(ImmSrc),
        .Imm_Ext(Imm_Ext)
    );
    
    memory_32_bit memory_inst(
        .clk(clk),
        .write_en(MemWrite),
        .A(ALUResult),
        .w_data(WriteData),
        .r_data(ReadData)
    );
    
    mux_2x1 mux_result_src(
        .x1(WriteData),
        .x2(Imm_Ext),
        .s(ALUSrc),
        .f(SrcB)
    );
    
    mux_3x1 mux_alu_src(
        .x1(ALUResult),
        .x2(ReadData),
        .x3(PC_Plus4),
        .s(ResultSrc),
        .f(Result)
    );
    
    ALU_32_bit alu_inst(
        .a(SrcA),
        .b(SrcB),
        .alu_control(ALUControl),
        .result(ALUResult),
        .zero_flag(zeroo)
    );
    
    mux_2x1 mux_pc_src(
        .x1(PC_Plus4),
        .x2(PC_Target),
        .s(PCSrc),
        .f(PC_Next)
    );
    
    Register register(
        .D(PC_Next) ,
        .reset_n(reset_n) ,
        .clk(clk),
        .Q(PC)
    
    );

    Risk_V uut (
        .clk(clk),
        .reset_n(reset_n)
    );

    initial begin
        clk = 0;
        reset_n = 0;
        #5 reset_n = 1; // Release reset after 5 time units
    end

    always #5 clk = ~clk; // Toggle clock every 5 time units
    
    always @(posedge clk) begin
        $display("PC:%d, PC_Next:%d, Instr:%h" , PC, PC_Next, Instr);
        $display("Result:%d\n" , Result);
        //$display("PC: %h, Instr: %h", PC, Instr);
    end
    
    endmodule