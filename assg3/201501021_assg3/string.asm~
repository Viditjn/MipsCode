.data
	string:	.space	1000
.globl main
.text
main:
	li	$v0,8
	la	$a0,string
	syscall
	la	$t0,string
	move	$t3,$t0
	lb	$t1,($t0)
	li	$s0,0
	li	$t2,10	# To store '\n' as an end of string
	li	$s1,97	# ascii value of 'a'
len:
	beq	$t1,$t2,change
	beq	$t1,$zero,change	##
	addi	$t0,$t0,1
	lb	$t1,($t0)
	addi	$s0,$s0,1
	b	len

change:
	beq	$s0,$zero,print
	lb	$t4,($t3)
	bge	$t4,$s1,lower
	blt	$t4,$s1,upper

lower:
	addi	$t4,$t4,-32
	sb	$t4,($t3)
	addi	$s0,$s0,-1
	addi	$t3,$t3,2
	b	change

upper:
	addi	$t4,$t4,32
	sb	$t4,($t3)
	addi	$s0,$s0,-1
	addi	$t3,$t3,2
	b	change

print:
	li	$v0,4
	la	$a0,string
	syscall
	
exit:
	li	$v0,10
	syscall
