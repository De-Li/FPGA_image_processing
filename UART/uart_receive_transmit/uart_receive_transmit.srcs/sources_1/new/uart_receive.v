`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2015 12:03:40 PM
// Design Name: 
// Module Name: receiver
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

//

module uart_receive(
input clk, //input clock
input reset, //input reset 
input RxD, //input receving data line
output reg [7:0] RxData, // output for 8 bits data
output done
    );
    
reg [2:0] state, nextstate;
reg [13:0] counter;
reg [4:0] bitcounter, oversample_counter;
reg [7:0] rxshiftreg;
reg [7:0] oversampling_data;
reg [4:0] pulsecount;

//uart_pulse has the same rate as uart's baud rate.
reg pulse, uart_pulse;
parameter IDLE = 0, START = 1, SHIFT = 2, STOP = 3, WAIT = 4, DONE = 5;
parameter baud_rate = 115200; //9600*1000 baud_rate for simulation
parameter clk_freq = 100000000;
parameter oversample_rate = 4;
parameter oversample_inter = clk_freq/(baud_rate*oversample_rate);
parameter counter_threshold = clk_freq/baud_rate;

//Oversampling and loading data
always @(posedge clk, posedge reset)begin
    //reset counters and regs
    if(reset)begin
        oversample_counter <= 0;
        rxshiftreg <= 0;
        bitcounter <= 0;
        oversampling_data <= 0;
    end
    else
    begin
        //reset variables for catching new uart data input.
        if(nextstate == START)begin  
            oversample_counter <= 0;
            rxshiftreg <= 0;
            bitcounter <= 0;
            oversampling_data <= 0;
        end
        //Every pulse(oversampling freq) sample a signal.
        if(state == SHIFT & pulse)begin
            oversampling_data[oversample_counter] <= RxD;
            oversample_counter <= oversample_counter + 1;
            //If reach uart pulse(1/9600), then select the majority of oversampling data.
            if(uart_pulse)begin
                rxshiftreg[bitcounter] <= ((oversampling_data[0] + oversampling_data[1]
                                            + oversampling_data[2] + oversampling_data[3] ) > 2) ? 1 : 0; //+ oversampling_data[4] + oversampling_data[5] + oversampling_data[6] + oversampling_data[7]
                //reset oversampling variables
                oversample_counter <= 0;
                oversampling_data <= 0;
                bitcounter <= bitcounter + 1;
                if(bitcounter > 7)
                    bitcounter <= 0;
            end
        end
    end
end

//Uart pulse and oversampling pulse counter logic
always @(posedge clk, posedge reset)begin
    //reset all counter
    if(reset)begin
        counter <= 0;
        pulse <= 0;
        uart_pulse <= 0;
        pulsecount <=0;
    end
    else begin
        counter <= counter + 1;
        //There is a data input right behind the previous one, so reset counter immediately for aligning uart data signal.
        if(nextstate == START & (state == DONE | state == IDLE))begin
            counter <= 0;
            pulse <= 0; //align pulse signal to uart signal is crucial, normally, it will takes one clk cycle delay which is acceptable.
            uart_pulse <= 0;
            pulsecount <=0;
        end
        
        //Reach oversample interval.
        if(counter > oversample_inter)begin
            counter <= 0;
            pulsecount <= pulsecount + 1;
            pulse <= 1;
            //Finished sampling 8 oversampled data 
            if(pulsecount == (oversample_rate - 1))begin
                uart_pulse <= 1;
                pulsecount <= 0;
                end
        end
        else begin
            pulse <= 0;
            uart_pulse <= 0;
        end
    end
end

//state transition logic
always @(posedge clk, posedge reset)begin
    if(reset)
        begin
            state <= 0;
        end
    else
        if(state == IDLE | state == DONE)
            state <= nextstate;
        else begin
            if(pulse)
                state <= nextstate;
        end
end

//next state transitional logic (combinational)
always @(*)begin
    case(state)
    IDLE:begin
        //Capture start signal => go to START state ASAP
        if(~RxD)begin
            nextstate = START;
        end
        else
            nextstate = IDLE;
    end 
    START: begin
        //Wait untial next uart_pulse to align time frame of UART
        if(uart_pulse)begin
            nextstate = SHIFT;
        end
        else
            nextstate = START;
    end
    SHIFT:begin
        //Wait uart_pulse, insuring the final bit to be written in the register.
        if(bitcounter == 7 & uart_pulse)
            nextstate = STOP;
        else
            nextstate = SHIFT;
    end
    STOP:
        if(RxD)
            nextstate = DONE;
        else
            nextstate = WAIT;
    WAIT: //if didn't receive STOP signal wait for it and discard rxshiftreg.
        if(RxD & uart_pulse)
            nextstate = IDLE;
        else
            nextstate = WAIT;
    DONE:begin
        RxData = rxshiftreg;
        if(~RxD)
            nextstate = START;
        else
            nextstate = IDLE;
    end
    endcase
end
        
//output logic
assign done = (state == DONE);
//assign RxData = done ? rxshiftreg : 0;

endmodule
