.text

.globl main

main:
	li $v0,5
	syscall
	move $s0,$v0
	li $t0,1
	li $t2,2
	li $s1,0
	li $s3,0
	jal calc

exit:
	move $s1,$s3
	bne $s0,$t0,exit1
	li $s1,1

exit1:
	bne $s0,$t2,exit2
	li $s1,1

exit2:
	li $v0,1
	move $a0,$s1
	syscall
	li $v0,10
	syscall

calc:
	addi $sp,$sp,-4
	sw $ra,($sp)
	bne $s0,$zero,not0
	addi $s1,$s1,0
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra

not0:
	bne $s0,$t0,not1
	addi $s1,$s1,1
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra

not1:
	bne $s0,$t2,fibb
	addi $s1,$s1,1
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra

fibb:
	addi $s0,$s0,-2
	jal calc
	add $s3,$s3,$s1
	addi $s0,$s0,2
	addi $s0,$s0,-1
	li $s1,0
	jal calc
	addi $s0,$s0,1
	add $s3,$s3,$s1
	li $s1,0
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
	
	
	
