.word $0801
.org  $0801

.scope
        .word _next, 10         ; Next line and current line number
        .byte $9e," 2064",0     ; SYS 2064
_next:  .word 0                 ; End of program
.scend

.advance 2064


