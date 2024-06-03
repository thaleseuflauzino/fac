.data
	fim: .asciz "\nFim do programa!\n"
	read: .asciz "Valor do Y: "
	barran: .asciz "\n"

	# i = 0;
	# do {
	#	y += 2;
	#	i++
	# } while( i < 10 )
.text
main:
	li a7, 4
	la a0, read
	ecall
	li a7, 5
	ecall
	mv a2, a0

	li a1, 0
while:
	li t1, 10
	addi a2, a2, 2
	addi a1, a1, 1
	bge a1, t1, continuar
	li a7, 1
	mv a0, a2
	ecall
	li a7, 4
	la a0, barran
	ecall
	j while
	
continuar:
	li a7, 4
	la a0, fim
	ecall
