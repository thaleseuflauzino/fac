.data
	barran: .asciz "\n"
	inputX: .asciz "Insira o valor de x: "
	inputY: .asciz "\nInsira o valor de y: "
	r: .asciz "o valor de X eh: "
	r1: .asciz "\ne o valor de Y eh: "

.text
	li a7, 4
	la a0, inputX
	ecall
	
	li a7, 5
	ecall
	mv t1, a0 # X armazenado em t1

	li a7, 4
	la a0, inputY
	ecall
	
	li a7, 5
	ecall
	mv t2, a0 # Y armazenado em t2
	
	la a0, t1 # endereço de X no a0
	la a1, t2 # endereço de Y no a1
	jal troca
	
	# Exibir o resultado
	li a7, 4
	la a0, r
	ecall
	
	mv a0, t1
	li a7, 1
	ecall
	
	li a7, 4
	la a0, r1
	ecall
	
	mv a0, t2
	li a7, 1
	ecall
	
	# Encerrar o programa
	li a7, 10
	ecall
troca:
	lw t3, 0(a0) # carrega o valor de x
	lw t4, 0(a1) # carrega o valor de y
	sw t3, 0(a1) # armazena o valor de x onde era y
	sw t4, 0(a0) # armazena o valor de y onde era x
	ret
	
