`timescale 1ns / 1ps

module tb_bram;

// Port signals for connecting with the BRAM
reg clka = 0;
reg ena = 0;
reg [0:0] wea = 1'b0;
reg [7:0] addra = 8'b0;
reg [7:0] dina = 8'b0;
wire [7:0] douta;

// Clock period
localparam clk_period = 10;

// Instantiate the BRAM component
BRAM_test bram (
    .clka(clka),
    .ena(ena),
    .wea(wea),
    .addra(addra),
    .dina(dina),
    .douta(douta)
);

// Generate the clock for BRAM
always #(clk_period / 2) clka = ~clka;

// Generate the inputs to apply to the BRAM
initial begin
    #(clk_period);
    ena = 1;
    wea = 1'b0;
    addra = 8'h00; #(clk_period);
    addra = 8'h01; #(clk_period);
    addra = 8'h02; #(clk_period);
    addra = 8'h03; #(clk_period);
    addra = 8'h04; #(clk_period);
    addra = 8'h05; #(clk_period);
    addra = 8'h06; #(clk_period);
    $stop;
end

endmodule

// BRAM_test module definition (for simulation purposes, replace with actual implementation)
module BRAM_test (
    input clka,
    input ena,
    input [0:0] wea,
    input [7:0] addra,
    input [7:0] dina,
    output [7:0] douta
);
    // Internal memory for simulation
    reg [7:0] mem [0:255];
    
    always @(posedge clka) begin
        if (ena) begin
            if (wea)
                mem[addra] <= dina;
            douta <= mem[addra];
        end
    end
endmodule
