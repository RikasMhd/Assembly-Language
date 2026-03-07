.data
array: .space 100  #25 integers allocataed
n: .asciiz "Enter the number = "
values: .asciiz "Enter the values: "
minMsg: .asciiz "\nMinimum = "
maxMsg: .asciiz "\nMaximum = "

.text
main:
	#prints Enter the number =
	li $v0, 4                         
	la $a0, n
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	la $t1, array
	li $t2, 0
	
loop1:	
	beq $t2, $t0, done_loop1
	
	#prints Enter the values:
	li $v0, 4
	la $a0, values
	syscall
	
	li $v0, 5
	syscall
	
	sw $v0, 0($t1)
	
    addi $t1, $t1, 4
	addi $t2, $t2, 1
	
    j loop1

done_loop1:
	la $t1, array		
	lw $t3, 0($t1)		
	move $t4, $t3		
	
	li $t2, 1            
    addi $t1, $t1, 4
	
loop2:
    beq $t2, $t0, done_loop2
	
	lw $t5, 0($t1)
	blt $t5, $t3, update_min
	
check_max:
	bgt $t5, $t4, update_max

continue:
    addi $t1, $t1, 4
	addi $t2, $t2, 1
    j loop2

update_min:
    move $t3, $t5
    j check_max

update_max:
    move $t4, $t5
    j continue

done_loop2:
	
    li $v0, 4
    la $a0, minMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, maxMsg
    syscall

    li $v0, 1
    move $a0, $t4
    syscall
	
    li $v0, 10
    syscall
