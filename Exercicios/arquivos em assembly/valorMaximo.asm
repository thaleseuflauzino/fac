#Entrada :
#a2 : endereço inicial da cadeia
#a3 : numero de elemenos da cadeia
#Saida:
#a0 : valor maximo
#a1 : endereco do valor com valor maximo

.text
main:
	lw a0, 0(a2) 
	mv a1, a2
	addi a3, a3, -1 #como a3 tem a quantidade de elementos, vamos diminuir a cada iteracao
	# ^^^
	# aqui iniciamos dizendo que o primeiro valor eh o maximo, porque nao comparamos com nenhum ainda
	
loop:
	ble a3, zero, fim ## branch less or equal -> a3 <= 0 (significa que lemos todos os elementos)
	addi a2, a2, 4 # arquitetura de 32 bits, portanto, para passar pro proximo, temos que avançar 4 bytes
	lw t1, 0(a2)
	bleu t1, a0, pula_valor # comparando o novo valor da linha acima com o primeiro valor, la de a0, t1 <= a0 -> pula_valor
	#se for maior temos que atualizar o valor e o endereço maximo
	mv a0, t1 # novo valor maximo
	mv a1, a2 # novo endereço do valor maximo
	
	
pula_valor:
	addi a3, a3, -1
	j loop
fim:
	#fim do programa