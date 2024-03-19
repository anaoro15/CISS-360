#==============================================================================
# Get x, y and print max(x, y)
#==============================================================================
	.text
	.globl main
	
main:   jal    read_int       # Get int x from user
        move   $s0, $v0       # and store in s0

        jal    read_int       # Get int y from user 
                              # and store in v0

        move   $a0, $s0       # a0 = s0
        move   $a1, $v0       # a1 = v0
        jal    max            # v0 = max(a0, a1)

        move   $a0, $v0       # a0 = v0
        jal    print_int      # print_int(a0)

        li     $v0, 10
        syscall
