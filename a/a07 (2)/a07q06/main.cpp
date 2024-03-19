;;         .text
;;         .globl main

;; swap:
;;         lw      $t0, 0($a0)
;;         lw      $t1, 0($a1)
        
;;         sw      $t0, 0($a1)
;;         sw      $t1, 0($a0)
;;         jr      $ra

;; bubblesort_pass:
;;         addi    $sp, $sp, -12
;;         sw      $ra, 0($sp)
;;         sw      $a0, 4($sp)
;;         sw      $a1, 8($sp)
        
;; bubblesort_pass_LOOP:
;;         bge     $a0, $a1, bubblesort_pass_LOOP_exit
;;         lw      $t2, 0($a0)
;;         lw      $t3, 4($a0)

;;         ble     $t2, $t3, jump_swap
        
;;         addi    $a1, $a0, 4
;;         jal     swap
;;         lw      $a1, 8($sp)
;;         j       bubblesort_pass_LOOP
        
;; jump_swap:
;;         addi    $a0, $a0, 4
;;         j       bubblesort_pass_LOOP
        
;; bubblesort_pass_LOOP_exit:      
;;         lw      $ra, 0($sp)
;;         addi    $sp, $sp, 12

;;         jr      $ra

;; bubblesort:
;;         addi    $sp, $sp, -4
;;         sw      $ra, 0($sp)
        
;;         bge     $a0, $a1, bubblesort_exit
;;         jal     bubblesort_pass

;;         addi    $a1, $a1, -4
;;         jal     bubblesort
        
;; bubblesort_exit:
;;         lw      $ra, 0($sp)
;;         addi    $sp, $sp, 4

;;         jr      $ra
        
;; println_int_array:
;;         addi    $sp, $sp, -8
;;         sw      $ra, 0($sp)
;;         sw      $a0, 4($sp)

;;         bge     $a0, $a1, exit_println_int_array
;;         lw      $t2, 0($a0)
;;         move    $a0, $t2
;;         li      $v0, 1
;;         syscall
;;         la      $a0, SPACE
;;         li      $v0, 4
;;         syscall
;;         lw      $a0, 4($sp)
;;         addi    $a0, $a0, 4
;;         jal     println_int_array

;; exit_println_int_array:
;;         lw      $ra, 0($sp)
;;         addi    $sp, $sp, 8
;;         la      $a0, NEWLINE
;;         li      $v0, 4
;;         syscall
;;         jr      $ra
        
;; main:
;;         li      $t0, 0
;;         li      $t1, -9999
;;         la      $a0, x
;;         add     $t0, $t0, $a0
        
;; LOOP:
;;         li      $v0, 5
;;         syscall

;;         beq     $v0, $t1, exit_LOOP
;;         sw      $v0, 0($t0)
;;         addiu   $t0, $t0, 4
;;         j       LOOP

;; exit_LOOP:
;;         la      $a0, x
;;         move    $a1, $t0
;;         jal     println_int_array

;;         la      $a0, x
;;         move    $a1, $t0
;;         jal     bubblesort

;;         la      $a0, x
;;         move    $a1, $t0
;;         jal     println_int_array

;;         li      $v0, 10
;;         syscall
        

;;         .data
;; x:
;;         .space 100
        
;; NEWLINE:
;;         .asciiz "\n"

;; SPACE:
        ;;         .asciiz " "
