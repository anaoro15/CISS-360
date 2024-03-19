        .text
        .globl main

print_int:
        li      $v0, 1
        syscall
        jr      $ra

read_int:
        li      $v0, 5
        syscall
        jr      $ra

        
read_string:
        li      $v0, 8
        syscall
        li      $t0, 10
   
read_string_LOOP:
        lb      $v0, 0($a0)
        beq     $v0, $t1, exit_read_string
        addiu   $a0, $a0, 4
        j       read_string_LOOP
        
exit_read_string:
        sb      $0, 0($a0)
        jr      $ra


print_string:
        li      $v0,4
        syscall
        jr      $ra
        
main:
        li      $a0, -5
        jal     print_int

        la      $a0, NEWLINE
        jal     print_string

        li      $a0, 42
        jal     print_int

        la      $a0, NEWLINE
        jal     print_string

        jal     read_int
        move    $a0, $v0

        jal     print_int

        la      $a0, NEWLINE
        jal     print_string

        la      $a0, helloworld
        jal     print_string

        la      $a0, spamandeggs
        jal     print_string


        la      $a0, arr
        li      $a1, 100

        jal     read_string
        
        la      $a0, arr

        jal     print_string
        

        li      $v0, 10
        syscall
        

        .data

NEWLINE:
        .asciiz "\n"
        
helloworld:
        .asciiz "hello world\n"

spamandeggs:
        .asciiz "spam and eggs\n"
        
arr:
        .space 100
        
