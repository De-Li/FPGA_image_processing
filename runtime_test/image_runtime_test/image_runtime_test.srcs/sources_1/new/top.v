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

module top(
    input clk, // system clock
    input reset, // system reset
    input RxD, // UART receive data line
    //input transmit, // trigger transmission
    output reg [7:0] RxData,
    output TxD_debug, // UART transmit data line
    output image_done,
    output clk_debug,
    output transmit_debug
    );

    // Internal signals
    wire [7:0] received_data;
    wire Rx_done, Tx_done, image_done;
    reg reg_done, reg_image_done, finished;
    reg transmit, image_start;
    reg [7:0] data_to_transmit;
    reg [22:0] counter;
    
    assign clk_debug = clk;
    assign transmit_debug = transmit;
    assign TxD_debug = TxD;

    // Instantiate the image scheduler
    image_scheduler image_processor(
        .clk(clk),
        .reset(reset),
        .start(image_start),
        .done(image_done)
    );
               
    // Instantiate the UART receiver
    uart_receive uart_receiver (
        .clk(clk),
        .reset(reset),
        .RxD(RxD),
        .RxData(received_data),
        .done(Rx_done)
    );

    // Instantiate the UART transmitter
    transmitter uart_transmitter (
        .clk(clk),
        .reset(reset),
        .transmit(transmit),
        .data(data_to_transmit),
        .TxD(TxD),
        .Tx_done(Tx_done)
    );

    parameter IDLE = 0, TRAN1 = 1, TRAN2 = 2, DONE = 3, WAIT = 4;
    reg [2:0] state, nextstate;
    
    always @(posedge clk)begin
        if(reset)
            state <= IDLE;
        else begin
            state <= nextstate;
        end
    end
    
    always @(*)begin
        if(reset)
            nextstate <= IDLE;
        else
            begin
                case(state)
                    IDLE:begin
                        if(Rx_done)
                            nextstate = TRAN1;
                        else 
                            nextstate = IDLE;
                         end
                    TRAN1:begin
                        if(Tx_done)begin
                            nextstate = WAIT;
                        end
                        else
                            nextstate = TRAN1;
                        end
                    WAIT:begin
                        if(image_done)
                            nextstate = TRAN2;
                        else
                            nextstate = WAIT;
                        end
                    TRAN2:begin
                        if(Tx_done) begin
                            nextstate = DONE;
                        end
                        else
                            nextstate = TRAN2;
                        end
                    DONE:nextstate = IDLE;
                endcase
            end
    end
    
    always @(posedge clk)begin
        if(reset)begin
            transmit <= 0;
            RxData <= 8'b11111111; //R: received
        end
        case(state)
            IDLE: begin
                transmit <= 0;
                image_start = 0;
                //RxData <= 8'b11111111; //R: received
            end
            TRAN1:
            begin
                transmit <= 1;
                RxData <= 8'b11110000; //R: received
                data_to_transmit <= 8'b01010010;
                if(Tx_done) image_start = 1;
            end
            WAIT: begin
                transmit <= 0;
                image_start = 0;
            end
            TRAN2:begin
                transmit <= 1;
                
                RxData <= 8'b00001111;
                data_to_transmit <= 8'b01000100;
            end
            DONE:begin
                transmit <= 0;
            end
        endcase
    end
endmodule
