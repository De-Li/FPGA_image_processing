`timescale 1ns / 1ps

module tb_top();

    // Clock and reset
    reg clk;
    reg reset;
    reg start;

    // Parameters to observe
    wire [2:0] state;
    wire [2:0] next_state;
    wire ena;
    wire wea;
    wire [14:0] addra;
    wire [23:0] douta;
    wire done;
    wire done_in;
    wire [7:0] red, green, blue;
    wire [7:0] red_o, green_o, blue_o;
    wire done_out;

    // Instantiate the top module
    top uut (
        .clk(clk),
        .reset(reset),
        .start(start)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        start = 0;
        #20;

        // Release reset
        reset = 0;
        start = 1;
        #10;
        start = 0;

        // Run for some time
        wait(uut.done);
        
        // End simulation
        $stop;
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0d, State: %b, Next State: %b, Ena: %b, Wea: %b, Addra: %d, Douta: %h, Done: %b, Done_in: %b, Red: %h, Green: %h, Blue: %h, Red_o: %h, Green_o: %h, Blue_o: %h, Done_out: %b",
                 $time, state, next_state, ena, wea, addra, douta, done, done_in, red, green, blue, red_o, green_o, blue_o, done_out);
    end

    // Bindings for observing internal signals
    assign state = uut.state;
    assign next_state = uut.next_state;
    assign ena = uut.ena;
    assign wea = uut.wea;
    assign addra = uut.addra;
    assign douta = uut.douta;
    assign done = uut.done;
    assign done_in = uut.done_in;
    assign red = uut.red;
    assign green = uut.green;
    assign blue = uut.blue;
    assign red_o = uut.red_o;
    assign green_o = uut.green_o;
    assign blue_o = uut.blue_o;
    assign done_out = uut.done_out;

endmodule
