`timescale 1ns / 1ps

module reg_file(
        input clk,
        input write_en,
		
        input [4:0] r_addr0, r_addr1,
        input [4:0] w_addr,
		
        input [31:0] w_data,
        output reg [31:0] r_data0, r_data1
    );
    
    reg [31:0] regfile [0:31];
    
    always @(posedge clk)
    begin
        if (write_en)
            regfile[w_addr] <= w_data;
    end
    

	//assign r_data0 = (r_addr0 == 5'b0) ? 32'b0 : (write_en && (w_addr == r_addr0)) ? w_data : regfile[r_addr0];
	always@(*)
	begin
       if (r_addr0 == 5'b0)
	      r_data0 = 32'b0 ;
	   else if (write_en && (w_addr == r_addr0))
	      r_data0 = regfile[w_addr] ; // r_data0 = w_data
	   else
	      r_data0 = regfile[r_addr0] ;
	end
	
	always@(*)
    begin
       if (r_addr1 == 5'b0)
          r_data1 = 32'b0 ;
       else if (write_en && (w_addr == r_addr1))
          r_data1 = regfile[w_addr] ;
       else
          r_data1 = regfile[r_addr1] ;
    end
    //assign r_data1 = (r_addr1 == 5'b0) ? 32'b0 : (write_en && (w_addr == r_addr1)) ? w_data : regfile[r_addr1];
    
    initial 
        begin
        
            regfile[0] = 32'h00000000;
            regfile[1] = 32'h00000000;
            regfile[2] = 32'h00000000;
            regfile[3] = 32'h00000000;
            regfile[4] = 32'h00000000;
            regfile[5] = 32'h00000000;
            regfile[6] = 32'h00000000;
            regfile[7] = 32'h00000000;
            regfile[8] = 32'h00000000;
            regfile[9] = 32'h00000000;
            regfile[10] = 32'h00000000;
            regfile[11] = 32'h00000000;
            regfile[12] = 32'h00000000;
            regfile[13] = 32'h00000000;
            regfile[14] = 32'h00000000;
            regfile[15] = 32'h00000000;
            regfile[16] = 32'h00000000;
            regfile[17] = 32'h00000000;
            regfile[18] = 32'h00000000;
            regfile[19] = 32'h00000000;
            regfile[20] = 32'h00000000;
            regfile[21] = 32'h00000000;
            regfile[22] = 32'h00000000;
            regfile[23] = 32'h00000000;
            regfile[24] = 32'h00000000;
            regfile[25] = 32'h00000000;
            regfile[26] = 32'h00000000;
            regfile[27] = 32'h00000000;
            regfile[28] = 32'h00000000;
            regfile[29] = 32'h00000000;
            regfile[30] = 32'h00000000;
            regfile[31] = 32'h00000000;
            
        end
    
endmodule
