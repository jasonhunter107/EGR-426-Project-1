# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.cache/wt [current_project]
set_property parent.project_path C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.srcs/sources_1/new/counter.vhd
  C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.srcs/sources_1/new/debouncer.vhd
  C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.srcs/sources_1/new/msgArray.vhd
  C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.srcs/sources_1/new/sevenSegDecoder.vhd
  C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.srcs/sources_1/new/sevenSegMux.vhd
  C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.srcs/sources_1/new/twoHzClkDivider.vhd
  C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.srcs/sources_1/new/sevenSegTop.vhd
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.srcs/constrs_1/new/7seg_pins.xdc
set_property used_in_implementation false [get_files C:/Users/Jason/Documents/EGR426/Projects/EGR-426-Project-1/Project1.srcs/constrs_1/new/7seg_pins.xdc]


synth_design -top sevenSegTop -part xc7a35tcpg236-1


write_checkpoint -force -noxdef sevenSegTop.dcp

catch { report_utilization -file sevenSegTop_utilization_synth.rpt -pb sevenSegTop_utilization_synth.pb }
