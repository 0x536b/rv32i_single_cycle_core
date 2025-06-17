.global _start

.section .text
_start:
	li x1, 100
	slti x2, x1, 101
	slti x3, x1, 100
	slti x4, x1, 99

	li x10, -100
	slti x11, x10, -99 
	slti x12, x10, -101
	slti x13, x10, -100
	EBREAK