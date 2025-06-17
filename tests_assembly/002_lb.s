.global _start

.section .text
_start:
	lb	x0, 23(x0)		# should be zero, as x0 is hardwired to zero
	lb	x1, 1(x0)		# load byte 1
	lb	x2, 2(x0)		# load byte 2
	lb	x3, 3(x0)		# load byte 3
	lb	x4, 4(x0)		# load byte 4
	lb	x5, 5(x0)		# load byte 5
	lb	x6, 6(x0)		# load byte 6
	lb	x7, 7(x0)		# load byte 7
	lb	x8, 8(x0)		# load byte 8
	lb 	x9, -3(x7)		# load byte 4
	lb 	x10, 22(x7)		# load byte 29
	lb 	x11, -15(x10)	# load byte 14
	lb 	x12, 255(x0)	# load byte 255 = -1 (ffffffff)
	lb 	x13, 248(x0)	# load byte 248 = -8 (fffffff8)
	lb 	x14, 10(x13)	# load byte 2 (-8 + 10) = 2
	# lb 	x, (x)		# load byte 
	# lb 	x, (x)		# load byte 
	# lb 	x, (x)		# load byte 
	# lb 	x, (x)		# load byte 
	# lb 	x, (x)		# load byte 
	# lb 	x, (x)		# load byte 
	# lb 	x, (x)		# load byte 
	# lb 	x, (x)		# load byte 
	# lb 	x, (x)		# load byte 
	# lb 	x, (x)		# load byte 
	ebreak
