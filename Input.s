.data
inputmessage: .asciiz "What's Your Name?\n"
name: .space 10
output1: .asciiz "Hello "
output2: .asciiz "Welcome to Assembly language Programming!"

.text
.globl main
main: 
	
	la $a0,name
	li $a1,10
	li $v0,8
	syscall  
	
	la $a0,output1
	li $v0,4
	syscall
	
	la $a0,name
	li $v0,4
	syscall  
	
	la $a0,output2
	li $v0,4
	syscall
	
    #Exit Program
	li $v0, 10
    syscall
