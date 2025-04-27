.data
prompt: .asciiz "Please enter a value n: "
space: .asciiz " "
n: .word 0 

.text
.globl main
main:
    li $v0, 4           # Print the prompt
    la $a0, prompt
    syscall

    li $v0, 5           # Read integer input
    syscall
    move $t0, $v0       # Store the input value in $t0
    sw $t0, n            # Store input value into memory location 'n'

    li $t1, 1            # Start the loop with t1 = 1 (since we want to print 1 to n-1)

loop_start:
    bge $t1, $t0, loop_end  # If $t1 >= $t0, end the loop

    li $v0, 1           # Print the integer value of $t1
    move $a0, $t1
    syscall

    li $v0, 4           # Print a space
    la $a0, space
    syscall

    addi $t1, $t1, 1    # Increment $t1 by 1

    j loop_start        # Jump back to the start of the loop

loop_end:
    li $v0, 10          # Exit the program
    syscall
