.global _start

.section .text
_start:
	li x1, 0x80000000
	srli x2, x1, 1
	srli x3, x1, 2
	srli x4, x1, 3
	srli x5, x1, 4
	srli x6, x1, 5
	srli x7, x1, 6
	srli x8, x1, 7
	srli x9, x1, 31

	li x10, 0xffffffff
	srli x11, x10, 1
	srli x12, x11, 2
	srli x13, x12, 3
	srli x14, x13, 4
	ebreak
	