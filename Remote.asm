;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1170 (Feb 16 2022) (MSVC)
; This file was generated Tue Apr 02 13:20:30 2024
;--------------------------------------------------------
$name Remote
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _InitPinADC_PARM_2
	public _main
	public _Timer2_ISR
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _LCDprint2
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _SendATCommand
	public _waitms_or_RI1
	public _RXU1
	public _getstr1
	public _getchar1_with_timeout
	public _getchar1
	public _sendstr1
	public _putchar1
	public _UART1_Init
	public _waitms
	public _Timer3us
	public _InitADC
	public __c51_external_startup
	public _LCDprint_PARM_3
	public _buff
	public _LCDprint2_PARM_3
	public _LCDprint2_PARM_2
	public _LCDprint_PARM_2
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_LCDprint_PARM_2:
	ds 1
_LCDprint2_PARM_2:
	ds 1
_LCDprint2_PARM_3:
	ds 1
_main_pwmR_1_119:
	ds 4
_main_pwmL_1_119:
	ds 4
_main_mode_1_119:
	ds 2
_main_buttonpress_1_119:
	ds 2
_main_JS_1_119:
	ds 8
_main_sloc0_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
_buff:
	ds 20
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_LCDprint_PARM_3:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x002b
	ljmp	_Timer2_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:57: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:60: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:61: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:62: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:64: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:65: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:72: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:73: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:74: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:95: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:96: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:97: while ((CLKSEL & 0x80) == 0);
L002001?:
	mov	a,_CLKSEL
	jnb	acc.7,L002001?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:98: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:99: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:100: while ((CLKSEL & 0x80) == 0);
L002004?:
	mov	a,_CLKSEL
	jnb	acc.7,L002004?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:105: P0MDOUT |= 0x11; // Enable UART0 TX (P0.4) and UART1 TX (P0.0) as push-pull outputs
	orl	_P0MDOUT,#0x11
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:106: P2MDOUT |= 0x01; // P2.0 in push-pull mode
	orl	_P2MDOUT,#0x01
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:107: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:108: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:109: XBR2     = 0x41; // Enable crossbar and uart 1
	mov	_XBR2,#0x41
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:115: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:116: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:117: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:118: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:119: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:120: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:121: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:124: TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:125: CKCON0|=0b_0001_0000;
	orl	_CKCON0,#0x10
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:126: TMR2RL=(-(SYSCLK/(2*DEFAULT_F))); // Initialize reload value
	mov	_TMR2RL,#0xEE
	mov	(_TMR2RL >> 8),#0xF6
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:127: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:128: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:129: TR2=1;         // Start Timer2
	setb	_TR2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:130: EA=1; // Global interrupt enable
	setb	_EA
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:132: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:135: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:137: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:138: ADEN=0; // Disable ADC
	clr	_ADEN
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:143: (0x0 << 0) ; // Accumulate n conversions: 0x0: 1, 0x1:4, 0x2:8, 0x3:16, 0x4:32
	mov	_ADC0CN1,#0x80
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:147: (0x0 << 2); // 0:SYSCLK ADCCLK = SYSCLK. 1:HFOSC0 ADCCLK = HFOSC0.
	mov	_ADC0CF0,#0x20
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:151: (0x1E << 0); // Conversion Tracking Time. Tadtk = ADTK / (Fsarclk)
	mov	_ADC0CF1,#0x1E
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:160: (0x0 << 0) ; // TEMPE. 0: Disable the Temperature Sensor. 1: Enable the Temperature Sensor.
	mov	_ADC0CN0,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:165: (0x1F << 0); // ADPWR. Power Up Delay Time. Tpwrtime = ((4 * (ADPWR + 1)) + 2) / (Fadcclk)
	mov	_ADC0CF2,#0x3F
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:169: (0x0 << 0) ; // ADCM. 0x0: ADBUSY, 0x1: TIMER0, 0x2: TIMER2, 0x3: TIMER3, 0x4: CNVSTR, 0x5: CEX5, 0x6: TIMER4, 0x7: TIMER5, 0x8: CLU0, 0x9: CLU1, 0xA: CLU2, 0xB: CLU3
	mov	_ADC0CN2,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:171: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:179: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:184: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:186: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:187: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:189: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:190: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L004004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L004007?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:192: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L004001?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:193: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:190: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L004004?
L004007?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:195: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:198: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:202: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L005005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L005009?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:203: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L005001?:
	cjne	r6,#0x04,L005018?
L005018?:
	jnc	L005007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L005001?
L005007?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:202: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L005005?
	inc	r5
	sjmp	L005005?
L005009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART1_Init'
;------------------------------------------------------------
;baudrate                  Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:206: void UART1_Init (unsigned long baudrate)
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:208: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:209: SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	mov	_SMOD1,#0x0C
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:210: SCON1 = 0x10;
	mov	_SCON1,#0x10
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:211: SBCON1 =0x00;   // disable baud rate generator
	mov	_SBCON1,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:212: SBRL1 = 0x10000L-((SYSCLK/baudrate)/(12L*2L));
	mov	__divulong_PARM_2,r2
	mov	(__divulong_PARM_2 + 1),r3
	mov	(__divulong_PARM_2 + 2),r4
	mov	(__divulong_PARM_2 + 3),r5
	mov	dptr,#0xA200
	mov	b,#0x4A
	mov	a,#0x04
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	__divulong_PARM_2,#0x18
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	a,#0x01
	subb	a,r4
	clr	a
	subb	a,r5
	mov	_SBRL1,r2
	mov	(_SBRL1 >> 8),r3
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:213: TI1 = 1; // indicate ready for TX
	setb	_TI1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:214: SBCON1 |= 0x40;   // enable baud rate generator
	orl	_SBCON1,#0x40
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:215: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar1'
;------------------------------------------------------------
;c                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:218: void putchar1 (char c) 
;	-----------------------------------------
;	 function putchar1
;	-----------------------------------------
_putchar1:
	mov	r2,dpl
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:220: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:221: while (!TI1);
L007001?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:222: TI1=0;
	jbc	_TI1,L007008?
	sjmp	L007001?
L007008?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:223: SBUF1 = c;
	mov	_SBUF1,r2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:224: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sendstr1'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:227: void sendstr1 (char * s)
;	-----------------------------------------
;	 function sendstr1
;	-----------------------------------------
_sendstr1:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:229: while(*s)
L008001?:
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	jz	L008004?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:231: putchar1(*s);
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_putchar1
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:232: s++;	
	inc	r2
	cjne	r2,#0x00,L008001?
	inc	r3
	sjmp	L008001?
L008004?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1'
;------------------------------------------------------------
;c                         Allocated to registers 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:236: char getchar1 (void)
;	-----------------------------------------
;	 function getchar1
;	-----------------------------------------
_getchar1:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:239: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:240: while (!RI1);
L009001?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:241: RI1=0;
	jbc	_RI1,L009008?
	sjmp	L009001?
L009008?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:243: SCON1&=0b_0011_1111;
	anl	_SCON1,#0x3F
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:244: c = SBUF1;
	mov	dpl,_SBUF1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:245: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:246: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1_with_timeout'
;------------------------------------------------------------
;c                         Allocated to registers 
;timeout                   Allocated to registers r2 r3 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:249: char getchar1_with_timeout (void)
;	-----------------------------------------
;	 function getchar1_with_timeout
;	-----------------------------------------
_getchar1_with_timeout:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:253: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:255: while (!RI1)
	mov	r2,#0x00
	mov	r3,#0x00
L010003?:
	jb	_RI1,L010005?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:257: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:258: Timer3us(20);
	mov	dpl,#0x14
	push	ar2
	push	ar3
	lcall	_Timer3us
	pop	ar3
	pop	ar2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:259: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:260: timeout++;
	inc	r2
	cjne	r2,#0x00,L010012?
	inc	r3
L010012?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:261: if(timeout==25000)
	cjne	r2,#0xA8,L010003?
	cjne	r3,#0x61,L010003?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:263: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:264: return ('\n'); // Timeout after half second
	mov	dpl,#0x0A
	ret
L010005?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:267: RI1=0;
	clr	_RI1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:269: SCON1&=0b_0011_1111;
	anl	_SCON1,#0x3F
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:270: c = SBUF1;
	mov	dpl,_SBUF1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:271: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:272: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getstr1'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;c                         Allocated to registers r5 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:275: void getstr1 (char * s)
;	-----------------------------------------
;	 function getstr1
;	-----------------------------------------
_getstr1:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:279: while(1)
L011004?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:281: c=getchar1_with_timeout();
	push	ar2
	push	ar3
	push	ar4
	lcall	_getchar1_with_timeout
	mov	r5,dpl
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:282: if(c=='\n')
	cjne	r5,#0x0A,L011002?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:284: *s=0;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:285: return;
	ljmp	__gptrput
L011002?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:287: *s=c;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	__gptrput
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:288: s++;
	sjmp	L011004?
;------------------------------------------------------------
;Allocation info for local variables in function 'RXU1'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:293: bit RXU1 (void)
;	-----------------------------------------
;	 function RXU1
;	-----------------------------------------
_RXU1:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:296: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:297: mybit=RI1;
	mov	c,_RI1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:298: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:299: return mybit;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms_or_RI1'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:302: void waitms_or_RI1 (unsigned int ms)
;	-----------------------------------------
;	 function waitms_or_RI1
;	-----------------------------------------
_waitms_or_RI1:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:306: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L013007?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L013011?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:308: for (k=0; k<4; k++)
	mov	r6,#0x00
L013003?:
	cjne	r6,#0x04,L013019?
L013019?:
	jnc	L013009?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:310: if(RXU1()) return;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_RXU1
	clr	a
	rlc	a
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	jz	L013002?
	ret
L013002?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:311: Timer3us(250);
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:308: for (k=0; k<4; k++)
	inc	r6
	sjmp	L013003?
L013009?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:306: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L013007?
	inc	r5
	sjmp	L013007?
L013011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SendATCommand'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:316: void SendATCommand (char * s)
;	-----------------------------------------
;	 function SendATCommand
;	-----------------------------------------
_SendATCommand:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:318: printf("Command: %s", s);
	push	ar2
	push	ar3
	push	ar4
	push	ar2
	push	ar3
	push	ar4
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:319: P1_6=0; // 'set' pin to 0 is 'AT' mode.
	clr	_P1_6
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:320: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:321: sendstr1(s);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	_sendstr1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:322: getstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_getstr1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:323: waitms(10);
	mov	dptr,#0x000A
	lcall	_waitms
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:324: P1_6=1; // 'set' pin to 1 is normal operation mode.
	setb	_P1_6
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:325: printf("Response: %s\r\n", buff);
	mov	a,#_buff
	push	acc
	mov	a,#(_buff >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:333: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:335: LCD_E=1;
	setb	_P2_0
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:336: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:337: LCD_E=0;
	clr	_P2_0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:340: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:343: ACC=x; //Send high nible
	mov	_ACC,r2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:344: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P1_0,c
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:345: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P1_1,c
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:346: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P1_2,c
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:347: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P1_3,c
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:348: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:349: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
	pop	ar2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:350: ACC=x; //Send low nible
	mov	_ACC,r2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:351: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P1_0,c
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:352: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P1_1,c
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:353: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P1_2,c
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:354: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P1_3,c
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:355: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:358: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:360: LCD_RS=1;
	setb	_P1_7
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:361: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:362: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:365: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:367: LCD_RS=0;
	clr	_P1_7
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:368: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:369: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:372: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:374: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_0
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:376: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:378: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:379: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:380: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:383: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:384: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:385: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:386: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:389: void LCDprint(char * string, unsigned char line, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:393: WriteCommand(line==2?0xc0:0x80);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L020013?
	mov	r5,#0xC0
	sjmp	L020014?
L020013?:
	mov	r5,#0x80
L020014?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:394: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:395: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L020003?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L020006?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L020003?
	inc	r6
	sjmp	L020003?
L020006?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:396: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_3,L020011?
	mov	ar2,r5
	mov	ar3,r6
L020007?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L020011?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L020007?
	inc	r3
	sjmp	L020007?
L020011?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint2'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint2_PARM_2'
;col                       Allocated with name '_LCDprint2_PARM_3'
;string                    Allocated to registers r2 r3 r4 
;j                         Allocated to registers r5 r6 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:399: void LCDprint2(char * string, unsigned char line, unsigned char col)
;	-----------------------------------------
;	 function LCDprint2
;	-----------------------------------------
_LCDprint2:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:403: WriteCommand(line==2?0xc0|col:0x80|col); // Move cursor to line and column
	mov	a,#0x02
	cjne	a,_LCDprint2_PARM_2,L021007?
	mov	a,#0xC0
	orl	a,_LCDprint2_PARM_3
	mov	r5,a
	sjmp	L021008?
L021007?:
	mov	a,#0x80
	orl	a,_LCDprint2_PARM_3
	mov	r5,a
L021008?:
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	lcall	_WriteCommand
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:404: for(j=0; string[j]!=0; j++) WriteData(string[j]); // Write the message
	mov	r5,#0x00
	mov	r6,#0x00
L021001?:
	mov	a,r5
	add	a,r2
	mov	r7,a
	mov	a,r6
	addc	a,r3
	mov	r0,a
	mov	ar1,r4
	mov	dpl,r7
	mov	dph,r0
	mov	b,r1
	lcall	__gptrget
	mov	r7,a
	jz	L021005?
	mov	dpl,r7
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_WriteData
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r5
	cjne	r5,#0x00,L021001?
	inc	r6
	sjmp	L021001?
L021005?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pin_num                   Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:412: void InitPinADC (unsigned char portno, unsigned char pin_num)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:416: mask=1<<pin_num;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L022013?
L022011?:
	add	a,acc
L022013?:
	djnz	b,L022011?
	mov	r3,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:418: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:419: switch (portno)
	cjne	r2,#0x00,L022014?
	sjmp	L022001?
L022014?:
	cjne	r2,#0x01,L022015?
	sjmp	L022002?
L022015?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:421: case 0:
	cjne	r2,#0x02,L022005?
	sjmp	L022003?
L022001?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:422: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:423: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:424: break;
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:425: case 1:
	sjmp	L022005?
L022002?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:426: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:427: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:428: break;
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:429: case 2:
	sjmp	L022005?
L022003?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:430: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:431: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:435: }
L022005?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:436: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:439: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:442: ADINT = 0;
	clr	_ADINT
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:443: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:444: while (!ADINT); // Wait for conversion to complete
L023001?:
	jnb	_ADINT,L023001?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:445: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:448: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:450: return ((ADC_at_Pin(pin)*VDD)/16383.0);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x837B
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:453: void Timer2_ISR (void) interrupt INTERRUPT_TIMER2
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:455: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:456: Speaker=!Speaker;
	cpl	_P3_0
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;pwmR                      Allocated with name '_main_pwmR_1_119'
;pwmL                      Allocated with name '_main_pwmL_1_119'
;mode                      Allocated with name '_main_mode_1_119'
;buttonpress               Allocated with name '_main_buttonpress_1_119'
;j                         Allocated to registers r4 r5 
;JS                        Allocated with name '_main_JS_1_119'
;x                         Allocated to registers 
;f                         Allocated to registers 
;sloc0                     Allocated with name '_main_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:460: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:464: int mode=1;
	mov	_main_mode_1_119,#0x01
	clr	a
	mov	(_main_mode_1_119 + 1),a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:465: int buttonpress=0;
	clr	a
	mov	_main_buttonpress_1_119,a
	mov	(_main_buttonpress_1_119 + 1),a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:476: LCD_4BIT();
	lcall	_LCD_4BIT
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:478: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:479: printf("\r\n Project2_Test \r\n");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:480: UART1_Init(9600);
	mov	dptr,#0x2580
	clr	a
	mov	b,a
	lcall	_UART1_Init
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:483: InitPinADC(2,3);
	mov	_InitPinADC_PARM_2,#0x03
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:484: InitPinADC(2,2);
	mov	_InitPinADC_PARM_2,#0x02
	mov	dpl,#0x02
	lcall	_InitPinADC
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:485: InitADC();
	lcall	_InitADC
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:488: SendATCommand("AT+DVIDBABA\r\n");  
	mov	dptr,#__str_3
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:491: SendATCommand("AT+VER\r\n");
	mov	dptr,#__str_4
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:492: SendATCommand("AT+BAUD\r\n");
	mov	dptr,#__str_5
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:493: SendATCommand("AT+RFID\r\n");
	mov	dptr,#__str_6
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:494: SendATCommand("AT+DVID\r\n");
	mov	dptr,#__str_7
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:495: SendATCommand("AT+RFC\r\n");
	mov	dptr,#__str_8
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:496: SendATCommand("AT+POWE\r\n");
	mov	dptr,#__str_9
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:497: SendATCommand("AT+CLSS\r\n");
	mov	dptr,#__str_10
	mov	b,#0x80
	lcall	_SendATCommand
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:499: printf("\r\Press and hold the BOOT button to transmit.\r\n");
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:501: LCDprint("Remote Test",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_12
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:503: while(1)
L026040?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:505: JS[0] = Volts_at_Pin(QFP32_MUX_P2_2); //VRX
	mov	dpl,#0x0F
	lcall	_Volts_at_Pin
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	_main_JS_1_119,r6
	mov	(_main_JS_1_119 + 1),r7
	mov	(_main_JS_1_119 + 2),r2
	mov	(_main_JS_1_119 + 3),r3
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:506: JS[1] = Volts_at_Pin(QFP32_MUX_P2_3); //VRY	
	mov	dpl,#0x10
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r6,b
	mov	r7,a
	mov	(_main_JS_1_119 + 0x0004),r2
	mov	((_main_JS_1_119 + 0x0004) + 1),r3
	mov	((_main_JS_1_119 + 0x0004) + 2),r6
	mov	((_main_JS_1_119 + 0x0004) + 3),r7
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:515: if (JS[0]>1.75)//going forward
	clr	a
	push	acc
	push	acc
	mov	a,#0xE0
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_JS_1_119
	mov	dph,(_main_JS_1_119 + 1)
	mov	b,(_main_JS_1_119 + 2)
	mov	a,(_main_JS_1_119 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L026066?
	ljmp	L026023?
L026066?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:517: TR2=0;
	clr	_TR2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:518: mode=1;
	mov	_main_mode_1_119,#0x01
	clr	a
	mov	(_main_mode_1_119 + 1),a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:519: if(JS[1]>1.75){
	clr	a
	push	acc
	push	acc
	mov	a,#0xE0
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L026067?
	ljmp	L026005?
L026067?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:520: pwmL=(JS[1]-1.72)/0.01604;
	mov	a,#0xF6
	push	acc
	mov	a,#0x28
	push	acc
	mov	a,#0xDC
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r6
	mov	a,r7
	lcall	___fsdiv
	mov	_main_pwmL_1_119,dpl
	mov	(_main_pwmL_1_119 + 1),dph
	mov	(_main_pwmL_1_119 + 2),b
	mov	(_main_pwmL_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:521: pwmR=100.0-pwmL;
	push	_main_pwmL_1_119
	push	(_main_pwmL_1_119 + 1)
	push	(_main_pwmL_1_119 + 2)
	push	(_main_pwmL_1_119 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	_main_pwmR_1_119,dpl
	mov	(_main_pwmR_1_119 + 1),dph
	mov	(_main_pwmR_1_119 + 2),b
	mov	(_main_pwmR_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:522: LCDprint("Turning right",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_13
	mov	b,#0x80
	lcall	_LCDprint
	ljmp	L026024?
L026005?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:523: }else if (JS[1]<1.6){
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r6
	jnz	L026068?
	ljmp	L026002?
L026068?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:524: pwmR=100.0-(JS[1]-0.01604)/0.01604;
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fssub
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsdiv
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	_main_pwmR_1_119,dpl
	mov	(_main_pwmR_1_119 + 1),dph
	mov	(_main_pwmR_1_119 + 2),b
	mov	(_main_pwmR_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:525: pwmL=100.0-pwmR;
	push	_main_pwmR_1_119
	push	(_main_pwmR_1_119 + 1)
	push	(_main_pwmR_1_119 + 2)
	push	(_main_pwmR_1_119 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	_main_pwmL_1_119,dpl
	mov	(_main_pwmL_1_119 + 1),dph
	mov	(_main_pwmL_1_119 + 2),b
	mov	(_main_pwmL_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:526: LCDprint("Turning left",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_14
	mov	b,#0x80
	lcall	_LCDprint
	ljmp	L026024?
L026002?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:528: pwmR=(JS[0]-1.70)/0.01604;
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	mov	a,#0xD9
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_JS_1_119
	mov	dph,(_main_JS_1_119 + 1)
	mov	b,(_main_JS_1_119 + 2)
	mov	a,(_main_JS_1_119 + 3)
	lcall	___fssub
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsdiv
	mov	_main_pwmR_1_119,dpl
	mov	(_main_pwmR_1_119 + 1),dph
	mov	(_main_pwmR_1_119 + 2),b
	mov	(_main_pwmR_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:529: pwmL=(JS[0]-1.70)/0.01604;
	mov	a,#0x9A
	push	acc
	mov	a,#0x99
	push	acc
	mov	a,#0xD9
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_JS_1_119
	mov	dph,(_main_JS_1_119 + 1)
	mov	b,(_main_JS_1_119 + 2)
	mov	a,(_main_JS_1_119 + 3)
	lcall	___fssub
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r2
	mov	a,r3
	lcall	___fsdiv
	mov	_main_pwmL_1_119,dpl
	mov	(_main_pwmL_1_119 + 1),dph
	mov	(_main_pwmL_1_119 + 2),b
	mov	(_main_pwmL_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:530: LCDprint("Going forward",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_15
	mov	b,#0x80
	lcall	_LCDprint
	ljmp	L026024?
L026023?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:533: }else if (JS[0]<1.6) //for going backwards
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_JS_1_119
	mov	dph,(_main_JS_1_119 + 1)
	mov	b,(_main_JS_1_119 + 2)
	mov	a,(_main_JS_1_119 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L026069?
	ljmp	L026020?
L026069?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:535: TR2=1;
	setb	_TR2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:536: TMR2RL=0x10000L-x;
	mov	_TMR2RL,#0xB0
	mov	(_TMR2RL >> 8),#0xB9
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:537: mode=0;
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:538: if(JS[1]>1.75){
	clr	a
	mov	_main_mode_1_119,a
	mov	(_main_mode_1_119 + 1),a
	push	acc
	push	acc
	mov	a,#0xE0
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L026070?
	ljmp	L026011?
L026070?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:539: pwmL=(JS[1]-1.72)/0.01604;
	mov	a,#0xF6
	push	acc
	mov	a,#0x28
	push	acc
	mov	a,#0xDC
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_pwmL_1_119,dpl
	mov	(_main_pwmL_1_119 + 1),dph
	mov	(_main_pwmL_1_119 + 2),b
	mov	(_main_pwmL_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:540: pwmR=100.0-pwmL;
	push	_main_pwmL_1_119
	push	(_main_pwmL_1_119 + 1)
	push	(_main_pwmL_1_119 + 2)
	push	(_main_pwmL_1_119 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	_main_pwmR_1_119,dpl
	mov	(_main_pwmR_1_119 + 1),dph
	mov	(_main_pwmR_1_119 + 2),b
	mov	(_main_pwmR_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:541: LCDprint("Turning right",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_13
	mov	b,#0x80
	lcall	_LCDprint
	ljmp	L026024?
L026011?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:542: }else if (JS[1]<1.6){
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L026071?
	ljmp	L026008?
L026071?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:543: pwmR=100.0-(JS[1]-0.01604)/0.01604;
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	_main_pwmR_1_119,dpl
	mov	(_main_pwmR_1_119 + 1),dph
	mov	(_main_pwmR_1_119 + 2),b
	mov	(_main_pwmR_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:544: pwmL=100.0-pwmR;
	push	_main_pwmR_1_119
	push	(_main_pwmR_1_119 + 1)
	push	(_main_pwmR_1_119 + 2)
	push	(_main_pwmR_1_119 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	_main_pwmL_1_119,dpl
	mov	(_main_pwmL_1_119 + 1),dph
	mov	(_main_pwmL_1_119 + 2),b
	mov	(_main_pwmL_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:545: LCDprint("Turning left",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_14
	mov	b,#0x80
	lcall	_LCDprint
	ljmp	L026024?
L026008?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:547: pwmR=(1.7-JS[0])/0.01604;
	push	_main_JS_1_119
	push	(_main_JS_1_119 + 1)
	push	(_main_JS_1_119 + 2)
	push	(_main_JS_1_119 + 3)
	mov	dptr,#0x999A
	mov	b,#0xD9
	mov	a,#0x3F
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_pwmR_1_119,dpl
	mov	(_main_pwmR_1_119 + 1),dph
	mov	(_main_pwmR_1_119 + 2),b
	mov	(_main_pwmR_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:548: pwmL=(1.7-JS[0])/0.01604;
	push	_main_JS_1_119
	push	(_main_JS_1_119 + 1)
	push	(_main_JS_1_119 + 2)
	push	(_main_JS_1_119 + 3)
	mov	dptr,#0x999A
	mov	b,#0xD9
	mov	a,#0x3F
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_pwmL_1_119,dpl
	mov	(_main_pwmL_1_119 + 1),dph
	mov	(_main_pwmL_1_119 + 2),b
	mov	(_main_pwmL_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:549: LCDprint("Reversing",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_16
	mov	b,#0x80
	lcall	_LCDprint
	ljmp	L026024?
L026020?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:552: }else if(JS[1]>1.75){
	clr	a
	push	acc
	push	acc
	mov	a,#0xE0
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L026072?
	ljmp	L026017?
L026072?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:554: pwmL=(JS[1]-1.72)/0.01604;
	mov	a,#0xF6
	push	acc
	mov	a,#0x28
	push	acc
	mov	a,#0xDC
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	_main_pwmL_1_119,dpl
	mov	(_main_pwmL_1_119 + 1),dph
	mov	(_main_pwmL_1_119 + 2),b
	mov	(_main_pwmL_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:555: pwmR=100.0-pwmL;
	push	_main_pwmL_1_119
	push	(_main_pwmL_1_119 + 1)
	push	(_main_pwmL_1_119 + 2)
	push	(_main_pwmL_1_119 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	_main_pwmR_1_119,dpl
	mov	(_main_pwmR_1_119 + 1),dph
	mov	(_main_pwmR_1_119 + 2),b
	mov	(_main_pwmR_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:556: LCDprint("Turning right",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_13
	mov	b,#0x80
	lcall	_LCDprint
	ljmp	L026024?
L026017?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:558: }else if (JS[1]<1.6){
	mov	a,#0xCD
	push	acc
	mov	a,#0xCC
	push	acc
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L026073?
	ljmp	L026014?
L026073?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:559: pwmR=100.0-(JS[1]-0.041)/0.01604;
	mov	a,#0x9E
	push	acc
	mov	a,#0xEF
	push	acc
	mov	a,#0x27
	push	acc
	mov	a,#0x3D
	push	acc
	mov	dpl,(_main_JS_1_119 + 0x0004)
	mov	dph,((_main_JS_1_119 + 0x0004) + 1)
	mov	b,((_main_JS_1_119 + 0x0004) + 2)
	mov	a,((_main_JS_1_119 + 0x0004) + 3)
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0x51
	push	acc
	mov	a,#0x66
	push	acc
	mov	a,#0x83
	push	acc
	mov	a,#0x3C
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	_main_pwmR_1_119,dpl
	mov	(_main_pwmR_1_119 + 1),dph
	mov	(_main_pwmR_1_119 + 2),b
	mov	(_main_pwmR_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:560: pwmL=100.0-pwmR;
	push	_main_pwmR_1_119
	push	(_main_pwmR_1_119 + 1)
	push	(_main_pwmR_1_119 + 2)
	push	(_main_pwmR_1_119 + 3)
	mov	dptr,#0x0000
	mov	b,#0xC8
	mov	a,#0x42
	lcall	___fssub
	mov	_main_pwmL_1_119,dpl
	mov	(_main_pwmL_1_119 + 1),dph
	mov	(_main_pwmL_1_119 + 2),b
	mov	(_main_pwmL_1_119 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:561: LCDprint("Turning left",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_14
	mov	b,#0x80
	lcall	_LCDprint
	sjmp	L026024?
L026014?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:564: pwmR=0.0;
	mov	_main_pwmR_1_119,#0x00
	mov	(_main_pwmR_1_119 + 1),#0x00
	mov	(_main_pwmR_1_119 + 2),#0x00
	mov	(_main_pwmR_1_119 + 3),#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:565: pwmL=0.0;
	mov	_main_pwmL_1_119,#0x00
	mov	(_main_pwmL_1_119 + 1),#0x00
	mov	(_main_pwmL_1_119 + 2),#0x00
	mov	(_main_pwmL_1_119 + 3),#0x00
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:566: LCDprint("At rest",1,1);
	mov	_LCDprint_PARM_2,#0x01
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_17
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:567: TR2=0;
	clr	_TR2
L026024?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:571: if(pwmR>100){
	clr	a
	push	acc
	push	acc
	mov	a,#0xC8
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,_main_pwmR_1_119
	mov	dph,(_main_pwmR_1_119 + 1)
	mov	b,(_main_pwmR_1_119 + 2)
	mov	a,(_main_pwmR_1_119 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L026026?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:572: pwmR=100.0;
	mov	_main_pwmR_1_119,#0x00
	mov	(_main_pwmR_1_119 + 1),#0x00
	mov	(_main_pwmR_1_119 + 2),#0xC8
	mov	(_main_pwmR_1_119 + 3),#0x42
L026026?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:574: if(pwmL>100){
	clr	a
	push	acc
	push	acc
	mov	a,#0xC8
	push	acc
	mov	a,#0x42
	push	acc
	mov	dpl,_main_pwmL_1_119
	mov	dph,(_main_pwmL_1_119 + 1)
	mov	b,(_main_pwmL_1_119 + 2)
	mov	a,(_main_pwmL_1_119 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L026028?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:575: pwmL=100.0;
	mov	_main_pwmL_1_119,#0x00
	mov	(_main_pwmL_1_119 + 1),#0x00
	mov	(_main_pwmL_1_119 + 2),#0xC8
	mov	(_main_pwmL_1_119 + 3),#0x42
L026028?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:577: if (pwmR<0){
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_pwmR_1_119
	mov	dph,(_main_pwmR_1_119 + 1)
	mov	b,(_main_pwmR_1_119 + 2)
	mov	a,(_main_pwmR_1_119 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L026030?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:578: pwmR=0.0;
	mov	_main_pwmR_1_119,#0x00
	mov	(_main_pwmR_1_119 + 1),#0x00
	mov	(_main_pwmR_1_119 + 2),#0x00
	mov	(_main_pwmR_1_119 + 3),#0x00
L026030?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:580: if (pwmL<0){
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_pwmL_1_119
	mov	dph,(_main_pwmL_1_119 + 1)
	mov	b,(_main_pwmL_1_119 + 2)
	mov	a,(_main_pwmL_1_119 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L026032?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:581: pwmL=0.0;
	mov	_main_pwmL_1_119,#0x00
	mov	(_main_pwmL_1_119 + 1),#0x00
	mov	(_main_pwmL_1_119 + 2),#0x00
	mov	(_main_pwmL_1_119 + 3),#0x00
L026032?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:584: printf("mode:%d pwmR:%.0f pwmL: %.0f  \r\n",mode,pwmR,pwmL);
	push	_main_pwmL_1_119
	push	(_main_pwmL_1_119 + 1)
	push	(_main_pwmL_1_119 + 2)
	push	(_main_pwmL_1_119 + 3)
	push	_main_pwmR_1_119
	push	(_main_pwmR_1_119 + 1)
	push	(_main_pwmR_1_119 + 2)
	push	(_main_pwmR_1_119 + 3)
	push	_main_mode_1_119
	push	(_main_mode_1_119 + 1)
	mov	a,#__str_18
	push	acc
	mov	a,#(__str_18 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf3
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:585: sprintf(buff, "pwmR: %.0f pwmL: %.0f \r\n", mode, pwmR,pwmL);
	push	_main_pwmL_1_119
	push	(_main_pwmL_1_119 + 1)
	push	(_main_pwmL_1_119 + 2)
	push	(_main_pwmL_1_119 + 3)
	push	_main_pwmR_1_119
	push	(_main_pwmR_1_119 + 1)
	push	(_main_pwmR_1_119 + 2)
	push	(_main_pwmR_1_119 + 3)
	push	_main_mode_1_119
	push	(_main_mode_1_119 + 1)
	mov	a,#__str_19
	push	acc
	mov	a,#(__str_19 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_buff
	push	acc
	mov	a,#(_buff >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf0
	mov	sp,a
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:586: sendstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_sendstr1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:587: waitms_or_RI1(200);
	mov	dptr,#0x00C8
	lcall	_waitms_or_RI1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:589: if(RXU1())
	lcall	_RXU1
	jnc	L026034?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:591: getstr1(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_getstr1
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:593: TR2=0; // Stop timer 2
	clr	_TR2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:595: TMR2RL=0x10000L-x; // Change reload value for new frequency
	mov	_TMR2RL,#0xB0
	mov	(_TMR2RL >> 8),#0xB9
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:596: TR2=1; // Start timer 2
	setb	_TR2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:597: printf("RX: %s\r\n", buff);
	mov	a,#_buff
	push	acc
	mov	a,#(_buff >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_20
	push	acc
	mov	a,#(__str_20 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
L026034?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:599: LCDprint("ooooooo",2,1);
	mov	_LCDprint_PARM_2,#0x02
	setb	_LCDprint_PARM_3
	mov	dptr,#__str_21
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:600: if(buttonpress > 7){
	clr	c
	mov	a,#0x07
	subb	a,_main_buttonpress_1_119
	clr	a
	xrl	a,#0x80
	mov	b,(_main_buttonpress_1_119 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	L026036?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:601: buttonpress = 0;
	clr	a
	mov	_main_buttonpress_1_119,a
	mov	(_main_buttonpress_1_119 + 1),a
L026036?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:603: if (P3_1 == 0){
	jb	_P3_1,L026065?
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:604: buttonpress++;
	inc	_main_buttonpress_1_119
	clr	a
	cjne	a,_main_buttonpress_1_119,L026081?
	inc	(_main_buttonpress_1_119 + 1)
L026081?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:606: for(j = 1; j<buttonpress+1; j++){
L026065?:
	mov	a,#0x01
	add	a,_main_buttonpress_1_119
	mov	r2,a
	clr	a
	addc	a,(_main_buttonpress_1_119 + 1)
	mov	r3,a
	mov	r4,#0x01
	mov	r5,#0x00
L026042?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jc	L026082?
	ljmp	L026040?
L026082?:
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:607: LCDprint("O",2,j);
	mov	a,r4
	orl	a,r5
	add	a,#0xff
	mov	_LCDprint_PARM_3,c
	mov	_LCDprint_PARM_2,#0x02
	mov	dptr,#__str_22
	mov	b,#0x80
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_LCDprint
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\mgjin\Documents\UBC\Year 2\ELEC 291\Project2\ELEC291_Project2\Remote.c:606: for(j = 1; j<buttonpress+1; j++){
	inc	r4
	cjne	r4,#0x00,L026042?
	inc	r5
	sjmp	L026042?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Command: %s'
	db 0x00
__str_1:
	db 'Response: %s'
	db 0x0D
	db 0x0A
	db 0x00
__str_2:
	db 0x0D
	db 0x0A
	db ' Project2_Test '
	db 0x0D
	db 0x0A
	db 0x00
__str_3:
	db 'AT+DVIDBABA'
	db 0x0D
	db 0x0A
	db 0x00
__str_4:
	db 'AT+VER'
	db 0x0D
	db 0x0A
	db 0x00
__str_5:
	db 'AT+BAUD'
	db 0x0D
	db 0x0A
	db 0x00
__str_6:
	db 'AT+RFID'
	db 0x0D
	db 0x0A
	db 0x00
__str_7:
	db 'AT+DVID'
	db 0x0D
	db 0x0A
	db 0x00
__str_8:
	db 'AT+RFC'
	db 0x0D
	db 0x0A
	db 0x00
__str_9:
	db 'AT+POWE'
	db 0x0D
	db 0x0A
	db 0x00
__str_10:
	db 'AT+CLSS'
	db 0x0D
	db 0x0A
	db 0x00
__str_11:
	db 0x0D
	db 'Press and hold the BOOT button to transmit.'
	db 0x0D
	db 0x0A
	db 0x00
__str_12:
	db 'Remote Test'
	db 0x00
__str_13:
	db 'Turning right'
	db 0x00
__str_14:
	db 'Turning left'
	db 0x00
__str_15:
	db 'Going forward'
	db 0x00
__str_16:
	db 'Reversing'
	db 0x00
__str_17:
	db 'At rest'
	db 0x00
__str_18:
	db 'mode:%d pwmR:%.0f pwmL: %.0f  '
	db 0x0D
	db 0x0A
	db 0x00
__str_19:
	db 'pwmR: %.0f pwmL: %.0f '
	db 0x0D
	db 0x0A
	db 0x00
__str_20:
	db 'RX: %s'
	db 0x0D
	db 0x0A
	db 0x00
__str_21:
	db 'ooooooo'
	db 0x00
__str_22:
	db 'O'
	db 0x00

	CSEG

end
