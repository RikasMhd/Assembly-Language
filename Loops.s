.data
string1: .asciiz "Sequence: "   #Stores the string "Sequence:" in memory.
count: .word 20    #count is defined but not used in this program.

.text
main:    					#Program execution starts at main

	la $a0,string1  		#Loads the address of "Sequence:" into $a0.
	li $v0,4        
	syscall        			#Syscall 4 prints a string.
	
	move $t0,$zero  		#$zero is a special MIPS register that always contains 0.This instruction copies 0 into $t0.$t0 is used as the loop counter.So, the loop will start counting from 0($t0 = 0)
	li $t1,10   			#li means load immediate.Loads the value 10 directly into $t1.$t1 is used as the loop($t1=10) limit
							#$t0 tells the loop where to start
	#li $t0,0				#$t1 tells the loop where to stop
	#li $t1,10				#If we change $zero to $1 then output prints 1 to 10
							#If we change 10 to 5 then output prints 0 to 5
				
	loop:					#This step prints the current number in the loop.
	move $a0,$t0  			#$a0 is the register used to pass arguments to syscalls.This instruction copies the number to be printed into $a0.Now $a0 holds the number to print
	li $v0,1				#Loads 1 into $v0.Syscall code 1 = print integer
	syscall
	
	addi $t0, 1  			#Adds 1 to the value in $t0.Updates the loop counter to the next number
	ble $t0, $t1, loop   	#ble means branch if less than or equal

	li $v0, 10   			#Syscall 10 exits the program.
	syscall
	
	

	
