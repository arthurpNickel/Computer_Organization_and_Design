; Versão guardando indice na memória e calculando endereço fora do loop e com addi

ji main

.bits8 0x00 ; Guardar índice i em memória

fim: ebreak

main:	
    ; Guardar endereço do vetor A em r3 (base para achar os outros)
	; r3 = A (pos 46)
	sub r0, r0
    addi 7
	addi 7
    addi 7
	addi 7
	addi 7
	addi 7
	addi 4
	sub r3, r3
	add r3, r0
	
soma_vetor:	
	;------------------------------------
	; if (i == tam) desvie para 'fim'
	; -----------------------------------

    ; Pega i da memória
    sub r0, r0          ; r0 = &i
	addi 1
    ld r2, r0           ; r2 = i

    ; r1(aux) = tam - i
	addi 7
	addi 2				; r0 = tam (considera que endereço de i sempre é 1) - gambiarra
    sub r1, r1
    add r1, r0          ; r1 = tam
    sub r1, r2          ; r1 = tam - i

	; r0 = &fim
	sub r0, r0
    addi fim 

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
	ld r1, r0

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
	add r2, r0		; r0 já é 1 (bateu com o endereço de i) - gambiarra

	; Guarda i incrementado
	st r2, r0

	;------------------------------------	
	; Desvia para soma_vetor usando brzr

	; r0 = &soma_vetor (pos 14)
	sub r0, r0
	addi 7
	addi 6

	sub r1, r1		; Força desvio
	brzr r1, r0	

;----------------------------------------
;Vetores:

; Vetor A (pos 46):
.bits8 0x00 0x02 0x04 0x06 0x08 0x0A 0x0C 0x0E 0x10 0x12

; Vetor B
.bits8 0x01 0x03 0x05 0x07 0x09 0x0B 0x0D 0x0F 0x11 0x13

; Vetor R
.bits8 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00