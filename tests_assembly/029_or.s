.global _start

.section .text
_start:
	li x1, 0xFFFFFFFF

	or x2, x0, x0
	or x3, x0, x1
	or x4, x1, x0
	or x5, x1, x1
	ebreak