`timescale 1ns / 1ps

module mux_3x1(
    input [31:0] x1,
    input [31:0] x2,
    input [31:0] x3,
    input [1:0] s,
    output reg [31:0] f
    );
    
    always @(*)
    begin
        case(s)
		    2'b00: f = x1;
            2'b01: f = x2;
            2'b10: f = x3;
            default: f = 32'b0 ;
        endcase
    end   
endmodule
