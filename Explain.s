.data #Under .data Variables are Declared
.text #start of executable instructions
.globl main #makes main visible to the system (program entry point)
main:
#Reading the first Integer
	li $v0,5
	syscall
	move $t0,$v0 #store the number in register $t0

#Reading the Second Integer
	li $v0,5
	syscall
	move $t1,$v0 #store the number in register $t1
	
#Reading the Third Integer
	li $v0,5
	syscall
	move $t2,$v0 #store the number in register $t2

add $t3,$t0,$t1  #t3=t0+t1
add $t3,$t3,$t2  #t3=t3+t2

move $a0, $t3  #argument register for system calls
li $v0, 1      #syscall code to print an integer
syscall        #prints the value in $a0

li $v0,10      #10 is the syscall code for exit.Program terminates cleanly
syscall 
