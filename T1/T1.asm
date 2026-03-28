#O aluno deverá escrever, em Assembly de REDUX-V, um programa que some dois vetores de 10 posições
#fazendo R=A+B. O código deve inicializar os vetores A, B e R. Os vetores devem iniciar logo após as
#instruções na memória (note que REDUX-V é uma arquitetura Von Neumann). Você deve implementar a
#soma com loop para percorrer o vetor. A lista de instruções é dada na próxima página. O Assembly
#deve ser escrito no formato legível pelo emulador EGG (https://github.com/gboncoffee/egg).

#colocar outras coisas aqui

.data
#QUESTION: word mesmo?
#QUESTION: Dá para fazer isso no EGG?
A: .word 0, 2, 4, 6, 8, 10, 12, 14, 16, 18 #vetor A
B: .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19 #vetor B
R: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 #vetor R zerado -> QUESTION: será que usar space dá certo?

.text

main:
    
	#QUESTION: inicializar vetores?
	
	#Inicia iterador
	#QUESTION: Função específica?
	addi a4, zero , 0
	
	#QUESTION:Ou recebe 10? -> depende se vai ter multiplicação
	#QUESTION:Quantos bytes tem 1 inteiro?
	addi a0, zero, 40	#a0(tam) = 10(tam do vetor) * 4(tam dos números, em bytes)
	
	#Atribui a ponteiros o endereço dos vetores
	#QUESTION: Usar addi mesmo?
	addi a1, A		#a0 = &A[0]
	addi a2, B		#a1 = &B[0]
	addi a3, R		#a3 = &R[0]
	
	#Chama função de soma_vetor
	#QUESTION: Soam mesmo ou só desvia?
	#QUESTION: soma_vetor ou soma e imprime?
	ji soma_vetor
	
	#TO DO: imprime R -> QUESTION: função para isso? -> Dá para ser aqui? Ou função chamada por soma_vetor?
		#inicia iterador?
		#percorre vetor até .. imprimindo?
	
soma_vetor:
	#QUESTION: É assim que usa brzr?
	#QUESTION: Aqui é a posição certa do branch -> pode ser entre incrementa iterador e percorre vetores
		#Aqui impede soma de vetores vazios -> mas nunca vai ter
	sub t0, a0, a4		#t0 = tam - i
	brzr t0, fim		# if (i == tam) return

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

fim:
	#QUESTION: return???
	
