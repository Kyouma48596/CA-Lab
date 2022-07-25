.globl main

.data  
inputs: .word 0x07, 0x0e

.text 
main:
la s0, inputs
lw t0, 0(s0)
lw t1, 4(s0)

Check:
bge t0, t1, Switch
sub t1, t1, t0
j Check

Switch:
beq t0, t1, Done
mv t2, t0
mv t0, t1
mv t1, t2
j Check

Done:
sw t0, 8(s0)
ecall 