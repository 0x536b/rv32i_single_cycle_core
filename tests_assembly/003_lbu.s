.global _start

.section .text
_start:
	lbu	x0, 23(x0)		# should be zero, as x0 is hardwired to zero
	lbu	x1, 1(x0)		# load byte 1
	lbu	x2, 2(x0)		# load byte 2
	lbu	x3, 3(x0)		# load byte 3
	lbu	x4, 4(x0)		# load byte 4
	lbu	x5, 5(x0)		# load byte 5
	lbu	x6, 6(x0)		# load byte 6
	lbu	x7, 7(x0)		# load byte 7
	lbu	x8, 8(x0)		# load byte 8
	lbu x9, -3(x7)		# load byte 4
	lbu x10, 22(x7)		# load byte 29
	lbu x11, -15(x10)	# load byte 14
	lbu x12, 255(x0)	# load byte 255 = 255 (000000ff)
	lbu x13, 248(x0)	# load byte 248 = 248 (000000f8)
	lbu x14, 10(x13)	# load byte 2 (-8 + 10) = 2
	# lbu 	x, (x)		# load byte 
	# lbu 	x, (x)		# load byte 
	# lbu 	x, (x)		# load byte 
	# lbu 	x, (x)		# load byte 
	# lbu 	x, (x)		# load byte 
	# lbu	x, (x)		# load byte 
	# lbu	x, (x)		# load byte 
	# lbu	x, (x)		# load byte 
	# lbu	x, (x)		# load byte 
	# lbu	x, (x)		# load byte 
	ebreak
