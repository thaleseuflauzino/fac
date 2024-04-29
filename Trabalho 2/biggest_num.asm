.data 
	qtd: .asciz ""         # string vazia para a quantidade
	numeros: .asciz ""     # string vazia para os numeros 
	pula_linha: .asciz "\n" # string de quebra linha
.text
main:

	li a7, 4               # carrega o código do sistema para imprimir uma string
	la a0, qtd             # manda o endereço da string 'qtd' para a0
	ecall                  # chamada para printar

	li a7, 5               # carrega o código do sistema para ler um inteiro
	ecall                  # chamada para printar
	
	mv t0, a0              # move o valor lido (quantidade) para t0 (registro de uso geral)

	li t2, 0               # carrega o valor 0 no registrador t2 (contador)

	li t1, -2147483648     # carrega o menor inteiro possível em t1 (usado para comparar)

loop:
    # Exibir o prompt para o número atual
    li a7, 4               # carrega o código do sistema para imprimir uma string
    la a0, numeros         # carrega o endereço da string 'numeros' para a0
    ecall                  # chamada para printar

    # Ler o número
    li a7, 5               # carrega o código do sistema para ler um inteiro
    ecall                  # chamada para printar

    # comparar o número atual com o maior (t1 é usado para armazenar o maior número)
    bgt a0, t1, attmaior   # if a0 (número lido) for maior que t1, vá para attmaior
    j incrementa           # else, -> incrementa

attmaior:
    mv t1, a0              # atualiza o maior número (armazena o número lido em t1)

incrementa:
    addi t2, t2, 1         # incrementa o contador

    # verifica se o contador atingiu a quantidade desejada
    bge t2, t0, imprime    # if t2 (contador) for maior ou igual a t0 (quantidade), vá para imprime
    j loop                 # else, volte para loop

imprime:
	li a7, 1               # carrega o código do sistema para imprimir um inteiro
	mv a0, t1              # move o maior número (t1) para a0 (registrador de argumento para syscall)
	ecall                   # chamada para printar

	li a7, 4               # carrega o código do sistema para imprimir uma string
	la a0, pula_linha      # carrega o endereço da string 'pula_linha' para a0
	ecall                  # chamada para printar
