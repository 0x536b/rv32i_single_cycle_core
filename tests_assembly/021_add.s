.global _start

.section .text
_start:
	# regular number
	li x1, 11111111
	li x2, 22222222
	add x3, x1, x2

	# regular + negative
	li x4, 22222222
	li x5, -11111111
	add x6, x4, x5

	# negative + regular
	li x7, -11111111
	li x8, 22222222
	add x9, x7, x8

	# overflow addition +ve, +ve
	li x10, 0x7FFFFFFF
	li x11, 0x7FFFFFFF
	add x12, x10, x11

	# negative + negative
	li x13, -11111111
	li x14, -22222222
	add x15, x13, x14

	# overflow addition -ve, -ve
	li x16, 0x80000001
	li x17, 0x80000001
	add x18, x16, x17


	ebreak
	