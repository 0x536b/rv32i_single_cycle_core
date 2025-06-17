
.global _start

.section .text
_start:
	li x1, 0b11111111111111110000000000000000
	li x2, 0b00000000000000001111111111111111
	
	xor x3, x1, x2
	xor x4, x2, x2
	xor x5, x1, x0
	xor x6, x2, x0
	ebreak