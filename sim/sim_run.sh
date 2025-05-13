#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

SRC_FOLDER=${SRC_FOLDER:-.}
HEX_FILE=${INSTRUCTION_FILE:-${SRC_FOLDER}/main.hex}

# Run the simulation, passing the INSTRUCTION_FILE plusarg
./obj_dir/Vcpu +INSTRUCTION_FILE="$HEX_FILE" "$@"
