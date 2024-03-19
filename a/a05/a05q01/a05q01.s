#================================================================
# Filename: a05q01.s
# Author: aoro
# Date: 12/10/2023
#
# Description
# It’s a well-known fact that when you take an integer and compute its remainder # after dividing
# it by 9, you will find that it’s the same as first adding the digits of the num# ber and then
# computing the remainder after dividing by 9. For instance the remainder of 38 a# fter dividing
# by 9 is 2 (because 38 is 4 × 9 + 2) and the sum of the digits of 38 is 3 + 8 = # 11 whose
# remainder after dividing by 9 is also 2 (because 11 = 1 × 9 + 2). Write a progr# am to verify
# this fact for 4-digit numbers. Your program must pass the following test. The f# irst line is
# the input from the user. The second line has three numbers: The first is the re# mainder of
# the user-input integer after dividing by 9, the second is the sum of the digits# of user-input
# integer, and the third is the remainder of the second number after dividing it # b y 9.
#
# $s0 - sum of all digits
# $t1 - 4 digit int % 9
# $t2 - sum_of_digits % 9
# $a0 - evaluated expression
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
	move    $t0, $v0   # t0 = 4 digit int from input
#################################################################
# 
# operations
# 
#################################################################
   	        
        li      $t1, 9
        div     $t0, $t1
        mfhi    $t1        # t1 - remainder of t0 % 9

        li      $t2, 10
        li      $t3, 100
        li      $t4, 1000

        div     $t0, $t2   # t0 % 10 
        mflo    $s4        # s4  - last digit
        
        div     $t0, $t2   # t0 / 10 
        mflo    $s3
        div     $s3, $t2   # t0 / 10 % 10
        mfhi    $s3        # s3 - third digit
        
        div     $t0, $t3   # t0 / 100 
        mflo    $s2
        div     $s2, $t2   # t0 / 100 % 10
        mfhi    $s2        # s2 - second digit

        div     $t0, $t4    # t0 / 1000
        mflo    $s1        # s1 - first digit

        add     $s0, $s1, $s2
        add     $s0, $s0, $s3   # s0 - sum of all digits

        li      $t2, 9
        div     $s0, $t2
        mfhi    $t2        # t2 - sum_of_digits  / 9

        li      $v0, 1
        move    $a0, $t1
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
        move    $a0, $t2
        syscall

        li      $v0, 4
        la      $a0, NEWLINE
        syscall
    
#################################################################
# 
# data segment 
# 
#################################################################
	.data
SPACE: .asciiz " "
NEWLINE: .asciiz "\n"
