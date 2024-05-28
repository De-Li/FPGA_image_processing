`timescale 1ns / 1ps

module transmitter_tb;

reg clk;
reg reset;
reg transmit;
reg [7:0] data;
wire TxD;

// Instantiate the UART transmitter module
top uut (
    .clk(clk),
    .reset(reset),
    .btn_transmit(transmit),
    .sw(data),
    .TxD(TxD)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    reset = 1;
    transmit = 0;
    data = 8'h00;
    
    // Apply reset
    #10 reset = 0;
    
    // Transmit data 0xA5
    #10 data = 8'hA5;
    transmit = 1;
    #10 
    transmit = 0;
    #10
    
    transmit = 1;
    #40
    transmit = 0;   
    // Wait for the transmission to complete
    #500;

    // Transmit data 0x5A
    #10 data = 8'h5A;
    transmit = 1;
    #10 
    transmit = 0;
    #10
    transmit = 1;
    #40
    transmit = 0;  
    // Wait for the transmission to complete
    #500;
    
    // Finish simulation
    $stop;
end

/*
// Monitor internal signals
initial begin
    $monitor("Time=%0d clk=%b reset=%b transmit=%b data=%h TxD=%b state=%d nextstate=%d bitcounter=%d rightshiftreg=%b",
             $time, clk, reset, transmit, data, TxD, uut.state, uut.nextstate, uut.bitcounter, uut.rightshiftreg);
end
*/
endmodule
