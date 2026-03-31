; Meu programa

.bits8 05

main:
    ; endereço de leitura?
    ; sub r0, r0
    ; addi 1
    sub r1, r1
    ; add r1, r0

    ; syscall? 
    sub r2, r2
    sub r0, r0
    addi 2
    add r2, r0

    ; número de bytes que vão ser lidos?
    sub r0, r0
    addi 1

    ecall

    ebreak
