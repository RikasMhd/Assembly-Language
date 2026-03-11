.data
word: .asciiz "Enter String : "
count: .asciiz "Count Vowels: "
str: .space 100

.text
main:
	li $v0,4
	la $a0,word
	syscall

	li $v0,8
	la $a0,str
	syscall

	la $t0,str
	li $t1,0

loop:
	lb $t2,0($t0)
	beq $t2,$zero,print_msg
	
	li $t3,'A'
	beq $t2,$t3,inc_vowel
	
	li $t3,'E'
	beq $t2,$t3,inc_vowel
	
	li $t3,'I'
	beq $t2,$t3,inc_vowel
	
	li $t3,'O'
	beq $t2,$t3,inc_vowel
	
	li $t3,'U'
	beq $t2,$t3,inc_vowel
	
	li $t3,'a'
	beq $t2,$t3,inc_vowel
	
	li $t3,'e'
	beq $t2,$t3,inc_vowel
	
	li $t3,'i'
	beq $t2,$t3,inc_vowel
	
	li $t3,'o'
	beq $t2,$t3,inc_vowel
	
	li $t3,'u'
	beq $t2,$t3,inc_vowel

	j next_char
	
next_char:
	addi $t0,$t0,1
	j loop
	
inc_vowel:
	addi $t1,$t1,1
	addi $t0,$t0,1
	j loop
	
print_msg:
	li $v0,4
	la $a0,count
	syscall
	
	li $v0,1
	move $a0,$t1
	syscall

li $v0,10
syscall
