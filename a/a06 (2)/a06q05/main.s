.text
.globl main

strncpy:
    addi    $sp, $sp, -4
    sw      $a0, 0($sp)
    li      $t0, 0            # Counter for copied characters
    move    $t1, $a1           # Source pointer
    move    $t2, $a2           # Maximum number of characters to copy

main_LOOP:
    beq     $t0, $t2, end_copy  # Check if num characters have been copied
    lb      $t3, 0($t1)          # Load a character from source
    beqz    $t3, zero_fill       # Check if the character is null

    sb      $t3, 0($a0)          # Copy the character to destination
    addiu   $t0, $t0, 1          # Increment the counter
    addiu   $a0, $a0, 1          # Move to the next destination position
    addiu   $t1, $t1, 1          # Move to the next source position
    j       main_LOOP            # Repeat the loop

zero_fill:
    beq     $t0, $t2, end_copy  # Check if num characters have been copied
    sb      $zero, 0($a0)        # Fill with zero if end of source is reached
    addiu   $t0, $t0, 1          # Increment the counter
    addiu   $a0, $a0, 1          # Move to the next destination position
    j       zero_fill            # Repeat the zero-fill loop

end_copy:
    lw      $v0, 0($sp)
    addi    $sp, $sp, 4
    jr      $ra

main:
    # test case 1
    la      $a0, s
    la      $a1, s
    li      $a2, 100
    jal     strncpy

    move    $a0, $v0
    li      $v0, 4
    syscall

    la      $a0, NEWLINE
    li      $v0, 4
    syscall

    # test case 2
    la      $a0, s
    la      $a1, t
    li      $a2, 100
    jal     strncpy

    move    $a0, $v0
    li      $v0, 4
    syscall

    la      $a0, NEWLINE
    li      $v0, 4
    syscall

    # test case 3
    la      $a0, s
    la      $a1, u
    li      $a2, 100
    jal     strncpy

    move    $a0, $v0
    li      $v0, 4
    syscall

    la      $a0, NEWLINE
    li      $v0, 4
    syscall

    li      $v0, 10
    syscall

.data
NEWLINE:
    .asciiz "\n"

s:
    .space 100

t:
    .asciiz "hello world"

u:
    .asciiz "spam and eggs"
