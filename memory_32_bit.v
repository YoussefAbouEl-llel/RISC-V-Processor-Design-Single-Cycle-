`timescale 1ns / 1ps

module memory_32_bit
    (
        input clk,
        input write_en,
        input [31:0] A,
        input [31: 0] w_data,
        output reg [31: 0] r_data
    );
    
    reg [7:0] memory [0 : 1023];  // 1KB memory (1024 bytes)    
    
    always @(posedge clk)
    begin
        if (write_en)
		begin
		    memory[{A[11:2], 2'b00} + 0] <= w_data[7:0];
            memory[{A[11:2], 2'b00} + 1] <= w_data[15:8];
            memory[{A[11:2], 2'b00} + 2] <= w_data[23:16];
            memory[{A[11:2], 2'b00} + 3] <= w_data[31:24];
		end
    end
	
	always @(*)
    begin
      if (!write_en)
       r_data = {memory[{A[11:2], 2'b00} + 3] , memory[{A[11:2], 2'b00} + 2], memory[{A[11:2], 2'b00} + 1], memory[{A[11:2], 2'b00} + 0]};
    end
    
    
endmodule