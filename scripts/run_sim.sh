#!/usr/bin/env bash
set -euo pipefail

mkdir -p ../work
iverilog -g2012 -o ../work/half_adder_sim ../rtl/half_adder.v ../rtl/half_adder_tb.v
vvp ../work/half_adder_sim | tee ../results/half_adder_simulation.txt
