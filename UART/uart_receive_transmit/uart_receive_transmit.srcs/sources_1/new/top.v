`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2024
// Design Name: 
// Module Name: uart_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Top module to receive data via UART and transmit it back
// 
// Dependencies: uart_receive, transmitter
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module uart_top(
    input clk, // system clock
    input reset, // system reset
    input RxD, // UART receive data line
    //input transmit, // trigger transmission
    output reg [7:0] RxData,
    output TxD // UART transmit data line
    );

    // Internal signals
    wire [7:0] received_data;
    wire done;
    reg transmit;
    reg [7:0] data_to_transmit;
    
    // Instantiate the UART receiver
    uart_receive uart_receiver (
        .clk(clk),
        .reset(reset),
        .RxD(RxD),
        .RxData(received_data),
        .done(done)
    );

    // Instantiate the UART transmitter
    transmitter uart_transmitter (
        .clk(clk),
        .reset(reset),
        .transmit(transmit),
        .data(data_to_transmit),
        .TxD(TxD)
    );
    
    // Data handling logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_to_transmit <= 8'b0;
            RxData <= 8'b11111111;
            transmit <= 0;
        end else begin
        if (done) begin
            RxData <= received_data;
            transmit <= 1;
            data_to_transmit <= received_data;
        end
        else
            transmit <= 0;
        end
    end
endmodule
