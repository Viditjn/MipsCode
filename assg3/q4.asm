.data
		array:  .word 100

.text

.globl main

main:
		li $s0,0
		li $v0,5
		syscall
		add $s0,$s0,$v0
		la $s1,array
		li $t0,0
		li $t1,0

loop:
		beq $s0,$t0,update
 	    li $v0,5
		syscall
		sw $v0,($s1)
		addi $s1,$s1,4
		addi $t0,$t0,1
		b loop

update:
		li $t0,0
        la $s1,array
		jal findMax

exit:
		li $v0,10
		syscall

findMax:
		beq $s0,$t0,print
		lw $t2,($s1)
		bgt $t1,$t2,paas
		li $t1,0
		add $t1,$t1,$t2
        paas:
		addi $s1,$s1,4
		addi $t0,$t0,1
		b findMax
        print:
		li $v0,1
		li $a0,0
		add $a0,$a0,$t1
		syscall
		jr $ra

		

		
		
		
		
