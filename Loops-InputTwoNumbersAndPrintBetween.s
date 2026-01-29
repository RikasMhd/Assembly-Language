.data
start: .asciiz "Input Start : "
end: .asciiz "Input End : "
string1: .asciiz "Sequence: " 
string2: .asciiz "  "   
.text
main:    					
	la $a0,start
	li $v0,4
	syscall
	
	li $v0,5
    syscall
    move $t0,$v0
	
	la $a0,end
	li $v0,4
	syscall
	
	li $v0,5
    syscall
    move $t1,$v0
	
	la $a0,string1
    li $v0,4
    syscall	
										
	loop:					
	move $a0,$t0  			
	li $v0,1				
	syscall
	
	la $a0,string2 		
	li $v0,4      
	syscall
	
	addi $t0,$t0, 1  			
	ble $t0, $t1, loop
	
	li $v0, 10  
	syscall
