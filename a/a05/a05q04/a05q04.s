#================================================================
# Filename: a05q04.s
# Author: aoro
# Date: 12/10/2023
#
# Description
# This program does a 3n + 1 or Collatz conjecture 
# ex: input is 22
# sequence: 22 11 34 17 52 26 13 40 20 10  5 16 8 4 2 1 
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

Collatz_conjecture:
	        li      $t1, 2                   # to check evenness
	        li      $t4, 1                   # when  n == 1 we terminate the loop 
if:             li      $v0, 1
	        move    $a0, $t0
	        syscall

	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        
	        beq     $t0, $t4, EXIT           # when n == 1, goto exit
	        div     $t0, $t1
	        mfhi    $t2
	        bne     $t2, $0, ODD         # n % 2 != 0 goto ODD
	        div     $t0, $t1
	        mflo    $t0                      # n = n / 2 (when n is even)
	        j       if
ODD:   	        move	$t3, $t0
		add     $t0, $t0, $t0
	        add     $t0, $t3, $t0
	        addi    $t0, $t0, 1              # n = 3n + 1 (when n is odd)
	        j       if
EXIT:           j       $ra
	        
					
main:           li      $v0, 5
		syscall		
		move    $t0, $v0                 # t0 - int from input
        	jal     Collatz_conjecture
	 
	        li      $v0, 4
	        la      $a0, NEWLINE
	        syscall

	        li	$v0, 10
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
