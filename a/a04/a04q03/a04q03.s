#================================================================
# Filename: a04q03.s
# Author: aoro
# Date: 09/10/2023
#
# Description
# This program prompts the user for integers and display 1 if
# three integers form the sides of a right angle triangle
# otherwise 0 is printed.
#
# Register usage:
# $s0 - x
# $s1 - y
# $s2 - z
# $a0 - evaluated expression
#================================================================

#################################################################
# 
# text segment 
# 
#################################################################
        .text
        .globl main

main:           li      $v0, 5
                syscall
	        move    $s0, $v0   # s0 = x
        
                li      $v0, 5
                syscall
	        move    $s1, $v0   # s1 = y
        
                li      $v0, 5
                syscall
	        move    $s2, $v0   # s2 = z

#################################################################
# 
# operations
# 
#################################################################

                 mult    $s0, $s0
                 mflo    $s0                              # x^2
                 mul     $s1, $s1
                 mflo    $s1                              # y^2
                 add     $s0, $s0, $s1                    # x^2 + y^2
                 mult    $s2, $s2
                 mflo    $s2                              # z^2
        
                 bne     $s0, $s2, not_angle    # if the sides are NOT right angle
	         li  	 $t0, 1		  		  # return 1
	         j 	 print
		 
not_angle:       li 	 $t0, 0				  # not right angle : return 0

print:      	 li      $v0, 1
		 move	 $a0, $t0			  # print 0 or 1
                 syscall
        
		 li	 $v0, 4
		 la	 $a0, NEWLINE
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
