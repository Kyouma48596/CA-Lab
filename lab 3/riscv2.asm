.globl main
.data
val: .word 0x0a
value: .word 0x54,0x23,0x65,0x87,0x44,0x87,0x37,0x00,0x12,0x33
.text
main:
	lw t0, val
	la s0,value
	L1:lw t2,0(s0)
	addi t2,t2,5
	sw t2,0(s0)
	addi t0,t0,-1
	addi s0,s0,4
	bne t0,zero,L1
	ecall
