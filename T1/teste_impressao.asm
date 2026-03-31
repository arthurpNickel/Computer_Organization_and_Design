; Meu programa
A: 
.bits8 5

main:
    sub r0, r0
    addi A
    sub r1, r1
    add r1, r0

    sub r2, r2
    sub r0, r0
    addi 1
    add r2, r0

    sub r0, r0
    addi 3

    ecall

    ebreak
