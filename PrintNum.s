.data 
ask: .asciiz "num: "
.text
main:
li $v0,4
la $a0,ask
syscall

li $v0,5
syscall
move $t0,$v0

li $v0,1
move $a0,$t0
syscall

la $v0,10
