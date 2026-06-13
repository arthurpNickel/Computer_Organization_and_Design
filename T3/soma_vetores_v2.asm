#ESCOLHIDA

# Escreva um programa de teste para cada processador:
# Uma soma de 2 vetores teste de 12 posições fazendo R=A+B. Seu código deve inicializar os
# vetores A, B e R. Os vetores devem estar alinhados na memória.
# Você deve utilizar pelo menos um loop para implementar a soma ou para inicializar o vetor
# (você deve mostar em algum ponto que sabe trabalhar com laços).
# R deverá iniciar com zero.
# A = {0,1,2,3,4,5,6,7,8,9,10,11}.
# B={20,21,22,23,24,25,26,27,28,29,30,31}.
# No caso do processador vetorial os dados estarão distribuidos nas memórias dos PEs

#DECISÕES (D)
    # 1: Antes de usar, todos os registradores foram zerados antes
    # 2: Mesmo que eu saiba que o dado está zerado, eu vou zerá-lo de novo por precaução
    # 3: inicialização dos dados do segundo vetor!!!!!!!!!!!!!!!!!
    # 4: Considerei que os endereços chegam certos em ... para a inicialização do segundo vetor
    # 5: Considerei que o vr1 se manterá com constante 4 na inicialização dos 2 vetores
    # 6: Não desviarei para labels que estão abaixo da label atual
    # 7: Load/Store não mexem no endereço de acesso a memória

#NOVAS INSTRUÇÕES: s.addli ra, limm e s.mvr sra srb

#QUESTIONS
    # ...

main: 
#"Inicializa_1"
    # Inicializa iterador -------------------

    # Inicializa "n" (número de iterações) em sr3
    s.movh 0            #D1
    s.movl 3
    s.mvr sr3, sr1      # sr3 = 3

    # Inicializa endereços de jump --------------

    # sr2 recebe endereço do inicializa_2
    s.movl X
    s.movl Y
    s.mvr sr2, sr1

    # sr1 recebe endeço de inicializa_vetores
    s.movl X
    s.movl Y

    # Inicializa dados iniciais -----------------
    v.sub vr2, vr2      # vr2 = {0, 0, 0, 0} - D1
    v.add vr2, vr0      # vr2 = {0, 1, 2, 3} - dados iniciais

    # Inicializa endereços iniciais  ------------
    v.sub vr3, vr3      # vr3 = {0, 0, 0, 0} - D1
    v.add vr3, vr0      # vr3 = {0, 1, 2, 3} - endereços iniciais

    # Define vr1 com a constante 4 --------------
    v.movh 0            #D1
    v.movl 4

    # Desvia para "inicializa_vetores"
    s.brzr sr0, sr1

inicializa_2:
    # Inicializa iterador -----------------------

    # Inicializa "n" (número de iterações) em sr3 
    s.movh 0            # D2
    s.movl 3
    s.mvr sr3, sr1      # sr3 = 3

    # Inicializa endereços de jump ---------------

    # sr2 recebe endereço do próximo label
    s.movl X
    s.movl Y
    s.mvr sr2, sr1

    # D6

    # Inicializa dados iniciais - 20 (10100) -----
    v.movl 4
    v.movh 1

    # Considerando que vr2 chega com {12, 13, 14, 15} e vr1 com {4, 4, 4, 4}
    v.add vr2, vr1      # vr2 = {16, 17, 18, 19}
    v.add vr2, vr1      # vr2 = {20, 21, 22, 23}

    # D4

    # D5

    # D6

inicializa_vetores:
    # Estou considerando que endereço está em VR3, dados em VR2 e 4 em VR1 !!!

    v.st vr2, vr3       # Guarda dados na memória

    v.add vr2, vr1      # vr2 = vr2 + vr1 / vr2 += 4 -> itera dados - estão em sequência
    v.add vr3, vr1      # vr3 = vr3 + vr1 / vr3 += 4 -> itera endereço - !!!!!!!!!!!!!!!

    # "if (i == 3) finaliza loop"
    s.addli sr3, -1     # n--

    s.brzr sr3, sr2     # Se sr3 == 0 -> pula para próximo label

    s.brzr sr0, sr1     # Desvia para "inicializa_vetores"

soma_setup:
    # Inicializa iterador

    # Inicializa "n" (número de iterações) em sr3 
    s.movh 0            # D2
    s.movl 3
    s.mvr sr3, sr1      # sr3 = 3

    # Q: Inicializa endereço de fim -> Vale a pena?
        # Posso usar espaço para colocar constante 1 (decremento) e outro para endereço de loop
    
    s.movh X            # sr1 = &fim
    s.movl Y
    s.mvr sr2, sr1      # sr2 = sr1

    # Monta endereço de soma_vetores
    s.movh X
    s.movl Y

    # Inicializa endereços iniciais
    v.sub vr3, vr3      # vr3 = {0, 0, 0, 0}
    v.add vr3, vr0      # vr3 = {0, 1, 2, 3}

soma_vetores:
    v.ld vr2, vr3       # Carrega 1/3 do vetor 1 em vr2

    # Monta endereço do vetor 2 em vr1
    v.movh 0            # vr1 = 12
    v.movl 12           # T: Na verdade é um número negativo que é igual 12 mas na representação complemento de 2
    v.add vr3, vr1

    v.ld vr1, vr3       # Carrega 1/3 do vetor 2 em vr1

    v.add vr2, vr1      # Soma vetor 1 e 2 e armazena em vr2

    # Monta endereço do vetor resultado em vr1
    v.movh 0
    v.movl 12
    v.add vr3, vr1

    v.st vr2, vr3       # Guarda vetor resultado

    # "if (i == 3) finaliza programa"
    s.addli sr3, -1     # n--

    s.brzr sr3, sr2

    # Se não...
    # Monta próximo endereço base
    # T: ARRUMAR AQUI!!!
    v.movl 12           # Considerei a parte de cima zerada por 3 instruções atrás
    v.sub vr3, vr1      #vr3 = vr3 - 12 (diminuiu 16 endereços para voltar ao vetor 1 e soma 4 para ir para o próximo bloco)

    s.brzr sr0 sr1      # Desvia para soma_vetores

# Q: Se fim for endereço 0 é só zerar sr1 ou fazer sr0, sr0
fim:
    # Loop infinito
    s.movh X
    s.movl Y
    s.brzr sr0, sr1