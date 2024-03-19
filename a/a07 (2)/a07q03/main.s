        .text
        .globl main

hanoi:
        addi    $sp, $sp, -20
        sw      $ra, 0($sp)
        sw      $a0, 4($sp)
        sw      $a1, 8($sp)
        sw      $a2, 12($sp)
        sw      $a3, 16($sp)
        
        li      $t0, 1
        beq     $a0, $t0, hanoi_base_case

        lw      $a0, 4($sp)
        addi    $a0, $a0, -1
        lw      $a1, 8($sp)
        lw      $a2, 16($sp)
        lw      $a3, 12($sp)
        jal     hanoi

        lw      $a0, 4($sp)
        lw      $a1, 8($sp)
        lw      $a2, 12($sp)
        lw      $a3, 16($sp)
        jal     hanoi

        lw      $a0, 4($sp)
        addi    $a0, $a0, -1
        lw      $a1, 12($sp)
        lw      $a2, 8($sp)
        lw      $a3, 16($sp)
        jal     hanoi
        
hanoi_base_case:
        move    $a0, $a1
        li      $v0, 8
        syscall
        
        la      $a0, SPACE
        li      $v0, 4
        syscall
        
        move    $a0, $a3
        li      $v0, 8
        syscall
        
        la      $a0, NEWLINE
        li      $v0, 4
        syscall

hanoi_exit:
        lw      $ra, 0($sp)
        addiu   $sp, $sp, 20

        jr      $ra
                
main:
        li      $v0, 5
        syscall
        move    $a0, $v0

        li      $a1, 'A'
        li      $a2, 'B'
        li      $a3, 'C'

        jal     hanoi

        li      $v0, 10
        syscall
        

        .data
ARROW:
        .asciiz "->"
NEWLINE:
        .asciiz "\n"
SPACE:
        .asciiz " "
