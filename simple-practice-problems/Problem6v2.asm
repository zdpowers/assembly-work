# PRACTICE PROGRAM 6
# While (s2[i] = s1[i] != '/0') i++
.data
	s1: .asciiz "hi"
	    .align 2
	s2: .space 5
	dialog: .asciiz "Input: "
.text
.globl main
main:
	# prompts for input to save into s2
	li $v0, 54
	la $a0, dialog
	la $a1, s2
	li $a2, 5
	syscall
	
	li $t0, 0		# i
	la $s1, s1		# load s1 into s1
	la $s2, s2		# load s2 into s2
	loop:
		lb $t1, ($s1)			# load byte at address s1 into t1
		lb $t2, ($s2)			# load byte at address s2 into t2
		beq $t1, $t2, checknull	# if s2[i] = s1[i], check if they equal '/0'
		j exit				# if they are not equal, then exit
		
	checknull:
		beq $t1, 0, equalsnull		# if s2[i] = s1[i] = null, branch without i++
		addi $t0, $t0, 1		# else i++
		
		addi $s1, $s1, 1		# Go to next element of s1
		addi $s2, $s2, 1		# Go to next element of s2
		j loop
		
	equalsnull:
		j exit				# if both s2[i] and s1[i] are null, exit
	
	
exit:
	li $v0, 10
	syscall