; VERSÃO PRINCIPAL com cálculo de endereço no loop e com as novas instruções

main:	
	; Inicia iterador
	sub r3, r3		; r3 (i) = 0
	
	; Desvia para soma_vetor
	ji 2

fim: ji 0
	
soma_vetor:	
	;------------------------------------
	; if (i == tam) desvie para 'fim'
	; -----------------------------------

    ; r1(aux) = tam - i
	li 7			; OBS: sobreescrição
	addi 3			; r0 = tam

	sub r1, r1	
	add r1, r0		; r1 = tam
	sub r1, r3		; r1 = r1(tam) - i

	li 2            ; r0 = fim

	brzr r1, r0		; se r1 == 0, desvie para 'fim'

	; -----------------------------------
	; Soma de rótulos e armazenamento
	; -----------------------------------
	; Calcula &A[i] (endereço base para vetores) e pega A[i]

	; r0 = i + A (pos 25)
    lui 2			; r0 = 32
	addi -7
	add r0, r3 		; r0 += i

	; r1 = A[i] - Armazena em r1
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

	li 1
	add r3, r0

	;------------------------------------	
	; Desvia para soma_vetor

	li 3			; r0 = soma_vetor
	jar r0

;----------------------------------------
;Vetores:

; Vetor A (pos 25):
.bits8 0x00 0x02 0x04 0x06 0x08 0x0A 0x0C 0x0E 0x10 0x12

; Vetor B:
.bits8 0x01 0x03 0x05 0x07 0x09 0x0B 0x0D 0x0F 0x11 0x13

; Vetor R:
.bits8 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00