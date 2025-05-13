#!/usr/bin/env bash
# Build script: Generate main.asm and main.hex from main.elf

set -e

# RISC-V toolchain prefix
RISCV_PREFIX=${RISCV_PREFIX:-riscv-none-elf-}
OBJDUMP=${OBJDUMP:-${RISCV_PREFIX}objdump}

# Memory width and depth for elf2hex (adjust as needed)
HEX_WIDTH=${HEX_WIDTH:-32}
HEX_DEPTH=${HEX_DEPTH:-65536}

# Input ELF file (default: main.elf)
ELF=${1:-main.elf}
HEX=main.hex
ASM=main.asm

# Generate hex file from ELF using elf2hex
echo "Generating $HEX from $ELF ..."
elf2hex $HEX_WIDTH $HEX_DEPTH "$ELF" >"$HEX"

# Generate disassembly for debugging
echo "Generating $ASM from $ELF ..."
$OBJDUMP -d -S --section=.text "$ELF" >"$ASM"

echo "Done. Artifacts: $HEX $ASM"
