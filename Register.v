`timescale 1ns / 1ps

module Register(
input [31:0] D ,
input reset_n ,
input clk,
output reg [31:0] Q 
    );
    always@(posedge clk , negedge reset_n)
    begin
    
    if(~reset_n)
         Q <= 0 ;
    else
         Q <= D ;
    end    
    
endmodule
