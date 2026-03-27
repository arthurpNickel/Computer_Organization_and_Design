#O aluno deverá escrever, em Assembly de REDUX-V, um programa que some dois vetores de 10 posições
#fazendo R=A+B. O código deve inicializar os vetores A, B e R. Os vetores devem iniciar logo após as
#instruções na memória (note que REDUX-V é uma arquitetura Von Neumann). Você deve implementar a
#soma com loop para percorrer o vetor. A lista de instruções é dada na próxima página. O Assembly
#deve ser escrito no formato legível pelo emulador EGG (https://github.com/gboncoffee/egg).

#colocar outras coisas aqui

.data
#QUESTION: word mesmo?
A: .word 0, 2, 4, 6, 8, 10, 12, 14, 16, 18 #vetor A
B: .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19 #vetor B
R: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 #vetor R zerado -> QUESTION: será que usar space dá certo?

.text

main:
    
	#QUESTION: inicializar vetores?
	
	#TO DO: inicia iterador
	#QUESTION: Função específica?
	addi a4, zero , 0 #QUESTION: inicia em 0???
	
	#QUESTION:Ou recebe 10? -> depende se vai ter multiplicação
	addi a0, zero, 40	#a0(tam) = 10(tam do vetor) * 4(tam dos números, em bytes)
	
	#Atribui a ponteiros o endereço dos vetores
	#QUESTION: Pode usar essa pseudo-instrução? -> ACHO QUE NÃO
	la a1, A		#a0 = &A[0]
	la a2, B		#a1 = &B[0]
	la a3, R		#a3 = &R[0]
	
	#TO DO: chama função de soma_vetor
	
	#TO DO: imprime R -> QUESTION: função para isso?
		#inicia iterador?
		#percorre vetor até .. imprimindo?
	
soma_vetor:
	#QUESTION: É assim que usa brzr?
	#QUESTION: Aqui é a posição certa do branch -> pode ser entre incrementa iterador e percorre vetores
		#Aqui impede soma de vetores vazios -> mas nunca vai ter
	sub t0, a0, a4		#t0 = tam - i
	brzr t0, fim		# if (i == tam) return

	#QUESTION: Será que não dá para declarar ponteiro de R aqui?
	
	#Soma rótulos
	add a3, a0, a1		#R[i] = A[i] + B[i]
	
	#Incrementa iterador
	#QUESTION: Função específica?
	#QUESTION: Será que não dá para usar multiplicação?
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
	
