#TRUQUES DA ARQUITETURA
	#Zerar registrador: Sub r1, r1
		#Prepara para atribuições

#O aluno deverá escrever, em Assembly de REDUX-V, um programa que some dois vetores de 10 posições
#fazendo R=A+B. O código deve inicializar os vetores A, B e R. Os vetores devem iniciar logo após as
#instruções na memória (note que REDUX-V é uma arquitetura Von Neumann). Você deve implementar a
#soma com loop para percorrer o vetor. A lista de instruções é dada na próxima página. O Assembly
#deve ser escrito no formato legível pelo emulador EGG (https://github.com/gboncoffee/egg).

#VERSÃO DE TESTES

#TODO: Arrumar todos os comentários para ;
#TODO: Arrumar todos os addis -> só r[0] recebe
#TODO: Arrumar todos os adds -> R[ra] <- R[ra] + R[ra]
#TODO: SÓ TEM 4 REGISTRADORES -> fazer adaptações necessárias (r0, r1, r2, r3)

#QUESTION: Dá para fazer isso no EGG?
#QUESTION: .32 mesmo?
A: .bits32 0 2 4 6 8 10 12 14 16 18 #vetor A
B: .bits32 1 3 5 7 9 11 13 15 17 19 #vetor B
R: .bits32 0 0 0 0 0 0 0 0 0 0 #vetor R zerado -> QUESTION: será que usar space dá certo?

#Q: .text?

main:
    
	#QUESTION: inicializar vetores?
	
	#Inicia iterador
	#QUESTION: Função específica? Dentro de função inicializadora?
	sub r3, r3		#r3 (i) = 0
	
	#QUESTION: acho que não dá para manter esse registrador
	#QUESTION:Ou recebe 10? -> Qual tamanho do int em bytes?
	addi a0, zero, 40	#a0(tam) = 10(tam do vetor) * 4(tam dos números, em bytes)
	
	#Atribui a ponteiros o endereço dos vetores

	#r2 = &A[0]
	sub r0, r0		#r0 = 0
	sub r2, r2		#r2 = 0
	addi A			#r0 = A
	add r2, r0		#r2 = r0 (A)

	#r1 = &B[0]
	sub r0, r0
	sub r1, r1
	addi A
	add r1, r0


	#Chama função de soma_vetor
	#QUESTION: Soma mesmo ou só desvia?
	#QUESTION: soma_vetor ou soma e imprime?
	ji soma_vetor
	
	#TO DO: imprime R -> QUESTION: função para isso? -> Dá para ser aqui? Ou função chamada por soma_vetor?
		#inicia iterador?
		#percorre vetor até .. imprimindo?
	
soma_vetor:
	#QUESTION: É assim que usa brzr?
	#QUESTION: Aqui é a posição certa do branch -> pode ser entre incrementa iterador e percorre vetores
		#Aqui impede soma de vetores vazios -> mas nunca vai ter
	
	#ìf (i == tam) "return" !!!!!!!!!!

	sub r0, r0
	addi 40		#QUESTION: 40 ou 10? Vai ter que ser esse número constante mesmo?

	sub r0, r3			#r0 = 40 - i

	brzr r0, imprime

	#QUESTION: Será que não dá para declarar ponteiro de R aqui? -> Ou função de inicialização?
	
	#Pega inteiros na memória
	ld t1, a1 		#a1 = A[i]
	ld t2, a2		#a2 = B[i]
	
	#Soma rótulos
	add t3, t1, t2		#t3 = A[i] + B[i]
	
	#QUESTION: verificar se está certo a ordem
	st a3, t3		#R[i] = t3
	
	#Incrementa iterador
	#QUESTION: Função específica?
	#QUESTION: Será que não dá para usar multiplicação?
	#QUESTION: Soma 1 ou 4? -> Depende da quantidade de bytes de int
	addi a4, a4, 4		#i += 4
	
	#QUESTION:Será que branch aqui? -> economiza 3 operações de soma
	
	#Percorre vetores
	#QUESTION: Função específica?
	add a1, a1, a0		#a1 = a1 + i
	add a2, a2, a0		#a2 = a2 + i
	add a3, a3, a0		#a3 = a3 + i
	
	#QUESTION: Assim que usa ji?? 
	ji soma_vetor		#goto soma_vetor -> TODO: Verificar comentário

imprime:
	#TODO: Ver se dá para imprimir no REDUX

fim:
	#QUESTION: return??? -> PArece que não dá
	ebreak
	
