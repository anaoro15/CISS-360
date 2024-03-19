        .text
        .globl main

###############################################################################
# Pass and Fail Test
###############################################################################
passfail:
        beq     $a0, 0, fail_case       # if the input is 0, then FAIL
        la      $a0, PASS       # Else, pass the test
        li      $v0, 4
        syscall
        li      $v0, 1
        j       exit_passfail

fail_case:
        la      $a0, FAIL
        li      $v0, 4
        syscall
        li      $v0, 0

exit_passfail:
        jr      $ra
###############################################################################

        
###############################################################################
strncmp:
    # Arguments:
    # $a0 - str1
    # $a1 - str2
    # $a2 - num

    # Return values:
    # $v0 - result (-1, 0, or 1)

    move $t0, $a2        # Initialize counter with num
    move $t1, $a0        # Address of str1
    move $t2, $a1        # Address of str2

compare_loop:
        beqz $t0, compare_equal  # If counter is zero, exit the loop
        
        lb $t3, 0($t1)        # Load character from str1
        lb $t4, 0($t2)        # Load character from str2

        beqz $t3, compare_extra  # If null character is reached in str1, exit the loop
        beqz $t4, compare_extra  # If null character is reached in str2, exit the loop

        bne $t3, $t4, difference_found  # If characters are different, exit the loop

        addi $t1, $t1, 1      # Move to the next character in str1
        addi $t2, $t2, 1      # Move to the next character in str2
        addi $t0, $t0, -1     # Decrement the counter
        j       compare_loop

compare_equal:
        li      $v0, 0
        j       end_compare

compare_extra:
        sgt     $v0, $t3, $t4
        blt     $t3, $t4, less_than

        j       end_compare
        
difference_found:
    sgt $v0, $t3, $t4     # Set $v0 to 1 if $t3 is greater than $t4
    blt $t3, $t4, less_than     # Set $t3 to 1 if $t4 is less than $t3

    j end_compare

less_than:
        li      $v0, -1

end_compare:
        
    jr $ra

###############################################################################


###############################################################################
#        
###############################################################################
test_strncmp:
        addi    $sp, $sp, -4
        sw      $ra, 0($sp)
        
        # Test 1
        li      $v0, 4
        la      $a0, test1_input_string
        syscall

        la      $a0, test1_str1
        la      $a1, test1_str2
        lw      $a2, test_num
        jal     strncmp
        move    $a0, $v0
        li      $v0, 1
        syscall

        la      $a0, test_middle
        li      $v0, 4
        syscall
        
        jal     passfail

        lw      $ra, 0($sp)
        
        la      $a0, NEWLINE
        li      $v0, 4
        syscall

    # Test 2
        li      $v0, 4
        la      $a0, test2_input_string
        syscall

        la      $a0, test2_str1
        la      $a1, test2_str2
        lw      $a2, test_num
        jal     strncmp
        move    $a0, $v0
        li      $v0, 1
        syscall

        la      $a0, test_middle
        li      $v0, 4
        syscall
        
        jal     passfail

        lw      $ra, 0($sp)
        
        la      $a0, NEWLINE
        li      $v0, 4
        syscall
        
        # Test 3
        li      $v0, 4
        la      $a0, test3_input_string
        syscall
        
        la      $a0, test3_str1
        la      $a1, test3_str2
        lw      $a2, test_num
        jal     strncmp
        move    $a0, $v0
        li      $v0, 1
        syscall

        la      $a0, test_middle
        li      $v0, 4
        syscall
        
        jal     passfail

        lw      $ra, 0($sp)
        
        la      $a0, NEWLINE
        li      $v0, 4
        syscall
        
        
        # Test 4
        li      $v0, 4
        la      $a0, test4_input_string
        syscall

        la      $a0, test4_str1
        la      $a1, test4_str2
        lw      $a2, test_num
        jal     strncmp
        move    $a0, $v0
        li      $v0, 1
        syscall

        la      $a0, test_middle
        li      $v0, 4
        syscall
        
        jal     passfail

        lw      $ra, 0($sp)
        
        la      $a0, NEWLINE
        li      $v0, 4
        syscall
        
        
        # Test 5
        li      $v0, 4
        la      $a0, test5_input_string
        syscall
        
        la      $a0, test5_str1
        la      $a1, test5_str2
        lw      $a2, test_num
        jal     strncmp
        move    $a0, $v0
        li      $v0, 1
        syscall

        la      $a0, test_middle
        li      $v0, 4
        syscall
        
        jal     passfail

        lw      $ra, 0($sp)
        
        la      $a0, NEWLINE
        li      $v0, 4
        syscall
        

        # Test 6
        li      $v0, 4
        la      $a0, test6_input_string
        syscall

        la      $a0, test6_str1
        la      $a1, test6_str2
        lw      $a2, test_num
        jal     strncmp
        move    $a0, $v0
        li      $v0, 1
        syscall

        la      $a0, test_middle
        li      $v0, 4
        syscall

        jal     passfail

        lw      $ra, 0($sp)
        
        la      $a0, NEWLINE
        li      $v0, 4
        syscall
        
        
        # Test 7
        li      $v0, 4
        la      $a0, test7_input_string
        syscall
        
        la      $a0, test7_str1
        la      $a1, test7_str2
        lw      $a2, test_num
        jal     strncmp
        move    $a0, $v0
        li      $v0, 1
        syscall
        
        la      $a0, test_middle
        li      $v0, 4
        syscall
        
        jal     passfail

        lw      $ra, 0($sp)
        
        la      $a0, NEWLINE
        li      $v0, 4
        syscall
                
        # Test 8        
        li      $v0, 4
        la      $a0, test8_input_string
        syscall

        la      $a0, test8_str1
        la      $a1, test8_str2
        lw      $a2, test8_num
        jal     strncmp
        move    $a0, $v0
        li      $v0, 1
        syscall

        la      $a0, test_middle
        li      $v0, 4
        syscall
        
        jal     passfail

        lw      $ra, 0($sp)
        
        la      $a0, NEWLINE
        li      $v0, 4
        syscall
        
        
        # Test 9
        li      $v0, 4
        la      $a0, test9_input_string
        syscall
        
        la      $a0, test9_str1
        la      $a1, test9_str2
        lw      $a2, test9_num
        jal     strncmp
        move    $a0, $v0
        li      $v0, 1
        syscall

        la      $a0, test_middle
        li      $v0, 4
        syscall

        jal     passfail
        
end_test:
        la      $a0, NEWLINE
        li      $v0, 4
        syscall
        
        lw      $ra, 0($sp)
        addi    $sp, $sp, 4
        
        jr      $ra
        
main:
        jal     test_strncmp

        li      $v0, 10
        syscall

        
	.data
NEWLINE:
	.asciiz "\n"

SPACE:
        .asciiz " "
        
FAIL:
        .asciiz "FAIL"
        
PASS:
        .asciiz "pass"
INPUTS:
        .asciiz "input(s)"
test_num:
        .word 100
test1_str1: .asciiz ""
test1_str2: .asciiz ""
test2_str1: .asciiz "hello world"
test2_str2: .asciiz "hello world"
test3_str1: .asciiz "hello"
test3_str2: .asciiz "hellp"
test4_str1: .asciiz "hello"
test4_str2: .asciiz "hellq"
test5_str1: .asciiz "hellm"
test5_str2: .asciiz "hello"
test6_str1: .asciiz "hello"
test6_str2: .asciiz "hell"
test7_str1: .asciiz "hell"
test7_str2: .asciiz "hello"
test8_str1: .asciiz "hello"
test8_str2: .asciiz "hell"
test8_num:  .word 2
test9_str1: .asciiz "hello"
test9_str2: .asciiz "hell"
test9_num:  .word 0
test1_input_string:
        .asciiz "Test 1: input(s): \"\", \"\", 100 ... output(s): "
test2_input_string:
        .asciiz "Test 2: input(s): \"hello world\", \"hello world\", 100 ... output(s): "
test3_input_string:
        .asciiz "Test 3: input(s): \"hello\", \"hellp\", 100 ... output(s): "
test4_input_string:
        .asciiz "Test 4: input(s): \"hello\", \"hellq\", 100 ... output(s): "
test5_input_string:
        .asciiz "Test 5: input(s): \"hellm\", \"hello\", 100 ... output(s): "
test6_input_string:
        .asciiz "Test 6: input(s): \"hello\", \"hell\", 100 ... output(s): "
test7_input_string:
        .asciiz "Test 7: input(s): \"hell\", \"hello\", 100 ... output(s): "
test8_input_string:
        .asciiz "Test 8: input(s): \"hello\", \"hell\", 2 ... output(s): "
test9_input_string:
        .asciiz "Test 9: input(s): \"hello\", \"hell\", 0 ... output(s): "
test_middle:
        .asciiz " ... "
