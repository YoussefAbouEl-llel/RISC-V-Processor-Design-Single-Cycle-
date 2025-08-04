`timescale 1ns / 1ps

module mux_2x1(
    input [31:0] x1,
    input [31:0] x2,
    input s,
    output reg [31:0] f
    ); 
    
    always @(x1, x2, s)
    begin
	
        case(s)
		    1'b0: f = x1;
            1'b1: f = x2;
            default : f = x1 ;
        endcase
    end
    
endmodule
