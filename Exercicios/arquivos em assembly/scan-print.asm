.data
	barran: .asciz "\n"
	leituraStr: .asciz ""

.text
main:
	 li a7, 8 # carrega sistema para ler string
	 la a0, leituraStr # carrega o endereço da LEITURASTR em a0
	 li a1, 50 # tamanho maximo string
	 ecall #print
	 
	 li a7, 4 # valor imediato 4, syscall de printStr
	 ecall #print
	 
	 #quebra linha
	 la a0, barran # carregando o endereco do objeto a ser printado
	 li a7, 4 # valor imediato 4, syscall de printStr
	 ecall #print
	 
	 li a7, 10 # valor imediato 10, syscall de saida
	 ecall #print

