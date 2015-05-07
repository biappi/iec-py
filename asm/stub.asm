; Flip KERNAL ram and jumps to our patched routine

.org  $02a7
.word $02a7

lda #$35
sta $01
jmp $f04d
