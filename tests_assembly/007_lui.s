.global _start

.section .text
_start:
	lui x0, 0xfffff
	lui x1, 0xfffff
	lui x2, 0x11111
	lui x3, 0x22222
	lui x4, 0x23234
	lui x5, 0x00BAD
	lui x6, 0x0F00D
	lui x7, 0x0DEAD
	lui x8, 0x0BEEF
	ebreak
