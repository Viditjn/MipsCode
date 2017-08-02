.text

.globl main

main:
	li $v0,5
	syscall
	move $s0,$v0
	li $t0,0
	li $s1,1
	jal calc

exit:
	li $v0,1
	move $a0,$s1
	syscall
	li $v0,10
	syscall

calc:
	addi $sp,$sp,-4
	sw $ra,($sp)
	bne $s0,$t0,not0
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra

not0:
	mul $s1,$s1,$s0
	addi $s0,$s0,-1
	jal calc
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra


