# Setting library and RTL paths
set_db / .init_lib_search_path /home/cadence/FOUNDRY/digital/90nm/dig/lib
set_db / .init_hdl_search_path {../rtl}
set REPORT_PATH   ../reports/genus

# Read Lib, RTL and SDC files
set_db / .library "slow.lib"
set DESIGN halfadder
read_hdl "halfadder.v"
elaborate $DESIGN
check_design -unresolved
read_sdc ../contraints/input_constraints.sdc

# Setting effort medium
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

syn_generic
syn_map
syn_opt

write_hdl > ../netlist/halfadder_netlist.v
write_sdc > ../contraints/post_synthesis_output_constraints.sdc

# PPA Reports
report_power > $REPORT_PATH/halfadder_power.rpt
report_area > $REPORT_PATH/halfadder_area.rpt
report_timing > $REPORT_PATH/halfadder_timing.rpt
report_gates > $REPORT_PATH/halfadder_gatecount.rpt
report_qor -levels_of_logic -power -exclude_constant_nets > $REPORT_PATH/halfadder_qor.rpt

gui_show
