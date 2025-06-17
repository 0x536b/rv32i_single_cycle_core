.global _start

.section .text
_start:
	lui x0, 0xfffff
	addi x20, x0, -30
	addi x21, x20, -70

	lui x1, 0xfffff
	addi x22, x1, -96

	lui x2, 0x11111
	addi x23, x2, 2047

	lui x3, 0x22222
	addi x24, x3, 0x111

	lui x4, 0x23234
	addi x25, x4, 0x111

	lui x5, 0x00BAD
	addi x26, x5, 0x0CC

	lui x6, 0x0F00D
	addi x27, x6, 0x0DD

	lui x7, 0x0DEAD
	addi x28, x7, 0x0DD

	lui x8, 0x0BEEF
	addi x29, x8, 0xFF
	ebreak
