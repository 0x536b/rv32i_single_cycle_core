# This should stop the PC and it should keep the PC at this instruction
# For this toy CPU, Im using EBREAK as a instruction to stop execution

.global _start

.section .text
_start:
	ebreak
	