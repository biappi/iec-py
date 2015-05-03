; KERNAL routine aliases (C64)

.alias	acptr		$ffa5
.alias	chkin		$ffc6
.alias	chkout		$ffc9
.alias	chrin		$ffcf
.alias	chrout		$ffd2
.alias	ciout		$ffa8
.alias	cint		$ff81
.alias	clall		$ffe7
.alias	close		$ffc3
.alias	clrchn		$ffcc
.alias	getin		$ffe4
.alias	iobase		$fff3
.alias	ioinit		$ff84
.alias	listen		$ffb1
.alias	load		$ffd5
.alias	membot		$ff9c
.alias	memtop		$ff99
.alias	open		$ffc0
.alias	plot		$fff0
.alias	ramtas		$ff87
.alias	rdtim		$ffde
.alias	readst		$ffb7
.alias	restor		$ff8a
.alias	save		$ffd8
.alias	scnkey		$ff9f
.alias	screen		$ffed
.alias	second		$ff93
.alias	setlfs		$ffba
.alias	setmsg		$ff90
.alias	setnam		$ffbd
.alias	settim		$ffdb
.alias	settmo		$ffa2
.alias	stop		$ffe1
.alias	talk		$ffb4
.alias	tksa		$ff96
.alias	udtim		$ffea
.alias	unlsn		$ffae
.alias	untlk		$ffab
.alias	vector		$ff8d

; KERNAL variable aliases (C64)

.alias d6510        $0000    ; 6510 On-Chip Data-Direction Register
.alias r6510        $0001    ; 6510 On-Chip 8-Bit Input/Output Register
.alias adray1       $0003    ; Jump Vector: Convert Floating-Integer
.alias adray2       $0005    ; Jump Vector: Convert Integer--Floating
.alias charac       $0007    ; Search Character
.alias endchr       $0008    ; Flag: Scan for Quote at End of String
.alias trmpos       $0009    ; Screen Column From Last TAB
.alias verck        $000a    ; Flag: 0 = Load, 1 = Verify
.alias count        $000b    ; Input Buffer Pointer / No. of Subscripts
.alias dimflg       $000c    ; Flag: Default Array DiMension
.alias valtyp       $000d    ; Data Type: $FF = String, $00 = Numeric
.alias intflg       $000e    ; Data Type: $80 = Integer, $00 = Floating
.alias garbfl       $000f    ; Flag: DATA scan/LIST quote/Garbage Coll
.alias subflg       $0010    ; Flag: Subscript Ref / User Function Call
.alias inpflg       $0011    ; Flag: $00 = INPUT, $40 = GET, $98 = READ
.alias tansgn       $0012    ; Flag TAN sign / Comparison Result
.alias linnum       $0014    ; Temp: Integer Value
.alias temppt       $0016    ; Pointer Temporary String
.alias lastpt       $0017    ; Last Temp String Address
.alias tempst       $0019    ; Stack for Temporary Strings
.alias index        $0022    ; Utility Pointer Area
.alias index1       $0022    ; First Utility Pointer.
.alias index2       $0024    ; Second Utility Pointer.
.alias resho        $0026    ; Floating-Point Product of Multiply
.alias txttab       $002b    ; Pointer: Start of BASIC Text
.alias vartab       $002d    ; Pointer: Start of BASIC Variables
.alias arytab       $002f    ; Pointer: Start of BASIC Arrays
.alias strend       $0031    ; Pointer End of BASIC Arrays (+1)
.alias fretop       $0033    ; Pointer: Bottom of String Storage
.alias frespc       $0035    ; Utility String Pointer
.alias memsiz1      $0037    ; Pointer: Highest Address Used by BASIC
.alias curlin       $0039    ; Current BASIC Line Number
.alias oldlin       $003b    ; Previous BASIC Line Number
.alias oldtxt       $003d    ; Pointer: BASIC Statement for CONT
.alias datlin       $003f    ; Current DATA Line Number
.alias datptr       $0041    ; Pointer: Current DATA Item Address
.alias inpptr       $0043    ; Vector: INPUT Routine
.alias varnam       $0045    ; Current BASIC Variable Name
.alias varpnt       $0047    ; Pointer: Current BASIC Variable Data
.alias forpnt       $0049    ; Pointer: Index Variable for FOR/NEXT
.alias vartxt       $004b    ; Temporary storage for TXTPTR during
.alias opmask       $004d    ; Mask used during FRMEVL.
.alias tempf3       $004e    ; Temporary storage for FLPT value.
.alias four6        $0053    ; Length of String Variable during Garbage
.alias jmper        $0054    ; Jump Vector used in Function Evaluation-
.alias tempf1       $0057    ; Temporary storage for FLPT value.
.alias tempf2       $005c    ; Temporary storage for FLPT value.
.alias facexp       $0061    ; Floating-Point Accumulator #1: Exponent
.alias facho        $0062    ; Floating Accum. #1: Mantissa
.alias facsgn       $0066    ; Floating Accum. #1: Sign
.alias sgnflg       $0067    ; Pointer: Series Evaluation Constant
.alias bits         $0068    ; Floating Accum. #1: Overflow Digit
.alias argexp       $0069    ; Floating-Point Accumulator #2: Exponent
.alias argho        $006a    ; Floating Accum. #2: Mantissa
.alias argsgn       $006e    ; Floating Accum. #2: Sign
.alias arisgn       $006f    ; Sign Comparison Result: Accum. # 1 vs #2
.alias facov        $0070    ; Floating Accum. #1. Low-Order (Rounding)
.alias fbufpt       $0071    ; Pointer: Cassette Buffer
.alias chrget       $0073    ; Subroutine: Get Next Byte of BASIC Text
.alias chrgot       $0079    ; Entry to Get Same Byte of Text Again
.alias txtptr       $007a    ; Pointer: Current Byte of BASIC Text
.alias rndx         $008b    ; Floating RND Function Seed Value
.alias status       $0090    ; Kernal I/O Status Word: ST
.alias stkey        $0091    ; Flag: STOP key / RVS key
.alias svxt         $0092    ; Timing Constant for Tape
.alias verck1       $0093    ; Flag: 0 = Load, 1 = Verify
.alias c3po         $0094    ; Flag: Serial Bus-Output Char. Buffered
.alias bsour        $0095    ; Buffered Character for Serial Bus
.alias syno         $0096    ; Cassette Sync No.
.alias ldtnd        $0098    ; No. of Open Files / Index to File Table
.alias dfltn        $0099    ; Default Input Device (0)
.alias dflto        $009a    ; Default Output (CMD) Device (3)
.alias prty         $009b    ; Tape Character Parity
.alias dpsw         $009c    ; Flag: Tape Byte-Received
.alias msgflg       $009d    ; Flag: $80 = Direct Mode, $00 = Program
.alias ptr1         $009e    ; Tape Pass 1 Error Log
.alias ptr2         $009f    ; Tape Pass 2 Error Log
.alias time         $00a0    ; Real-Time Jiffy Clock (approx) 1/60 Sec
.alias cntdn        $00a5    ; Cassette Sync Countdown
.alias bufpnt       $00a6    ; Pointer: Tape I/O Buffer
.alias inbit        $00a7    ; RS-232 Input Bits / Cassette Temp
.alias bitci        $00a8    ; RS-232 Input Bit Count / Cassette Temp
.alias rinone       $00a9    ; RS-232 Flag: Check for Start Bit
.alias ridata       $00aa    ; RS-232 Input Byte Buffer/Cassette Temp
.alias riprty       $00ab    ; RS-232 Input Parity / Cassette Short Cnt
.alias sal          $00ac    ; Pointer: Tape Buffer/ Screen Scrolling
.alias eal          $00ae    ; Tape End Addresses/End of Program
.alias cmp0         $00b0    ; Tape Timing Constants
.alias tape1        $00b2    ; Pointer: Start of Tape Buffer
.alias bitts        $00b4    ; RS-232 Out Bit Count / Cassette Temp
.alias nxtbit       $00b5    ; RS-232 Next Bit to Send/ Tape EOT Flag
.alias rodata       $00b6    ; RS-232 Out Byte Buffer
.alias fnlen        $00b7    ; Length of Current File Name
.alias la           $00b8    ; Current Logical File Number
.alias sa           $00b9    ; Current Secondary Address
.alias fa           $00ba    ; Current Device Number
.alias fnadr        $00bb    ; Pointer: Current File Name
.alias roprty       $00bd    ; RS-232 Out Parity / Cassette Temp
.alias fsblk        $00be    ; Cassette Read / Write Block Count
.alias mych         $00bf    ; Serial Word Buffer
.alias cas1         $00c0    ; Tape Motor Interlock
.alias stal         $00c1    ; I/O Start Address
.alias memuss       $00c3    ; Tape Load Temps
.alias lstx         $00c5    ; Current Key Pressed: CHR$(n) 0 = No Key
.alias ndx          $00c6    ; No. of Chars. in Keyboard Buffer (Queue)
.alias rvs          $00c7    ; Flag: Reverse Chars. - 1=Yes, 0=No Used
.alias indx         $00c8    ; Pointer: End of Logical Line for INPUT
.alias lxsp         $00c9    ; Cursor X-Y Pos. at Start of INPUT
.alias sfdx         $00cb    ; Flag: Print Shifted Chars.
.alias blnsw        $00cc    ; Cursor Blink enable: 0 = Flash Cursor
.alias blnct        $00cd    ; Timer: Countdown to Toggle Cursor
.alias gdbln        $00ce    ; Character Under Cursor
.alias blnon        $00cf    ; Flag: Last Cursor Blink On/Off
.alias crsw         $00d0    ; Flag: INPUT or GET from Keyboard
.alias pnt          $00d1    ; Pointer: Current Screen Line Address
.alias pntr         $00d3    ; Cursor Column on Current Line
.alias qtsw         $00d4    ; Flag: Editor in Quote Mode, $00 = NO
.alias lnmx         $00d5    ; Physical Screen Line Length
.alias tblx         $00d6    ; Current Cursor Physical Line Number
.alias insrt        $00d8    ; Flag: Insert Mode, >0 = # INSTs
.alias ldtb1        $00d9    ; Screen Line Link Table / Editor Temps
.alias user         $00f3    ; Pointer: Current Screen Color RAM loc.
.alias keytab       $00f5    ; Vector Keyboard Decode Table
.alias ribuf        $00f7    ; RS-232 Input Buffer Pointer
.alias robuf        $00f9    ; RS-232 Output Buffer  Pointer
.alias frekzp       $00fb    ; Free 0-Page Space for User Programs
.alias baszpt       $00ff    ; BASIC Temp Data Area
.alias bad          $0100    ; Tape Input Error Log
.alias buf          $0200    ; System INPUT Buffer
.alias lat          $0259    ; KERNAL Table: Active Logical File No's.
.alias fat          $0263    ; KERNAL Table: Device No. for Each File
.alias sat          $026d    ; KERNAL Table: Second Address Each File
.alias keyd         $0277    ; Keyboard Buffer Queue (FIFO)
.alias memstr       $0281    ; Pointer: Bottom of Memory for O.S.
.alias memsiz       $0283    ; Pointer: Top of Memory for O.S.
.alias timout       $0285    ; Flag: Kernal Variable for IEEE Timeout
.alias color        $0286    ; Current Character Color Code
.alias gdcol        $0287    ; Background Color Under Cursor
.alias hibase       $0288    ; Top of Screen Memory (Page)
.alias xmax         $0289    ; Size of Keyboard Buffer
.alias rptflg       $028a    ; Flag: REPEAT Key Used, $80 = Repeat
.alias kount        $028b    ; Repeat Speed Counter
.alias delay        $028c    ; Repeat Delay Counter
.alias shflag       $028d    ; Flag: Keyboard SHIFT Key/CTRL Key/C= Key
.alias lstshf       $028e    ; Last Keyboard Shift Pattern
.alias keylog       $028f    ; Vector: Keyboard Table Setup
.alias mode         $0291    ; Flag: $00=Disable SHIFT Keys, $80=Enable
.alias autodn       $0292    ; Flag: Auto Scroll Down, 0 = ON
.alias m51ctr       $0293    ; RS-232: 6551 Control Register Image
.alias ms1cdr       $0294    ; RS-232: 6551 Command Register Image
.alias m51ajb       $0295    ; RS-232 Non-Standard BPS (Time/2-100) USA
.alias rsstat       $0297    ; RS-232: 6551 Status Register Image
.alias bitnum       $0298    ; RS-232 Number of Bits Left to Send
.alias baudof       $0299    ; RS-232 Baud Rate: Full Bit Time (us)
.alias ridbe        $029b    ; RS-232 Index to End of Input Buffer
.alias ridbs        $029c    ; RS-232 Start of Input Buffer (Page)
.alias rodbs        $029d    ; RS-232 Start of Output Buffer (Page)
.alias rodbe        $029e    ; RS-232 Index to End of Output Buffer
.alias irqtmp       $029f    ; Holds IRQ Vector During Tape I/O
.alias enabl        $02a1    ; RS-232 Enables
.alias ierror       $0300    ; Vector: Print BASIC Error Message
.alias imain        $0302    ; Vector: BASIC Warm Start
.alias icrnch       $0304    ; Vector: Tokenize BASIC Text
.alias iqplop       $0306    ; Vector: BASIC Text LIST
.alias igone        $0308    ; Vector: BASIC Char. Dispatch
.alias ieval        $030a    ; Vector: BASIC Token Evaluation
.alias sareg        $030c    ; Storage for 6502 .A Register
.alias sxreg        $030d    ; Storage for 5502 .X Register
.alias syreg        $030e    ; Storage for 6502 .Y Register
.alias spreg        $030f    ; Storage for 6502 .SP Register
.alias usrpok       $0310    ; USR Function Jump Instr (4C)
.alias usradd       $0311    ; USR Address Low Byte / High Byte
.alias cinv         $0314    ; Vector: Hardware Interrupt
.alias cbinv        $0316    ; Vector: BRK Instr. Interrupt
.alias nminv        $0318    ; Vector: Non-Maskable Interrupt
.alias iopen        $031a    ; KERNAL OPEN Routine Vector
.alias iclose       $031c    ; KERNAL CLOSE Routine Vector
.alias ichkin       $031e    ; KERNAL CHKIN Routine
.alias ickout       $0320    ; KERNAL CHKOUT Routine
.alias iclrch       $0322    ; KERNAL CLRCHN Routine Vector
.alias ibasin       $0324    ; KERNAL CHRIN Routine
.alias ibsout       $0326    ; KERNAL CHROUT Routine
.alias istop        $0328    ; KERNAL STOP Routine Vector
.alias igetin       $032a    ; KERNAL GETIN Routine
.alias iclall       $032c    ; KERNAL CLALL Routine Vector
.alias usrcmd       $032e    ; User-Defined Vector
.alias iload        $0330    ; KERNAL LOAD Routine
.alias isave        $0332    ; KERNAL SAVE Routine Vector
.alias tbuffr       $033c    ; Tape I/O Buffer
.alias vicscn       $0400    ; 1024 Byte Screen Memory Area

; Character codes for the colors.
.alias	color'0		144
.alias	color'1		5
.alias	color'2		28
.alias	color'3		159
.alias	color'4		156
.alias	color'5		30
.alias	color'6		31
.alias	color'7		158
.alias	color'8		129
.alias	color'9		149
.alias	color'10	150
.alias	color'11	151
.alias	color'12	152
.alias	color'13	153
.alias	color'14	154
.alias	color'15	155

; ...and reverse video
.alias	reverse'on 	18
.alias	reverse'off 	146

; ...and character set
.alias	upper'case	142
.alias	lower'case	14


