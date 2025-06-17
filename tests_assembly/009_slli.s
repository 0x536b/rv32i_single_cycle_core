.global _start

.section .text
_start:
	li x1, 0x1
	slli x2, x1, 1
	slli x3, x1, 2
	slli x4, x1, 3
	slli x5, x1, 4
	slli x6, x1, 5
	slli x7, x1, 6
	slli x8, x1, 7
	slli x9, x1, 31

	li x10, 0xffffffff
	slli x11, x10, 16
	slli x12, x11, 8
	slli x13, x12, 4
	slli x14, x13, 2
	ebreak
