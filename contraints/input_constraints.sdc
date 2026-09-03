# Half-adder timing constraints
# No sequential clock exists in this combinational design.
# Keep this file as the constraint entry point for synthesis/STA.

set_input_delay 0.0 -clock [get_clocks *] [get_ports {a b}]
set_output_delay 0.0 -clock [get_clocks *] [get_ports {sum carry}]
