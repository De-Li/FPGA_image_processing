`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2024
// Design Name: 
// Module Name: uart_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Test bench for uart_top module
// 
// Dependencies: uart_top
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module uart_top_tb();

    // Test bench signals
    reg clk;
    reg reset;
    reg RxD;
    wire [7:0] RxData;
    wire TxD;
    wire image_done;
    wire clk_debug;
    wire transmit_debug;

    // Instantiate the UART top module
    top uut (
        .clk(clk),
        .reset(reset),
        .RxD(RxD),
        .RxData(RxData),
        .TxD_debug(TxD),
        .image_done(image_done),
        .clk_debug(clk_debug),
        .transmit_debug(transmit_debug)
    );
    
    parameter test_interval = 100000000 / (9600 * 1000);
    
    // UART transmit task
    task uart_transmit;
        input [7:0] data;
        integer i;
        begin
            // Start bit
            RxD = 0;
            #(test_interval * 16); // Adjust this delay based on baud rate and clock frequency
            
            // Data bits
            for (i = 0; i < 8; i = i + 1) begin
                RxD = data[i];
                #(test_interval * 16); // Adjust this delay based on baud rate and clock frequency
            end

            // Stop bit
            RxD = 1;
            #(test_interval * 16); // Adjust this delay based on baud rate and clock frequency
        end
    endtask

    // Clock generation
    always #5 clk = ~clk; // 100 MHz clock

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        RxD = 1;

        // Apply reset
        #20 reset = 0;

        // Monitor the signals in the top module
        $monitor("Time: %0t | state: %b | RxData: %b | data_to_transmit: %b | transmit: %b | image_done: %b | TxD: %b", 
                 $time, uut.state, uut.RxData, uut.data_to_transmit, uut.transmit, uut.image_done, uut.TxD_debug);

        // Send a byte (0xA5) via RxD with start and stop bits
        uart_transmit(8'hA5);

        wait(uut.image_done);

        // Send a byte (0x55) via RxD with start and stop bits
        uart_transmit(8'h55);

        wait(uut.image_done);

        
        // Send a byte (0xA5) via RxD with start and stop bits
        uart_transmit(8'hA5);

        wait(uut.image_done);

        
        // Send a byte (0x15) via RxD with start and stop bits
        uart_transmit(8'h15);

        wait(uut.image_done);

        $stop;
    end
endmodule