            .text
            .globl main

read_int:
        
print_int:

abs_int:

min:
        

main:       jal     read_int            # Get int x from user
            move    $a0, $v0            # and store in a0
            jal     abs_int             # v0 = |a0| = |x|
            move    $s0, $v0            # s0 = v0 = |x|       

                                        # Get int y from user 
                                        # and store in a0     
                                        # v0 = |a0| = |x|            
                                        # a1 = v0 = |x|
        
                                        # a0 = s0 = |x|
            jal     min                 # v0 = min(|a0|,|a1|) = min(|x|, |y|)
                                        # a0 = v0 = min(|x|, |y|)
            jal     print_int           # print_int(a0)

            li      $v0, 10             
            syscall
        
