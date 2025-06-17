.global _start

.section .text
_start:
	li x1, 0xffffffff
	li x2, 0x000
	xori x3, x1, 0x000

	li x4, 0xffffffff
	li x5, 0x7ff
	xori x6, x4, 0x7ff

	li x7, 0xf0
	li x8, 0x0f
	xori x9, x7, 0x0f
	ebreak
	