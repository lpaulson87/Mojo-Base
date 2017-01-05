`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:13 01/02/2017 
// Design Name: 
// Module Name:    message_rom 
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
module message_rom(

	input clk,
	input [3:0] addr,
	output [7:0] data
    );
	 
	 wire [7:0] rom_data [13:0];
	 
	 assign rom_data[0] = "H";
	 assign rom_data[1] = "E";
	 assign rom_data[2] = "L";
	 assign rom_data[3] = "L";
	 assign rom_data[4] = "O";
	 assign rom_data[5] = " ";
	 assign rom_data[6] = "W";
	 assign rom_data[7] = "O";
	 assign rom_data[8] = "R";
	 assign rom_data[9] = "L";
	 assign rom_data[10] = "D";
	 assign rom_data[11] = "!";
	 assign rom_data[12] = "\n";
	 assign rom_data[13] = "\r";
	 
	reg [7:0] data_d, data_q;
	
	assign data = data_q;
	
	always @(*) begin
		if (addr > 4'd13)
			data_d = " ";
		else
			data_d = rom_data[addr];
		end
		
	always @(posedge clk) begin
		data_q = data_d;
	end

endmodule
