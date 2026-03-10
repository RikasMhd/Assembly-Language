.data
num: .asciiz "Enter Number: "
fact: .asciiz "Factorial: "
.text
data:
li $v0,4
la $a0,num
syscall

li $v0,5
syscall
move $t0,$v0

li $t1,1
li $t2,1

check:
bgt $t2,$t0,ans

mul $t1,$t1,$t2
addi $t2,$t2,1
j check

ans:
li $v0,4
la $a0,fact
syscall

move $a0,$t1
li $v0,1
syscall

 
li $v0,10
syscall
