# Half Adder — RTL to GDS Flow

This repository contains the implementation and physical-design flow for a 1-bit half adder.

The repository is organized around clear separation between RTL, constraints, scripts, technology collateral, synthesis outputs, physical-design outputs, reports, and execution workspaces.

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

The flow uses explicit implementation-stage separation so that source RTL, constraints, scripts, technology-dependent inputs, generated netlists, reports, and physical-design artifacts are not mixed together.

The intended progression is:

```text
RTL
 ↓
Constraints
 ↓
Synthesis
 ↓
Mapped Netlist
 ↓
Physical Design
 ↓
Implementation / Signoff Artifacts
```

Genus scripts are organized around the standard synthesis sequence of configuring library and HDL search paths, reading RTL, elaborating the top module, reading SDC constraints, synthesizing to a mapped design, generating timing/cell/power/area reports, and writing mapped Verilog, SDC, and SDF outputs.

Commands should be launched from the intended flow/execution directory so relative paths remain stable across the Tcl scripts and generated artifacts.

## Current design

Top-level RTL module: `half_adder`

- Inputs: `a`, `b`
- Outputs: `sum`, `carry`
- `sum = a ^ b`
- `carry = a & b`

## Status

RTL, testbench, constraints, and initial synthesis/script organization are present. Generated technology-dependent netlists and physical-design artifacts should be added only after running the flow with the target Cadence/tool and technology-library versions.
