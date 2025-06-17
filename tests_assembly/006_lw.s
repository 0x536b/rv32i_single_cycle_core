.global _start

.section .text
_start:
	lw x0, 12(x0) 	#
	lw x1, 252(x0)	# fcfcfcfc
	lw x2, 12(x0)	# 0c0c0c0c
	lw x3, 24(x0)	# 00000024
	lw x4, 28(x0)	# 80000028
 	lw x5, 20(x0)	# ffffffff
	lw x6, 32(x0)	# fffffff0
	lw x7, -4(x3)	# fffffff0
	lw x8, 32(x7)	# 10101010
	ebreak
