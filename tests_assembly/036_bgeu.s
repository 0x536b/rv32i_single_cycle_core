.global _start

.section .text
_start:
	li  x1, -2 # in unsigned = 4294967294
	li  x2, 6
	bgeu x2, x1, label1 # not taken, as 6 is not greater than 4294967294
	NOP
	NOP
	NOP
	bge x2, x1, label2 # taken, as in signed, 6 is greater than -2

label1:
	li x10, 0xFFFFFFFF
	li x11, 0xFFFFFFFF
	ebreak

label2:
	li x10, 0xBBBBBBBB
	li x11, 0xBBBBBBBB
	bgeu x2, x1, label1 # not taken, as 6 is not greater than 4294967294
	NOP
	NOP
	NOP
	bgeu x1, x2, label3 # taken, yes  4294967294 is greater than 6
	li x10, 0xFFFFFFFF
	li x11, 0xFFFFFFFF
	ebreak
	
label3:
	li x10, 0xEEEEEEEE
	li x11, 0xEEEEEEEE
	bgeu x2, x1, label1 # not taken, as 6 is not greater than 4294967294
	NOP
	NOP
	NOP
	bgeu x2, x2, label4 # taken
	li x10, 0xFFFFFFFF
	li x11, 0xFFFFFFFF
	ebreak

label4:
	li x10, 0xDEADBEEF
	li x11, 0xBADF00D
	ebreak