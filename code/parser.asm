; RTC Parser Code
; Leif Bloomquist - April 3, 2006

 processor 6502 ; PET 8296

 ; Jump Table --------------------------------------------------------
 
 ; Parse 
 org $9c40,0 ;40000 decimal (Fill value=0) 
 jmp parse

 ; Print Message
 org $9c4A ;40010 decimal 
 jmp print
 
 ; Code (Parse) --------------------------------------------------------
 
parse
 ;Set Read Mode
 lda $9ff8
 ora #$40
 sta $9ff8

 ; Read Year (add 2000 to it in BASIC)
 ldy $9fff
 lda lookup,y
 sta 0700 ;Inside the tape buffer - note decimal!
 
 ;Read Month
 ldy $9ffe
 and #$1f
 lda lookup,y
 sta 0701
 
 ;Read Date
 ldy $9ffd
 and #$3f
 lda lookup,y
 sta 0702
 
 ;Read Day of week
 ldy $9ffc
 and #$08
 lda lookup,y
 sta 0703

 ;Read Hours
 ldy $9ffb
 and #$3f
 lda lookup,y
 sta 0704
 
 ;Read Minutes
 ldy $9ffa
 and #$7f
 lda lookup,y
 sta 0705
 
 ;Read Seconds
 ldy $9ff9
 and #$7f
 lda lookup,y
 sta 0706
 
 ;Clear Read Mode
 lda $9ff8
 and #$BF
 sta $9ff8
 
 rts

; Code (Print) --------------------------------------------------------

print
 ldy #$00
loop
 lda message,y
 beq done
 jsr $ffd2
 iny
 jmp loop
 
done
 rts
 
; BCD Lookup Table --------------------------------------------------------
 
 org $9d00 
lookup
 dc.b	0
 dc.b	1
 dc.b	2
 dc.b	3
 dc.b	4
 dc.b	5
 dc.b	6
 dc.b	7
 dc.b	8
 dc.b	9
 dc.b	10
 dc.b	11
 dc.b	12
 dc.b	13
 dc.b	14
 dc.b	15
 dc.b	10
 dc.b	11
 dc.b	12
 dc.b	13
 dc.b	14
 dc.b	15
 dc.b	16
 dc.b	17
 dc.b	18
 dc.b	19
 dc.b	20
 dc.b	21
 dc.b	22
 dc.b	23
 dc.b	24
 dc.b	25
 dc.b	20
 dc.b	21
 dc.b	22
 dc.b	23
 dc.b	24
 dc.b	25
 dc.b	26
 dc.b	27
 dc.b	28
 dc.b	29
 dc.b	30
 dc.b	31
 dc.b	32
 dc.b	33
 dc.b	34
 dc.b	35
 dc.b	30
 dc.b	31
 dc.b	32
 dc.b	33
 dc.b	34
 dc.b	35
 dc.b	36
 dc.b	37
 dc.b	38
 dc.b	39
 dc.b	40
 dc.b	41
 dc.b	42
 dc.b	43
 dc.b	44
 dc.b	45
 dc.b	40
 dc.b	41
 dc.b	42
 dc.b	43
 dc.b	44
 dc.b	45
 dc.b	46
 dc.b	47
 dc.b	48
 dc.b	49
 dc.b	50
 dc.b	51
 dc.b	52
 dc.b	53
 dc.b	54
 dc.b	55
 dc.b	50
 dc.b	51
 dc.b	52
 dc.b	53
 dc.b	54
 dc.b	55
 dc.b	56
 dc.b	57
 dc.b	58
 dc.b	59
 dc.b	60
 dc.b	61
 dc.b	62
 dc.b	63
 dc.b	64
 dc.b	65
 dc.b	60
 dc.b	61
 dc.b	62
 dc.b	63
 dc.b	64
 dc.b	65
 dc.b	66
 dc.b	67
 dc.b	68
 dc.b	69
 dc.b	70
 dc.b	71
 dc.b	72
 dc.b	73
 dc.b	74
 dc.b	75
 dc.b	70
 dc.b	71
 dc.b	72
 dc.b	73
 dc.b	74
 dc.b	75
 dc.b	76
 dc.b	77
 dc.b	78
 dc.b	79
 dc.b	80
 dc.b	81
 dc.b	82
 dc.b	83
 dc.b	84
 dc.b	85
 dc.b	80
 dc.b	81
 dc.b	82
 dc.b	83
 dc.b	84
 dc.b	85
 dc.b	86
 dc.b	87
 dc.b	88
 dc.b	89
 dc.b	90
 dc.b	91
 dc.b	92
 dc.b	93
 dc.b	94
 dc.b	95
 dc.b	90
 dc.b	91
 dc.b	92
 dc.b	93
 dc.b	94
 dc.b	95
 dc.b	96
 dc.b	97
 dc.b	98
 dc.b	99
 dc.b	100
 dc.b	101
 dc.b	102
 dc.b	103
 dc.b	104
 dc.b	105
 dc.b	100
 dc.b	101
 dc.b	102
 dc.b	103
 dc.b	104
 dc.b	105
 dc.b	106
 dc.b	107
 dc.b	108
 dc.b	109
 dc.b	110
 dc.b	111
 dc.b	112
 dc.b	113
 dc.b	114
 dc.b	115
 dc.b	110
 dc.b	111
 dc.b	112
 dc.b	113
 dc.b	114
 dc.b	115
 dc.b	116
 dc.b	117
 dc.b	118
 dc.b	119
 dc.b	120
 dc.b	121
 dc.b	122
 dc.b	123
 dc.b	124
 dc.b	125
 dc.b	120
 dc.b	121
 dc.b	122
 dc.b	123
 dc.b	124
 dc.b	125
 dc.b	126
 dc.b	127
 dc.b	128
 dc.b	129
 dc.b	130
 dc.b	131
 dc.b	132
 dc.b	133
 dc.b	134
 dc.b	135
 dc.b	130
 dc.b	131
 dc.b	132
 dc.b	133
 dc.b	134
 dc.b	135
 dc.b	136
 dc.b	137
 dc.b	138
 dc.b	139
 dc.b	140
 dc.b	141
 dc.b	142
 dc.b	143
 dc.b	144
 dc.b	145
 dc.b	140
 dc.b	141
 dc.b	142
 dc.b	143
 dc.b	144
 dc.b	145
 dc.b	146
 dc.b	147
 dc.b	148
 dc.b	149
 dc.b	150
 dc.b	151
 dc.b	152
 dc.b	153
 dc.b	154
 dc.b	155
 dc.b	150
 dc.b	151
 dc.b	152
 dc.b	153
 dc.b	154
 dc.b	155
 dc.b	156
 dc.b	157
 dc.b	158
 dc.b	159
 dc.b	160
 dc.b	161
 dc.b	162
 dc.b	163
 dc.b	164
 dc.b	165
 
message
 dc.b 210,212,195," CHIP IS PRESENT.", $0d, $00
