.data
array: .space 100  #25 integers allocataed
n: .asciiz "Enter the number = "
values: .asciiz "Enter the values: "
minMsg: .asciiz "\nMinimum = "
maxMsg: .asciiz "\nMaximum = "

.text
main:
	#prints Enter the number =
	li $v0, 4                         
	la $a0, n
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	la $t1, array
	li $t2, 0
	
loop1:	
	beq $t2, $t0, done_loop1
	
	#prints Enter the values:
	li $v0, 4
	la $a0, values
	syscall
	
	li $v0, 5		#Read Value (Ex:num=5,  store 5 values)
	syscall
	
	sw $v0, 0($t1) 		#store value arr[1],arr[2],....
	
    addi $t1, $t1, 4		#Move to Next Array Position
	addi $t2, $t2, 1		#Increase Counter
	
    j loop1

#Start Finding Min and Max
done_loop1:
	la $t1, array		
	lw $t3, 0($t1)		#minimum
	move $t4, $t3		#Maximum  :  array[0] = 8, max,min=8
	
	#Prepare Second Loop
	li $t2, 1            #Start from second element.
    addi $t1, $t1, 4

#Find Min & Max
loop2:			
    beq $t2, $t0, done_loop2
	
	lw $t5, 0($t1)		#Load Next Array Value
	blt $t5, $t3, update_min		#Check Minimum     #if current_value < min  =update min

#Check Maximum
check_max:		
	bgt $t5, $t4, update_max		#if current_value > max=update max

#Continue Loop		
continue:		
    addi $t1, $t1, 4		#Move to next array element
	addi $t2, $t2, 1
    j loop2

#Update Minimum
update_min:		
    move $t3, $t5		#min = current value
    j check_max

#Update Maximum
update_max:		
    move $t4, $t5		##max = current value
    j continue

done_loop2:				
#Print Minimum
    li $v0, 4
    la $a0, minMsg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

#Print Minimum
    li $v0, 4
    la $a0, maxMsg
    syscall

    li $v0, 1
    move $a0, $t4
    syscall
	
    li $v0, 10
    syscall
