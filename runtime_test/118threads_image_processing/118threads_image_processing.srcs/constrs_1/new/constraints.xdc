set_property PACKAGE_PIN W5 [get_ports clk]       
 set_property IOSTANDARD LVCMOS33 [get_ports clk]
 create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

set_property PACKAGE_PIN B18 [get_ports RxD]
set_property IOSTANDARD LVCMOS33 [get_ports RxD]

set_property PACKAGE_PIN A18 [get_ports TxD]
set_property IOSTANDARD LVCMOS33 [get_ports TxD]

 set_property PACKAGE_PIN R2 [get_ports reset]     
 set_property IOSTANDARD LVCMOS33 [get_ports reset]
# LEDs
set_property PACKAGE_PIN U16 [get_ports {RxData[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RxData[0]}]
set_property PACKAGE_PIN E19 [get_ports {RxData[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RxData[1]}]
set_property PACKAGE_PIN U19 [get_ports {RxData[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RxData[2]}]
set_property PACKAGE_PIN V19 [get_ports {RxData[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RxData[3]}]
set_property PACKAGE_PIN W18 [get_ports {RxData[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RxData[4]}]
set_property PACKAGE_PIN U15 [get_ports {RxData[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RxData[5]}]
set_property PACKAGE_PIN U14 [get_ports {RxData[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RxData[6]}]
set_property PACKAGE_PIN V14 [get_ports {RxData[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {RxData[7]}]


###Bank = 15, Pin name = IO_L1N_T0_AD0N_15,					Sch name = JA1
#set_property PACKAGE_PIN B13 [get_ports TxD_debug}]
#set_property IOSTANDARD LVCMOS33 [get_ports TxD_debug]
###Bank = 15, Pin name = IO_L5N_T0_AD9N_15,					Sch name = JA2
#set_property PACKAGE_PIN F14 [get_ports image_done]
#set_property IOSTANDARD LVCMOS33 [get_ports image_done]
###Bank = 15, Pin name = IO_L16N_T2_A27_15,					Sch name = JA3
#set_property PACKAGE_PIN D17 [get_ports transmit_debug]
#set_property IOSTANDARD LVCMOS33 [get_ports transmit_debug]
###Bank = 15, Pin name = IO_L16P_T2_A28_15,					Sch name = JA4
#set_property PACKAGE_PIN E17 [get_ports clk_debug]
#set_property IOSTANDARD LVCMOS33 [get_ports clk_debug]

#Sch name = JA1

set_property PACKAGE_PIN J1 [get_ports TxD_debug]
set_property IOSTANDARD LVCMOS33 [get_ports TxD_debug]

#Sch name = JA2

set_property PACKAGE_PIN L2 [get_ports image_done]
set_property IOSTANDARD LVCMOS33 [get_ports image_done]

#Sch name = JA3

set_property PACKAGE_PIN J2 [get_ports image_start_out]
set_property IOSTANDARD LVCMOS33 [get_ports image_start_out]

#Sch name = JA4

set_property PACKAGE_PIN G2 [get_ports clk_debug]
set_property IOSTANDARD LVCMOS33 [get_ports clk_debug]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]