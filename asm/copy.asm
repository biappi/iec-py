; Copies KERNAL in RAM but do not flip it in

.include "c64plat.asm"
.include "c64stub.asm"

.alias copy_char_1 $0400
.alias copy_char_2 $0401

copy_all:
    ; set start address (kernal)
    lda #$e0
    sta $fc
    lda #$00
    sta $fb

    lda #$00
    sta copy_end_byte

    jsr copyrom

    rts

    ; set start address (basic)
    lda #$a0
    sta $fc
    lda #$00
    sta $fb

    lda #$c0
    sta copy_end_byte

    jsr copyrom

    ; lda #$35
    ; sta $01

    rts

copyrom:
    copy_high:
        ldx $fc
        stx copy_char_1

        ldy #$00

        copy_low:
            sty copy_char_2

            lda ($fb), y
            sta ($fb), y

            cpy #$ff
            beq copy_increment_word
            iny
            jmp copy_low

    copy_increment_word:
        inc $fc

        ldy $fc
        sty copy_char_1

        lda copy_end_byte
        cmp $fc
        beq copy_end

        jmp copy_high
        
    copy_end:
        rts

copy_end_byte:
    .byte $0

