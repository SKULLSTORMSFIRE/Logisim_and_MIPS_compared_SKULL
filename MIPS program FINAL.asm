.data
enterMsg1: .asciiz "Please enter the last four digits of your student id \n"
enterMsg2: .asciiz "Press enter between each digit \n"
enterMsg3: .asciiz "Enter next digit \n"
enterMsg4: .asciiz "\nThe total of the digits is: "
enterMsg5: .asciiz "\nThe total of the digits multiplied is: "
enterMsg6: .asciiz "array output: \n"
newtab: .asciiz "\t"
array: .space 4

.text
#sets up loop var
addi $t2, $zero, 4
#sets up $t6 not equal to zero
addi $t6, $zero, 1

# output the initial instruction text to the console
addi $v0, $zero, 4
la $a0, enterMsg1
syscall

##
# output the next line instruction text to the console
addi $v0, $zero, 4
la $a0, enterMsg2
syscall

askandcollect:
	# output the text asking for the next digit to the console
	addi $v0, $zero, 4
	la $a0, enterMsg3
	syscall
	
	# read an integer from keyboard input and store the input in $s0 for the total
	addi $v0, $zero, 5
	syscall
	
	sb $v0, array($t2)
	
	#takes away 1 from $t2
	subi $t2, $t2, 1
	
bgtz $t2, askandcollect

# outputs a newline
addi $v0, $zero, 4
la $a0, enterMsg6
syscall

#sets up loop var
addi $t2, $zero, 4

####
#gets position at $t2 and outputs 
addi $t7, $t7, 2
lb $t7, array($t7)  
move $a0, $t7
addi $v0, $zero, 1
syscall
####

outputarrayadd:
	#gets position at $t2 and outputs it
	lb $t4, array($t2)  
	move $a0, $t4
	addi $v0, $zero, 1
	syscall
	
	# outputs a newline
	addi $v0, $zero, 4
	la $a0, newtab
	syscall
	
	#takes away 1 from $t2
	subi $t2, $t2, 1
	
	add $t5, $t5, $t4
	mul $t6, $t6, $t4
	
bgtz $t2, outputarrayadd

##
# output the total intro to the console
addi $v0, $zero, 4
la $a0, enterMsg4
syscall

#output the total of the nums from $t5
move $a0, $t5
addi $v0, $zero, 1
syscall

# output the total timesed intro to the console
addi $v0, $zero, 4
la $a0, enterMsg5
syscall

#output the total of the nums timesed from $t6
move $a0, $t6
addi $v0, $zero, 1
syscall


addi $v0, $zero, 10
syscall


	
