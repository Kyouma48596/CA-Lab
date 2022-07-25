.globl main
.data
list: .word 0x0f, 0xe, 0x0e, 0x0b, 0x0a
num: .word 0x05

.text 
main:
lw s0, num
la s1, list

Loop:   
lw t0, 0(s1)
lw t1, 4(s1)
bge t0, t1, Switch
Here:addi s1, s1, 4
lw t4, 4(s1)
li t5, 5
beq t4, t5, L1
j Loop

Switch:
beq t0, t1, No 
mv t2, t0
mv t0, t1
mv t1, t2
sw t0, 0(s1)
sw t1, 4(s1)
addi s0, s0, 1
j Loop

Reset_Loop:
lw s0, num
la s1, list
j Loop

L1:
bne s0, t5, Reset_Loop
beq s0, t5, Done

Done:
ecall

No:
j Here