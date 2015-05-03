.include "c64plat.asm"
.include "c64stub.asm"

    ldx #$00

loop:
    lda text, x
    beq end
    jsr chrout
    inx
    jmp loop

end:
    rts

text:
    .byte "HELLO", 0

