.data
	barran: .asciz "\n"
	erro: .asciz "Entrada invalida."
	
.text
main:
	li a7, 5
	ecall
	mv t1, a0 # a em t1
	
	li a7, 5
	ecall
	mv t2, a0 # b em t2
	
	li t5, 1 
	ble t1, t5, invalida #if a <= 1
	ble t2, t5, invalida #if a <= 1
	mul t4, t1, t2 # t4 = t1*t2
	j whileMDC	
	
whileMDC:
	beqz t2, cont
	rem t3, t1, t2 # t3 = a%b
	mv t1, t2 # a = b
	mv t2, t3 # b = a % b
	j whileMDC
		
invalida:
	li a7, 4
	la a0, erro
	ecall
	j quebra_linha
	j exit
	
cont:
	div t4, t4, t1	
	li a7, 1
	mv a0, t1
	ecall
	
	li a7, 4
	la a0, barran
	ecall
	
	li a7, 1
	mv a0, t4
	ecall
	
	j quebra_linha
	j exit
exit:
	li a7, 10
	ecall
	
quebra_linha:
	li a7, 4
	la a0, barran
	ecall
	