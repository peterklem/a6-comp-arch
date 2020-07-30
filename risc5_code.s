
main:
    # Store all values into registers
    addi t0,zero,1 
    sd t0,-0(s2)             # A[0] = 1
    addi t0,zero,2
    sd t0,-8(s2)             # A[1] = 2
    sd zero, -16(s2)         # A[2] thru A[5] = 0
    sd zero, -24(s2)
    sd zero, -32(s2)
    sd zero, -40(s2)

    #For loop
    addi t0, zero, 1        # i(t0) = 1
    addi t1, zero, 4        # t1 = 4 (loop limit)
LOOP:
    
    bge t0, t1, Exit        # if i greater than or equal to 4 goto end
    addi t2, zero, 16         # A[i+2] address location
    addi t3, zero, 8          # A[i+1] address location
    
    add a3, s2, zero        # &A[i]
    add a4, s2, t3          # &A[i+1]
    j myFunction 

    # Function call
    addi t0, t0, 1          # increment i

Exit:


myFunction:
    # returns 2 * (num1 + num2) + 10
    # take in a3 and a4 as num1 and num2 respectively
    add a3, a3, a4 # num1 += num2
    addi t6, zero, 1 # temp = 1
    sll a3, a3, t6
    addi a0, a3, 10 
    jr ra
    