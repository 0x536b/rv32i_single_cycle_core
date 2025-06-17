.global _start

.section .text
_start:
	li x1, 0xFFFFFFFF

	and x2, x0, x0
	and x3, x0, x1
	and x4, x1, x0
	and x5, x1, x1
	ebreak