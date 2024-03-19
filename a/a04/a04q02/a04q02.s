#================================================================
# Filename: a04q02.s
# Author: aoro
# Date: 09/10/2023
#
# Description
# This program prompts the user for three integers,
# prints the three integers, and print 1 if the
# integers are in ascending order and 0 otherwise.
# Note that 1 1 1 is in ascending order while 2 3 1 is
# not (because of the last integer).
#
# Register usage:
# $s0 - x
# $s1 - y
# $s2 - z
#================================================================

#################################################################
# 
# text segment 
# 
#################################################################
        .text
        .globl main

main:   li      $v0, 5
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

                 bgt     $s0, $s1, not_asc                # if (x <= y)
	         bgt     $s1, $s2, not_asc                # if (y <= z)
		 li 	 $t0, 1		  		  # return 1
		 j 	 print
		 
not_asc:         li 	 $t0, 0				  # descending : return 0

print:           li	 $v0, 1
		 move	 $a0, $s0			  # print x
		 syscall

		 li	 $v0, 4
		 la 	 $a0, SPACE
		 syscall
		 
		 li	 $v0, 1			
		 move	 $a0, $s1			  # print y
		 syscall
		
		 li	 $v0, 4
		 la 	 $a0, SPACE
		 syscall
		 		
		 li	 $v0, 1
		 move	 $a0, $s2 			  # print z
		 syscall

		 li	 $v0, 4
		 la 	 $a0, SPACE
		 syscall
		 
	         li      $v0, 1
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
