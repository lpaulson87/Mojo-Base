`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:28 01/02/2017 
// Design Name: 
// Module Name:    message_printer 
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
module message_printer(
	input clk,
	input rst,
	output [7:0] tx_data,
	output reg new_tx_data,
	input tx_busy,
	input [7:0] rx_data,
	input new_rx_data
    );
	 
	 localparam STATE_SIZE = 1;
	 localparam IDLE = 0, PRINT_MESSAGE = 1;
	 
	 localparam MESSAGE_LEN = 14;
	 
	 reg [STATE_SIZE-1:0] state_d, state_q;
	 reg [3:0] addr_d, addr_q;
	 
	 message_rom message_rom(
		.clk(clk),
		.addr(addr_q),
		.data(tx_data)
		);
		
		always @(*) begin
			state_d = state_q;	//default values
			addr_d = addr_q;		//need to prevent latches
			new_tx_data = 1'b0;
			
			case (state_q)
				IDLE: begin
					addr_d = 4'b0;
					if (new_rx_data && rx_data == "h")
						state_d = PRINT_MESSAGE;
				end
				PRINT_MESSAGE: begin
					if(!tx_busy) begin
						new_tx_data = 1'b1;
						addr_d = addr_q + 1'b1;
						if (addr_q == MESSAGE_LEN-1)
							state_d = IDLE;
					end
				end
				default: state_d = IDLE;
			endcase
		end
		
		always @(posedge clk) begin
			if(rst) begin
				state_q <= IDLE;
			end else begin
				state_q <= state_d;
			end
			
			addr_q <= addr_d;
		end
			
endmodule
