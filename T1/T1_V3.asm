; O aluno deverá escrever, em Assembly de REDUX-V, um programa que some dois vetores de 10 posições
; fazendo R=A+B. O código deve inicializar os vetores A, B e R. Os vetores devem iniciar logo após as
; instruções na memória (note que REDUX-V é uma arquitetura Von Neumann). Você deve implementar a
; soma com loop para percorrer o vetor. A lista de instruções é dada na próxima página. O Assembly
; deve ser escrito no formato legível pelo emulador EGG (https://github.com/gboncoffee/egg).

; TODO: Ver se dá para imprimir com REDUX
; TODO: Ver minha nova lógica tá dando boa e responder question, com o chat
; QUESTION: Será que dá para fixar um registrador com o endereço de A -> fazer calculo de endereços sempre com base nele
; TODO: Verificar se dá para colocar labels nos vetores

; Q: .text?

main:
    
	; QUESTION: inicializar vetores?
	
	; Inicia iterador
	; QUESTION: Função específica? Dentro de função inicializadora?
	sub r3, r3		; r3 (i) = 0
	
	; Chama função de soma_vetor
	; QUESTION: Soma mesmo ou só desvia?
	; QUESTION: soma_vetor ou soma e imprime?
	ji soma_vetor
	
	; TO DO: imprime R -> QUESTION: função para isso? -> Dá para ser aqui? Ou função chamada por soma_vetor?
		; inicia iterador?
		; percorre vetor até .. imprimindo?

; QUESTION: Isso é gambiarra?
fim:
	; QUESTION: return??? -> PArece que não dá
	ebreak
	
soma_vetor:
	; QUESTION: É assim que usa brzr?
	; QUESTION: Aqui é a posição certa do branch -> pode ser entre incrementa iterador e percorre vetores
		; Aqui impede soma de vetores vazios -> mas nunca vai ter
	
	; ìf (i == tam) desvie para "imprime"
    ; r1(aux) = tam - i
	sub r0, r0
	addi 7		; QUESTION: 40 ou 10? Vai ter que ser esse número constante mesmo?
	addi 3
	sub r0, r3			; r0 = tam - i
    sub r1, r1          
    add r1, r0          ; r1 = r0 (tam - i)

	sub r0, r0
    addi fim            ; r0 = & de label "fim" ; ACHO QUE ISSO TA DANOD ERRADO -> colocou "0xfe"

	brzr r1, r0			; se r1 == 0; branch para R[r0]
	; -----------------------------------

	; r1 = A[i]
    ; Calcula endereço do próximo inteiro

	; r0 = i
	sub r0, r0
	add r0, r3

	; AJUSTE DE ENDEREÇO!!!!!!!!!!!!!!!!!!!!
	; r0 = i + A
    addi 7
	addi 7
    addi 7
	addi 7
	addi 3

	; r1 = A[i]
	ld r1, r0		; (Importante: A[i] sobrescreve o que tem em r1)

	; ----------------------------------

	; r2 = B[i]
	; endereço de B[i] em r0: r0 = (A + i) + 10 + número de instruções adicionadas = B + i
	
	; r0 = r0(A+i) + 10 + n
	addi 7			
	addi 3 ; + n (se add mais um tirando essa)

	; r2 = B[i]
	ld r2, r0

	; ---------------------------------

	; r1 = A[i] + B[i]
	add r1, r2


	; R[i] = r1 (A[i] + B[i])

	; r0 = i + R = (B + i) + 10 + número de instruções adicionadas
	; r0 = B + i
    addi 7
	addi 3 ; + n (se add mais uma tirando essa)

    ; QUESTION: Tá certo a ordem de registradores?
    st r1, r0       ; M[r0] = R[r1] <-> R[i] = A[i] + B[i]
	
	; Incrementa iterador
	; QUESTION: Função específica? Dá?
	; i = i + 1
	sub r0, r0
	addi 1
	add r3, r0
	
	; QUESTION: Assim que usa ji?? 
	ji soma_vetor		; goto soma_vetor -> TODO: Verificar comentário

; QUESTION: word mesmo?
; QUESTION: Dá para fazer isso no EGG?
; QUESTION: .8 mesmo?
.bits8 0x00 0x02 0x04 0x06 0x08 0x0A 0x0C 0x0E 0x10 0x12 ; vetor A
.bits8 0x01 0x03 0x05 0x07 0x09 0x0B 0x0D 0x0F 0x11 0x13 ; vetor B
.bits8 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 ; vetor R-> QUESTION: será que usar space dá certo?