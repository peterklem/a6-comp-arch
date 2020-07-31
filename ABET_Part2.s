# Computer Architecture: Assignment 6 Part 2
# Naomi Torre, Preston Watson, Sterling Pilkington

main:
	  addi sp, sp, -12	# making room for 3 items on stack
	  sw s3, 8(sp)		# storing in stack pointer offset by 8 bytes
	  sw s4, 4(sp)		# storing in stack pointer offset by 4 bytes
	  sw ra, 0(sp)		# storing in stack pointer offset by 0 bytes
						# RISC-v does not explicitly define a link register but instead suggests ra
	  add s3, zero, zero # setting i = 0 for loop (zero is zero register)
	  addi a4, zero, 4  # a4 = 4
	  addi s4, zero, 256 #this is initializing an empty array A[]
	  addi t2, zero, 1
	  sw t2, 0(s4)                   
	  addi t2, zero, 2
	  sw t2, 4(s4)
	  addi t2, zero, 0
	  sw t2, 8(s4)
	  addi t2, zero, 0
	  sw t2, 12(s4)
	  addi t2, zero, 0
	  sw t2, 16(s4)
	  addi t2, zero, 0
	  sw t2, 20(s4)
	  
Loop: 
	  bge s3, a4, Exit	
	  slli t3, s3, 2	# t3 = i * 4
	  add t4, t3, s4	# t4 = &A[i]
	  addi t5, t3, 4	# t5 = i*4+4 which is i+1
	  add t6, t5, s4	# t6 = &A[i+1]
	  lw a2, 0(t4)		
	  lw a3, 0(t6)		
	  jal myFunction	# calls myFunction (jump and link)
	  addi t0, t3, 8	# t0 = i*4+8 which is i+2
	  add t1, t0, s4	# t1 = &A[i+2]
	  sw a1, 0(t1)		
	  addi s3, s3, 1	# i++ (for loop)
	  j Loop			# jump back to loop
Exit:
	  lw ra, 0(sp)		# restore previous value in ra
	  lw s4, 4(sp)		# restore previous value in s4
	  lw s3, 8(sp)		# restore previous value in s3
	  addi sp, sp, 12	# restore stack pointer to the top
	  jr ra				# return to caller 

myFunction:
			add a1, a2, a3  # a1 = num1 + num2 (num1 maps to a2, num2 maps to a3)
			slli a1, a1, 1  # a1 = 2 * (num1 + num2)
			addi a1, a1, 10 #a1 = 2 * (num1 + num2) + 10
			jr ra			