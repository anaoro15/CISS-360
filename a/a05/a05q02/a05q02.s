#================================================================
# Filename: a05q02.s
# Author: aoro
# Date: 12/10/2023
#
# Description
# This program produces an output of cubes from 0 to the integer input.
# The two values on the same line are separated by the tab character.
#
# $t0 - int from input
# $t1 - i (loop counter)
# $t2 - temporary storage for i
# $t3 - temporary storage of i for cubing
# $a0 - evaluated expression
#================================================================

#################################################################
# 
# text segment 
# 
#################################################################
        .text
        .globl main

####################################################################
#		for loop that runs from 0 to n (input)
####################################################################
		li    	$t1, 0     			 # loop counter
        
for_loop:
                bgt   	$t1, $t0, end_loop   # for i > n  goto end_loop
                move    $t2, $t1             # save old i before subing it
		
		move 	$t3, $t2
		multu	$t2, $t2
		mflo	$t2 
		multu	$t2, $t3
		mflo 	$t2 		     # i ^ 3
        
		li      $v0, 1
                move    $a0, $t1             # print i
                syscall

                li      $v0, 4
                la      $a0, TAB
                syscall
        
                li      $v0, 1
                move    $a0, $t2             # print i ^ 3
                syscall
		
		li      $v0, 4
                la      $a0, NEWLINE
                syscall
		
                addi    $t1, 1               # i++
                j       for_loop
        
end_loop:
                li      $v0, 4
                la      $a0, NEWLINE
                syscall
		j		$ra
    
main:           li      $v0, 5
                syscall		
		move    $t0, $v0             # t0 - int from input
		jal     for_loop
		
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
