# Genus synthesis script — Half Adder
# Execute from work/ so paths remain relative to the execution workspace.

set rtl_dir ../rtl
set constraints_dir ../contraints
set netlist_dir ../netlist
set reports_dir ../reports

file mkdir $netlist_dir
file mkdir $reports_dir

read_hdl [glob $rtl_dir/half_adder.v]
elaborate half_adder

if {[llength [get_clocks *]] > 0} {
    read_sdc $constraints_dir/half_adder.sdc
}

check_design -unresolved
syn_generic
syn_map
syn_opt

write_hdl > $netlist_dir/half_adder_netlist.v
report_area > $reports_dir/half_adder_area.rpt
report_timing > $reports_dir/half_adder_timing.rpt
report_power > $reports_dir/half_adder_power.rpt
