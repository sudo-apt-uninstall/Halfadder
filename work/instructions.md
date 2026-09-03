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
