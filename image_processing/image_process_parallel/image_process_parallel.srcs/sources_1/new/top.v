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
reg [7:0] red [0:1];
reg [7:0] green [0:1];
reg [7:0] blue [0:1];

wire [1:0] done_out;
wire [7:0] red_o [0:1];
wire [7:0] green_o [0:1];
wire [7:0] blue_o [0:1];

//BRAM Parameters
reg ena, wea;
reg [13:0] addra;
reg [47:0] dina;
wire [47:0] douta;

// States
localparam IDLE = 0, READ = 1, PROCESS = 2, LOAD= 3, WRITE = 4, DONE = 5;
reg [2:0] state, next_state;
integer i;  

// Image processing module instantiation (2 instances for parallel processing)
genvar idx;
generate
    for (idx = 0; idx < 2; idx = idx + 1) begin : image_proc_inst
        image_processing ip_inst (
            .clk(clk),
            .reset(reset),
            .sel_module(sel_module),
            .red(red[idx]),
            .green(green[idx]),
            .blue(blue[idx]),
            .done_in(done_in),
            .done_out(done_out[idx]),
            .val(val),
            .red_o(red_o[idx]),
            .green_o(green_o[idx]),
            .blue_o(blue_o[idx])
        );
    end
endgenerate
                     
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
            if(i > 9200) next_state = DONE;
            else
                next_state = READ; 
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
        addra <= 0;
    end
    else begin
    if (state == READ) begin

        end
        case (state)
            IDLE: begin
                ena <= 0;
                wea <= 0;
                addra <= 0;
                if(start)
                    ena <= 1;
                else
                    ena <= 0;
            end
            READ: begin
                red[0] <= douta[31:24];
                green[0] <= douta[39:32];
                blue[0] <= douta[47:40];
                red[1] <= douta[7:0];
                green[1] <= douta[15:8];
                blue[1] <= douta[23:16];
                
            //$display("red, green, blue: %b%b%b", red, green, blue);
            end
            PROCESS: begin
                addra <= addra + 1;
                i <= i +1;             
            end
            DONE: begin
                ena <= 0;
                addra <= 0;
            end
            default: begin
                ena <= 0;
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
        case (state)
            IDLE: begin
                done_in <= 0;
            end
            READ: begin
                done_in <= 1;//done_in <= 1;
            end
            PROCESS: begin
                done_in <= 0;
                //i <= i + 1;
                //addra <= addra +1;
            end
            DONE: begin
                ;
            end
            default: begin
                ;
            end
        endcase
    end
end
    assign done = (state == DONE);


    
endmodule