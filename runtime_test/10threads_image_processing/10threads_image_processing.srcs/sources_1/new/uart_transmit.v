`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2024 04:09:29 PM
// Design Name: 
// Module Name: transmitter
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


module transmitter(
input clk, //UART input clock
input reset, // reset signal
input transmit, //btn signal to trigger the UART communication
input [7:0] data, // data transmitted
output reg TxD, // Transmitter serial output. TxD will be held high during reset, or when no transmissions aretaking place.
output Tx_done 
    );

parameter IDLE = 0, LOAD = 1, SHIFT = 2, DONE = 3;
parameter counter_threshold = 10415; //10415;

//internal variables
reg [3:0] bitcounter; //4 bits counter to count up to 10
reg [13:0] counter; //14 bits counter to count the baud rate, counter = clock / baud rate
reg [3:0] state,nextstate; // initial & next state variable
// 10 bits data needed to be shifted out during transmission.
//The least significant bit is initialized with the binary value "0" (a start bit) A binary value "1" is introduced in the most significant bit 
reg [9:0] rightshiftreg; 
reg pulse;

/*
IDLE: wait for new data in
LAOD: assemble data with start and stop bits
shift: send 1 bit data clk by clk
clear: reset counter
*/

//counter and shiftreg
always @(posedge clk, posedge reset)begin
    if(reset)
        begin
            counter <= 0;
            bitcounter <= 0;
        end
    else
        begin
        counter <= counter + 1;
        if(counter >= counter_threshold)
        begin
            pulse <= 1;
            counter <= 0;
            case(state)
            LOAD: begin
                rightshiftreg <= {1'b1,data,1'b0};
            end
            SHIFT:begin
                TxD <= rightshiftreg[0];
                rightshiftreg <= rightshiftreg >> 1;
                bitcounter <= bitcounter + 1;
            end
            endcase

        end
        else
        begin
            pulse <= 0;
            if(state != SHIFT)
                TxD <= 1;
            if(state == DONE)
                bitcounter = 0;
        end
    end
end


// state transition logic
always @(posedge clk, posedge reset)begin
    if(reset)
        begin
            state <= IDLE;
        end
    else
        state <= nextstate;
end

// next state transition logic
always @(*)begin
    if(reset)
        begin
            nextstate <= IDLE;
        end
    case(state) 
    IDLE: nextstate = (transmit) ? LOAD : IDLE;  //(transmit & pulse)
    LOAD: begin
        if(pulse)
            nextstate = SHIFT;
        else
            nextstate = LOAD;
    end
    SHIFT:begin
        if((bitcounter >= 10) & (pulse))
            nextstate = DONE;
        else
            nextstate = SHIFT;
    end
    DONE:begin
        nextstate = IDLE;
    end
    default: nextstate = IDLE;
    endcase
end

    assign Tx_done = (state == DONE) ? 1:0;

endmodule