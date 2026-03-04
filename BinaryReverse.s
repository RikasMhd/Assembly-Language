#Program to print a list of numbers
.data
space: .asciiz " "
count: .word 20
 
.text
    main:
 
li $v0, 5 # # code for reading integer is 5
syscall
move $t0, $v0
 
li $t1, 2
move $t3, $zero
 
loop:
div $t0,$t1  #$t0 divided by 2
mfhi $a0	 
mflo $t0
 
li $v0, 1 	# code for printing integer is 1
syscall
 
bgt $t0, $t3, loop # Branch(jump) to loop (line 16) if $t0 > 0
 
li $v0, 10
syscall # Use syscall 10 to stop simulation
