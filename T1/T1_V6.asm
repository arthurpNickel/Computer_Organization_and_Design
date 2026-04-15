; O aluno deverá escrever, em Assembly de REDUX-V, um programa que some dois vetores de 10 posições
; fazendo R=A+B. O código deve inicializar os vetores A, B e R. Os vetores devem iniciar logo após as
; instruções na memória (note que REDUX-V é uma arquitetura Von Neumann). Você deve implementar a
; soma com loop para percorrer o vetor. A lista de instruções é dada na próxima página. O Assembly
; deve ser escrito no formato legível pelo emulador EGG (https://github.com/gboncoffee/egg).

; Versão entrando no loop com iterador na memória	
	; Meio ruim, com bastante gambiarra

ji main

.bits8 0x00 ; Guardar índice i em memória

fim: ebreak

main:	
	; Inicia iterador -> Esquisitasso isso aqui -> ignoro i em memória !!!!!!!!!!!!!
	sub r2, r2		; r2 (i) = 0

    ; Guardar endereço do vetor A em r3 (base para achar os outros)
	; r3 = A (pos 45)
	sub r0, r0
    addi 7
	addi 7
    addi 7
	addi 7
	addi 7
	addi 7
	addi 3
	sub r3, r3
	add r3, r0

	; Q: Somar iterador aqui já?
	
soma_vetor:
	; if (i == tam) desvie para 'fim'

	; Para entrar aqui é garantido que i está em r2

    ; r1(aux) = tam - i
	sub r0, r0
	addi 7
	addi 3				; r0 = tam (considera que endereço de i sempre é 0)
    sub r1, r1
    add r1, r0          ; r1 = tam
    sub r1, r2          ; r1 = tam - i

	sub r0, r0
    addi fim            ; r0 = &ebreak

	brzr r1, r0			; se r1 == 0, desvie para 'fim'
	; -----------------------------------
	; Soma de rótulos e armazenamento
	; -----------------------------------
	; Calcula &A[i] e pega A[i]

	; Neste ponto, eu tenho i em r2 e A em r3

	; r0 = &A[i]
	sub r0, r0
	add r0, r2
	add r0, r3

	; r1 = A[i]
	ld r1, r0		; (Importante: A[i] sobrescreve o que tem em r1)

	; ----------------------------------
	; Calcula &B[i] e pega B[i]

	; r0 = r0 (A+i) + 10 (tam de A)
	addi 7			
	addi 3

	; r2 = B[i]
	ld r2, r0

	; ---------------------------------
	; Calcula &R[i] e armazena soma de rótulos

	; r0 = B + i + 10 = R + i
    addi 7
	addi 3

	; r1 = A[i] + B[i]
	add r1, r2

	; R[i] = A[i] + B[i]
    st r1, r0       ; M[r0] = R[r1]
	
	;------------------------------------
	; Incrementa iterador - i++

	; r2 = i
	sub r0, r0		; r1 = &i
	addi 1;
	sub r2, r2
	ld r2, r0

	; i++
	add r2, r0		; r0 já é 1 (bateu com o endereço de i)

	; Guarda i incrementado
	st r2, r0

	;------------------------------------	
	; Desvia para soma_vetor usando brzr

	; r0 = &soma_vetor (pos 14)
	sub r0, r0
	addi 7
	addi 7

	sub r1, r1		; Força desvio
	brzr r1, r0	

;----------------------------------------
;Vetores:

; Vetor A (pos 45):
.bits8 0x00 0x02 0x04 0x06 0x08 0x0A 0x0C 0x0E 0x10 0x12

; Vetor B
.bits8 0x01 0x03 0x05 0x07 0x09 0x0B 0x0D 0x0F 0x11 0x13

; Vetor R
.bits8 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00