/* Copyright (c) 2022 Stephan Nolting */
/* This file is derived from neorv32-riscof and is licensed under the BSD 3-Clause License. */
/* See the BSD-3-Clause-LICENSE file in the project root for license details. */

OUTPUT_ARCH( "riscv" )
ENTRY(rvtest_entry_point)

SECTIONS
{
  . = 0x80000000;
  .text.init : { *(.text.init) }
  . = ALIGN(0x1000);
  .tohost : { *(.tohost) }
  . = ALIGN(0x1000);
  .text : { *(.text) }
  . = ALIGN(0x1000);
  .data : { *(.data) }
  .data.string : { *(.data.string)}
  .bss : { *(.bss) }
  _end = .;
}
