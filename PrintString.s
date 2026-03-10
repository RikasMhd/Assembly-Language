.data 
ask: .asciiz "Name: "
space: .space 100
.text
main:
li $v0,4
la $a0,ask
syscall

li $v0,8
la $a0,space
li $a1,100
syscall

li $v0,4
la $a0,space
syscall

la $v0,10
