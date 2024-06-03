.data
	msgX: .asciz "\nDigite o valor de x: "
	msgY: .asciz "\nDigite o valor de y:  "
	resultado_else: .asciz "\nEntrou no else!!\n"
	resultado_if: .asciz "\nNão entrou no else!!\n"
	endMsg: .asciz "\nFim da execucao\n"
	
.text
main:
	li a7, 4
	la a0, msgX
	ecall # printa a mensagem msgX
	
	li a7, 5
	ecall
	mv t1, a0 # le e salva o valor de x
	
	li a7, 4
	la a0, msgY
	ecall # printa a mensagem msgY
	
	li a7, 5
	ecall
	mv t2, a0 # le e salva o valor de Y
	
	addi t3, zero, 10 # temporario T3 para usar no if-else
	# tambem pode ser utilizado 
	li t3, 10
	# sao equivalentes ^^^^
	blt t1, t3, else
	addi t2, t2, 1
	
	li a7, 4
	la a0, resultado_if
	ecall # printa a mensagem resultado_if
	
	jal end
	
else:
	mv t2, t1
	li a7, 4
	la a0, resultado_else
	ecall # printa a mensagem resultado_else
	
	
	li a7, 1 
	mv a0, t1
	ecall # print no valor final de X

	
	## X = T1
	## Y = T2
	
end: 
	li a7, 4
	la a0, endMsg
	ecall # printa a mensagem end
	
	li a7, 1 
	mv a0, t2
	ecall # print no valor final de Y
	
	li a7, 10
	ecall