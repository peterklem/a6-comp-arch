
main:
    # Store all values into registers




    addi t0,zero,1 
    sw t0,0(s2)             # A[0] = 1
    addi t0,zero,2
    sw t0,4(s2)             # A[1] = 2
    sw zero, 8(s2)         # A[2] thru A[5] = 0
    sw zero, 12(s2)
    sw zero, 16(s2)
    sw zero, 20(s2)



    #For loop
    addi t0, zero, 0       # i = 0 to begin
    addi t1, zero, 4        # t1 = 4 (loop limit)
LOOP:

    bge t0, t1, Exit        # if i greater than or equal to 4 goto end
    slli t4, t0, 2          # t4 = 4*i (marker for array spacing)
    add t5, t4, s2          # t5 = &A[i]
    addi t4, zero, 4        # t4 = 4i + 1
    add t6, t4, s2          # t6 = &A[i+1]
    lw a4, 0(t5)            # Load &A[i] into function
    lw a3, 0(t6)            # Load &A[i+1] into function

    # Take care of stack
    addi sp, sp, -12        
    sw t0, 8(sp)            # Store i
    sw s2, 4(sp)            # Store array
    sw ra, 0(sp)            # Store pointer back

    jal myFunction          # Call function

    # Restore stack
    lw ra, 0(sp)
    lw s2, 4(sp)
    lw t0, 8(sp)


    addi t4, t0, 8          # t4 = i + 2     
    add t2, t4, s2          # t2 = &A[i+2]
    sw a0, 0(t2)            # Store function return val in A[i+2]
    # Function call
    addi t0, t0, 1          # increment i
    j LOOP

Exit:
    jr ra

myFunction:
    # returns 2 * (num1 + num2) + 10
    # take in a3 and a4 as num1 and num2 respectively
    add a3, a3, a4 # num1 += num2
    slli a3, a3, 1
    addi a0, a3, 10 
    jr ra
    