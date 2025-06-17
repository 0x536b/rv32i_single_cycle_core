.global _start

.section .text
_start:
	li x1, 0x47000000
	srai x2, x1, 1
	srai x3, x1, 2
	srai x4, x1, 3
	srai x5, x1, 4
	srai x6, x1, 5
	srai x7, x1, 6
	srai x8, x1, 7
	srai x9, x1, 31

	li x11, 0xffffffff
	srai x12, x11, 1
	srai x13, x11, 2
	srai x14, x12, 3
	srai x15, x13, 4
	ebreak
	