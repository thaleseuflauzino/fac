.data 
	qtd: .asciz ""         # string vazia para a quantidade
	numeros: .asciz ""     # string vazia para os numeros 
	pula_linha: .asciz "\n" # string de quebra linha
.text
main:

	li a7, 4               # carrega o codigo do sistema para imprimir uma string
	la a0, qtd             # manda o endereco da string 'qtd' para a0
	ecall                  # chamada para printar

	li a7, 5               # carrega o codigo do sistema para ler um inteiro
	ecall                  # chamada para printar
	
	mv t0, a0              # move o valor lido (quantidade) para t0 (registro de uso geral)

	li t2, 0               # carrega o valor 0 no registrador t2 (contador)

	li t1, -2147483648     # carrega o menor inteiro poss�vel em t1 (usado para comparar)

loop:
    # Exibir o prompt para o numero atual
    li a7, 4               # carrega o codigo do sistema para imprimir uma string
    la a0, numeros         # carrega o endereco da string 'numeros' para a0
    ecall                  # chamada para printar

    # Ler o n�mero
    li a7, 5               # carrega o c�digo do sistema para ler um inteiro
    ecall                  # chamada para printar

    # comparar o n�mero atual com o maior (t1 e usado para armazenar o maior n�mero)
    bgt a0, t1, attmaior   # if a0 (numero lido) for maior que t1, vai para attmaior
    j incrementa           # else, -> incrementa

attmaior:
    mv t1, a0              # atualiza o maior numero (armazena o numero lido em t1)

incrementa:
    addi t2, t2, 1         # incrementa o contador

    # verifica se o contador atingiu a quantidade desejada
    bge t2, t0, imprime    # if t2 (contador) for maior ou igual a t0 (quantidade), vai para imprime
    j loop                 # else, volte para loop

imprime:
	li a7, 1               # carrega o codigo do sistema para imprimir um inteiro
	mv a0, t1              # move o maior numero (t1) para a0 (registrador de argumento para syscall)
	ecall                   # chamada para printar

	li a7, 4               # carrega o codigo do sistema para imprimir uma string
	la a0, pula_linha      # carrega o endereco da string 'pula_linha' para a0
	ecall                  # chamada para printar
