.data
string1: .asciiz "What's Your Name?\n"
input: .space 10
string2: .asciiz "Hello "
string3: .asciiz "Welcome to Assembly Language Programming."

.text
main:
	#Print String1(What's Your Name?)
	la $a0,string1
	li $v0,4
	syscall

	#Get Input From User as String
	la $a0,input
	li $a1,10
	li $v0,8
	syscall

	#Print String2(Hello )
	la $a0,string2
	li $v0,4
	syscall

	#Print Input(Ex:Rikas)
	la $a0,input
	li $v0,4
	syscall

	#Print String3(Welcome to Assembly Language Programming.)
	la $a0,string3
	li $v0,4
	syscall

	#Exit Program
	li $v0,10
	syscall
