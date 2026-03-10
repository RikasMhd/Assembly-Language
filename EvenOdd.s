.data 
num: .asciiz "Enter Number : "
even_msg: .asciiz "Number is Even \n"
odd_msg: .asciiz "Number is odd \n"
div3_msg: .asciiz "Number is div by 3 \n"
not_div3_msg: .asciiz "Number is not div by 3 \n"
space: .space 100

.text
main:
#prints Num
li $v0,4
la $a0,num
syscall

li $v0,5
syscall
move $t0,$v0

#Check even/odd
li $t1,2
div $t0,$t1
mfhi $t2
beq $t2,$zero,even
j odd

even:
li $v0,4
la $a0,even_msg
syscall
j check_div3

odd:
li $v0, 4
la $a0, odd_msg
syscall
j check_div3

check_div3:
li $t1,3
div $t0,$t1
mfhi $t2
beq $t2,$zero,divisible
j not_divisible

divisible:
li $v0,4
la $a0,div3_msg
syscall
j exit

not_divisible:
li $v0, 4
la $a0, not_div3_msg
syscall
j exit

#exit
exit:
la $v0,10
syscall
