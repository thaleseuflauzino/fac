.data
    gabarito: .space 100         # Espaço alocado para o gabarito (respostas corretas)
    respostas: .space 100        # Espaço alocado para as respostas (respostas do aluno)
    quebra_linha: .asciz "\n"    # String para imprimir uma nova linha

.text

    li a7, 5        # Carrega o valor imediato 5 em a7 (número do syscall para ler um inteiro)
    ecall           # Faz a chamada de sistema (lê um inteiro da entrada do usuário)
    mv t0, a0       # Move o resultado de a0 para t0 (armazena o número de questões)

    # Adicionando 2 ao t0
    addi t0, t0, 2  # Adiciona 2 ao valor em t0

    # Lendo o Gabarito
    li a7, 8        # Carrega o valor imediato 8 em a7 (número do syscall para ler uma string)
    la a0, gabarito # Carrega o endereço de gabarito em a0
    mv a1, t0       # Usa o valor em t0 como o tamanho máximo do gabarito
    ecall           # Faz a chamada de sistema (lê a string do gabarito)
    mv t1, a0       # Move o endereço do gabarito de a0 para t1

    # Lendo as Respostas
    li a7, 8        # Carrega o valor imediato 8 em a7 (número do syscall para ler uma string)
    la a0, respostas # Carrega o endereço de respostas em a0
    mv a1, t0       # Usa o valor em t0 como o tamanho máximo das respostas
    ecall           # Faz a chamada de sistema (lê a string das respostas)
    mv t2, a0       # Move o endereço das respostas de a0 para t2

    # Inicializando os contadores
    li t3, 0        # Inicializa o contador i em t3 com 0
    li t4, 0        # Inicializa o contador de acertos em t4 com 0

    # Ajusta t0 para o número original de questões
    addi t0, t0, -2

loop:
    beq t0, t3, print  # Se t3 (contador) for igual a t0 (número de questões), vai para print

    lb t5, (t1)       # Carrega um byte do gabarito para t5
    lb t6, (t2)       # Carrega um byte das respostas para t6

    # Verifica se a resposta é igual ao gabarito
    beq t5, t6, incrementa # Se t5 (gabarito) for igual a t6 (resposta), vai para incrementa

    # Se não forem iguais, continua o loop
    addi t3, t3, 1    # Incrementa o contador i
    addi t1, t1, 1    # Incrementa o endereço do gabarito
    addi t2, t2, 1    # Incrementa o endereço das respostas
    j loop            # Volta para o início do loop

incrementa:
    addi t4, t4, 1    # Incrementa o contador de acertos
    addi t3, t3, 1    # Incrementa o contador i
    addi t1, t1, 1    # Incrementa o endereço do gabarito
    addi t2, t2, 1    # Incrementa o endereço das respostas
    j loop            # Volta para o início do loop

print:
    li a7, 1          # Carrega o valor imediato 1 em a7 (número do syscall para imprimir um inteiro)
    mv a0, t4         # Move o valor de t4 (contador de acertos) para a0
    ecall             # Faz a chamada de sistema (imprime o número de acertos)

    li a7, 4          # Carrega o valor imediato 4 em a7 (número do syscall para imprimir uma string)
    la a0, quebra_linha # Carrega o endereço de quebra_linha em a0
    ecall             # Faz a chamada de sistema (imprime uma nova linha)

    li a7, 10         # Carrega o valor imediato 10 em a7 (número do syscall para sair)
    ecall             # Faz a chamada de sistema (termina o programa)
