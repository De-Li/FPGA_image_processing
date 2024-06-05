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


module image_scheduler(
input clk,
input reset,
input wire start,
output done
    );
    
integer i, j, k;
parameter numberofthreads = 10;

//image parameters declaration
//reg done_in;
reg [7:0] red [numberofthreads - 1:0];
reg [7:0] green [numberofthreads - 1:0];
reg [7:0] blue [numberofthreads - 1:0];

//wire [1:0] done_out;
wire [7:0] red_o [numberofthreads - 1:0];
wire [7:0] green_o [numberofthreads - 1:0];
wire [7:0] blue_o [numberofthreads - 1:0];

//BRAM Parameters
reg ena, wea;
reg [13:0] addra;
reg [(numberofthreads*24)-1:0] dina;
wire [(numberofthreads*24)-1:0] douta;

// States
localparam IDLE = 0, READ = 1, PROCESS = 2, LOAD= 3, WRITE = 4, DONE = 5;
reg [2:0] state, next_state;


// Image processing module instantiation (2 instances for parallel processing)
genvar idx;
generate
    for (idx = 0; idx < numberofthreads; idx = idx + 1) begin : image_proc_inst
        image_processing ip_inst (
            .clk(clk),
            .reset(reset),
            .red(red[idx]),
            .green(green[idx]),
            .blue(blue[idx]),
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
            if(i > (19470/(numberofthreads))) next_state = DONE;
            else
                next_state = READ; 
        end
        DONE: begin
            next_state = IDLE;
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
        case (state)
            IDLE: begin
                ena <= 0;
                wea <= 0;
                addra <= 0;
                i <= 0;
                if(start)
                    ena <= 1;
                else
                    ena <= 0;
            end
            READ: begin
                for (j = 0; j < numberofthreads; j = j + 1) begin : thread_loop
                        red[j] = douta[((j*24)+7) -: 8];
                        green[j] = douta[((j*24)+15) -: 8];
                        blue[j] = douta[((j*24)+23) -: 8];
                end
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
    assign done = (state == DONE);


    
endmodule