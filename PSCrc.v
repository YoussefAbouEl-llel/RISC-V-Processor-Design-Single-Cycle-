`timescale 1ns / 1ps

module PCSrc (

input zeroo ,
input Branch ,
input jump ,
output PCSrc

);

assign PCSrc = (zeroo & Branch) | jump ;

endmodule