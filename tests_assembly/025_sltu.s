.global _start

.section .text
_start:
	li x1, 0x1111
	li x2, 0x2222

	sltu x3, x1, x2 # true
	sltu x4, x2, x1 # false
	sltu x5, x2, x2 # false

	# negative numbers
	li x6, -1000	# 4294966296
	li x7, 2000  	# 2000
	li x8, 4294966295
	sltu x9, x6, x7 # false
	sltu x10, x7, x6 # true
	sltu x11, x6, x6 # false
	sltu x12, x8, x6 # true


	li x13, -4
	li x14, -3
	li x15, -2
	li x16, -1
	slt x17, x13, x14 	# true
	sltu x18, x13, x14 # true
	slt x19, x16, x15   # false
	sltu x19, x16, x15 	# false

	ebreak