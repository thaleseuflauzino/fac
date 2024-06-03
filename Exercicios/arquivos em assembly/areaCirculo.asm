.data
	barran: .asciz "\n"
	pi: .asciz "\nO numero de pi: "
	raio: .asciz "\nQual raio do circulo? "
	resultado: .asciz "\nResultado: "
.text
main:
	#leitura pi
	li a7, 4
	la a0, pi
	ecall
	
	li a7, 7
	ecall
	fmv.d fa0, ft0
	
	# leitura raio
	li a7, 4
	la a0, raio
	ecall
	
	li a7, 7
	ecall
	fmv.d fa0, ft1
	
	#operacoes
	# raio * raio
	fmul.d ft2, ft1, ft1
	# pi
	fmul.d ft3, ft2,ft0
	
	
	#print
	li a7, 4
	la a0, resultado
	ecall
	
	fmv.d ft3, fa0
	li a7, 3
	ecall
	
	#print
	li a7, 4
	la a0, barran
	ecall
	
