.global _start

.section .text
_start:
	li x1, 100
	sltiu x2, x1, 101	# true
	sltiu x3, x1, 100	# false
	sltiu x4, x1, -1	# true, as -f in unsinged form is FFFFFFFF

	li x10, -100
	sltiu x11, x10, -99		
	sltiu x12, x10, -101
	sltiu x13, x10, -100
	sltiu x14, x10, 100 # False, as unsinged(-100) is a bigger number
	ebreak
	