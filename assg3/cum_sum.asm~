.data
	array:	.space 1000
	space:	.asciiz	" "
.text
.globl main

main:
	li	$v0,5
	syscall
	move	$t0,$v0
	li	$s1,0
	la	$t1,array
	move	$t2,$t0
	move	$t4,$t1

cum_sum:
	beq	$t2,$zero,printdata
	li	$v0,5
	syscall
	move	$t3,$v0
	add	$s1,$s1,$t3
	sw	$s1,($t1)
	addi	$t1,$t1,4
	addi	$t2,$t2,-1
	b	cum_sum

printdata:
	beq	$t0,$zero,exitop
	lw	$t3,($t4)
	li	$v0,1
	move	$a0,$t3
	syscall
	li	$v0,4
	la	$a0,space
	syscall
	addi	$t0,$t0,-1
	addi	$t4,$t4,4
	b	printdata

exitop:
	li	$v0,10
	syscall
