# RTL-to-GDS Flow Reference: Inspiration from the Sourav365 8-Bit ALU Project

## Purpose

This document records the structural and flow-level ideas taken as reference from the `Sourav365/RTL-to-GDS-Flow-of-an-8-Bit-ALU` repository, specifically the `alu_design` project.

The reference was used for **organization and RTL-to-GDS flow planning**, not as a source for copying Half Adder implementation files.

Reference repository:
`https://github.com/Sourav365/RTL-to-GDS-Flow-of-an-8-Bit-ALU/tree/main/alu_design`

## Changes / Ideas Applied to Halfadder

| Reference concept | Halfadder organization / equivalent | Notes |
|---|---|---|
| `alu_design/rtl/` | `rtl/` | Dedicated location for RTL and related design sources. |
| `alu_design/constraints/` | `contraints/` | Dedicated constraints area. The existing `contraints` spelling was retained to match the project's established directory convention. |
| `alu_design/tcl/` | `scripts/` | Tcl/scripts are separated from RTL and generated artifacts. |
| `alu_design/genus/` | Synthesis-stage organization through scripts, reports, netlist, and results | The directory structure reflects a distinct synthesis stage without fabricating Genus databases or claiming that a complete Genus run has already been performed. |
| `alu_design/innovus/` | Separate physical-design/output areas | Physical-design artifacts are kept conceptually separate from source RTL. |
| `alu_design/lib/` | Technology-library collateral kept separate from RTL | Library files are treated as technology-dependent inputs rather than design source. |
| `alu_design/lef_files/` | Technology/LEF collateral kept separate | LEF and related physical-design collateral belong to the implementation side of the flow. |
| Generated reports | `reports/` | Reports are separated from source and scripts. |
| Generated netlist / SDF | `netlist/`, `outputs/`, and `results/` | Generated implementation artifacts are separated from source RTL. |
| Staged RTL → synthesis → PD flow | `scripts/` plus project documentation | The project structure is intended to support a staged flow rather than mixing all artifacts together. |

## Reference Synthesis Flow

The referenced ALU project follows the general synthesis sequence:

1. Configure technology/library and search paths.
2. Read the RTL.
3. Elaborate the design.
4. Read timing constraints (SDC).
5. Run mapped synthesis (`synthesize -to_mapped`).
6. Generate timing, gate-count/area, and power-related reports.
7. Write the mapped Verilog netlist.
8. Write the SDC constraints.
9. Write SDF timing information.

This sequence is useful as a reference for the intended progression from RTL to implementation artifacts.

## Important Scope Limitation

The presence of directories corresponding to synthesis, physical design, libraries, reports, and results **does not mean that the complete RTL-to-GDS flow has already been executed for the Half Adder**.

In particular, this documentation should not be interpreted as evidence that:

- Cadence Genus synthesis has been successfully run for the current Halfadder revision;
- Cadence Innovus physical design has been completed;
- technology-specific timing, area, power, LEF, or GDS results have been generated;
- the Half Adder has already passed a complete RTL-to-GDS signoff flow.

Those claims should only be made after the corresponding tool runs and artifacts actually exist in the repository.

## Structural vs. Implementation Changes

The main influence from the reference project is **repository structure and flow organization**:

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

The Halfadder RTL itself is not considered derived from the ALU RTL merely because the repository organization follows a similar flow-oriented structure.

## Directory Naming Note

The reference project uses a correctly spelled `constraints` directory. The Halfadder repository currently uses `contraints`.

The spelling was intentionally retained rather than silently renaming the existing project directory, because consistency with the current Halfadder repository structure is preferable unless a dedicated cleanup/change is explicitly requested.

## Summary

The Sourav365 ALU repository was used as a **reference for organizing an RTL-to-GDS project**, particularly the separation of:

- RTL sources;
- constraints;
- scripts/Tcl;
- technology collateral;
- synthesis/implementation outputs;
- reports; and
- generated netlists/results.

No claim of copied source code or completed tool execution should be inferred from this reference.
