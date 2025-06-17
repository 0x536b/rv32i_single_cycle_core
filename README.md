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
- 0 - ``

## Requirements 
- verilator 
- Surfer 
- riscv32-unknown-elf-gcc

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

## Resource and References
- [Ripes Simulator](https://github.com/mortbopet/Ripes)