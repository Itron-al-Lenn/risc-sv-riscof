#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

# Compile the SystemVerilog testbench and design files
verilator --cc --exe --build \
  --top-module cpu \
  -I "$GITHUB_WORKSPACE/RISC_SV/src/cpu.sv" \
  "$GITHUB_WORKSPACE/RISC_SV/src/*.sv"
