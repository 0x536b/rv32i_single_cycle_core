.global _start

.section .text
_start:
	NOP						# PC = 0x0
	NOP						# PC = 0x4
	NOP						# PC = 0x8
	NOP						# PC = 0xc
	jal x1, label1			# PC = 0x10	# if you put a numerical value like 0xC, the assembler will think your target is 0xC and will calc the offset
	li x10, 0xFFFFFFFF		# PC = 0x14
	li x11, 0xFFFFFFFF		# PC = 0x18

label1:
	li x12, 0xBBBBBBBB		# PC = 0x1c
	li x13, 0xBBBBBBBB		# PC = 0x20
	ebreak					# # PC = 0x24

	# at the end of this program, the following should be correct
	# PC = 0x2c
	# x1 = 0x14
	# x10 = 0
	# x11 = 0
	# x12 = 0xBBBBBBBB
	# x13 = 0xBBBBBBBB
	