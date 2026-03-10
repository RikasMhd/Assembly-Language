.data 
n1: .asciiz "Enter Number 1: "
n2: .asciiz "Enter Number 2: "
n3: .asciiz "Enter Number 3: "
large: .asciiz "Largest Number: "
space: .space 100
.text
main:
#prints Num1
li $v0,4
la $a0,n1
syscall

li $v0,5
syscall
move $t0,$v0

#prints Num2
li $v0,4
la $a0,n2
syscall

li $v0,5
syscall
move $t1,$v0

#prints Num3
li $v0,4
la $a0,n3
syscall

li $v0,5
syscall
move $t2,$v0

move $t3,$t2

blt $t3, $t1, update1   # if t3 < t1, t1 is larger
blt $t3, $t2, update2   # if t3 < t2, t2 is larger
j print_result 


update1:
move $t3,$t1
blt $t3,$t2,update2
j print_result

update2:
move $t3,$t2

print_result:
li $v0,4
la $a0,large
syscall

li $v0,1
move $a0,$t3
syscall


#exit
la $v0,10
syscall
