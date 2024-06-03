.data
	n1: .asciz "Primeiro numero: "
	n2: .asciz "Segundo numero: "
	resultadoSoma: .asciz "\nResultado Soma: "
	resultadoMult: .asciz "\nResultado Multiplicacao: "
	resultadoDiv: .asciz "\nResultado Divisao: "
	resultadoSub: .asciz "\nResultado Subtracao: "
	barran: .asciz "\n"
	
.text
main:
	li a7, 4
	la a0, n1
	ecall
	
	li a7, 5 # syscall de ler int
	ecall
	mv t0, a0
	
	li a7, 4 
	la a0, n2
	ecall
	
	li a7, 5 # syscall de ler int
	ecall
	mv t1, a0
	
	add t2, t1, t0 # soma
	mul t3, t1,t0 # multiplicacao
	div t4, t1, t0 # divisao
	sub t5, t1, t0 # subtracao
	
	li a7, 4
	la a0, resultadoSoma
	ecall
	
	li a7, 1 #print
	mv a0, t2 # colocando em a0 o resultado da soma
	ecall #print
	
	li a7, 4
	la a0, resultadoSub
	ecall
	
	li a7, 1 #print
	mv a0, t5 # colocando em a0 o resultado da Subtracao
	ecall #print
	
	li a7, 4
	la a0, resultadoMult
	ecall
	
	li a7, 1 #print
	mv a0, t3 # colocando em a0 o resultado da Multiplicacao
	ecall #print
	
	li a7, 4
	la a0, resultadoDiv
	ecall
	
	li a7, 1 #print
	mv a0, t4 # colocando em a0 o resultado da Divisao
	ecall #print
	
	
	li a7, 4
	la a0, barran
	ecall