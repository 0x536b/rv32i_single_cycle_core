.global _start

.section .text
_start:
	NOP						# PC = 0x0
	NOP						# PC = 0x4
	NOP						# PC = 0x8
	NOP						# PC = 0xc
	jalr x1, x0, 0x1c		# PC = 0x10	
	li x10, 0xFFFFFFFF		# PC = 0x14
	li x11, 0xFFFFFFFF		# PC = 0x18
	li x12, 0xAAAAAAAA		# PC = 0x1c
	li x13, 0xAAAAAAAA		# PC = 0x20

	# at the end of this program, the following should be correct
	# PC = 2c
	# x1 = 0x14
	# x10 = 0
	# x11 = 0
	# x12 = 0xAAAAAAAA
	# x13 = 0xAAAAAAAA
	ebreak