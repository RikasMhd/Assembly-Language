.data #Stores strings to be printed.
name: .asciiz "Name: " #means ASCII string ending with null character (\0).
sub: .space 50  #Reserve memory for string
.text
.globl main

main:
#syscall to print string & 
	li $v0,4
	li $a0,name  #address of the string(a0)
	syscall
	
	li $v0,8
	li $a0,sub  #a1=Max number of characters
	li $a1,50  #Memory
	syscall
	
	li $v0,10
	syscall
