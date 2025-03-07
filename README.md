# FPGA
 Projects related to FPGA

Refer this tutorial for Vivado simulation, you can open each project with Vivado and it will make your life easier.
https://www.youtube.com/watch?v=6CpSlv1se7U

The board used to this project:
https://digilent.com/shop/basys-3-artix-7-fpga-trainer-board-recommended-for-introductory-users/?srsltid=AfmBOopdOXaN63CUVnT3Od-TNtv-x9Ta9h8HCUwDLC5ICr2k9SD5TSFr

# Overview
This project implements UART communication and image processing using FPGA, with runtime tests for parallel computation.

# Part 1: UART
Reception – Describe the functionality and implementation details of data reception.
Transmission – Explain the functionality and code implementation of data transmission.
Reception and Transmission – Describe how reception and transmission are combined and synchronized.

# Part 2: Image Processing
BRAM Control – Explain how BRAM is used for storing and accessing image data.

Parallel Image Processing Test– Discuss strategies and steps for parallel image processing.

# Part 3: Runtime Testing
Testing Parallel Computation – Provide methods and analysis for testing the performance of parallel computation.


# UART Receive:
IDLE:
Finite State Machine (FSM) in UART
A Finite State Machine (FSM) is used in UART communication to manage the sequential states involved in transmitting and receiving data. The FSM helps control the timing, order, and transition between different phases of UART communication.

The FSM starts in the IDLE state, waiting for a start signal (when RxD goes low).
If RxD is low, the FSM transitions to the START state.

START

After detecting the start signal, the FSM waits for a uart_pulse (which aligns the FSM with the UART timing).
Once the pulse is received, the FSM moves to the SHIFT state.

SHIFT

In the SHIFT state, the FSM shifts data bits into the receive register (rxshiftreg) on each uart_pulse.
If the bitcounter reaches 7 (indicating 8 bits have been received), the FSM transitions to the STOP state.

STOP

The FSM waits for the stop bit (RxD should be high).
If RxD is high, the FSM moves to the DONE state; if not, it enters the WAIT state.

WAIT

If the stop bit is not received, the FSM stays in the WAIT state until RxD becomes high.
Once RxD is high and a uart_pulse is received, the FSM resets to IDLE.

DONE

The FSM assigns the received data from rxshiftreg to RxData.
If RxD goes low (indicating the start of a new transmission), the FSM transitions to START.
Otherwise, it returns to IDLE.

# UART Transmit:
IDLE

The FSM starts in the IDLE state, waiting for a transmit signal and a pulse (which could be a clock edge).
If both signals are present, the FSM transitions to the LOAD state to load the data.

LOAD

In the LOAD state, the data is prepared for transmission.
Once a pulse is received, the FSM moves to the SHIFT state.
If no pulse is received, it stays in the LOAD state.

SHIFT

In the SHIFT state, data bits are shifted out one at a time on each pulse.
When the bitcounter reaches 10 (indicating that all bits, including the start and stop bits, have been sent), the FSM transitions to the CLEAR state.
CLEAR

In the CLEAR state, the FSM resets internal registers and returns to the IDLE state, preparing for the next transmission.
default

This is a safety state that ensures the FSM returns to IDLE if an undefined state occurs.

# Image Processing
  
 In your project, the image processing part focuses on grayscale conversion. Grayscale processing simplifies image data by removing color information and representing each pixel with a single intensity value (instead of RGB channels).

How Grayscale Conversion Works
Input Format: The original image is likely in RGB format, where each pixel is represented by three color channels:

𝑅
(
𝑅
𝑒
𝑑
)
,
 
𝐺
(
𝐺
𝑟
𝑒
𝑒
𝑛
)
,
 
𝐵
(
𝐵
𝑙
𝑢
𝑒
)
R(Red), G(Green), B(Blue)
Conversion Formula: A common method to convert RGB to grayscale is using the weighted sum approach based on human perception:

Gray
=
0.299
×
𝑅
+
0.587
×
𝐺
+
0.114
×
𝐵
Gray=0.299×R+0.587×G+0.114×B
Green has the highest weight since the human eye is more sensitive to it.
FPGA Implementation:

Store pixel data in BRAM (Block RAM).
Perform the weighted sum calculation using fixed-point or integer arithmetic (to optimize for FPGA).
Write the result back to BRAM or output buffer.
 ![Description](./image_processing/grayscale.jpg)
