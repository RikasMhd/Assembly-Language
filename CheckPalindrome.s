.data
msg: .asciiz "Enter a string: "
pal_msg: .asciiz "\nThe string is a palindrome.\n"
not_pal_msg: .asciiz "\nThe string is NOT a palindrome.\n"
str: .space 100

.text
main:
# Print prompt
li $v0,4
la $a0,msg
syscall

# Read string
li $v0,8
la $a0,str
li $a1,100
syscall

# Find string length
la $t0,str
li $t1,0

len_loop:
lb $t2,0($t0)
beq $t2,$zero,check_pal
addi $t1,$t1,1
addi $t0,$t0,1
j len_loop

# Check palindrome
check_pal:
la $t3,str       # start pointer
la $t4,str
add $t4,$t4,$t1  # move to null
addi $t4,$t4,-1  # move to last char

pal_loop:
blt $t3,$t4,compare_done
j pal_true

compare_done:
lb $t5,0($t3)
lb $t6,0($t4)
bne $t5,$t6,pal_false
addi $t3,$t3,1
addi $t4,$t4,-1
blt $t3,$t4,pal_loop
j pal_true

pal_true:
li $v0,4
la $a0,pal_msg
syscall
j exit

pal_false:
li $v0,4
la $a0,not_pal_msg
syscall

exit:
li $v0,10
syscall
