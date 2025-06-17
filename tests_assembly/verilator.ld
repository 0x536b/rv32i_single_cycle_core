ENTRY(_start)

MEMORY
{
	imem (RWX) : ORIGIN = 0x000000, LENGTH = 0x100000
}
SECTIONS
{
	everything :
	{
		. = ALIGN(4);
		*(.*)
	} >imem
}