.include "c64plat.asm"

.org  $f04d
.word $f04d

.alias dump_base $0801
.alias dump_top  $d000

dump_stuff:
    ; Setting device
    lda #1
    ldx #8
    ldy #1
    jsr setlfs

    ; Setting name
    lda #4
    ldx #<name
    ldy #>name
    jsr setnam

    ; What to save
    lda #<dump_base
    sta txttab

    lda #>dump_base
    sta txttab+1

    ; Banking off BASIC
    lda #$35
    sta $01

    ldx #<dump_top      ;load x with low byte of end of save
    ldy #>dump_top      ;load y with high byte
    lda #<txttab        ;load accumulator with page 0 offset
    jsr save

    ; Banking KERNAL back in
    lda #$37

    ; NOP sled to make the end RTS match
    ; from this patch to the rom
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

    ; Actually switch ROM for the RAM
    sta $01

    ; bye bye
    rts

name:
    .byte "TEST"

