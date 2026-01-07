# Use .set noreorder to prevent the assembler from filling branch
# delay slots, if you want to fill delay slots manually.
# .set noreorder
.data
string1: .asciiz "Name: "
string2: .asciiz "Mohanathas\n"

string3: .asciiz "Address: "

string5: .asciiz "Age: "
age: .word 22

.text

main:
	la $a0,string1
	li $v0,4
	syscall
	
	la $a0,string2
	li $v0,4
	syscall
	
	la $a0,string3
	li $v0,4
	syscall
	
	la $a0,string4
	li $v0,4
	syscall
	
	la $a0,string5
	li $v0,4
	syscall
	
	lw $a0,age
	li $v0,1
	syscall
	
	li $v0, 10
	syscall
