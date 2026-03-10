.data
prompt: .asciiz "Enter a string: "
output_msg: .asciiz "Uppercase: "
buffer: .space 100        # space to store input string
newline: .asciiz "\n"

.text
.globl main

main:
    # --- Print prompt ---
    li $v0, 4
    la $a0, prompt
    syscall

    # --- Read string from user ---
    li $v0, 8            # syscall 8 = read string
    la $a0, buffer
    li $a1, 100          # max length = 100
    syscall

    # --- Print "Uppercase:" ---
    li $v0, 4
    la $a0, output_msg
    syscall

    # --- Convert string to uppercase ---
    la $t0, buffer       # $t0 points to first character

uppercase_loop:
    lb $t1, 0($t0)       # load byte (character)
    beq $t1, 0, print_result  # if null terminator, end loop

    # check if character is lowercase a-z
    li $t2, 97           # ASCII 'a'
    li $t3, 122          # ASCII 'z'
    blt $t1, $t2, skip_convert  # if < 'a', skip
    bgt $t1, $t3, skip_convert  # if > 'z', skip

    # convert to uppercase by subtracting 32
    li $t4, 32
    sub $t1, $t1, $t4
    sb $t1, 0($t0)       # store back uppercase

skip_convert:
    addi $t0, $t0, 1     # move to next character
    j uppercase_loop

# --- Print the converted string ---
print_result:
    li $v0, 4
    la $a0, buffer
    syscall

    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # --- Exit ---
    li $v0, 10
    syscall
