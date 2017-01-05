`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:45:32 12/03/2016 
// Design Name: 
// Module Name:    button_conditioner 
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
module button_conditioner(
	
	input clk,
	input btn,
	output out
    );

	reg [19:0] ctr_d, ctr_q;
	reg [1:0] sync_d, sync_q;
	
	assign out = ctr_q == {20{1'b1}};
	
	always @(*) begin
		sync_d[0] = btn;
		sync_d[1] = sync_q[0];
		ctr_d = ctr_q + 1'b1;
		
		if (ctr_q == {20{1'b1}}) begin
			ctr_d = ctr_q;
		end
		
		if (!sync_q[1])
			ctr_d = 20'd0;
	end
	
	always @(posedge clk) begin
		ctr_q <= ctr+d;
		sync_q <= sync_d;
	end

endmodule
