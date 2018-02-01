#mapping LED's
# Mapping clk
set_property PACKAGE_PIN W5 [get_ports clk_100Mhz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100Mhz]

#seven-segment LED display
        set_property PACKAGE_PIN W7 [get_ports {sevseg[6]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {sevseg[6]}]
        set_property PACKAGE_PIN W6 [get_ports {sevseg[5]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {sevseg[5]}]
        set_property PACKAGE_PIN U8 [get_ports {sevseg[4]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {sevseg[4]}]
        set_property PACKAGE_PIN V8 [get_ports {sevseg[3]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {sevseg[3]}]
        set_property PACKAGE_PIN U5 [get_ports {sevseg[2]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {sevseg[2]}]
        set_property PACKAGE_PIN V5 [get_ports {sevseg[1]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {sevseg[1]}]
        set_property PACKAGE_PIN U7 [get_ports {sevseg[0]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {sevseg[0]}]
            
 #mapping anode signals
        set_property PACKAGE_PIN U2 [get_ports {an[0]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
        set_property PACKAGE_PIN U4 [get_ports {an[1]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
        set_property PACKAGE_PIN V4 [get_ports {an[2]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
        set_property PACKAGE_PIN W4 [get_ports {an[3]}]                    
            set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]
			
#mapping switches/buttons
		set_property PACKAGE_PIN U18 [get_ports btnc]                    
           set_property IOSTANDARD LVCMOS33 [get_ports btnc]          
        set_property PACKAGE_PIN V17 [get_ports clr]                    
            set_property IOSTANDARD LVCMOS33 [get_ports clr]
            
#mapping other switches
#        set_property PACKAGE_PIN W16 [get_ports {s[2]}]                    
#            set_property IOSTANDARD LVCMOS33 [get_ports {s[2]}]
#        set_property PACKAGE_PIN W17 [get_ports {s[3]}]                    
#            set_property IOSTANDARD LVCMOS33 [get_ports {s[3]}]
#        set_property PACKAGE_PIN W15 [get_ports {s[4]}]                    
#            set_property IOSTANDARD LVCMOS33 [get_ports {s[4]}]
#        set_property PACKAGE_PIN V15 [get_ports {s[5]}]                    
#            set_property IOSTANDARD LVCMOS33 [get_ports {s[5]}]