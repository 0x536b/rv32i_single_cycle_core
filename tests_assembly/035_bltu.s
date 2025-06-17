.global _start

.section .text
_start:
	li  x1, -2 # in unsigned = 4294967294
	li  x2, 6
	bltu x1, x2, label1 # not taken, as 4294967294 is not less than 6
	NOP
	NOP
	NOP
	blt x1, x2, label2 # taken, as in signed, -2 is less than 6

label1:
	li x10, 0xFFFFFFFF
	li x11, 0xFFFFFFFF
	ebreak

label2:
	li x10, 0xBBBBBBBB
	li x11, 0xBBBBBBBB
	bltu x1, x2, label1 # not taken
	NOP
	NOP
	NOP
	bltu x2, x1, label3 # taken, yes 6 is less than 4294967294 
	li x10, 0xFFFFFFFF
	li x11, 0xFFFFFFFF
	ebreak
	
label3:
	li x10, 0xEEEEEEEE
	li x11, 0xEEEEEEEE
	ebreak