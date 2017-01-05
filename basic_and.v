`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:04 12/03/2016 
// Design Name: 
// Module Name:    basic_and 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module basic_and#(parameter WIDTH = 1)(
	input [WIDTH-1:0] a,
	input [WIDTH-1:0] b,
	output [WIDTH-1:0] out
);

assign out = a&b;

endmodule
