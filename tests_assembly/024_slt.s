.global _start

.section .text
_start:
	li x1, 0x1111
	li x2, 0x2222

	slt x3, x1, x2 # true
	slt x4, x2, x1 # false
	slt x5, x2, x2 # false

	# negative numbers
	li x6, -1000 
	li x7, -2000
	slt x8, x6, x7 # false
	slt x9, x7, x6 # true
	slt x10, x6, x6 # false

	ebreak
	