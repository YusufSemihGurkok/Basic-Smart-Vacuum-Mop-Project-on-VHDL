## Clock signal
set_property PACKAGE_PIN W5 [get_ports Clk1]
set_property IOSTANDARD LVCMOS33 [get_ports Clk1]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clk1]
## Switches
set_property PACKAGE_PIN V17 [get_ports {rst}]
    set_property IOSTANDARD LVCMOS33 [get_ports {rst}]
set_property PACKAGE_PIN V16 [get_ports {bluetoothmode}]
    set_property IOSTANDARD LVCMOS33 [get_ports {bluetoothmode}]
# LEDs
set_property PACKAGE_PIN U16 [get_ports {RxData1[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {RxData1[0]}]
set_property PACKAGE_PIN E19 [get_ports {RxData1[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {RxData1[1]}]
set_property PACKAGE_PIN U19 [get_ports {RxData1[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {RxData1[2]}]
set_property PACKAGE_PIN V19 [get_ports {RxData1[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {RxData1[3]}]
set_property PACKAGE_PIN W18 [get_ports {RxData1[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {RxData1[4]}]
set_property PACKAGE_PIN U15 [get_ports {RxData1[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {RxData1[5]}]
set_property PACKAGE_PIN U14 [get_ports {RxData1[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {RxData1[6]}]
set_property PACKAGE_PIN V14 [get_ports {RxData1[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {RxData1[7]}]
set_property PACKAGE_PIN V13 [get_ports {sensordistance[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sensordistance[0]}]
set_property PACKAGE_PIN V3 [get_ports {sensordistance[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sensordistance[1]}]
set_property PACKAGE_PIN W3 [get_ports {sensordistance[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sensordistance[2]}]
set_property PACKAGE_PIN U3 [get_ports {sensordistance[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sensordistance[3]}]
set_property PACKAGE_PIN P3 [get_ports {sensordistance[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sensordistance[4]}]
set_property PACKAGE_PIN N3 [get_ports {sensordistance[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sensordistance[5]}]
set_property PACKAGE_PIN P1 [get_ports {sensordistance[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sensordistance[6]}]
set_property PACKAGE_PIN L1 [get_ports {sensordistance[7]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sensordistance[7]}]
##Pmod Header JA
#Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {Rx1}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Rx1}]
#Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {Tx1Data}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Tx1Data}]
###Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {Trigger1}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Trigger1}]
#Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {Echo}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Echo}]
#Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {output1[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {output1[0]}]
#Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {output1[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {output1[1]}]
#Sch name = JA9
set_property PACKAGE_PIN H2 [get_ports {output2[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {output2[0]}]
#Sch name = JA10
set_property PACKAGE_PIN G3 [get_ports {output2[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {output2[1]}]
##Pmod Header JB 
##Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {red}] 
    set_property IOSTANDARD LVCMOS33 [get_ports {red}]
#Sch name = JB2 
set_property PACKAGE_PIN A16 [get_ports {green}]
    set_property IOSTANDARD LVCMOS33 [get_ports {green}]
#Sch name = JB3 
set_property PACKAGE_PIN B15 [get_ports {blue}]
    set_property IOSTANDARD LVCMOS33 [get_ports {blue}]
