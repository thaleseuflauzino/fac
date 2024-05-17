.data
    palavra: .space 500
    quebra_linha: .asciz "\n"

.text

main:
    li a7, 5            # Carrega o número do syscall para ler um inteiro
    ecall               # Faz a chamada de sistema
    mv s1, a0           # Move o resultado de a0 para s1

    li a7, 8            # Carrega o número do syscall para ler uma string
    la a0, palavra      # Carrega o endereço de palavra em a0
    li a1, 500          # Carrega 500 em a1 (tamanho máximo da string)
    ecall               # Faz a chamada de sistema

    la t0, palavra      # Carrega o endereço de palavra em t0
    la t1, palavra      # Carrega o endereço de palavra em t1

loop:
    lb t3, 0(t1)        # Carrega um byte de t1 para t3
    beq t3, zero, tras  # Se t3 for zero (final da string), vai para tras
    addi t1, t1, 1      # Incrementa t1
    j loop              # Vai para o início do loop

tras:
    addi t1, t1, -2     # Decrementa t1 por 2 (para posicionar no último caractere da string)

verifica:
    bge t0, t1, palindromo # Se t0 for maior ou igual a t1, vai para palindromo
    lb t3, 0(t0)         # Carrega um byte de t0 para t3
    lb t4, 0(t1)         # Carrega um byte de t1 para t4
    bne t3, t4, nao_palindromo # Se t3 for diferente de t4, vai para nao_palindromo

    addi t0, t0, 1      # Incrementa t0
    addi t1, t1, -1     # Decrementa t1
    j verifica          # Vai para verifica

nao_palindromo:
    li a7, 1            # Carrega o número do syscall para imprimir um inteiro
    li a0, 0            # Carrega 0 em a0 (não é um palíndromo)
    ecall               # Faz a chamada de sistema
    j exit              # Vai para exit

palindromo:
    li a7, 1            # Carrega o número do syscall para imprimir um inteiro
    li a0, 1            # Carrega 1 em a0 (é um palíndromo)
    ecall               # Faz a chamada de sistema
    j exit              # Vai para exit

exit:
    li a7, 4            # Carrega o número do syscall para imprimir uma string
    la a0, quebra_linha # Carrega o endereço de quebra_linha em a0
    ecall               # Faz a chamada de sistema

    li a7, 10           # Carrega o número do syscall para terminar o programa
    ecall               # Faz a chamada de sistema
