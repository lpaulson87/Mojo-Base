`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:30 01/04/2017 
// Design Name: 
// Module Name:    input_capture 
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
module input_capture(
	input clk,
	input rst,
	output [3:0] channel,
	input new_sample,
	input [9:0] sample,
	input [3:0] sample_channel,
	output [7:0] led
    );

	assign channel = 4'd0;		//only read A0
	
	reg [9:0] sample_d, sample_q;
	wire pwm;
	
	pwm #(.CTR_LEN(10)) ped_pwm(	//10bit PWM
		.clk(clk),
		.rst(rst),
		.compare(sample_q),
		.pwm(pwm)
		);
		
	assign led  = {8{pwm}};		//8 replicas of PWM
	
	always @(*) begin
		sample_d = sample_q;
		
		if (new_sample && sample_channel == 4'd0)
			sample_d = sample;
	end
	
	always @(posedge clk) begin
		if (rst) begin
			sample_q = 10'd0;
		end else begin
			sample_q = sample_d;
		end
	end

endmodule
