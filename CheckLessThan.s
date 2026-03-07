.data
s1: .asciiz "LessThan"
s2: .asciiz "Not LessThan"
n1: .word 
n2: .word
.text
main:
	#addi $t0,5
	#addi $t1,15
	
	li $v0,5
	la $a0,n1
	syscall
	move $t0,$v0
	
	li $v0,5
	la $a0,n2
	syscall
	move $t1,$v0
	
	blt $t0,$t1,lessThan
	bgt $t0,$t1,notLessThan
	
	li $v0,10
	syscall
	
lessThan:
	li $v0,4
	la $a0,s1
	syscall
	
	li $v0,10
	syscall
	
notLessThan:
	li $v0,4
	la $a0,s2
	syscall
	
	li $v0,10
	syscall
	
