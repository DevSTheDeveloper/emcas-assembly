#    JAVA CODE BELOW, CONVER TO SPIM:
# public class Main {
#     public static void main(String[] args) {
#         // Declare and initialize x with value 5
#         int x = 5;
#         
#         // Declare and initialize y with value 10
#         int y = 10;
#         
#         // Check if x is less than y
#         if (x < y) {
#             // If x is less than y, print this message
#             System.out.println("x is less than y");
#         } else {
#             // If x is not less than y, print this message
#             System.out.println("x is not less than y");
#         }
#     }
# }

	.data
x:	.word 5
y:	.word 10
xless:	.asciiz "x is less than y"
xnotless:	.asciiz "x is not less than y"

	.text
	.globl main

main:
	lw $t0, x
	lw $t1, y

	blt $t0, $t1, less
	bge $t0, $t1, notless

	
less:
	li $v0, 4
	la $a0, xless
	syscall

	j exit
	
notless:
	li $v0, 4
	la $a0, xnotless
	syscall

	j exit
exit:
	li $v0, 10
	syscall

