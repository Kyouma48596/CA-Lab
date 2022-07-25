.globl main

.data  
N: .word 0x0a
series: .word 0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0

.text 
main:
lw s0, N
la s1, series 
li t3, 2
run:
lw t0, 0(s1)
lw t1, 4(s1)
add t2, t0, t1
sw t2, 8(s1)
addi s1, s1, 4
addi s0, s0, -1
beq s0, t3, Done
bne s0, t3, run

Done:
ecall



