.data
	barran: .asciz "\n"
	nao: .asciz "nao"
	sim: .asciz "sim"
	erro: .asciz "Entrada invalida."
	
.text
main:
	li a7, 5
	ecall
	mv t1, a0 # valor de a registrado em t1

	li t2, 1 
	li t3, 2 
	blez t1, invalida # if a <= 0
	ble t1, t2, no # if a <= 1
	beq t1, t3, yes # if a == 2
	rem t4, t1,t3 # t4 = a%2
	beqz t4, no # if (a%2 == 0)
	li t5, 3
	j for
	j quebra_linha
	j exit
	
	
for:
	mul t6, t5,t5 # t6 = d * d
	bgt t6, t1, yes 
	rem s0, t1, t5 # s0 = n % d
	beqz s0, no # if n % d == 0
	addi t5, t5, 2 # d += 2
	j for
	
invalida:
	li a7, 4
	la a0, erro
	ecall
	j quebra_linha
	j exit
	
yes:
	li a7, 4
	la a0, sim
	ecall
	j quebra_linha
	j exit
no:
	li a7, 4
	la a0, nao
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