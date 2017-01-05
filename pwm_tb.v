`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:43 12/03/2016 
// Design Name: 
// Module Name:    pwm_tb 
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
module pwm_tb();

	reg clk, rst;
	reg [7:0] compare;
	wire pwm;
	
	pwm #(.CTR_LEN(8)) DUT(
		.clk(clk),
		.rst(rst),
		.compare(compare),
		.pwm(pwm)
	);

	initial begin
		clk = 1'b0;
		rst = 1'b1;
		repeat(4) #10 clk = ~clk;
		rst = 1'b0;
		forever #10 clk = ~clk;		//Generatre clock
	end
	
	initial begin
		compare = 8'd0;		//initial value
		@(negedge rst);		//wait for reset
		compare = 8'd128;
		repeat(256) @(posedge clk);
		compare = 8'd30;
		repeat(256) @(posedge clk);
		$finish;
	end

endmodule
