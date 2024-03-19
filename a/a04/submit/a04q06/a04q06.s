#=================================================================
# Filename: a04q06.s
# Author: aoro
# Date: 09/10/2023
#
# Description
# This program prompts the user for a program that tells the
# user if the date entered is valid or not. The program
# prompts the user for a date (an integer)
# in the format of yyyymmdd, prints the year,
# month and day from the input, and
# prints 1 if the date is correct, or 0 (zero) otherwise.
# For instance the user enters 19910229 for February 29th, 1991.
#
# Register usage:
# $t0 - 8 digit int
# $t1 - 1000
# $t2 - 100 
# $s0 - year
# $s1 - month
# $s2 - day
# $a0 - evaluated expression
#================================================================

#################################################################
# 
# text segment 
# 
#################################################################
                .text
                .globl main

#==========================================================================
#      checking if year is >= 1 && <= 2023, and month >= 1 && <= 12
#==========================================================================

year_and_month_range:	

	        li      $t0, 1                  # year & month range start
	        li      $t1, 2023               # year range end
	        li      $t2, 12                 # month range end
	        blt     $s0, $t0, non_valid
	        bgt     $s0, $t1, non_valid
	        blt     $s1, $t0, non_valid
	        bgt     $s1, $t2, non_valid
	        li      $a1, 1
	        j       $ra                     # year and month are in valid range
                                           
non_valid:      li      $a1, 0                  # year and month not in valid range
                j       $ra
        

#==========================================================================
#               checking if the year is a leap year
#==========================================================================
        
leap_year:      li      $t0, 4
                li      $t1, 100
        	div     $s0, $t0                # year % 4
	        mfhi    $t0
	        div     $s0, $t1                # year % 100
	        mfhi    $t1
	        bne     $t0, $zero, leap_test2
	        beq     $t1, $zero, leap_test2
	        li      $a0, 1                  # is leap a0 returns 1
	        j       $ra
leap_test2:	li      $t0, 400
		div	$s0, $t0		# year % 400
	        mfhi	$t0
		bne	$t0, $zero, non_leap
	        li	$a0, 1
	        j	$ra
non_leap:       li      $a0, 0                  # not leap a0 returns 0
	        j       $ra
	        # a0 = is leap or not leap

#==========================================================================
#               checking if the month is a leap feb
#==========================================================================
        
leap_february:
	        li      $t0, 1
		li      $t1, 29
	        li      $t3, 2

	        bne    $s1, $t3, non_leap_feb
	        blt     $s2, $t0, non_leap_feb
	        bgt     $s2, $t1, non_leap_feb
	        li      $a2, 1                  # is leap feb, a2 = 1
	        j       $ra
non_leap_feb:   li      $a2, 0                  # is not leap feb, a2 = 0
                j       $ra
#==========================================================================
#               checking if the month has valid num of days
#==========================================================================
months_range:
	        li      $t0, 9
	        li      $t1, 1
	        li      $t2, 30
	        li      $t3, 31
	        bne     $s1, $t0, not_sept         # month != 9 && days are not valid
	        blt     $s2, $t4, non_valid
	        bgt     $s2, $t5, non_valid
	        li      $a3, 1
	        j       $ra

not_sept:       li      $t0, 4
                bne     $s1, $t0, not_april
	        blt     $s2, $t4, non_valid
	        bgt     $s2, $t5, non_valid
	        li      $a3, 1
	        j       $ra

not_april:      li      $t0, 6
                bne     $s1, $t0, not_june
	        blt     $s2, $t4, non_valid
	        bgt     $s2, $t5, non_valid
	        li      $a3, 1
	        j       $ra

not_june:       li      $t0, 11
                bne     $s1, $t0, not_nov
	        blt     $s2, $t4, non_valid
	        bgt     $s2, $t5, non_valid
	        li      $a3, 1
	        j       $ra

not_nov:        li      $t0, 1 
                bne     $s1, $t0, not_jan
	        blt     $s2, $t1, non_valid
	        bgt     $s2, $t3, non_valid
	        li      $a3, 1
	        j       $ra
        
not_jan:        li      $t0, 3
                bne     $s1, $t0, not_march
	        blt     $s2, $t1, non_valid
	        bgt     $s2, $t3, non_valid
	        li      $a3, 1
	        j       $ra

not_march:      li      $t0, 5
                bne     $s1, $t0, not_may
	        blt     $s2, $t1, non_valid
	        bgt     $s2, $t3, non_valid
	        li      $a3, 1
	        j       $ra

not_may:        li      $t0, 7
                bne     $s1, $t0, not_july
	        blt     $s2, $t1, non_valid
	        bgt     $s2, $t3, non_valid
	        li      $a3, 1
	        j       $ra

not_july:       li      $t0, 8
                bne     $s1, $t0, not_aug
	        blt     $s2, $t1, non_valid
	        bgt     $s2, $t3, non_valid
	        li      $a3, 1
	        j       $ra
        
not_aug:        li      $t0, 10
                bne     $s1, $t0, not_oct
	        blt     $s2, $t1, non_valid
	        bgt     $s2, $t3, non_valid
	        li      $a3, 1
	        j       $ra

not_oct:        li      $t0, 12
                bne     $s1, $t0, not_dec
	        blt     $s2, $t1, non_valid
	        bgt     $s2, $t3, non_valid
	        li      $a3, 1
	        j       $ra

not_dec:        li      $a3, 0
                j       $ra
#==========================================================================
#               checking if it is a non leap februar
#==========================================================================
      
non_leap_february:      
	        li      $t0, 1
		li      $t1, 28
	        li      $t3, 2
	        bne    $s1, $t3, non_valid_feb
	        blt     $s2, $t0, non_valid_feb
	        bgt     $s2, $t1, non_valid_feb
	        li      $s4, 1                  # is non-leap feb, a4 = 1
	        j       $ra
non_valid_feb:  li      $s4, 0                  # is not non -leap feb, a4 = 0
                j       $ra

#================================================================================
#  checking if the date is valid 
#  using if else conditions
#================================================================================
IF:
                li      $t0, 1          # 1 - true
                li      $t1, 0          # 0 - false
                bne     $a1, $t0, EXIT  # if (!months_range) goto EXIT
                bne     $a0, $t0, ELSE  # if (!leap_year) goto ELSE
                bne     $a2, $t0, OR    # if (!leap_february) goto OR
                li      $s4, 1          # if (leap_february) s0 = true
                j       $ra             # return to main
OR:             bne     $a3, $t0, EXIT  # if (!months_range) goto EXIT
	        li      $s4, 1          # if (months_range) s0 = true
	        j       $ra             # return to main
ELSE:           bne     $s4, $t0, OR2   # if (!non_leap_feb) goto OR2
		li      $s4, 1
		j	$ra
OR2:            bne     $a3, $t0, EXIT  # if (!months_range) goto EXIT
	        li      $s4, 1          # if (months_range) s0 = true
	        j       $ra             # return to main

EXIT:           li      $s4, 0          # not valid date
                j       $ra
#================================================================================
#	         extracting the year, month, day 
#================================================================================

main:           li      $v0, 5
                syscall	        	# t0 = 19910229
	        move    $t0, $v0        # t0 = input - 8 digit int
        
	        li 	$t1, 10000
                div     $t0, $t1        # input / 10000
                mflo    $s0             # s0 = year = input / 10000

	        li      $t1, 100        # store 100 in t1
				
                div     $t0, $t1        # input / 100
                mflo    $s1             # s0  = input / 100
                div     $s1, $t1        # year % 100
                mfhi    $s1             # s1 = month = input / 100 % 100
        
                div     $t0, $t1        # input % 100
                mfhi    $s2             # s2 = day = input / 100

#===============================================================================
#               checking if the month has valid num of days
#===============================================================================
        	jal     year_and_month_range
	        jal     leap_year
	        jal     months_range
	        jal     non_leap_february
	        jal     leap_february
	        jal     IF
#================================================================================
#               printing the year / month / day
#================================================================================
	        li      $v0, 1
	        move    $a0, $s0
	        syscall

	        li      $v0, 4
	        la      $a0, SPACE
	        syscall

                li      $v0, 1
	        move    $a0, $s1
	        syscall
	        
	        li      $v0, 4
	        la      $a0, SPACE
	        syscall

                li      $v0, 1
	        move    $a0, $s2
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
