# Escreva um programa de teste para cada processador:
# Uma soma de 2 vetores teste de 12 posições fazendo R=A+B. Seu código deve inicializar os
# vetores A, B e R. Os vetores devem estar alinhados na memória.
# Você deve utilizar pelo menos um loop para implementar a soma ou para inicializar o vetor
# (você deve mostar em algum ponto que sabe trabalhar com laços).
# R deverá iniciar com zero.
# A = {0,1,2,3,4,5,6,7,8,9,10,11}.
# B={20,21,22,23,24,25,26,27,28,29,30,31}.
# No caso do processador vetorial os dados estarão distribuidos nas memórias dos PEs


# SE LOAD/STORE NÃO INTERFERIR NO ENDEREÇO
main:
    # Vai algo aqui? Ou seria igual o inicializa 1?

inicialilza_1:
    # Inicializa iterador -------------------

    # Inicializa "n" (número de iterações) em sr3
    # s.movh 0 ?
    s.movl 3
    s.sub sr3, sr3      # Q: Precisa?
    s.add sr3, sr1      # sr3 = 3

    # Inicializa endereços de jump --------------

    # sr2 recebe endereço do inicializa_2

    # sr1 recebe endeço de inicializa_vetores

    # Inicializa dados iniciais -----------------
    v.sub vr2, vr2      # vr2 = {0, 0, 0, 0} -> Q: Precisa?
    v.add vr2, vr0      # vr2 = {0, 1, 2, 3} - dados iniciais

    # Inicializa endereços iniciais  ------------
    v.sub vr3, vr3      # vr3 = {0, 0, 0, 0} -> Q: Precisa?
    v.add vr3, vr0      # vr3 = {0, 1, 2, 3} - endereços iniciais

    # Define vr1 com a constante 4 --------------
    v.movh 0
    v.movl 4        # Nesse caso em específico essa instrução é inútil

    # Desvia para "inicializa_vetores"
    s.brzr sr0, sr1       # Q: Precisa? -> provavelmente

inicializa_2:
    # Inicializa iterador -----------------------

    # Inicializa "n" (número de iterações) em sr3 
    # s.movh 0 ?
    s.movl 3
    s.sub sr3, sr3      # Q: Precisa?
    s.add sr3, sr1      # sr3 = 3

    # Inicializa endereços de jump ---------------

    # sr2 recebe endereço do próximo label

    # sr1 recebe endeço de inicializa_vetores

    # Inicializa dados iniciais - 20 (10100) -----
    v.movl 4
    v.movh 1

    v.sub vr2, vr2      # Abre espaço para receber dado
    v.add vr2, vr1      # Aloca dados em vr2 / vr2 = {20, 20, 20, 20}
    v.add vr2, vr0      # vr2 = {20, 21, 22, 23} - dados iniciais

#OU!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # Considerando que vr2 chega com {12, 13, 14, 15}
    v.add vr2, vr1      # vr2 = {16, 17, 18, 19}
    v.add vr2, vr1      # vr2 = {20, 21, 22, 23}

    #Q: Precisa inicializar endereços iniciais? Ou já vem prontos da inicialização do primeiro vetor?!!!!!!!!!!!
        # Acho que vr3 = {12, 13, 14, 15} depois da inicialização do primeiro vetor, então n precisa fazer algo

    # Define vr1 com a constante 4 -> Q: Se não mudar da inicialização 1 para a 2 não precisa!
    v.movh 0
    v.movl 4        # Nesse caso em específico essa instrução é inútil

    # Desvia para "inicializa_vetores"
    s.brzr sr0, sr2       # Q: Precisa? -> provavelmente

inicializa_vetores:
    # Estou considerando que endereço está em VR3!!!

    v.st vr2, vr3   # Guarda dados na memória

    v.add vr2, vr1  # vr2 = vr2 + vr1 / vr2 += 4 -> itera dados - estão em sequência
    v.add vr3, vr1  # vr3 = vr3 + vr1 / vr3 += 4 -> itera endereço - !!!!!!!!!!!!!!!

    # "if (i == 3) finaliza loop"
    #s.movh 0 ?
    s.movl 1            # Inicializa variavel de iteração
    s.add sr3, sr1        # n--

    s.brzr sr3, sr2       # Se sr3 == 0 -> pula para ...

    # Se não...
    s.movh Y            # Monta endereço de "inicializa_vetores"
    s.movl X

    s.brzr sr0, sr1       # Desvia para "inicializa_vetores"

# Q: Esse nome mesmo?
chama_soma:
    # Inicializa iterador

    # Inicializa "n" (número de iterações) em sr3 
    # s.movh 0 ?
    s.movl 3
    s.sub sr3, sr3      # Q: Precisa?
    s.add sr3, sr1      # sr3 = 3

    # Q: Inicializa endereço de fim -> se for em baixo não precisa
        # Posso usar epaço para colocar constante 1 (decremento) e outro para endereço de loop
    
    s.movh X            # sr1 = &fim
    s.movl Y
    s.sub sr2, sr2      # sr2 = 0
    s.add sr2, sr1      # sr2 = sr1


    # Inicializa endereços iniciais
    v.sub vr3, vr3      # vr3 = {0, 0, 0, 0}
    v.add vr3, vr0      # vr3 = {0, 1, 2, 3}

soma_vetores:
    v.ld vr2, vr3       # Carrega 1/3 do vetor 1 em vr2

    # Monta endereço do vetor 2
    v.movh 0            # vr1 = 8
    v.movl 8
    v.add vr3, vr1

    v.ld vr1, vr3       # Carrega 1/3 do vetor 2 em vr1

    v.add vr2, vr3      # Soma vetor 1 e 2 e armazena em vr2

    # Monta endereço do vetor resultado
    v.movh 0
    v.movl 8
    v.add vr3, vr1

    v.st vr2, vr3       # Guarda vetor resultado

    # "if (i == 3) finaliza programa"
    # s.movh 0 ?
    s.movl 1
    s.sub sr3, sr1

    s.brzr vr3, vr2

    # Se não...

    # Monta próximo endereço base
    # v.movh 0 ?
    v.movl 12
    v.sub vr3, vr1      #vr3 = vr3 - 12 (diminuiu 16 endereços para voltar ao vetor 1 e soma 4 para ir para o próximo bloco)

    # Monta endereço de soma_vetores

    s.movh X
    s.movl Y

    s.brzr sr0 sr1

# Q: SE LOAD/STORE INTERFERIR NO ENDEREÇO ?


