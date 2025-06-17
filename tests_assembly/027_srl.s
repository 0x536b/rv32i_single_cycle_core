.global _start

.section .text
_start:
	li x1, 0b11111111000000001111111100000000
	li x2, 4
	li x3, 8
	li x4, 31

	srl x5, x1, x2
	srl x6, x1, x3
	srl x7, x1, x4
	ebreak