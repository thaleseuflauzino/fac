.data 
	input: .asciz "Digite o valor de y: "
	barran: .asciz "\n"
	fim: .asciz "\n Fim da execucao\n"
	
	# i = 0
	# while (i < 20){
	#	y += 3;
	#	i++;
	# }
	
.text
	li a7, 4
	la a0, input
	ecall
	li a7, 5
	ecall
	mv a2, a0
	
	li t1, 0
while:
	li a1, 20
	bge t1, a1, jump
	addi a2, a2, 3
	addi t1, t1, 1
	
	li a7, 1
	mv a0, a2
	ecall
	j while
	
jump:
	li a7, 4
	la a0, fim
	ecall