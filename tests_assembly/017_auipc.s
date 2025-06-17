.global _start

.section .text
_start:
	auipc x1, 0xfffff 	# PC will be 0, so result will be fffff000
	auipc x2, 0xfffff 	# PC will be 4, so result will be fffff004
	nop					# PC will be 8
	nop					# PC will be c
	nop					# PC will be 10
	nop					# PC will be 14
	nop					# PC will be 18
	nop					# PC will be 14
	auipc x3, 0xfffff	# PC will be 20, so result will be fffff020
	ebreak