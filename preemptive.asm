;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Mac OS X x86_64)
;--------------------------------------------------------
	.module preemptive
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
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
	.globl _delay
	.globl _now
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
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
	.area	OSEG    (OVR,DATA)
_ThreadCreate_cnt_65537_22	=	0x003a
_ThreadCreate_temp_65537_22	=	0x003b
_ThreadCreate_tempword_65537_22	=	0x003c
_ThreadCreate_ptr_65538_31	=	0x003d
_ThreadCreate_ACCnow_65539_32	=	0x003e
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;n                         Allocated to registers r7 
;------------------------------------------------------------
;	preemptive.c:18: void delay(unsigned char n){
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,dpl
;	preemptive.c:19: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:20: if(threadname == 0){
	mov	a,_threadname
;	preemptive.c:21: clocka += 1/2 + n/8 ;
	jnz	00110$
	mov	ar5,r7
	mov	r6,a
	mov	__divsint_PARM_2,#0x08
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r6
	mov	dpl,r5
	mov	dph,r6
	lcall	__divsint
	mov	r5,dpl
	mov	r6,_clocka
	mov	a,r5
	add	a,r6
	mov	_clocka,a
	sjmp	00111$
00110$:
;	preemptive.c:22: }else if(threadname == 1){
	mov	a,#0x01
	cjne	a,_threadname,00107$
;	preemptive.c:23: clockb += 1/2 + n/8 ;
	mov	ar5,r7
	mov	r6,#0x00
	mov	__divsint_PARM_2,#0x08
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r6
	mov	dpl,r5
	mov	dph,r6
	lcall	__divsint
	mov	r5,dpl
	mov	r6,_clockb
	mov	a,r5
	add	a,r6
	mov	_clockb,a
	sjmp	00111$
00107$:
;	preemptive.c:24: }else if(threadname == 2){
	mov	a,#0x02
	cjne	a,_threadname,00104$
;	preemptive.c:25: clockc += 1/2 + n/8 ;
	mov	ar5,r7
	mov	r6,#0x00
	mov	__divsint_PARM_2,#0x08
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r6
	mov	dpl,r5
	mov	dph,r6
	lcall	__divsint
	mov	r5,dpl
	mov	r6,_clockc
	mov	a,r5
	add	a,r6
	mov	_clockc,a
	sjmp	00111$
00104$:
;	preemptive.c:26: }else if(threadname == 3){
	mov	a,#0x03
	cjne	a,_threadname,00111$
;	preemptive.c:27: clockd += 1/2 + n/8 ;
	mov	r6,#0x00
	mov	__divsint_PARM_2,#0x08
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r6
	mov	dpl,r7
	mov	dph,r6
	lcall	__divsint
	mov	r6,dpl
	mov	r7,_clockd
	mov	a,r6
	add	a,r7
	mov	_clockd,a
00111$:
;	preemptive.c:29: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:30: ThreadYield();
;	preemptive.c:31: }
	ljmp	_ThreadYield
;------------------------------------------------------------
;Allocation info for local variables in function 'now'
;------------------------------------------------------------
;	preemptive.c:33: unsigned char now(void){
;	-----------------------------------------
;	 function now
;	-----------------------------------------
_now:
;	preemptive.c:34: return curTime;
	mov	dpl,_curTime
;	preemptive.c:35: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:92: void Bootstrap(void){
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
;	preemptive.c:94: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:95: masky = 0;//tread pool
	mov	_masky,#0x00
;	preemptive.c:96: threadname = 0;//threadNum=0
	mov	_threadname,#0x00
;	preemptive.c:97: TMOD = 0; // timer 0 mode 0
	mov	_TMOD,#0x00
;	preemptive.c:98: IE = 0x82; // enable timer0 interrupt
	mov	_IE,#0x82
;	preemptive.c:99: TR0 = 1; // start runningtimer0	
;	assignBit
	setb	_TR0
;	preemptive.c:101: curTime = 0;//now
	mov	_curTime,#0x00
;	preemptive.c:102: clocka = 0;//delay循環
	mov	_clocka,#0x00
;	preemptive.c:103: clockb = 0;
	mov	_clockb,#0x00
;	preemptive.c:104: clockc = 0;
	mov	_clockc,#0x00
;	preemptive.c:105: clockd = 0;
	mov	_clockd,#0x00
;	preemptive.c:108: SemaphoreCreate(thread_num, 4);//count thread number only 4//有點怪
	mov	_thread_num,#0x04
;	preemptive.c:109: SemaphoreCreate(mutex, 1);
	mov	_mutex,#0x01
;	preemptive.c:111: SemaphoreCreate(empty, 2);
	mov	_empty,#0x02
;	preemptive.c:112: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:115: ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
;	preemptive.c:116: RESTORESTATE;
	mov	a,_threadname
	add	a,#_savedSP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:117: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;cnt                       Allocated with name '_ThreadCreate_cnt_65537_22'
;temp                      Allocated with name '_ThreadCreate_temp_65537_22'
;tempword                  Allocated with name '_ThreadCreate_tempword_65537_22'
;ptr                       Allocated with name '_ThreadCreate_ptr_65538_31'
;ACCnow                    Allocated with name '_ThreadCreate_ACCnow_65539_32'
;------------------------------------------------------------
;	preemptive.c:125: ThreadID ThreadCreate(FunctionPtr fp){
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:126: SemaphoreWait(thread_num);//if threadnumber<=4 create newthread
		0$:
	MOV ACC, _thread_num 
	JZ 0$ 
	JB ACC.7, 0$ 
	DEC _thread_num 
;	preemptive.c:127: EA = 0; 
;	assignBit
	clr	_EA
;	preemptive.c:128: __data __at(0x3A) ThreadID cnt = 0;
;	preemptive.c:129: __data __at(0x3B) char temp = 0;
;	preemptive.c:130: __data __at(0x3C) char tempword = 0;
;	preemptive.c:132: if(!(masky & 0x01)){//no 1
	clr	a
	mov	_ThreadCreate_cnt_65537_22,a
	mov	_ThreadCreate_temp_65537_22,a
	mov	_ThreadCreate_tempword_65537_22,a
	mov	a,_masky
	jb	acc.0,00110$
;	preemptive.c:133: masky = masky | 0x01;
	orl	_masky,#0x01
;	preemptive.c:134: cnt = 0;//threadid
	mov	_ThreadCreate_cnt_65537_22,#0x00
	sjmp	00111$
00110$:
;	preemptive.c:135: }else if(!(masky & 0x02)){
	mov	a,_masky
	jb	acc.1,00107$
;	preemptive.c:136: masky = masky | 0x02;
	orl	_masky,#0x02
;	preemptive.c:137: cnt = 1;
	mov	_ThreadCreate_cnt_65537_22,#0x01
	sjmp	00111$
00107$:
;	preemptive.c:138: }else if(!(masky & 0x04)){
	mov	a,_masky
	jb	acc.2,00104$
;	preemptive.c:139: masky = masky | 0x04;
	orl	_masky,#0x04
;	preemptive.c:140: cnt = 2;
	mov	_ThreadCreate_cnt_65537_22,#0x02
	sjmp	00111$
00104$:
;	preemptive.c:141: }else if(!(masky & 0x08)){
	mov	a,_masky
	jb	acc.3,00111$
;	preemptive.c:142: masky = masky | 0x08;
	orl	_masky,#0x08
;	preemptive.c:143: cnt=3;
	mov	_ThreadCreate_cnt_65537_22,#0x03
00111$:
;	preemptive.c:146: if(cnt == 0){
	mov	a,_ThreadCreate_cnt_65537_22
;	preemptive.c:147: temp = 0x3F;
;	preemptive.c:148: tempword = 0b00000000;
	jnz	00121$
	mov	_ThreadCreate_temp_65537_22,#0x3f
	mov	_ThreadCreate_tempword_65537_22,a
	sjmp	00122$
00121$:
;	preemptive.c:149: }else if(cnt == 1){
	mov	a,#0x01
	cjne	a,_ThreadCreate_cnt_65537_22,00118$
;	preemptive.c:150: temp = 0x4F;//stack pointer
	mov	_ThreadCreate_temp_65537_22,#0x4f
;	preemptive.c:151: tempword = 0b00001000;//state
	mov	_ThreadCreate_tempword_65537_22,#0x08
	sjmp	00122$
00118$:
;	preemptive.c:152: }else if(cnt == 2){
	mov	a,#0x02
	cjne	a,_ThreadCreate_cnt_65537_22,00115$
;	preemptive.c:153: temp = 0x5F;
	mov	_ThreadCreate_temp_65537_22,#0x5f
;	preemptive.c:154: tempword = 0b00010000;
	mov	_ThreadCreate_tempword_65537_22,#0x10
	sjmp	00122$
00115$:
;	preemptive.c:155: }else if(cnt == 3){
	mov	a,#0x03
	cjne	a,_ThreadCreate_cnt_65537_22,00122$
;	preemptive.c:156: temp = 0x6F;
	mov	_ThreadCreate_temp_65537_22,#0x6f
;	preemptive.c:157: tempword = 0b00011000;
	mov	_ThreadCreate_tempword_65537_22,#0x18
00122$:
;	preemptive.c:160: __data __at(0x3D) char ptr = SP;
	mov	_ThreadCreate_ptr_65538_31,_SP
;	preemptive.c:161: SP = temp;
	mov	_SP,_ThreadCreate_temp_65537_22
;	preemptive.c:169: __endasm;
	PUSH	DPL
	PUSH	DPH
;	preemptive.c:172: __data __at(0x3E) char ACCnow = ACC;
	mov	_ThreadCreate_ACCnow_65539_32,_ACC
;	preemptive.c:173: ACC = 0;
	mov	_ACC,#0x00
;	preemptive.c:180: __endasm;
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	preemptive.c:184: __endasm;
	PUSH	0x3C
;	preemptive.c:187: savedSP[cnt] = SP;//stack pointer
	mov	a,_ThreadCreate_cnt_65537_22
	add	a,#_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:188: SP = ptr;//restore back
	mov	_SP,_ThreadCreate_ptr_65538_31
;	preemptive.c:189: ACC = ACCnow;
	mov	_ACC,_ThreadCreate_ACCnow_65539_32
;	preemptive.c:190: EA = 1;//inside EA=0 and EA=1
;	assignBit
	setb	_EA
;	preemptive.c:191: return cnt;   
	mov	dpl,_ThreadCreate_cnt_65537_22
;	preemptive.c:192: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:201: void ThreadYield(void){
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:202: SAVESTATE;//save original thread
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_threadname
	add	a,#_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:203: do{ //find the next thread that can run and set the current thread ID to it,
00120$:
;	preemptive.c:204: threadname = (threadname + 1) % 4;
	mov	r6,_threadname
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	__modsint_PARM_2,#0x04
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	lcall	__modsint
	mov	r6,dpl
	mov	r7,dph
	mov	_threadname,r6
;	preemptive.c:205: if(threadname == 0 && (masky & 0x01) != 0 && clocka == 0){
	mov	a,_threadname
	jnz	00116$
	mov	a,_masky
	jnb	acc.0,00116$
	mov	a,_clocka
	jz	00122$
;	preemptive.c:206: break;
00116$:
;	preemptive.c:208: else if(threadname == 1 && (masky & 0x02) != 0 && clockb == 0){
	mov	a,#0x01
	cjne	a,_threadname,00111$
	mov	a,_masky
	jnb	acc.1,00111$
	mov	a,_clockb
	jz	00122$
;	preemptive.c:209: break;
00111$:
;	preemptive.c:211: else if(threadname == 2 && (masky & 0x04) != 0 && clockc == 0){
	mov	a,#0x02
	cjne	a,_threadname,00106$
	mov	a,_masky
	jnb	acc.2,00106$
	mov	a,_clockc
	jz	00122$
;	preemptive.c:212: break;
00106$:
;	preemptive.c:214: else if(threadname == 3 && (masky & 0x08) != 0 && clockd == 0){
	mov	a,#0x03
	cjne	a,_threadname,00120$
	mov	a,_masky
	jnb	acc.3,00120$
	mov	a,_clockd
	jnz	00120$
;	preemptive.c:217: } while (1);
00122$:
;	preemptive.c:218: RESTORESTATE;//restore thread
	mov	a,_threadname
	add	a,#_savedSP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:219: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:226: void ThreadExit(void){
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:228: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:230: if(threadname == 0){
	mov	a,_threadname
	jnz	00102$
;	preemptive.c:231: masky = masky &~ (0x01); 
	anl	_masky,#0xfe
;	preemptive.c:232: clocka=0;
	mov	_clocka,#0x00
00102$:
;	preemptive.c:234: if(threadname == 1){
	mov	a,#0x01
	cjne	a,_threadname,00104$
;	preemptive.c:235: masky = masky &~ (0x02); 
	anl	_masky,#0xfd
;	preemptive.c:236: clockb=0;
	mov	_clockb,#0x00
00104$:
;	preemptive.c:238: if(threadname == 2){
	mov	a,#0x02
	cjne	a,_threadname,00106$
;	preemptive.c:239: masky = masky &~ (0x04);
	anl	_masky,#0xfb
;	preemptive.c:240: clockc=0;
	mov	_clockc,#0x00
00106$:
;	preemptive.c:242: if(threadname == 3){
	mov	a,#0x03
	cjne	a,_threadname,00108$
;	preemptive.c:243: masky = masky &~ (0x08);
	anl	_masky,#0xf7
;	preemptive.c:244: clockd=0;
	mov	_clockd,#0x00
00108$:
;	preemptive.c:246: SemaphoreSignal(thread_num);//thread kill num+1
	INC _thread_num 
;	preemptive.c:247: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:248: do{ // 
00123$:
;	preemptive.c:249: threadname=(threadname + 1) % 4;
	mov	r6,_threadname
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	__modsint_PARM_2,#0x04
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	lcall	__modsint
	mov	r6,dpl
	mov	r7,dph
	mov	_threadname,r6
;	preemptive.c:250: if((masky >> threadname) & 1){
	mov	b,_threadname
	inc	b
	mov	a,_masky
	sjmp	00176$
00175$:
	clr	c
	rrc	a
00176$:
	djnz	b,00175$
	jnb	acc.0,00123$
;	preemptive.c:251: if(threadname == 0 && clocka == 0){
	mov	a,_threadname
	jnz	00110$
	mov	a,_clocka
	jz	00125$
;	preemptive.c:252: break;
00110$:
;	preemptive.c:254: if(threadname == 1 && clockb == 0){
	mov	a,#0x01
	cjne	a,_threadname,00113$
	mov	a,_clockb
	jz	00125$
;	preemptive.c:255: break;
00113$:
;	preemptive.c:257: if(threadname == 2 && clockc == 0){
	mov	a,#0x02
	cjne	a,_threadname,00116$
	mov	a,_clockc
	jz	00125$
;	preemptive.c:258: break;
00116$:
;	preemptive.c:260: if(threadname == 3 && clockd == 0){
	mov	a,#0x03
	cjne	a,_threadname,00123$
	mov	a,_clockd
	jnz	00123$
;	preemptive.c:264: }while(1);
00125$:
;	preemptive.c:265: RESTORESTATE;
	mov	a,_threadname
	add	a,#_savedSP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:266: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:269: void myTimer0Handler(void){
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:271: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:272: SAVESTATE; 	
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_threadname
	add	a,#_savedSP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:280: __endasm;
	MOV	ACC, R0
	MOV	B, R1
	MOV	DPL,R2
	MOV	DPH, R3
;	preemptive.c:282: curTime = curTime + 1;//current time
	mov	a,_curTime
	mov	r7,a
	inc	a
	mov	_curTime,a
;	preemptive.c:284: if(clocka > 0){ 
	mov	a,_clocka
	jz	00102$
;	preemptive.c:285: clocka --;
	mov	a,_clocka
	dec	a
	mov	_clocka,a
00102$:
;	preemptive.c:287: if(clockb > 0){ 
	mov	a,_clockb
	jz	00104$
;	preemptive.c:288: clockb --;
	mov	a,_clockb
	dec	a
	mov	_clockb,a
00104$:
;	preemptive.c:290: if(clockc > 0){ 
	mov	a,_clockc
	jz	00106$
;	preemptive.c:291: clockc--;
	mov	a,_clockc
	dec	a
	mov	_clockc,a
00106$:
;	preemptive.c:293: if(clockd > 0){ 
	mov	a,_clockd
	jz	00128$
;	preemptive.c:294: clockd --;
	mov	a,_clockd
	dec	a
	mov	_clockd,a
;	preemptive.c:298: do{
00128$:
;	preemptive.c:299: threadname = (threadname + 1) % 4;//yield to another thread
	mov	r6,_threadname
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	__modsint_PARM_2,#0x04
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	lcall	__modsint
	mov	r6,dpl
	mov	r7,dph
	mov	_threadname,r6
;	preemptive.c:300: if(clocka == 0 && threadname == 0 && (masky & 0x01) != 0){
	mov	a,_clocka
	jnz	00124$
	mov	a,_threadname
	jnz	00124$
	mov	a,_masky
	jb	acc.0,00130$
;	preemptive.c:301: break;
00124$:
;	preemptive.c:303: else if(clockb == 0 && threadname == 1 && (masky & 0x02) != 0 ){
	mov	a,_clockb
	jnz	00119$
	mov	a,#0x01
	cjne	a,_threadname,00119$
	mov	a,_masky
	jb	acc.1,00130$
;	preemptive.c:304: break;
00119$:
;	preemptive.c:306: else if(clockc == 0 && threadname == 2 && (masky & 0x04) != 0 ){
	mov	a,_clockc
	jnz	00114$
	mov	a,#0x02
	cjne	a,_threadname,00114$
	mov	a,_masky
	jb	acc.2,00130$
;	preemptive.c:307: break;
00114$:
;	preemptive.c:309: else if(clockd == 0 && threadname == 3 && (masky & 0x08) != 0 ){
	mov	a,_clockd
	jnz	00128$
	mov	a,#0x03
	cjne	a,_threadname,00128$
	mov	a,_masky
	jnb	acc.3,00128$
;	preemptive.c:312: } while (1);
00130$:
;	preemptive.c:323: __endasm;
	MOV	R0, ACC
	MOV	R1, B
	MOV	R2, DPL
	MOV	R3, DPH
;	preemptive.c:324: RESTORESTATE;
	mov	a,_threadname
	add	a,#_savedSP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:325: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:329: __endasm;
	RETI
;	preemptive.c:331: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
