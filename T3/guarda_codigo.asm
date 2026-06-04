# Guardar código para caso eu escolha instrução ji

# SE LOAD/STORE NÃO INTERFERIR NO ENDEREÇO

inicializa_2:
    # Inicializa iterador -------------------

    # Inicializa "n" (número de iterações) em sr3
    s.movl 3
    s.sub sr3, sr3      # Q: Precisa?
    s.add sr3, sr1      # sr3 = 3

    s.movl 1            # Inicializa variavel de iteração
    s.sub sr2, sr2      # sr2 = 0 - Q: Precisa?
    s.add sr2, sr1      # sr2 = 1

    # Inicializa endereço de jump ------------

    # sr3 recebe endereço do próximo label

    # Inicializa dado ------------------------

    # Montar dado inicial - 20 (10100)
    v.movl 4
    v.movh 1

    v.sub vr2, vr2   # Abre espaço para receber dado
    v.add vr2, vr1   # Aloca dados em vr2

    # Define vr1 com a constante 4
    v.movh 0
    v.movl 4        # Nesse caso em específico essa instrução é inútil

    # Ajusta e guarda sequência na memória
    v.add vr2, vr0  # "Acerta" dados, de acordo com o PE

inicializa_vetores:
    # Estou considerando que endereço está em VR3!!!
    v.st vr2, vr3   # Guarda dados na memória

    v.add vr2, vr1  # vr2 = vr2 + vr1 / vr2 += 4 -> itera dados - estão em sequência
    v.add vr3, vr1  # vr3 = vr3 + vr1 / vr3 += 4 -> itera endereço - !!!!!!!!!!!!!!!

    # "if (i == 3) finaliza loop"
    add sr3, sr2        # n--

    brzr sr3, sr1       # Se  


    # Montar endereço
    # por enquanto vou considerar que já tenho que algum registrador...