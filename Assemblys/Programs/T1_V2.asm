; O aluno deverá escrever, em Assembly de REDUX-V, um programa que some dois vetores de 10 posições
; fazendo R=A+B. O código deve inicializar os vetores A, B e R. Os vetores devem iniciar logo após as
; instruções na memória (note que REDUX-V é uma arquitetura Von Neumann). Você deve implementar a
; soma com loop para percorrer o vetor. A lista de instruções é dada na próxima página. O Assembly
; deve ser escrito no formato legível pelo emulador EGG (https://github.com/gboncoffee/egg).

; VERSÃO DE TESTES

; TODO: Ver se dá para imprimir com REDUX
; TODO: Ver minha nova lógica tá dando boa e responder question, com o chat
; TODO: Arrumar todos os comentários para ;

; QUESTION: word mesmo?
; QUESTION: Dá para fazer isso no EGG?
; QUESTION: .8 mesmo?
A: .bits16 0, 2, 4, 6, 8, 10, 12, 14, 16, 18 ; vetor A
B: .bits16 1 3 5 7 9 11 13 15 17 19 ; vetor B
R: .bits16 0 0 0 0 0 0 0 0 0 0 ; vetor R zerado -> QUESTION: será que usar space dá certo?

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
	
soma_vetor:
	; QUESTION: É assim que usa brzr?
	; QUESTION: Aqui é a posição certa do branch -> pode ser entre incrementa iterador e percorre vetores
		; Aqui impede soma de vetores vazios -> mas nunca vai ter
	
	; ìf (i == tam) desvie para "imprime"
    ; r1(aux) = tam - i
	sub r0, r0
	addi 10		; QUESTION: 40 ou 10? Vai ter que ser esse número constante mesmo?
	sub r0, r3			; r0 = tam - i
    sub r1, r1          
    add r1, r0          ; r1 = r0 (tam - i)

    addi fim          ; r0 = & de label "fim"

	brzr r1, r0
	; -----------------------------------

	; r1 = A[i]
    ; Calcula endereço do próximo inteiro
	sub r0, r0		; r0 = 0
	add r0, r3		; r0 = i
	addi A			; r0 = i + A

	ld r1, r0		; r1 = A[i] (Importante: A[i] sobrescreve o que tem em r1)

	; r2 = B[i]
	sub r0, r0		; r0 = 0
	add r0, r3		; r0 = i
	addi B			; r0 = i + B

	ld r2, r0		; r2 = B[i]

	; QUESTION: Sobrou um registrador aqui! Ent será que dá para fazer de outro jeito?
	add r1, r2		; r1 = A[i] + B[i]

	; R[i] = r1 (A[i] + B[i])
	sub r0, r0      
    add r0, r3      ; r0 = i
    addi R          ; r0 = i + &R[0]
    ; QUESTION: Tá certo a ordem de registradores?
    st r1, r0       ; M[r0] = R[r1] <-> R[i] = A[i] + B[i]
	
	; Incrementa iterador
	; QUESTION: Função específica? Dá?

    ; i = i + 1
    sub r0, r0          ; r0 = 0
    add r0, r3          ; r0 = i
    addi 1      ; Ou 4?  r0 = i + 1
    sub r3, r3          ; r3 = 0
    add r3, r0          ; r3 = r0 (i + 1)
	
	; QUESTION: Assim que usa ji?? 
	ji soma_vetor		; goto soma_vetor -> TODO: Verificar comentário

; imprime:
	; TODO: Ver se dá para imprimir no REDUX

fim:
	; QUESTION: return??? -> PArece que não dá
	ebreak
	