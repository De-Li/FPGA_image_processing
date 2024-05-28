`timescale 1ns / 1ps

module receiver_tb;

// Test bench signals
reg clk;
reg reset;
reg RxD;
wire [7:0] RxData;
wire done;
wire [13:0] counter;
wire [4:0] bitcounter, oversample_counter;
wire [7:0] rxshiftreg;
wire [7:0] oversampling_data;
wire [4:0] pulsecount;
wire pulse, uart_pulse;
wire [2:0] state, nextstate;

// Assign internal signals to wires for monitoring
assign state = uut.state;
assign nextstate = uut.nextstate;
assign counter = uut.counter;
assign bitcounter = uut.bitcounter;
assign oversample_counter = uut.oversample_counter;
assign rxshiftreg = uut.rxshiftreg;
assign oversampling_data = uut.oversampling_data;
assign pulsecount = uut.pulsecount;
assign pulse = uut.pulse;
assign uart_pulse = uut.uart_pulse;

// Instantiate the UART receiver module
uart_receive uut (
    .clk(clk),
    .reset(reset),
    .RxD(RxD),
    .RxData(RxData),
    .done(done)
);

// Clock generation
always #5 clk = ~clk; // 100 MHz clock

parameter test_interval = 100000000/(9600*1000);
// UART transmit task
task uart_transmit;
    input [7:0] data;
    integer i;
    begin
        // Start bit
        RxD = 0;
        #(test_interval*16); // Adjust this delay based on baud rate and clock frequency
        // Data bits
        for (i = 0; i < 8; i = i + 1) begin
            RxD = data[i];
            #(test_interval*16); // Adjust this delay based on baud rate and clock frequency
        end

        // Stop bit
        RxD = 1;
        //#(test_interval*16); // Adjust this delay based on baud rate and clock frequency
    end
endtask

// Initial block to drive the test
initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    RxD = 1;

    // Wait for a few clock cycles
    #(40);

    // De-assert reset
    reset = 0;

    // Wait for a few clock cycles
    #(20 * 5);

    // Transmit a byte of data (0x55)
    uart_transmit(8'hA3);
     $display("transmit ha3");
    // Wait for data to be received
    wait(done);
    #(10);
    $display("transmit ha3 after wait");
    // Check received data
    if (RxData == 8'hA3) begin
        $display("Test Passed: Received data = %h", RxData);
    end else begin
        $display("Test Failed: Received data = %h", RxData);
    end

    
    // Transmit another byte of data (0xA3)
    uart_transmit(8'h55);
    // Wait for data to be received
    wait(done);
    #(10);
    $display("transmit h55 after wait");
    // Check received data
    if (RxData == 8'h55) begin
        $display("Test Passed: Received data = %h", RxData);
    end else begin
        $display("Test Failed: Received data = %h", RxData);
    end
    
     #(40);
        // Transmit a byte of data (0x55)
    uart_transmit(8'hA3);
     $display("transmit ha3");
    // Wait for data to be received
    wait(done);
    #(10);
    $display("transmit ha3 after wait");
    // Check received data
    if (RxData == 8'hA3) begin
        $display("Test Passed: Received data = %h", RxData);
    end else begin
        $display("Test Failed: Received data = %h", RxData);
    end
    
    #(40);
    // End simulation
    $stop;
    
end

// Monitor all important signals
initial begin
    //$monitor("Time = %0t, state = %0d, nextstate = %0d, counter = %0d, bitcounter = %0d, oversample_counter = %0d, rxshiftreg = %0h, oversampling_data = %0h, pulsecount = %0d, pulse = %0d, uart_pulse = %0d, RxD = %0d, RxData = %0h, done = %0d",
          //  $time, uut.state, uut.nextstate, uut.counter, uut.bitcounter, uut.oversample_counter, uut.rxshiftreg, uut.oversampling_data, uut.pulsecount, uut.pulse, uut.uart_pulse, RxD, RxData, done);
end

endmodule
