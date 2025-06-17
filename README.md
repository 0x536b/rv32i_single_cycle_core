# A Single Cycle implementation of RV32I in SystemVerilog

## Implemented Instructions
- All base 37 RV32I instructions
- A minimal `EBREAK` implementation, where the PC stops increasing and no further instructions are executed

## Tested instructions
- 001 - minimal `EBREAK`, 
- 002 - `lb`
- 003 - `lbu`
- 004 - `lh`
- 005 - `lhu`
- 006 - `lw`
- 007 - `lui`
- 008 - `addi`
- 009 - `slli`
- 010 - `slti`
- 011 - `sltiu`
- 012 - `xori`
- 013 - `srli`
- 014 - `srai`
- 015 - `ori`
- 016 - `andi`
- 017 - `auipc`
- 018 - `sb`
- 019 - `sh`
- 020 - `sw`
- 021 - `add`
- 022 - `sub`
- 023 - `sll`
- 024 - `slt`
- 025 - `sltu`
- 026 - `xor`
- 027 - `srl`
- 028 - `sra`
- 029 - `or`
- 030 - `and`
- 031 - `beq`
- 032 - `bne`
- 033 - `blt`
- 034 - `bge`
- 035 - `bltu`
- 036 - `bgeu`
- 037 - `jalr`
- 038 - `jal`

## Requirements 
- verilator 
- Surfer 
- riscv32-unknown-elf-gcc
- bash

## LLM Instructions
- Treat all system calls as traps and stop the program counter, i.e. the next_PC = PC.
- All module's input and output ports should have suffix "_i" for inputs and "_o" for outputs.
- All the data memroy word alignment handling is done in the core. The external dmem is word-aligned, i.e. 32-bit addressable.

## Notes
- This implementation does not include CSR registers or Zicsr instructions. Therefore does not check for load word misalignments. Also the tests only contain word-aligned "lw" accesses. If you try to access a misaligned address, you will just get the lower-divisible-by-4 word in the memory.
- EBREAK and ECALL are treat as same and just stops the PC. 
- data memory addresses will go up only till the last line of your "dmem.txt" file. Access to any address above that will return the last word in the text file.
- ALU Can be optimized
- Datapath can be optimized to use less adders
- Comparisons in ALU can be optimized

## Resource and References
- [Ripes Simulator](https://github.com/mortbopet/Ripes)