.data
array: .space 20           # Space for 5 integers
msg:   .asciiz "Enter a number: "
newline: .asciiz "\n"
.text
.globl main

main:
    la $t2, array          # Load base address of array

    # --- First number ---
    li $v0, 4              # print message
    la $a0, msg
    syscall

    li $v0, 5              # read integer
    syscall
    sw $v0, 0($t2)         # store at array[0]

    # --- Second number ---
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall
    sw $v0, 4($t2)         # store at array[1]

    # --- Third number ---
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall
    sw $v0, 8($t2)         # store at array[2]

    # --- Fourth number ---
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall
    sw $v0, 12($t2)        # store at array[3]

    # --- Fifth number ---
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall
    sw $v0, 16($t2)        # store at array[4]
	
	#load the 0th element
	lw $t0,0($t2)

	#print the number
	li $v0,1
	move $a0,$t0
	syscall
	
	#print newline
	li $v0,4
	la $a0,newline
	syscall
	
	#load the 1st element
	lw $t0,4($t2)
	
	#print the number
	li $v0,1
	move $a0,$t0
	syscall


    # --- Exit ---
    li $v0, 10
    syscall
