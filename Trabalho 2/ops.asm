.data
	na: .asciz ""
	nb: .asciz ""
	nc: .asciz ""
	ADD: .asciz "ADD: "
	SUB: .asciz "\nSUB: "
	AND: .asciz "\nAND: "
	OR: .asciz "\nOR:  "
	XOR: .asciz "\nXOR: "
	MASK: .asciz "\nMASK: "
	
	SLL: .asciz "\nSLL("
	SLLL: .asciz "): "
	
	SRL: .asciz "\nSRL("
	SRLL: .asciz "): "
	
	quebra_linha: .asciz "\n"
	
.text

	# lendo e armazenando o 1o n
	li a7, 4
	la a0, na
	ecall
	
	li a7, 5
	ecall
	
	mv t0, a0
	
	# lendo e armazenando o 2o n
	li a7, 4
	la a0, nb
	ecall
	
	li a7, 5
	ecall
	
	mv t1, a0
	
	# lendo e armazenando o 3o n
	li a7, 4
	la a0, nc
	ecall
	
	li a7, 5
	ecall
	
	mv t2, a0
	
	# operacoes
	add  t3, t0, t1 # t3 = t0 + t1
	sub t4, t0, t1 # t4 = t0 - t1
	and t5, t0, t1  # t5 = t0 AND t1
	or t6, t0, t1   # t6 = t0 OR t1
	xor a2, t0, t1  # a2 = t0 XOR t1
	li a3, 31
	and a4, t2, a3 # a4 = t2 AND 31 
	sll s2, t0, a4
	srl s3, t1, a4
	
	# lendo e dando print ADD
	li a7, 4
	la a0, ADD
	ecall
	
	li a7, 1
	mv a0, t3
	ecall
	
	# lendo e dando print SUB
	li a7, 4
	la a0, SUB
	ecall
	
	li a7, 1
	mv a0, t4
	ecall
	
	# lendo e dando print SUB
	li a7, 4
	la a0, AND
	ecall
	
	li a7, 1
	mv a0, t5
	ecall
	
	# lendo e dando print OR
	li a7, 4
	la a0, OR
	ecall
	
	li a7, 1
	mv a0, t6
	ecall
	
	# lendo e dando print XOR
	li a7, 4
	la a0, XOR
	ecall
	
	li a7, 1
	mv a0, a2
	ecall
	
	# lendo e dando print AND 31
	li a7, 4
	la a0, MASK
	ecall
	
	li a7, 1
	mv a0, a4
	ecall
	
	# lendo e dando print SLL
	li a7, 4
	la a0, SLL
	ecall
	
	# lendo e dando print SLL Num Mas
	li a7, 1
	mv a0, a4
	ecall
	
	# lendo e dando print SLLL
	li a7, 4
	la a0, SLLL
	ecall
	
	li a7, 1
	mv a0, s2
	ecall
	
	
	# lendo e dando print SRL
	li a7, 4
	la a0, SRL
	ecall
	
	# lendo e dando print SRL Num Mas
	li a7, 1
	mv a0, a4
	ecall
	
	# lendo e dando print SRLL
	li a7, 4
	la a0, SRLL
	ecall
	
	li a7, 1
	mv a0, s3
	ecall
	
	# dando o \n final
	li a7, 4
	la a0, quebra_linha
	ecall