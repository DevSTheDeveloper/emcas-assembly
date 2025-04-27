.data
a: .word 15
b: .word 5
result: .word 0
addition: .asciiz "The sum of a and b is: "
subtract: .asciiz "The difference between a and b is: "

.text
.globl main
main:
    lw $t0, a
    lw $t1, b

    j adding

adding:
    add $t2, $t1, $t0
    li $v0, 4
    la $a0, addition
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    j subtraction

subtraction:
    sub $t2, $t1, $t0
    li $v0, 4
    la $a0, subtract
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    j exit

exit:
    li $v0, 10
    syscall
