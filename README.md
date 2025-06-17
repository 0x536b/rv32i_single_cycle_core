## LLM Instructions
- Treat all system calls as traps and stop the program counter, i.e. the next_PC = PC.
- All module's input and output ports should have suffix "_i" for inputs and "_o" for outputs 

## Notes
- This implementation does not include CSR registers or Zicsr instructions. Therefore does not check for load word misalignments. Also the tests only contain word-aligned "lw" accesses. If you try to access a misaligned address, you will just get the lower-divisible-by-4 word in the memory.
- EBREAK and ECALL are treat as same and just stops the PC. 