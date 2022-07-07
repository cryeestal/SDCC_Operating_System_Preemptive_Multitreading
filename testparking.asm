;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Mac OS X x86_64)
;--------------------------------------------------------
	.module testparking
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _timer0_ISR
	.globl _main
	.globl _Car
	.globl _ThreadExit
	.globl _ThreadCreate
	.globl _delay
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _list
	.globl _space
	.globl _curcar
	.globl _thread_num
	.globl _empty
	.globl _full
	.globl _mutex
	.globl _curTime
	.globl _clockd
	.globl _clockc
	.globl _clockb
	.globl _clocka
	.globl _savedSP
	.globl _threadNum
	.globl _threadname
	.globl _masky
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_masky	=	0x0020
_threadname	=	0x0021
_threadNum	=	0x0022
_savedSP	=	0x0023
_clocka	=	0x0027
_clockb	=	0x0028
_clockc	=	0x0029
_clockd	=	0x002a
_curTime	=	0x002b
_mutex	=	0x002c
_full	=	0x002d
_empty	=	0x002e
_thread_num	=	0x002f
_curcar	=	0x0030
_space	=	0x0031
_list	=	0x0033
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Car'
;------------------------------------------------------------
;	testparking.c:15: void Car(void)
;	-----------------------------------------
;	 function Car
;	-----------------------------------------
_Car:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	testparking.c:17: SemaphoreWait(empty);//If a Car sees a parking lot if empty and get a mutex, it can park itself into it.
		0$:
	MOV ACC, _empty 
	JZ 0$ 
	JB ACC.7, 0$ 
	DEC _empty 
;	testparking.c:18: SemaphoreWait(mutex);
		1$:
	MOV ACC, _mutex 
	JZ 1$ 
	JB ACC.7, 1$ 
	DEC _mutex 
;	testparking.c:19: if(curcar == 0b00000000){//代表哪台車parking
	mov	a,_curcar
	jnz	00138$
;	testparking.c:20: list[threadname] = '1';
	mov	a,_threadname
	add	a,#_list
	mov	r0,a
	mov	@r0,#0x31
;	testparking.c:21: curcar = 0b00000001;
	mov	_curcar,#0x01
;	testparking.c:22: if(!space[0]){
	mov	a,_space
	jnz	00104$
;	testparking.c:23: space[0] = '1';
	mov	_space,#0x31
	ljmp	00139$
00104$:
;	testparking.c:24: }else if(!space[1]){
	mov	a,(_space + 0x0001)
	jz	00340$
	ljmp	00139$
00340$:
;	testparking.c:25: space[1] = '1';
	mov	(_space + 0x0001),#0x31
	ljmp	00139$
00138$:
;	testparking.c:29: else if(curcar == 0b00000001){
	mov	a,#0x01
	cjne	a,_curcar,00135$
;	testparking.c:30: list[threadname] = '2';
	mov	a,_threadname
	add	a,#_list
	mov	r0,a
	mov	@r0,#0x32
;	testparking.c:31: curcar = 0b00000011;
	mov	_curcar,#0x03
;	testparking.c:32: if(!space[0]){
	mov	a,_space
	jnz	00109$
;	testparking.c:33: space[0] = '2';
	mov	_space,#0x32
	sjmp	00139$
00109$:
;	testparking.c:34: }else if(!space[1]){
	mov	a,(_space + 0x0001)
	jnz	00139$
;	testparking.c:35: space[1] = '2';
	mov	(_space + 0x0001),#0x32
	sjmp	00139$
00135$:
;	testparking.c:38: else if(curcar == 0b00000011){
	mov	a,#0x03
	cjne	a,_curcar,00132$
;	testparking.c:39: list[threadname] = '3';
	mov	a,_threadname
	add	a,#_list
	mov	r0,a
	mov	@r0,#0x33
;	testparking.c:40: curcar = 0b00000111;
	mov	_curcar,#0x07
;	testparking.c:41: if(!space[0]){
	mov	a,_space
	jnz	00114$
;	testparking.c:42: space[0] = '3';
	mov	_space,#0x33
	sjmp	00139$
00114$:
;	testparking.c:43: }else if(!space[1]){
	mov	a,(_space + 0x0001)
	jnz	00139$
;	testparking.c:44: space[1] = '3';
	mov	(_space + 0x0001),#0x33
	sjmp	00139$
00132$:
;	testparking.c:47: else if(curcar == 0b00000111){
	mov	a,#0x07
	cjne	a,_curcar,00129$
;	testparking.c:48: list[threadname] = '4';
	mov	a,_threadname
	add	a,#_list
	mov	r0,a
	mov	@r0,#0x34
;	testparking.c:49: curcar = 0b00001111;
	mov	_curcar,#0x0f
;	testparking.c:50: if(!space[0]){
	mov	a,_space
	jnz	00119$
;	testparking.c:51: space[0] = '4';
	mov	_space,#0x34
	sjmp	00139$
00119$:
;	testparking.c:52: }else if(!space[1]){
	mov	a,(_space + 0x0001)
	jnz	00139$
;	testparking.c:53: space[1] = '4';
	mov	(_space + 0x0001),#0x34
	sjmp	00139$
00129$:
;	testparking.c:56: else if(curcar == 0b0001111)
	mov	a,#0x0f
	cjne	a,_curcar,00139$
;	testparking.c:58: list[threadname] = '5';
	mov	a,_threadname
	add	a,#_list
	mov	r0,a
	mov	@r0,#0x35
;	testparking.c:59: curcar = 0b00011111;
	mov	_curcar,#0x1f
;	testparking.c:60: if(!space[0]){
	mov	a,_space
	jnz	00124$
;	testparking.c:61: space[0] = '5';
	mov	_space,#0x35
	sjmp	00139$
00124$:
;	testparking.c:62: }else if(!space[1]){
	mov	a,(_space + 0x0001)
	jnz	00139$
;	testparking.c:63: space[1] = '5';
	mov	(_space + 0x0001),#0x35
00139$:
;	testparking.c:67: SBUF = list[threadname]; while(!TI){}TI=0;
	mov	a,_threadname
	add	a,#_list
	mov	r1,a
	mov	_SBUF,@r1
00140$:
;	assignBit
	jbc	_TI,00357$
	sjmp	00140$
00357$:
;	testparking.c:68: SBUF = '>'; while(!TI){}TI = 0;
	mov	_SBUF,#0x3e
00143$:
;	assignBit
	jbc	_TI,00358$
	sjmp	00143$
00358$:
;	testparking.c:69: if(space[0] == list[threadname]){
	mov	a,_threadname
	add	a,#_list
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	cjne	a,_space,00155$
;	testparking.c:70: SBUF = '0';
	mov	_SBUF,#0x30
;	testparking.c:71: while(!TI){}TI = 0;
00146$:
;	assignBit
	jbc	_TI,00156$
	sjmp	00146$
00155$:
;	testparking.c:72: }else if(space[1] == list[threadname]){
	mov	a,_threadname
	add	a,#_list
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	cjne	a,(_space + 0x0001),00156$
;	testparking.c:73: SBUF = '1';
	mov	_SBUF,#0x31
;	testparking.c:74: while(!TI){}TI = 0;
00149$:
;	assignBit
	jbc	_TI,00364$
	sjmp	00149$
00364$:
00156$:
;	testparking.c:77: SemaphoreSignal(mutex);
	INC _mutex 
;	testparking.c:79: delay(10);//thread離開
	mov	dpl,#0x0a
	lcall	_delay
;	testparking.c:81: SemaphoreWait(mutex); //拿key開走
		2$:
	MOV ACC, _mutex 
	JZ 2$ 
	JB ACC.7, 2$ 
	DEC _mutex 
;	testparking.c:82: if(list[threadname] == space[0])
	mov	a,_threadname
	add	a,#_list
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	cjne	a,_space,00178$
;	testparking.c:84: space[0] = 0;
	mov	_space,#0x00
;	testparking.c:85: SBUF = list[threadname];//threadname代表現在是誰在操作 哪台車
	mov	a,_threadname
	add	a,#_list
	mov	r1,a
	mov	_SBUF,@r1
;	testparking.c:86: while(!TI){}TI = 0;
00157$:
;	assignBit
	jbc	_TI,00367$
	sjmp	00157$
00367$:
;	testparking.c:87: SBUF = '~';
	mov	_SBUF,#0x7e
;	testparking.c:88: while(!TI){}TI = 0;
00160$:
;	assignBit
	jbc	_TI,00368$
	sjmp	00160$
00368$:
;	testparking.c:89: SBUF = '0';
	mov	_SBUF,#0x30
;	testparking.c:90: while(!TI){}TI = 0;
00163$:
;	assignBit
	jbc	_TI,00179$
	sjmp	00163$
00178$:
;	testparking.c:94: else if(list[threadname] == space[1])
	mov	a,_threadname
	add	a,#_list
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	cjne	a,(_space + 0x0001),00179$
;	testparking.c:96: space[1] = 0;
	mov	(_space + 0x0001),#0x00
;	testparking.c:97: SBUF = list[threadname];
	mov	a,_threadname
	add	a,#_list
	mov	r1,a
	mov	_SBUF,@r1
;	testparking.c:98: while(!TI){}TI = 0;
00166$:
;	assignBit
	jbc	_TI,00372$
	sjmp	00166$
00372$:
;	testparking.c:99: SBUF = '~';
	mov	_SBUF,#0x7e
;	testparking.c:100: while(!TI){}TI = 0;
00169$:
;	assignBit
	jbc	_TI,00373$
	sjmp	00169$
00373$:
;	testparking.c:101: SBUF = '1';
	mov	_SBUF,#0x31
;	testparking.c:102: while(!TI){}TI = 0;
00172$:
;	assignBit
	jbc	_TI,00374$
	sjmp	00172$
00374$:
00179$:
;	testparking.c:107: SemaphoreSignal(mutex);//車子完成離開
	INC _mutex 
;	testparking.c:108: SemaphoreSignal(empty);
	INC _empty 
;	testparking.c:110: ThreadExit();
;	testparking.c:111: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	testparking.c:114: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	testparking.c:116: TMOD|=0x20;
	orl	_TMOD,#0x20
;	testparking.c:117: TH1=-6;
	mov	_TH1,#0xfa
;	testparking.c:118: SCON=0x50;
	mov	_SCON,#0x50
;	testparking.c:119: TR1=1;
;	assignBit
	setb	_TR1
;	testparking.c:120: curcar=0;
	mov	_curcar,#0x00
;	testparking.c:121: space[0]=0;
	mov	_space,#0x00
;	testparking.c:122: space[1]=0;
	mov	(_space + 0x0001),#0x00
;	testparking.c:123: list[0]=0;
	mov	_list,#0x00
;	testparking.c:124: list[1]=0;
	mov	(_list + 0x0001),#0x00
;	testparking.c:125: list[2]=0;
	mov	(_list + 0x0002),#0x00
;	testparking.c:126: list[3]=0;
	mov	(_list + 0x0003),#0x00
;	testparking.c:127: ThreadCreate(Car);
	mov	dptr,#_Car
	lcall	_ThreadCreate
;	testparking.c:128: ThreadCreate(Car);
	mov	dptr,#_Car
	lcall	_ThreadCreate
;	testparking.c:129: ThreadCreate(Car);
	mov	dptr,#_Car
	lcall	_ThreadCreate
;	testparking.c:130: ThreadCreate(Car);
	mov	dptr,#_Car
	lcall	_ThreadCreate
;	testparking.c:131: ThreadCreate(Car);
	mov	dptr,#_Car
	lcall	_ThreadCreate
;	testparking.c:133: SemaphoreCreate(mutex, 1);
	mov	_mutex,#0x01
;	testparking.c:134: SemaphoreCreate(full, 0);
	mov	_full,#0x00
;	testparking.c:135: SemaphoreCreate(empty, 2);
	mov	_empty,#0x02
;	testparking.c:137: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	testparking.c:139: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	testparking.c:142: __endasm;
	ljmp	_myTimer0Handler
;	testparking.c:143: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	testparking.c:146: void _sdcc_gsinit_startup(void){
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	testparking.c:149: __endasm;
	ljmp	_Bootstrap
;	testparking.c:150: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:151: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	testparking.c:152: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:153: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
