.text

.globl main

main:
		li $t2,1
		li $v0,5
		syscall
		move $t0,$v0
		li $v0,5
		syscall
		move $t1,$v0

power:
		beq $t1,$zero,exit
		mul $t2,$t2,$t0
		addi $t1,$t1,-1
		b power 

exit:
		li $v0,1
		move $a0,$t2
		syscall
		li $v0,10
		syscall
