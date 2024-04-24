.data
	hello: .asciz "Ola Mundo\n" #cria um espaço pra mensagem
.text # cod
main:
	la a0, hello #registrnado mensagem no a0
	li a7,4 # printando ola mundo
	ecall # chamando a funcao de print
	li a7,10 #return0
	ecall
	li a0, 0        # Indica codigo de saida bem sucedido
        li a7, 93        # a7, 93 = encerrar programa (EXIT)
        ecall             # executa tudo
