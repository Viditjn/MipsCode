.text

.globl main

main: 
	li $v0,5
	syscall
	move $s0,$v0
	li $v0,5
	syscall
	move $s1,$v0
	jal gcd

exit:
	li $v0,1
	move $a0,$s1
	syscall
	li $v0,10
	syscall

gcd:
	addi $sp,$sp,-4
	sw $ra,($sp)
	div $s0,$s1
	mfhi $s2
	bne $s2,$zero,gcd1
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra

gcd1:
	move $s0,$s1
	move $s1,$s2
	jal gcd
	lw $ra,($sp)
	addi $sp,$sp,4
	jr $ra
	
