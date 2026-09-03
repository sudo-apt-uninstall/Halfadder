# Half Adder — RTL to GDS Flow

This repository contains the implementation and physical-design flow for a 1-bit half adder.

Its organization combines the useful conventions from `counter4bitsync-private` with the more explicit implementation-stage separation used by `Sourav365/RTL-to-GDS-Flow-of-an-8-Bit-ALU/alu_design`.

## Repository structure

- `rtl/` — synthesizable RTL and simulation sources
- `scripts/` — runnable Genus/simulation/physical-design entry points
- `contraints/` — timing constraints (`.sdc`); directory name is retained from the existing project convention
- `netlist/` — synthesized and implementation netlists
- `reports/` — timing, area, power, gate/cell and physical-design reports
- `outputs/` — screenshots, schematics and other reviewable visual outputs
- `results/` — final flow deliverables such as DEF/GDS/SPEF/SDF when generated
- `docs/` — project notes and tool documentation references
- `work/` — Cadence/tool execution workspace and intermediate databases

## Flow organization

The ALU reference separates implementation data into stage-specific areas such as `constraints/`, `genus/`, `innovus/`, `lef_files/`, `lib/`, `rtl/`, and `tcl/`. This repository keeps the same conceptual separation while using the broader `netlist/`, `reports/`, `outputs/`, `results/`, and `work/` convention already established in the counter project. fileciteturn23file0L2-L2

Genus scripts follow the reference pattern of setting the library/HDL search paths, reading RTL, elaborating the top, reading SDC constraints, synthesizing to a mapped design, generating timing/cell/power/area reports, and writing mapped Verilog, SDC, and SDF outputs. fileciteturn25file0L2-L2

Commands should be launched from the intended flow/execution directory so relative paths remain stable across the Tcl scripts and generated artifacts. The counter project similarly documents `work/` as its execution location. fileciteturn3file0L2-L2

## Current design

Top-level RTL module: `half_adder`

- Inputs: `a`, `b`
- Outputs: `sum`, `carry`
- `sum = a ^ b`
- `carry = a & b`

## Status

RTL, testbench, constraints, and initial synthesis/script organization are present. Generated technology-dependent netlists and physical-design artifacts should be added only after running the flow with the target Cadence/tool and technology-library versions.
