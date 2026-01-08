 .data

.text
.globl main

main:
    # read first integer
    li $v0, 5
    syscall
    move $t0, $v0

    # read second integer
    li $v0, 5
    syscall
    move $t1, $v0

    # read third integer
    li $v0, 5
    syscall
    move $t2, $v0

    # sum = t0 + t1 + t2
    add $t3, $t0, $t1
    add $t3, $t3, $t2

    # print sum
    move $a0, $t3
    li $v0, 1
    syscall

    # exit
    li $v0, 10
    syscall
