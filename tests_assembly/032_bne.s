.global _start

.section .text
_start:
	li  x1, 0xFFFF
	li  x2, 0xAAAA
	bne x1, x1, label1 # not taken
	NOP
	NOP
	NOP
	bne x1, x2, label2 # taken

label1:
	li x10, 0xFFFFFFFF
	li x11, 0xFFFFFFFF
	ebreak

label2:
	li x10, 0xBBBBBBBB
	li x11, 0xBBBBBBBB
	ebreak
	