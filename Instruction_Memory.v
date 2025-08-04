`timescale 1ns / 1ps

module Instruction_Memory (
input [31:0] addr,
output [31:0] data
);

reg [31:0] rom [0:63] ;


// initial 
// begin
//    // Initialize ROM contents
//    rom[0] = 32'b000000000100_00000_000_01000_0010011; //# addi s0, zero, 4 ,0x00400413
//    rom[1] = 32'b000000000001_00000_000_01001_0010011; //# addi s1,zero, 1  ,0x01100493
//    //rom[1] = 32'b000000000001_01001_000_01001_0010011; //# addi s1,s1, 1    ,
//    //rom[3] = 32'b000000000001_01001_000_01001_0010011; //# addi s1,s1, 1    ,0x00148493
//    rom[2] = 32'b000000000010_01001_001_01001_0010011; //# slli s1, s1, 2     ,0x00249493
//    rom[3] = 32'b0000000_01001_01000_000_01100_1100011; //# beq s0, s1, target  ,0x00940663
//    rom[4] = 32'b000000000001_01001_000_01001_0010011; //# addi s1, s1, 1   ,0x0x00148493
//    rom[5] = 32'b0100000_01000_01001_000_01001_0110011; //# sub  s1, s1, s0 ,0x408484B3
//    rom[6] = 32'b0000000_01000_01001_000_01001_0110011; //# add s1, s1, s0 ,0x008484B3
//    rom[7] = 32'b0000000_01000_01001_000_01001_0110011; //# add s1, s1, s0 ,0x008484B3
//end
    integer i ;
    initial begin
        // Initialize specific memory locations with provided machine code
        rom[0]  = 32'h00500113;
        rom[1]  = 32'h00C00193;
        rom[2]  = 32'hFF718393;
        rom[3]  = 32'h0023E233;
        rom[4]  = 32'h0041F2B3;
        rom[5]  = 32'h004282B3;
        rom[6]  = 32'h02728863;
        rom[7]  = 32'h0041A233;
        rom[8]  = 32'h00020463;
        rom[9]  = 32'h00000293;
        rom[10] = 32'h0023A233;
        rom[11] = 32'h005203B3;
        rom[12] = 32'h402383B3;
        rom[13] = 32'h0471AA23;
        rom[14] = 32'h06002103;
        rom[15] = 32'h005104B3;
        rom[16] = 32'h008001EF;
        rom[17] = 32'h00100113;
        rom[18] = 32'h00910133;
        rom[19] = 32'h0221A023;
        rom[20] = 32'h00210063;
    
        // Initialize the rest of the memory to zero
        // Assumes WORD_DEPTH parameter is defined for the memory size
        for (i = 21; i < 32; i = i + 1) 
        begin
            rom[i] = 32'b0;
        end
    end
	
assign data = rom[addr[7:2]];

endmodule



