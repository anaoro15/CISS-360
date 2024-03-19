#================================================================
# Filename: a05q05.s
# Author: aoro
# Date: 12/10/2023
#
# Description
# This program accepts n from the user and then accepts n integers
# from the user and then prints the integer in ascending order.
#
# Registers used:
# $t0 - n from input
# $t1 - base case 1
# $t2 - base case 2, later used as temporary
# $t3 - base case 3 (counter for ELSE)
# t4 - n - 1 (end for the loop)
# $v0 - evaluated expression
#================================================================

####################################################################
#		for loop that runs from 0 to n - 1 (input)
####################################################################
				.text
				.globl main
				
input:          bge     $t2, $t0, sort_array          # if i >= n goto sort_array
        
                li      $v0, 5                        # read the integer
                syscall
                sw      $v0, 0($t1)                   # store it in array at address 0
                addi    $t1, $t1, 4                   # move to the next element in array
                addi    $t2, $t2, 1                   # increment loop counter
                j       input                         # go back to input

sort_array:     addiu   $t2, $t0, -2                  # outer loop counter j = n - 2
outer_loop:     blt     $t2, $0, print_sorted_array   # if j < 0 goto print_array
		li      $t3, 0                        # inner loop counter i = 0
		la      $t1, array                    # reset array pointer to zero
inner_loop:     bgt     $t3, $t2, exit_inner_loop     # if i > j goto exit_inner_loop
		lw      $t4, 0($t1)                   # int at x[i]
		lw      $t5, 4($t1)                   # int at x[i + 1]
	        blt     $t4, $t5, no_swap
	        sw      $t4, 4($t1)
		sw      $t5, 0($t1)

no_swap:        addiu   $t1, $t1, 4                   # move to the next element in the array
                addiu   $t3, $t3, 1                   # increment inner loop counter
                j       inner_loop

exit_inner_loop:
                addiu   $t2, $t2, -1                  # increment outer loop counter
                j       outer_loop

print_sorted_array:
                la      $t1, array                    # reset array pointer to the beginning
		li	$t3, 0
                
print_loop:	bge     $t3, $t0, exit_program        # if array pointer >= n, exit loop
                lw      $a0, 0($t1)                   # load array element
                li      $v0, 1
                syscall

                li      $v0, 4
                la      $a0, SPACE
                syscall

                addiu   $t1, $t1, 4                   # move to the next element in the array
                addiu	$t3, $t3, 1
		j       print_loop
        
main:
                li      $v0, 5
		syscall		
		move    $t0, $v0                      # t0 - n (num of integers)
		li      $t2, 0
                la      $t1, array
                j       input

exit_program:   li      $v0, 4
		la      $a0, NEWLINE
		syscall

		li      $v0, 10
		syscall

#################################################################
# 
# data segment 
# 
#################################################################
	.data
SPACE: .asciiz " "
NEWLINE: .asciiz "\n"
TAB:    .asciiz "\t"
array:   .word 0
