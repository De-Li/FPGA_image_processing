`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2018 19:28:11
// Design Name: 
// Module Name: Modules
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


module image_processing( clk, reset ,red, green, blue, // input signlas 
                     red_o, green_o, blue_o);          //output signals for brightness

//sel_module = 01 (increase brightness)
//sel_module = 10 (decrease brightness)
//sel_module = 00 (rgb2gray)

 input clk, reset;
 input[7:0] red, green, blue;
 output reg[7:0] red_o, green_o, blue_o;
 reg[8:0] red_x, green_x, blue_x;

 always @(posedge clk)
    begin
        if(reset) begin
            red_o <= 0;
            green_o <= 0;
            blue_o <= 0;
        end 
        else begin
                red_o <= (red >> 2) + (red >> 5) + (green >> 1) + (green >> 4)+ (blue >> 4) + (blue >> 5);
                green_o <= (red >> 2) + (red >> 5) + (green >> 1) + (green >> 4)+ (blue >> 4) + (blue >> 5);
                blue_o <= (red >> 2) + (red >> 5) + (green >> 1) + (green >> 4)+ (blue >> 4) + (blue >> 5);
        end
    end
endmodule