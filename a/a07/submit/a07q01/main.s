#Author:  aoro
#File:    a07q01
##############################################################################          .text
        .globl main

g:
        addi    $sp, $sp, -8
        sw      $ra, 0($sp)
        sw      $a1, 4($sp)

        beq     $a1, $0, g_exit
        div     $a0, $a1
        mfhi    $a1

        lw      $a0, 4($sp)
        jal     g
        
g_exit: 
        move    $v0, $a0
        lw      $ra, 0($sp)
        addi    $sp, $sp, 8
        jr      $ra
        
main:   
        li      $v0, 5
        syscall

        move    $a0, $v0

        li      $v0, 5
        syscall

        move    $a1, $v0

        
        jal     g
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
SPACE:
        .asciiz " "
