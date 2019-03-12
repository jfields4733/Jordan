proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir D:/Vivado_Labs/User_Demo/proj/User_Demo.cache/wt [current_project]
  set_property parent.project_path D:/Vivado_Labs/User_Demo/proj/User_Demo.xpr [current_project]
  set_property ip_repo_paths D:/Vivado_Labs/User_Demo/repo [current_project]
  set_property ip_output_repo D:/Vivado_Labs/User_Demo/proj/User_Demo.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet D:/Vivado_Labs/User_Demo/proj/User_Demo.runs/synth_1/Nexys4DdrUserDemo.dcp
  add_files -quiet d:/Vivado_Labs/User_Demo/src/ip/BRAM_1/BRAM_1.dcp
  set_property netlist_only true [get_files d:/Vivado_Labs/User_Demo/src/ip/BRAM_1/BRAM_1.dcp]
  add_files -quiet d:/Vivado_Labs/User_Demo/src/ip/ClkGen/ClkGen.dcp
  set_property netlist_only true [get_files d:/Vivado_Labs/User_Demo/src/ip/ClkGen/ClkGen.dcp]
  add_files -quiet d:/Vivado_Labs/User_Demo/src/ip/ddr/ddr.dcp
  set_property netlist_only true [get_files d:/Vivado_Labs/User_Demo/src/ip/ddr/ddr.dcp]
  add_files -quiet d:/Vivado_Labs/User_Demo/src/ip/PxlClkGen/PxlClkGen.dcp
  set_property netlist_only true [get_files d:/Vivado_Labs/User_Demo/src/ip/PxlClkGen/PxlClkGen.dcp]
  add_files -quiet d:/Vivado_Labs/User_Demo/src/ip/Square_Root/Square_Root.dcp
  set_property netlist_only true [get_files d:/Vivado_Labs/User_Demo/src/ip/Square_Root/Square_Root.dcp]
  read_xdc -mode out_of_context -ref BRAM_1 -cells U0 d:/Vivado_Labs/User_Demo/src/ip/BRAM_1/BRAM_1_ooc.xdc
  set_property processing_order EARLY [get_files d:/Vivado_Labs/User_Demo/src/ip/BRAM_1/BRAM_1_ooc.xdc]
  read_xdc -mode out_of_context -ref ClkGen -cells inst d:/Vivado_Labs/User_Demo/src/ip/ClkGen/ClkGen_ooc.xdc
  set_property processing_order EARLY [get_files d:/Vivado_Labs/User_Demo/src/ip/ClkGen/ClkGen_ooc.xdc]
  read_xdc -prop_thru_buffers -ref ClkGen -cells inst d:/Vivado_Labs/User_Demo/src/ip/ClkGen/ClkGen_board.xdc
  set_property processing_order EARLY [get_files d:/Vivado_Labs/User_Demo/src/ip/ClkGen/ClkGen_board.xdc]
  read_xdc -ref ClkGen -cells inst d:/Vivado_Labs/User_Demo/src/ip/ClkGen/ClkGen.xdc
  set_property processing_order EARLY [get_files d:/Vivado_Labs/User_Demo/src/ip/ClkGen/ClkGen.xdc]
  read_xdc -mode out_of_context -ref ddr d:/Vivado_Labs/User_Demo/src/ip/ddr/ddr/user_design/constraints/ddr_ooc.xdc
  set_property processing_order EARLY [get_files d:/Vivado_Labs/User_Demo/src/ip/ddr/ddr/user_design/constraints/ddr_ooc.xdc]
  read_xdc -ref ddr d:/Vivado_Labs/User_Demo/src/ip/ddr/ddr/user_design/constraints/ddr.xdc
  set_property processing_order EARLY [get_files d:/Vivado_Labs/User_Demo/src/ip/ddr/ddr/user_design/constraints/ddr.xdc]
  read_xdc -mode out_of_context -ref PxlClkGen -cells inst d:/Vivado_Labs/User_Demo/src/ip/PxlClkGen/PxlClkGen_ooc.xdc
  set_property processing_order EARLY [get_files d:/Vivado_Labs/User_Demo/src/ip/PxlClkGen/PxlClkGen_ooc.xdc]
  read_xdc -prop_thru_buffers -ref PxlClkGen -cells inst d:/Vivado_Labs/User_Demo/src/ip/PxlClkGen/PxlClkGen_board.xdc
  set_property processing_order EARLY [get_files d:/Vivado_Labs/User_Demo/src/ip/PxlClkGen/PxlClkGen_board.xdc]
  read_xdc -ref PxlClkGen -cells inst d:/Vivado_Labs/User_Demo/src/ip/PxlClkGen/PxlClkGen.xdc
  set_property processing_order EARLY [get_files d:/Vivado_Labs/User_Demo/src/ip/PxlClkGen/PxlClkGen.xdc]
  read_xdc -mode out_of_context -ref Square_Root -cells U0 d:/Vivado_Labs/User_Demo/src/ip/Square_Root/Square_Root_ooc.xdc
  set_property processing_order EARLY [get_files d:/Vivado_Labs/User_Demo/src/ip/Square_Root/Square_Root_ooc.xdc]
  read_xdc D:/Vivado_Labs/User_Demo/src/constraints/Nexys4DDR_C.xdc
  read_xdc -ref PxlClkGen -cells inst d:/Vivado_Labs/User_Demo/src/ip/PxlClkGen/PxlClkGen_late.xdc
  set_property processing_order LATE [get_files d:/Vivado_Labs/User_Demo/src/ip/PxlClkGen/PxlClkGen_late.xdc]
  link_design -top Nexys4DdrUserDemo -part xc7a100tcsg324-1
  write_hwdef -file Nexys4DdrUserDemo.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Nexys4DdrUserDemo_opt.dcp
  catch { report_drc -file Nexys4DdrUserDemo_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force Nexys4DdrUserDemo_placed.dcp
  catch { report_io -file Nexys4DdrUserDemo_io_placed.rpt }
  catch { report_utilization -file Nexys4DdrUserDemo_utilization_placed.rpt -pb Nexys4DdrUserDemo_utilization_placed.pb }
  catch { report_control_sets -verbose -file Nexys4DdrUserDemo_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Nexys4DdrUserDemo_routed.dcp
  catch { report_drc -file Nexys4DdrUserDemo_drc_routed.rpt -pb Nexys4DdrUserDemo_drc_routed.pb -rpx Nexys4DdrUserDemo_drc_routed.rpx }
  catch { report_methodology -file Nexys4DdrUserDemo_methodology_drc_routed.rpt -rpx Nexys4DdrUserDemo_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file Nexys4DdrUserDemo_timing_summary_routed.rpt -rpx Nexys4DdrUserDemo_timing_summary_routed.rpx }
  catch { report_power -file Nexys4DdrUserDemo_power_routed.rpt -pb Nexys4DdrUserDemo_power_summary_routed.pb -rpx Nexys4DdrUserDemo_power_routed.rpx }
  catch { report_route_status -file Nexys4DdrUserDemo_route_status.rpt -pb Nexys4DdrUserDemo_route_status.pb }
  catch { report_clock_utilization -file Nexys4DdrUserDemo_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force Nexys4DdrUserDemo_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force Nexys4DdrUserDemo.mmi }
  write_bitstream -force -no_partial_bitfile Nexys4DdrUserDemo.bit -bin_file
  catch { write_sysdef -hwdef Nexys4DdrUserDemo.hwdef -bitfile Nexys4DdrUserDemo.bit -meminfo Nexys4DdrUserDemo.mmi -file Nexys4DdrUserDemo.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

