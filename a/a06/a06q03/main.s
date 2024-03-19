#Author:  aoro
#File:    a06q03
##############################################################################
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
# STRLEN Function
###############################################################################
strlen:
	li	$v0, 0
	li      $t1, 0
        
strlen_LOOP:
        beq     $t1, $a1, strlen_exit
	lb	$t0, 0($a0)
	beq	$t0, $0, strlen_exit
	addiu	$v0, $v0, 1
	addiu	$a0, $a0, 1
        addiu   $t1, $t1, 1
	j strlen_LOOP

strlen_exit:	
	jr $ra
###############################################################################

        
###############################################################################
# Function for printing characters
############################################################################### 
print_char:
	li $v0, 11
	syscall
	jr $ra
###############################################################################


###############################################################################
# Function for printing strings
############################################################################### 
print_str:
	li	$v0, 4
	syscall
	jr $ra
###############################################################################


###############################################################################
# Function for reading string
############################################################################### 
## $a0 = address of the string
## $a1 = maximum size of the string
read_str:
	li	$v0, 8
	syscall
	li	$t1, 10
		
read_str_LOOP:
	lb	$t0, 0($a0)
	beq	$t0, $t1, read_str_exit
	addiu	$a0, $a0, 1
	j	read_str_LOOP
		
read_str_exit:
	sb	$0, 0($a0)
	
	jr $ra
###############################################################################

        
###############################################################################
# Function for printing integers
############################################################################### 
print_int:
	li	$v0, 1
	syscall
	jr $ra
###############################################################################


        
###############################################################################
# Function for test_strlen
###############################################################################
test_strlen:
        addi    $sp, $sp, -4
        sw      $ra, 0($sp)
        # FIRST TEST CASE #
	la	$a0, arr1
	la	$a1, 100
	jal strlen

        move    $t0, $v0

        la      $a0, empty_str
        jal     print_str
        
        la      $a0, SPACE
        jal     print_str
	
	move	$a0, $a1
	jal     print_int

        la      $a0, SPACE
        jal     print_str

        move    $a0, $t0
        jal     print_int

        la      $a0, SPACE
        jal     print_str

        jal     passfail
        
	la	$a0, NEWLINE
	jal print_str

	# SECOND TEST CASE #
	la	$a0, arr2
	la	$a1, 100
	jal strlen

        move    $t0, $v0

        la      $a0, hello_str
        jal     print_str
        
        la      $a0, SPACE
        jal     print_str
	
	move	$a0, $a1
	jal     print_int

        la      $a0, SPACE
        jal     print_str

        move    $a0, $t0
        jal     print_int

        la      $a0, SPACE
        jal     print_str

        jal     passfail
        
	la	$a0, NEWLINE
	jal     print_str

        # THIRD TEST CASE #
	la	$a0, arr2
	la	$a1, 5
	jal     strlen

        move    $t0, $v0

        la      $a0, hello_str
        jal     print_str
        
        la      $a0, SPACE
        jal     print_str
	
	move	$a0, $a1
	jal     print_int

        la      $a0, SPACE
        jal     print_str

        move    $a0, $t0
        jal     print_int

        la      $a0, SPACE
        jal     print_str

        jal     passfail
        
	la	$a0, NEWLINE
	jal     print_str

        lw      $ra, 0($sp)
        addiu   $sp, $sp, 4
        jr      $ra
###############################################################################

        
###############################################################################
# MAIN FUNCTION
############################################################################### 
main:
        jal     test_strlen
        
	li	$v0, 10
	syscall
		
	.data
arr1:
        .asciiz ""

arr2:
        .asciiz "hello world"
        
empty_str: 
        .asciiz "\"\""

hello_str:
        .asciiz "\"hello world\""

NEWLINE:
	.asciiz "\n"

SPACE:
        .asciiz " "
        
FAIL:
        .asciiz "FAIL"
        
PASS:
        .asciiz "pass"
