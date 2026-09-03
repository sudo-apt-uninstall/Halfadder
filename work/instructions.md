# Work Instructions

## Purpose

`work/` is the Cadence/tool execution workspace for the Half Adder RTL-to-GDS flow. Keep generated databases, temporary files, logs, and other tool-specific intermediate artifacts here rather than mixing them with source RTL, constraints, scripts, reports, or final deliverables.

## Flow Discipline

- Treat `rtl/` as source input; do not edit RTL from inside `work/`.
- Treat `contraints/` as the source of timing constraints; do not create ad-hoc copies unless required by the tool flow.
- Run Cadence tools from the intended execution directory and preserve stable relative paths.
- Keep generated/intermediate tool data in `work/`.
- Keep reviewable reports in `reports/` and final flow deliverables in `results/`.
- Keep screenshots and other visual review outputs in `outputs/`.
- Keep reusable Tcl and flow scripts in `scripts/`.

## Tool and Version Control

Record the actual Cadence/tool version used for each flow run. Do not assume that the version documented in a reference manual is the version installed in the lab environment.

Record technology-library and PDK-related versions/paths used by the run whenever applicable. Do not replace project-specific paths with guessed paths.

## Execution

Before running a flow:

1. Verify the current working directory.
2. Verify the top-level RTL module and source filenames.
3. Verify the constraint file and clock/timing assumptions, if applicable.
4. Verify HDL/library search paths.
5. Verify technology-library, LEF, Liberty, and other required physical-design inputs.
6. Verify the installed Cadence/tool version.
7. Use project-relative paths where practical so the flow remains reproducible.

## Terminal / Working Directory Rule

**Before Step 1, open a terminal directly from the repository's `work/` folder. Execute the flow commands from `work/` only.**

The commands in these instructions assume the current working directory is `work/`. Do not run them from the repository root, `rtl/`, or another directory unless the command is explicitly rewritten for that execution directory.

## Step 1 — RTL Simulation with Xcelium

The first flow step is to compile, elaborate, and simulate the RTL using Xcelium `xrun` from inside `work/`.

Run:

```bash
xrun ../rtl/halfadder.v ../rtl/halfadder_tb.v -access +rwc -gui
```

The command follows the execution-directory and relative-path convention used in the project's prior Xcelium flow: RTL sources are referenced as `../rtl/...` from `work/`, and `-access +rwc` is used for waveform/debug visibility.

Do not add coverage options to the initial command unless coverage is specifically required. First establish a clean RTL compile/elaboration/simulation run.

After a successful run, retain the Xcelium-generated execution data under `work/` as appropriate. Do not manually edit Xcelium-generated files such as `xrun.history` or files under `xcelium.d/` unless debugging requires it.

## Step 2 — Genus Synthesis

Run Cadence Genus from inside `work/` using the project synthesis Tcl script:

```bash
genus -files ../scripts/genus_script.tcl
```

The script reads `rtl/halfadder.v`, elaborates the `halfadder` design, reads `contraints/input_constraints.sdc`, performs generic synthesis, technology mapping, and optimization, then writes the synthesized netlist and post-synthesis constraints.

The synthesized netlist is written to:

```text
../netlist/halfadder_netlist.v
```

Genus PPA reports are written under:

```text
../reports/genus/
```

The report set includes power, area, timing, gate count, and QoR reports. Keep Genus reports separate from Innovus reports; Innovus reports must be placed under `../reports/innovus/`.

## Cleanup

Do not blindly delete `work/`. Intermediate databases may be required for continuing or debugging a Cadence run. Remove generated data only when its provenance and whether it is still needed are understood.

## Current RTL Naming

The active RTL sources are:

- `rtl/halfadder.v` — top module `halfadder`
- `rtl/halfadder_tb.v` — simulation testbench `halfadder_tb`

The repository previously contained underscore-named copies; those duplicates have been removed. Use the current filenames and module names above.

## Reference Material

Use the project documentation and reference manuals for methodology and tool-specific behavior. In particular, distinguish academic/flow requirements from Cadence-version-specific command syntax and behavior.

Do not copy technology- or installation-specific paths from reference documentation into the project without verifying them against the actual environment.
