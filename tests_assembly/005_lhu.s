.global _start

.section .text
_start:
	lhu	x0, 22(x0)			# 0000_0000
	lhu	x1,  8(x0) 			# 0000_0808
	lhu	x2,  12(x0) 		# 0000_0c0c
	lhu	x3,  36(x0) 		# 0000_2424
	lhu	x4,  -12(x3) 		# 0000_1818
	lhu	x5,  100(x4) 		# 0000_7c7c
	lhu	x6,  100(x5) 		# 0000_e0e0
	lhu	x7,  254(x0) 		# 0000_fefe
	lhu 	x8,  500(x7) 	# 0000_f2f2
	ebreak