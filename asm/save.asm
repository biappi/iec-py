.include "c64plat.asm"

;.word $0801
.alias prog  $0801

.org  $0801
    lda #1              ;device = 1:cassette
    jsr setlfs
    lda #0              ;no file name
    jsr setnam
    lda prog            ;load start address of save
    sta txttab          ;(low byte)
    lda prog+1
    sta txttab+1        ;(high byte)
    ldx vartab          ;load x with low byte of end of save
    ldy vartab+1        ;load y with high byte
    lda #<txttab        ;load accumulator with page 0 offse t
    jsr save

