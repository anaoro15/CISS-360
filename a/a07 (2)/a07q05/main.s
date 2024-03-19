        .text
        .globl main

read_str:
        li      $v0, 8
        syscall
        jr      $ra
        
is_palindrome:
        addi    $sp, $sp, -4
        sw      $ra, 0($sp)

        addiu   $a1, $a1, -1
        
        bge     $a0, $a1, is_palindrome_base_case
        lb      $t0, 0($a0)
        lb      $t1, 0($a1)

        bne     $t0, $t1, is_palindrome_not
        addiu   $a0, $a0, 1
      
        jal     is_palindrome
        
is_palindrome_base_case:
        li      $v0, 1
        j       exit_is_palindrome

is_palindrome_not:
        li      $v0, 0

exit_is_palindrome:
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        jr      $ra
        
main:
        la      $a0, arr
        li      $a1, 100
        
        jal     read_str

        la      $a0, arr

        li      $v0, 5
        syscall

        #end point of the array - which is the word
        la      $a1, arr
        add     $a1, $a1, $v0

        jal     is_palindrome
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
        
arr:    .space 100
        
