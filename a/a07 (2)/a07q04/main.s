        .text
        .globl main

j_function:
        addi    $sp, $sp, -8
        sw      $ra, 0($sp)
        sw      $a0, 4($sp)
        
        li      $t0, 1
        beq     $a0, $t0, base

        addi    $a0, $a0, -1

        jal     j_function

        add     $t0, $v0, $a1
        addi    $t0, $t0, -1
        lw      $a0, 4($sp)

        div     $t0, $a0
        mfhi    $t0
        addi    $t0, $t0, 1

        move    $v0, $t0
        j       exit_j
        
base:
        li      $v0, 1
       
exit_j:
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
        
        jal     j_function

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
        
        
