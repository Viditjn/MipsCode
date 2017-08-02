.data
    space:  .asciiz "\n"

.text
.globl main

main:
    li  $v0,5
    syscall
    move    $t0,$v0
    move    $a0,$t0
    li      $s0,1
    jal     fact
    li      $v0,1
    move    $a0,$s0
    syscall
    j       exit

fact:
    addi    $sp,$sp,-8
    sw      $a0,0($sp)
    sw      $ra,4($sp)
    ble     $a0,$zero,temp
    addi    $a0,$a0,-1
    jal     fact
    lw      $t1,0($sp)
    mul     $s0,$s0,$t1
temp:
    lw      $ra,4($sp)
    addi    $sp,$sp,8
    jr      $ra

exit:
    li      $v0,10
    syscall
