.global _start

.section .text
_start:
	li x1, 0x00001111
	li x2, 0x00002222
	li x3, 0x00003333
	li x4, 0x00004444

	sh x1, 0(x0)
	sh x2, 2(x0)
	sh x3, 4(x0)
	sh x4, 6(x0)

	sb x1, 8(x0)
	lh x5, 8(x0) 

	sh x3, -1(x5)
	sh x3, 1(x5)
	sh x3, 3(x5)
	ebreak