set_property SRC_FILE_INFO {cfile:d:/Vivado_Labs/User_Demo/src/ip/ClkGen/ClkGen.xdc rfile:../../../../src/ip/ClkGen/ClkGen.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_100MHz_i]] 0.1
