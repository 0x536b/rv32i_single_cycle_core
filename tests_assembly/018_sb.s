.global _start

.section .text
_start:
	li x1, 0x00000011
	li x2, 0x00000022
	li x3, 0x00000033
	li x4, 0x00000044

	sb x1, 0(x0)
	sb x2, 1(x0)
	sb x3, 2(x0)
	sb x4, 3(x0)

	sb x1, 4(x0)
	lb x5, 4(x0) 
	sb x3, -2(x5)
	sb x3, 0(x5)
	sb x3, 2(x5)
	ebreak
	