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
    
    wire [7:0] received_data;
    wire done;
    wire transmit;
    wire [7:0] data_to_transmit;
    
    assign received_data = uut.received_data;
    assign done = uut.done;
    assign transmit = uut.transmit;
    assign data_to_transmit = uut.data_to_transmit;
    
    // Instantiate the UART top module
    uart_top uut (
        .clk(clk),
        .reset(reset),
        .RxD(RxD),
        .RxData(RxData),
        .TxD(TxD)
    );
    
    parameter test_interval = 100000000 / (115200 * 16); // Adjusting for baud rate

    // UART transmit task
    task uart_transmit;
        input [7:0] data;
        integer i;
        begin
            // Start bit
            RxD = 0;
            #(test_interval); // Adjust this delay based on baud rate and clock frequency
            
            // Data bits
            for (i = 0; i < 8; i = i + 1) begin
                RxD = data[i];
                #(test_interval); // Adjust this delay based on baud rate and clock frequency
            end

            // Stop bit
            RxD = 1;
            #(test_interval); // Adjust this delay based on baud rate and clock frequency
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
        $timeformat(-9, 3, " ns", 6); // Set time format to nanoseconds with 3 decimal places
        // Monitor the signals in the top module
        $monitor("Time: %0t | RxData: %b | TxD: %b | data_to_transmit: %b | transmit: %b | done: %b", 
                 $time, uut.RxData, uut.TxD, uut.data_to_transmit, uut.transmit, uut.done);

        // Send a byte (0xA5) via RxD with start and stop bits
        uart_transmit(8'b10100101);

        // Wait for reception and transmission to complete
        #2000;

        // Send another byte (0x55) via RxD with start and stop bits
        uart_transmit(8'b01010101);

        // Wait for reception and transmission to complete
        #2000;

        // End of test
        $stop;
    end

endmodule