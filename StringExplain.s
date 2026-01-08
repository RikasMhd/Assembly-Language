.data #Stores strings to be printed.
name: .asciiz "Name: Mohanthas\n" #means ASCII string ending with null character (\0).
address: .asciiz "Address: Jaffna\n"
age: .asciiz "Age: 28"
.text
.globl main

main:
#syscall to print string & 
	li $v0,4
	li $a0,name  #address of the string(a0)
	syscall
	
	li $v0,4
	li $a0,address
	syscall
	
	li $v0,4
	li $a0,age
	syscall
	
	li $v0,10
	syscall
