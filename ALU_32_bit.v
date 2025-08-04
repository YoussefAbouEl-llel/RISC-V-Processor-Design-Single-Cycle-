`timescale 1ns / 1ps

module ALU_32_bit
(
    input [31:0] a,
    input [31:0] b,
    input [2:0] alu_control,
    output reg [31:0] result,
    output reg zero_flag
);
    always @(*) begin
        case (alu_control)
        3'b000: result = a + b; // ADD operation
        3'b001: result = a - b; // SUBTRACT operation
        3'b010: result = a & b; // AND operation    
        3'b011: result = a | b; // OR operation
        3'b100: result = a ^ b; // XOR operation
        3'b101: result = (a < b) ? 32'b1 : 32'b0; // SLT (set if less than) operation
        3'b110: result = a << b; // SLL (shift left logical) operation
        3'b111: result = a >> b; // SRL(shift right logical) operation
        endcase

        // Set the zero flag
        zero_flag = (result == 32'b0); // Set zero flag if result is zero
    end


endmodule

           