`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2024 04:55:26 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk, // Input clock from the board
    input reset, // Reset signal from the board
    input btn_transmit, // Button signal to trigger the UART communication
    input [7:0] sw, // 8-bit data from switches
    output TxD // UART Transmitter serial output
    );
/*
assign TxD_debug = TxD;
assign transmit_debug = transmit;
assign button_debug = btn1;
assign clk_debug = clk;
*/

//transmit_debouncing D2 (.clk(clk), .btn1(btn_transmit), .transmit(transmit));

// Instantiate the transmitter module
transmitter uut (
    .clk(clk),
    .reset(reset),
    .transmit(btn_transmit),
    .data(sw),
    .TxD(TxD)
);

/*
// Monitor internal signals
initial begin
    $monitor("Time=%0d clk=%b reset=%b btn_transmit=%b sw=%h TxD=%b state=%d nextstate=%d bitcounter=%d rightshiftreg=%b",
             $time, clk, reset, btn_transmit, sw, TxD, uut.state, uut.nextstate, uut.bitcounter, uut.rightshiftreg);
end
*/
endmodule
