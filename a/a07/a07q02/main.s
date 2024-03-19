#Author:  aoro
#File:    a07q02
##############################################################################          .text
        .globl main

h:
        addi    $sp, $sp, -8
        sw      $ra, 0($sp)
        sw      $a0, 4($sp)
        
        lw      $t0, 4($sp)
        li      $t1, 5

        # base case n <= 5
        ble     $t0, $t1, h_first_case

        #second case n <= 10
        li      $t2, 10
        ble     $t0, $t2, h_second_case

        # third case n > 10
        addi    $a0, $t0, -1  # a - 1
        jal     h
        move    $t3, $v0

        addi    $a0, $t0, -2  # a - 2
        jal     h
        move    $t4, $v0

        addi    $a0, $t0, -3  # a - 3
        jal     h
        move    $t5, $v0

        add     $t4, $t4, $t4
        sub     $t3, $t3, $t4
        add     $v0, $t3, $t5

        j       h_exit
        
h_first_case:
        li      $v0, 2
        j       h_exit
        
h_second_case:
        addi    $a0, $t0, -1
        jal     h
        move    $t2, $v0
        
        addi    $a0, $t0, -2
        jal     h
        add     $v0, $v0, $t2

h_exit:
        lw      $ra, 0($sp)
        lw      $a0, 4($sp)
        addi    $sp, $sp, 8
        jr      $ra
        
main:
        li      $v0, 5
        syscall

        move    $a0, $v0
        
        jal     h

        move    $a0, $v0
        li      $v0, 1
        syscall
        
        la      $a0, NEWLINE
        li      $v0, 4
        syscall

        li      $v0, 10
        syscall

        .data
        
NEWLINE:
        .asciiz "\n"

        
        
