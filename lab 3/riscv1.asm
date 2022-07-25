.globl main
.data

value: .word 0x10, 0x18, 0

.text
main:
	la t0, value
	
	lw t1, 0(t0)
	lw t2, 4(t0)
	add t3, t1, t2
	sw t3, 8(t0)
	ecall
