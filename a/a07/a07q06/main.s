# Author: aoro
# FIle: a07q06


        .data
x:      .space 400  # Array to store integers (100 integers * 4 bytes each)
newline: .asciiz "\n"
space:   .asciiz " "

.text
.globl main

# Function to swap two integers
swap:
    lw      $t0, 0($a0)      # Load value at address $a0 into $t0
    lw      $t1, 0($a1)      # Load value at address $a1 into $t1
    
    sw      $t0, 0($a1)      # Store $t0 at address $a1
    sw      $t1, 0($a0)      # Store $t1 at address $a0
    
    jr      $ra             # Return

# Function for a single pass of bubble sort
bubblesort_pass:
    bge     $a0, $a1, pass_exit  # If start >= end - 1, exit
    lw      $t2, 0($a0)          # Load *start into $t2
    lw      $t3, 4($a0)          # Load *(start + 1) into $t3

    ble     $t2, $t3, pass_continue  # If *start <= *(start + 1), continue

    jal     swap               # Call swap function
    j       pass_continue      # Continue with the next element

pass_continue:
    addi    $a0, $a0, 4        # Move to the next element
    j       bubblesort_pass    # Recursive call

pass_exit:
    jr      $ra                 # Return

# Function for bubble sort
bubblesort:
    bge     $a0, $a1, sort_exit  # If start >= end, exit
    jal     bubblesort_pass      # Call bubblesort_pass function
    addi    $a0, $a0, 4          # Move to the next element
    j       bubblesort           # Recursive call

sort_exit:
    jr      $ra                  # Return

# Function to print integers in the array
println_int_array:
    bge     $a0, $a1, println_exit  # If start >= end, exit
    lw      $t2, 0($a0)             # Load *start into $t2

    li      $v0, 1                  # Print integer system call
    move    $a0, $t2
    syscall

    li      $v0, 4                  # Print string system call
    la      $a0, space
    syscall

    addi    $a0, $a0, 4             # Move to the next element
    j       println_int_array       # Recursive call

println_exit:
    li      $v0, 4                  # Print string system call
    la      $a0, newline
    syscall

    jr      $ra                     # Return

# Main function
main:
    la      $a0, x                   # Load the base address of the array x
    la      $a1, x + 400             # Load the end address of the array x (100 integers * 4 bytes each)
    li      $t0, 0                   # Initialize counter n to 0

input_loop:
    li      $v0, 5                   # Read integer system call
    syscall

    beq     $v0, -9999, exit_input_loop  # If input is -9999, exit loop

    sw      $v0, 0($a0)              # Store the input value in the array x
    addi    $a0, $a0, 4              # Move to the next element in the array
    addi    $t0, $t0, 1              # Increment counter n
    j       input_loop               # Repeat the loop

exit_input_loop:
    la      $a0, x                   # Load the base address of the array x
    add     $a1, $a0, $t0            # Calculate the end address of the array x

    jal     bubblesort               # Call bubblesort function
    jal     println_int_array        # Call println_int_array function to print the sorted array

    li      $v0, 10                  # Exit system call
    syscall
