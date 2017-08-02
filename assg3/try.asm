.data
    array:  .space 1000
    space:  .asciiz "\n"
    text:   .asciiz "Print No. Of Elements"

.text
.globl main

main:
    li  $v0,5
    syscall
    move  $t1,$v0
    li  $t0,0
    li  $s0,0
    li  $t5,0
    la  $t3,array
    la  $s1,array
    j   max

max:
    beq $t1,$t0,p
    li  $v0,5
    syscall
    move  $t2,$v0
    sw    $t2,($t3)
    blt $s0,$t2,change
    addi    $t0,$t0,1
    addi    $t3,$t3,4
    j   max

change:
    move  $s0,$t2
    addi    $t0,$t0,1
    addi    $t3,$t3,4
    j   max

print:
    li  $v0,1
    move  $a0,$s0
    syscall
    j   exit

p:
    beq $t1,$t5,print
    lw  $s2,($s1)
    li  $v0,1
    move  $a0,$s2
    syscall
    li  $v0,4
    la  $a0,space
    syscall
    addi    $s1,$s1,4
    addi    $t5,$t5,1
    j   p

exit:
    li  $v0,10
    syscall
