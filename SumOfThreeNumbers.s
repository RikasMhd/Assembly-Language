.data
int1: .word 0
int2: .word 0
int3: .word 0

input1: .asciiz "Integer 1:"
input2: .asciiz "Integer 2:"
input3: .asciiz "Integer 3:"
sum: .asciiz "Sum :"


.text
main:
	la $a0,input1
	li $v0,4
	syscall
	
	la $a0,int1
	li $a1,10
	li $v0,5
	syscall
	move $t0,$v0
	
	la $a0,input2
	li $v0,4
	syscall
	
	la $a0,int2
	li $a1,10
	li $v0,5
	syscall
	move $t1,$v0
	
	la $a0,input3
	li $v0,4
	syscall
	
	la $a0,int3
	li $a1,10
	li $v0,5
	syscall
	move $t2,$v0
	
	add $t3,$t1,$t0
	add $t3,$t3,$t2
	
	la $a0,sum
	li $v0,4
	syscall
	
	move $a0,$t3
	li $v0,1
	syscall
	
	li $v0,10
	syscall
