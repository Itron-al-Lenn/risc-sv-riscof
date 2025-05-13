#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

SRC_FOLDER=${SRC_FOLDER:-.}
RISC_SV=${RISC_SV:-../RISC-SV/src/}
HEX_FILE=${INSTRUCTION_FILE:-${SRC_FOLDER}/main.hex}

# Compile the SystemVerilog testbench and design files
verilator --cc --exe --build \
  -CFLAGS "-DINSTRUCTION_FILE=\"$HEX_FILE\"" \
  --top-module cpu \
  "$RISC_SV/*.sv"

# Run the simulation, passing the INSTRUCTION_FILE plusarg
./obj_dir/Vcpu +INSTRUCTION_FILE="$HEX_FILE" "$@"
