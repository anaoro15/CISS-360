#================================================================
# Filename: a05q03.s
# Author: aoro
# Date: 12/10/2023
#
# Description
# This program checks if a non-negative integer entered by
# the user is a prime
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
				
is_prime:	li    	$t1, 0                  # base case1: n = 0
                li      $t2, 1                  # base case2: n = 1
                li      $t3, 2                  # initialize d (divisor) = 2
                addiu	$t4, $t0, -1		# last loop iteration is n - 1   
	        bne     $t0, $t1, CASE2
	        li      $v0, 0
	        j       $ra
	        
CASE2:
	        bne    $t0, $t2, CASE3
	        li      $v0, 0
	        j       $ra
	        
CASE3:
	        bne    $t0, $t3, ELSE
	        li      $v0, 1
	        j       $ra
						
	        
ELSE:           bgt   	$t3, $t4, isPrime        # for d > n  goto end_loop
	        div     $t0, $t3                 # n % d
	        mfhi    $t2                      # t2 = n % d
	        bne     $t2, $zero, incr         # if n % d != 0 goto next iteration
	        li      $v0, 0
	        j	$ra
			
incr:		addi    $t3, $t3, 1              # d++
	        j       ELSE    
	        
isPrime:   	li      $v0, 1
		j       $ra
					
main:           li      $v0, 5
		syscall		
		move    $t0, $v0                 # t0 - int from input
        	jal     is_prime
	        
		move	$a0, $v0
		li	$v0, 1
		syscall
			
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
