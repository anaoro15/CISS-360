#================================================================
# Filename: a04q01.s
# Author: aoro
# Date: 09/10/2023
#
# Description
# The program prompts the user for x, y, z, i, t and prints the
# value for the Al Chemiz expression.
# x + y / (z + i) * t^3
#
# Register usage:
# $s0 - x
# $s1 - y
# $s2 - z
# $s3 - i
# $v0 - evaluated expression
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

        li      $v0, 5
		syscall
       	move    $s3, $v0   # s3 = i
       
        li      $v0, 5     # v0 = t
        syscall

#################################################################
# 
# operations
# 
#################################################################
        add     $s2, $s2, $s3    # s2 = z + i
        div     $s1, $s2
        mflo    $s1				 # s1 = y / (z + i)
        mult    $v0, $v0
		mflo    $t0 			 # v0 = t + t
        mult    $t0, $v0
		mflo    $v0				 # v0 = t + t + t
        mul     $v0, $v0, $s1    # v0 = s1 * v0
        add     $a0, $v0, $s0    # v0 = x + y / (z + i) * t^3
        
		li      $v0, 1
        syscall
		
		li		$v0, 4
		la		$a0, NEWLINE
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
