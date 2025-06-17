.global _start

.section .text
_start:
	li x1, 0xffffffff
	li x2, 1
	li x3, 4
	li x4, 16
	li x5, 31

	sll x6, x1, x2 
	sll x7, x1, x3 
	sll x8, x1, x4 
	sll x9, x1, x5 
	ebreak
	