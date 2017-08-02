.text

.globl main

main:
		li $v0,5
		syscall
		move $t0,$v0
		li $v0,5
		syscall
		move $t1,$v0
		li $t2,1
	    	jal power
exit:
		li $v0,1
		move $a0,$s0
		syscall
		li $v0,10
		syscall

power:
		addi $sp,$sp,-4
		sw $ra,($sp)
		bne $t1,$zero,nonzero
		li $s0,1
		lw $ra,($sp)
		addi $sp,$sp,4
		jr $ra

nonzero:
		bne $t1,$t2,not1
		move $s0,$t0
		lw $ra,($sp)
		addi $sp,$sp,4
		jr $ra

not1:
		and $s1,$t1,$t2
		beq $s1,$zero,even
		addi $t1,$t1,-1
		srl $t1,$t1,1
		jal power
		mul $s0,$s0,$s0
		mul $s0,$s0,$t0
		lw $ra,($sp)
		addi $sp,$sp,4
		jr $ra

even:
		srl $t1,$t1,1
		jal power
		mul $s0,$s0,$s0
		lw $ra,($sp)
		addi $sp,$sp,4
		jr $ra
