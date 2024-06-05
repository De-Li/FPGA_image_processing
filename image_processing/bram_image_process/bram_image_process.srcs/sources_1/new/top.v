`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2024 04:21:26 PM
// Design Name: 
// Module Name: top
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


module top(
input clk,
input reset,
input wire start,
output done
    );
    
//image parameters declaration
reg done_in;
reg [2:0] sel_module;
reg[7:0] val;
reg[7:0] red, green, blue;
wire done_out;
wire[7:0] red_o, green_o, blue_o;

//BRAM Parameters
reg ena, wea;
reg [14:0] addra;
reg [23:0] dina;
wire [23:0] douta;

// States
localparam IDLE = 0, READ = 1, PROCESS = 2, LOAD= 3, WRITE = 4, DONE = 5;
reg [2:0] state, next_state;
integer i;  

//image module instantiation
image_processing tb( clk, reset, sel_module,red, green, blue,     // input signlas
                 done_in, done_out,       // output signals for tgb2gray
                 val,                           // brightness values
                 red_o, green_o, blue_o);
                     
 //Bram module instantiation
 bram_image bram(
    .clka(clk),
    .ena(ena),
    .wea(wea),
    .addra(addra),
    .dina(dina),
    .douta(douta)
  );
  
// State transitional logic
always @(posedge clk) begin
    if (reset) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end

//nextstate transitional logic
always @(*) begin
    case (state)
        IDLE: begin
            if (start) next_state <= READ;
            else next_state = IDLE;
        end
        READ: begin
            next_state = PROCESS;
        end
        PROCESS: begin
            if(i > 18400) next_state = DONE;
            else
                next_state = LOAD; 
        end
        LOAD:begin //assign processed data to dina.
            next_state = WRITE;
        end
        WRITE: begin
            if (i < 18400) next_state = READ;
            else next_state = DONE;
        end
        DONE: begin
            next_state = DONE;
        end
        default: next_state = IDLE;
    endcase
end

//Bram read and write logic
always @(posedge clk) begin
    if (reset) begin
        i <= 0;
        ena <= 0;
        wea <= 0;
        addra <= 0;
    end
    else begin
        case (state)
            IDLE: begin
                ena <= 0;
                wea <= 0;
                addra <= 0;
            end
            READ: begin
                ena <= 1;
                wea <= 0;
            end
            PROCESS: begin
                ;
                //addra <= addra +1;
            end
            LOAD: begin
                wea <= 1;
                addra <= addra + 18401;
                dina[7:0] <= red_o;
                dina[15:8] <= green_o;
                dina[23:16] <= blue_o;
            end
            WRITE:begin //BRAM write dina at this state so change addra simultaneously won't affect writing address.
                addra <= addra - 18400;
                i <= i + 1;
            end
            DONE: begin
                ena <= 0;
                wea <= 0;
            end
            default: begin
                ena <= 0;
                wea <= 0;
                addra <= 0;
            end
        endcase
    end
end

//image processing logic
always @(posedge clk) begin
    if (reset) begin
        done_in <= 0;
        sel_module <= 3'b000;
        val <= 50;    
    end
    else begin
        if (state == READ) begin
            red <= douta[7:0];
            green <= douta[15:8];
            blue <= douta[23:16];
            done_in <= 1;
            //$display("red, green, blue: %b%b%b", red, green, blue);
        end
        case (state)
            IDLE: begin
                ena <= 1;
                wea <= 0;
                done_in <= 0;
                addra <= 0;
            end
            READ: begin
                ena <= 1;
                wea <= 0;
                //done_in <= 1;
            end
            PROCESS: begin
                ;
                //i <= i + 1;
                //addra <= addra +1;
            end
            LOAD:begin 
                ;
            end
            WRITE: begin
                done_in <= 0;
            end
            DONE: begin
                ena <= 0;
                wea <= 0;
            end
            default: begin
                ena <= 0;
                wea <= 0;
            end
        endcase
    end
end

    assign done = (state == DONE);


    
endmodule