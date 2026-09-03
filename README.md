# Half Adder — RTL to GDSII Flow

This repository follows the organization used for the `counter4bitsync-private` VLSI work repository, adapted for a half-adder design.

## Repository structure

- `rtl/` — synthesizable Verilog/SystemVerilog RTL
- `scripts/` — synthesis, STA, and physical-design Tcl/configuration scripts
- `contraints/` — timing constraints (`.sdc`)
- `netlist/` — generated synthesis/implementation netlists
- `reports/` — synthesis, timing, area, power, and physical-design reports
- `outputs/` — screenshots and other useful visual outputs
- `results/` — final flow artifacts intended for convenient review
- `docs/` — tool/user manuals and project documentation
- `work/` — tool execution workspace and generated intermediate files

Commands and tool runs should be executed from `work/` where practical, with scripts and constraints using paths relative to that execution directory.

This repository is a half-adder implementation/tracking repository for VLSI RTL-to-GDSII experimentation and documentation.
