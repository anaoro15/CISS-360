#=================================================================
# Filename: a04q07.s
# Author: aoro
# Date: 09/10/2023
#
# Description
# his program that shows the work for adding two 2–digit numbers using column
# addition.
#
# Register usage:
# $t0 - 9
# $t1 - 10
# $s0 - first digit of int1 
# $s1 - second digit of int1
# $s3 - first digit of int2
# $s4 - second digit of int2
# a1 - sum of first digits
# a2 - sum of second digits
# a3 - sum3
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
	        move    $t0, $v0        # t0 = FIRST INTEGER

                li      $v0, 5
                syscall	     
	        move    $t1, $v0        # t0 = SECOND INTEGER
                
	        li 	$t2, 10
                div     $t0, $t2        
                mflo    $s0             # s0 = FIRST DIGIT int1
                mfhi    $s1             # s1 = SECOND DIGIT int1

                div     $t1, $t2        
                mflo    $s3             # s3 = FIRST DIGIT int2
                mfhi    $s4             # s4 = SECOND DIGIT int2

                add     $a1, $s1, $s4   # sum1 = second dig1 + second dig2
                add     $a2, $s0, $s3   # sum2 = first dig1 + first dig2
                li      $a3, 0          # sum3 = 0

                
	        
#===============================================================================
#               checking if (sum1 > 9 && sum2 > 9)
#===============================================================================
IF:             li      $t0, 9
                li      $t1, 10
                ble     $a1, $t0, ELSE_IF
                ble     $a2, $t0, ELSE_IF
				move	$t4, $a1
	        div     $a1, $t1                # sum1 = sum1 / 10
	        mflo    $a1                     # sum1 = a1
	        add     $a2, $a2, $a1           # sum2 = sum2 + sum1
	        move    $t3, $a2                # storing sum2 + sum1 / 10 for later
	        div     $a2, $t1                # sum2 = sum2 / 10
	        mflo    $a2                     # sum2 = a2
	        add     $a3, $a3, $a2           # sum3 = sum3 + (sum2 + sum1 / 10) / 10

                div     $t3, $t1
                mfhi    $a2                     # sum2 = (sum2 + sum1 / 10) % 10

                div     $t4, $t1
                mfhi    $a1                     # sum1 = sum1 % 10

#================================================================================
#               printing for the case 1
#================================================================================
                li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s0
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s1
	        syscall
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, PLUS
	        syscall
	        li      $v0, 1
	        move    $a0, $s3
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s4
	        syscall
	        li	$v0, 4
		la	$a0, NEWLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, UNDERLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        li      $v0, 1
	        move    $a0, $a3
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $a2
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $a1
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        li	$v0, 4
	        la	$a0, UNDERLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        j       END        
#================================================================================
#               checking else if (sum1 > 9)
#================================================================================

ELSE_IF:        ble     $a1, $t0, ELSE_IF2
		move    $t4, $a1                # int t = sum1 
	                
		div     $a1, $t1                # sum1 = sum1 / 10
		mflo    $a1                     # sum1 = a1
		add     $a2, $a2, $a1           # sum2 = sum2 + sum1 / 10
		div	$a2, $t1
		mfhi	$a2			# sum2 = (sum2 + sum1 / 10) % 10
				
                div     $t4, $t1
                mfhi    $a1                     # sum1 = sum1 % 10
#================================================================================
#               printing for the case 2
#================================================================================
                li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall

	        div     $t4, $t1
	        mflo    $t4
	        
	        li      $v0, 1
	        move    $a0, $t4
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall

                li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s0
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s1
	        syscall
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, PLUS
	        syscall
	        li      $v0, 1
	        move    $a0, $s3
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s4
	        syscall
	        li	$v0, 4
		la	$a0, NEWLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, UNDERLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall

                li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	       
	        li      $v0, 1
	        move    $a0, $a2
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $a1
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        li	$v0, 4
	        la	$a0, UNDERLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        j       END                
        
#================================================================================
#               checking else if (sum2 > 9)
#================================================================================

ELSE_IF2:       ble     $a2, $t0, ELSE
				
		move	$t3, $a2
                div     $a2, $t1
                mflo    $a3                     # sum3 = sum2 / 10

                div     $t3, $t1
                mfhi    $a2                     # sum2 = sum2 % 10
#================================================================================
#               printing for the case 3
#================================================================================
                li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s0
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s1
	        syscall
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, PLUS
	        syscall
	        li      $v0, 1
	        move    $a0, $s3
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s4
	        syscall
	        li	$v0, 4
		la	$a0, NEWLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, UNDERLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        li      $v0, 1
	        move    $a0, $a3
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $a2
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $a1
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        li	$v0, 4
	        la	$a0, UNDERLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        j       END
        
#================================================================================
#               printing for the ELSE case 
#================================================================================
ELSE:           li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s0
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s1
	        syscall
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, PLUS
	        syscall
	        li      $v0, 1
	        move    $a0, $s3
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $s4
	        syscall
	        li	$v0, 4
		la	$a0, NEWLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, UNDERLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall

                li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $a2
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall
	        li      $v0, 1
	        move    $a0, $a1
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        li	$v0, 4
	        la	$a0, UNDERLINE
	        syscall
	        
	        li	$v0, 4
	        la	$a0, NEWLINE
	        syscall
	        j       END

#===============================================================                        
END:            li	$v0, 4
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
PLUS: .asciiz "+ "
UNDERLINE: .asciiz "------"
