#================================================================
# Filename: a04q04.s
# Author: aoro
# Date: 09/10/2023
#
# Description
# This program that prompts the user for four integers where the
# first two are the end points of a
# closed interval and the next two numbers are the
# end points of another interval. The program prints 1 if
# the two intervals overlap,
# and 0 if the two intervals do not overlap.
#
 # Register usage:
# $s0 - a
# $s1 - b
# $s2 - c
# $s3 - d
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
	        move    $s0, $v0   # s0 = a
        
                li      $v0, 5
                syscall
	        move    $s1, $v0   # s1 = b
        
                li      $v0, 5
                syscall
	        move    $s2, $v0   # s2 = c

                
                li      $v0, 5     # v0 = d
                syscall
#################################################################
# 
# operations
# 
#################################################################

        
                 blt     $v0, $s0, not_inter    # if d >= a
                 bgt     $s2, $s1, not_inter    # if c <= b
	         li  	 $t0, 1		        # return 1
	         j 	 print
		 
not_inter:       li 	 $t0, 0	        	# not right angle : return 0

print:      	 li      $v0, 1
		 move	 $a0, $t0	        # print 0 or 1
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
