.data
input1: .asciz "\n"
input2: .asciz "\n"
result: .asciz "\n"
newline: .asciz "\n"
.text
main:
	#lendo o primeiro numero
	li a7,4
	la a0, input1
	ecall
	li a7,5
	ecall
	mv t0, a0
	
	#lendo o segundo numero
	li a7,4
	la a0, input2
	ecall
	li a7,5
	ecall
	mv t1, a0
	
	#Soma
	add t2, t0,t1
	li a7,4
	la a0, result
	ecall
	li a7, 1
	mv a0,t2
	ecall
	
	la a0, newline 
	li a7, 4
	ecall
	li a7, 10
	ecall
