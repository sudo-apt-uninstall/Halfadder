# Flow staging notes

Reference patterns used for this project:

1. Keep RTL and testbench under `rtl/`.
2. Keep reusable/runnable Tcl entry points under `scripts/`.
3. Keep timing constraints under `contraints/` to preserve the existing project convention.
4. Keep generated synthesis netlists in `netlist/` and reports in `reports/`.
5. Keep review screenshots/schematics under `outputs/`.
6. Keep final implementation deliverables under `results/`.
7. Keep technology collateral separate from design sources when introduced. The ALU reference uses dedicated `lib/` and `lef_files/` directories, which can be added here when the target PDK/library files are known.
8. Keep tool-generated databases and temporary files in `work/` rather than mixing them with source-controlled inputs.

Do not copy technology-specific files from another project blindly. Library names, LEF/GDS files, MMMC views, routing layers, site definitions, and Innovus command syntax depend on the installed tool/version and target technology.
