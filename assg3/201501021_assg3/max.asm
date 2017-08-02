.data
	array:	.space 1000
	space:	.asciiz "\n"
	string:	.asciiz "hello\n"
.text
.globl main
main:
	li	$v0,5
	syscall
	move	$t0,$v0
	la	$t1,array
	move	$t3,$t0
	la	$t4,array

store:
	beq	$t0,$zero,printmax
	li	$v0,5
	syscall
	move	$t2,$v0
	sw	$t2,($t1)
	addi	$t1,$t1,4
	addi	$t0,$t0,-1
	b	store

printmax:
	lw	$s0,($t4)
	jal	findmax
	li	$v0,1
	move	$a0,$s0
	syscall
	b	exit

exit:	
	li	$v0,10
	syscall

findmax:	
	beq	$t3,$zero,ret
	lw	$t2,($t4)
	bge	$t2,$s0,change
	addi	$t3,$t3,-1
	addi	$t4,$t4,4
	b	findmax

change:
	move	$s0,$t2
	addi	$t3,$t3,-1
	addi	$t4,$t4,4
	b	findmax

ret:
	jr	$ra
