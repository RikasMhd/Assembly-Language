.data
num: .asciiz "Enter Number: "
space: .asciiz "  "
fib: .asciiz "Fibonacci: "
.text
main:
li $v0,4
la $a0,num
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,fib
syscall
	
li $t1,0
li $t2,1
li $t3,0

check:
bge  $t3, $t0, end_fib

move $a0, $t1
li $v0, 1
syscall

li $v0,4
la $a0,space
syscall
	
add $t4,$t1,$t2
move $t1,$t2
move $t2,$t4

addi $t3,$t3,1
j check

end_fib: 
li $v0,10
syscall
