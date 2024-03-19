#=================================================================
# Filename: a04q05.s
# Author: aoro
# Date: 09/10/2023
#
# Description
# This program that prompts the user for four integers and
# prints out the second largest.
#
# Register usage:
# $v0 - a, b, c, d
# $t0 - the largest int
# $t1 - loop counter
# $t2 - end of loop 
# $t3 - second largest int
# $a0 - evaluated expression
#================================================================

#################################################################
# 
# text segment 
# 
#################################################################
                .text
                .globl main

main:           
		li      $t0, -1                # intializing max
		li      $t1, 1                 # i = 1
		li      $t2, 4                 # end[i] = 4
		li      $t3, -2                # initializing second largest
input_loop: 	bgt     $t1, $t2, END_LOOP     # looping from 1 to 4

		li      $v0, 5                 # prompting the user for input
		syscall

                ble     $v0, $t0, not_largest  # if (v0 <= t0)
                move    $t3, $t0               # new second largest
                move    $t0, $v0               # new largest
                j       check_next

not_largest:    ble     $v0, $t3, check_next
                move    $t3, $v0               # move current value to second largest
check_next:     addi    $t1, $t1, 1            # increment the counter
                j       input_loop

END_LOOP:       li      $v0, 1
		move    $a0, $t3	       # print the second largest
                syscall
        
		li	$v0, 4
		la	$a0, NEWLINE
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
