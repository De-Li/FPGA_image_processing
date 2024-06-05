`timescale 1ns / 1ps

module tb_top;

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
    wire [47:0] douta;
    wire done;
    wire [7:0] red_0, red_1;
    wire [7:0] green_0, green_1;
    wire [7:0] blue_0, blue_1;
    wire [7:0] red_o_0, red_o_1;
    wire [7:0] green_o_0, green_o_1;
    wire [7:0] blue_o_0, blue_o_1;

    integer coe_file;
    reg [23:0] pixel_data;

    // Instantiate the top module
    image_scheduler uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .done(done)
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
        // Open COE file for writing
        coe_file = $fopen("output.coe", "w");
        $fwrite(coe_file, "memory_initialization_radix=2;\n");
        $fwrite(coe_file, "memory_initialization_vector=\n");
        // Release reset
        reset = 0;
        start = 1;
        #10;
        start = 0;



        // Run until done signal is asserted
        wait(done);

        // Close the COE file
        $fclose(coe_file);
        
        // End simulation
        #10;
        $stop;
    end

    // Monitor signals and write to COE file
    always @(posedge clk) begin
        if (state == 1) begin
            pixel_data = {red_o_0, green_o_0, blue_o_0};
            $fwrite(coe_file, "%b,\n", pixel_data);
            pixel_data = {red_o_1, green_o_1, blue_o_1};
            $fwrite(coe_file, "%b,\n", pixel_data);
        end
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0d, State: %b, Next State: %b, Ena: %b, Wea: %b, Addra: %d, Douta: %h, Done: %b, Red[0]: %h, Green[0]: %h, Blue[0]: %h, Red[1]: %h, Green[1]: %h, Blue[1]: %h, Red_o[0]: %h, Green_o[0]: %h, Blue_o[0]: %h, Red_o[1]: %h, Green_o[1]: %h, Blue_o[1]: %h",
                 $time, state, next_state, ena, wea, addra, douta, done, red_0, green_0, blue_0, red_1, green_1, blue_1, red_o_0, green_o_0, blue_o_0, red_o_1, green_o_1, blue_o_1);
    end

    // Bindings for observing internal signals
    assign state = uut.state;
    assign next_state = uut.next_state;
    assign ena = uut.ena;
    assign wea = uut.wea;
    assign addra = uut.addra;
    assign douta = uut.douta;
    assign red_0 = uut.red[0];
    assign green_0 = uut.green[0];
    assign blue_0 = uut.blue[0];
    assign red_1 = uut.red[1];
    assign green_1 = uut.green[1];
    assign blue_1 = uut.blue[1];
    assign red_o_0 = uut.red_o[0];
    assign green_o_0 = uut.green_o[0];
    assign blue_o_0 = uut.blue_o[0];
    assign red_o_1 = uut.red_o[1];
    assign green_o_1 = uut.green_o[1];
    assign blue_o_1 = uut.blue_o[1];

endmodule
