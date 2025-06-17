.global _start

.section .text
_start:
	lh	x0, 22(x0)		# 0000_0000
	lh	x1,  8(x0) 		# 0000_0808
	lh	x2,  12(x0) 	# 0000_0c0c
	lh	x3,  36(x0) 	# 0000_2424
	lh	x4,  -12(x3) 	# 0000_1818
	lh	x5,  100(x4) 	# 0000_7c7c
	lh	x6,  100(x5) 	# ffff_e0e0
	lh	x7,  254(x0) 	# ffff_fefe
	lh 	x8,  500(x7) 	# ffff_f2f2
	# lh 	x10, (x) 	#
	# lh 	x11, (x) 	#
	# lh 	x12, (x) 	#
	# lh 	x13, (x) 	#
	# lh 	x14, (x) 	#
	ebreak