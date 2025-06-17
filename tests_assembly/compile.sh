#!/bin/bash

set -eu
YELLOW='\033[1;33m'
NC='\033[0m'

FILE=$1

# delete old files
echo -e "${YELLOW}Removing old files${NC}"
rm -rf ${FILE}_out

# Create a new directory
echo -e "${YELLOW}Creating directory for ${FILE} ${NC}"
mkdir -p ${FILE}_out

# Compiling to binary
echo -e "${YELLOW}Compiling to binary${NC}" 
riscv32-unknown-elf-gcc -march=rv32i -mabi=ilp32 \
-ffreestanding -nostartfiles -nostdlib \
-Tverilator.ld ${FILE}.s -o ${FILE}_out/${FILE}.elf

# Reversing binary to asm, for verification
echo -e "${YELLOW}Reversing the binary to asm${NC}"
riscv64-elf-objdump -d -M no-aliases \
${FILE}_out/${FILE}.elf > ${FILE}_out/${FILE}_reversed_asm.s

# Converting ELF to raw binary
echo -e "${YELLOW}Converting ELF to raw BIN${NC}"
riscv64-elf-objcopy -O binary ${FILE}_out/${FILE}.elf ${FILE}_out/${FILE}.bin

# parsing bin to verilog-friendly hex file
echo -e "${YELLOW}Parsing ELF to verilog-friendly ASCII-text hex file${NC}"
hexdump -v -e '1/4 "%08x " "\n"' ${FILE}_out/${FILE}.bin > ${FILE}_out/${FILE}_hex.txt


