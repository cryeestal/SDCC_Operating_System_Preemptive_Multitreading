                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.1.0 #12072 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _list
                                    111 	.globl _space
                                    112 	.globl _curcar
                                    113 	.globl _thread_num
                                    114 	.globl _empty
                                    115 	.globl _full
                                    116 	.globl _mutex
                                    117 	.globl _curTime
                                    118 	.globl _clockd
                                    119 	.globl _clockc
                                    120 	.globl _clockb
                                    121 	.globl _clocka
                                    122 	.globl _savedSP
                                    123 	.globl _threadNum
                                    124 	.globl _threadname
                                    125 	.globl _masky
                                    126 	.globl _delay
                                    127 	.globl _now
                                    128 	.globl _ThreadCreate
                                    129 	.globl _ThreadYield
                                    130 	.globl _ThreadExit
                                    131 ;--------------------------------------------------------
                                    132 ; special function registers
                                    133 ;--------------------------------------------------------
                                    134 	.area RSEG    (ABS,DATA)
      000000                        135 	.org 0x0000
                           000080   136 _P0	=	0x0080
                           000081   137 _SP	=	0x0081
                           000082   138 _DPL	=	0x0082
                           000083   139 _DPH	=	0x0083
                           000087   140 _PCON	=	0x0087
                           000088   141 _TCON	=	0x0088
                           000089   142 _TMOD	=	0x0089
                           00008A   143 _TL0	=	0x008a
                           00008B   144 _TL1	=	0x008b
                           00008C   145 _TH0	=	0x008c
                           00008D   146 _TH1	=	0x008d
                           000090   147 _P1	=	0x0090
                           000098   148 _SCON	=	0x0098
                           000099   149 _SBUF	=	0x0099
                           0000A0   150 _P2	=	0x00a0
                           0000A8   151 _IE	=	0x00a8
                           0000B0   152 _P3	=	0x00b0
                           0000B8   153 _IP	=	0x00b8
                           0000D0   154 _PSW	=	0x00d0
                           0000E0   155 _ACC	=	0x00e0
                           0000F0   156 _B	=	0x00f0
                                    157 ;--------------------------------------------------------
                                    158 ; special function bits
                                    159 ;--------------------------------------------------------
                                    160 	.area RSEG    (ABS,DATA)
      000000                        161 	.org 0x0000
                           000080   162 _P0_0	=	0x0080
                           000081   163 _P0_1	=	0x0081
                           000082   164 _P0_2	=	0x0082
                           000083   165 _P0_3	=	0x0083
                           000084   166 _P0_4	=	0x0084
                           000085   167 _P0_5	=	0x0085
                           000086   168 _P0_6	=	0x0086
                           000087   169 _P0_7	=	0x0087
                           000088   170 _IT0	=	0x0088
                           000089   171 _IE0	=	0x0089
                           00008A   172 _IT1	=	0x008a
                           00008B   173 _IE1	=	0x008b
                           00008C   174 _TR0	=	0x008c
                           00008D   175 _TF0	=	0x008d
                           00008E   176 _TR1	=	0x008e
                           00008F   177 _TF1	=	0x008f
                           000090   178 _P1_0	=	0x0090
                           000091   179 _P1_1	=	0x0091
                           000092   180 _P1_2	=	0x0092
                           000093   181 _P1_3	=	0x0093
                           000094   182 _P1_4	=	0x0094
                           000095   183 _P1_5	=	0x0095
                           000096   184 _P1_6	=	0x0096
                           000097   185 _P1_7	=	0x0097
                           000098   186 _RI	=	0x0098
                           000099   187 _TI	=	0x0099
                           00009A   188 _RB8	=	0x009a
                           00009B   189 _TB8	=	0x009b
                           00009C   190 _REN	=	0x009c
                           00009D   191 _SM2	=	0x009d
                           00009E   192 _SM1	=	0x009e
                           00009F   193 _SM0	=	0x009f
                           0000A0   194 _P2_0	=	0x00a0
                           0000A1   195 _P2_1	=	0x00a1
                           0000A2   196 _P2_2	=	0x00a2
                           0000A3   197 _P2_3	=	0x00a3
                           0000A4   198 _P2_4	=	0x00a4
                           0000A5   199 _P2_5	=	0x00a5
                           0000A6   200 _P2_6	=	0x00a6
                           0000A7   201 _P2_7	=	0x00a7
                           0000A8   202 _EX0	=	0x00a8
                           0000A9   203 _ET0	=	0x00a9
                           0000AA   204 _EX1	=	0x00aa
                           0000AB   205 _ET1	=	0x00ab
                           0000AC   206 _ES	=	0x00ac
                           0000AF   207 _EA	=	0x00af
                           0000B0   208 _P3_0	=	0x00b0
                           0000B1   209 _P3_1	=	0x00b1
                           0000B2   210 _P3_2	=	0x00b2
                           0000B3   211 _P3_3	=	0x00b3
                           0000B4   212 _P3_4	=	0x00b4
                           0000B5   213 _P3_5	=	0x00b5
                           0000B6   214 _P3_6	=	0x00b6
                           0000B7   215 _P3_7	=	0x00b7
                           0000B0   216 _RXD	=	0x00b0
                           0000B1   217 _TXD	=	0x00b1
                           0000B2   218 _INT0	=	0x00b2
                           0000B3   219 _INT1	=	0x00b3
                           0000B4   220 _T0	=	0x00b4
                           0000B5   221 _T1	=	0x00b5
                           0000B6   222 _WR	=	0x00b6
                           0000B7   223 _RD	=	0x00b7
                           0000B8   224 _PX0	=	0x00b8
                           0000B9   225 _PT0	=	0x00b9
                           0000BA   226 _PX1	=	0x00ba
                           0000BB   227 _PT1	=	0x00bb
                           0000BC   228 _PS	=	0x00bc
                           0000D0   229 _P	=	0x00d0
                           0000D1   230 _F1	=	0x00d1
                           0000D2   231 _OV	=	0x00d2
                           0000D3   232 _RS0	=	0x00d3
                           0000D4   233 _RS1	=	0x00d4
                           0000D5   234 _F0	=	0x00d5
                           0000D6   235 _AC	=	0x00d6
                           0000D7   236 _CY	=	0x00d7
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable register banks
                                    239 ;--------------------------------------------------------
                                    240 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        241 	.ds 8
                                    242 ;--------------------------------------------------------
                                    243 ; internal ram data
                                    244 ;--------------------------------------------------------
                                    245 	.area DSEG    (DATA)
                           000020   246 _masky	=	0x0020
                           000021   247 _threadname	=	0x0021
                           000022   248 _threadNum	=	0x0022
                           000023   249 _savedSP	=	0x0023
                           000027   250 _clocka	=	0x0027
                           000028   251 _clockb	=	0x0028
                           000029   252 _clockc	=	0x0029
                           00002A   253 _clockd	=	0x002a
                           00002B   254 _curTime	=	0x002b
                           00002C   255 _mutex	=	0x002c
                           00002D   256 _full	=	0x002d
                           00002E   257 _empty	=	0x002e
                           00002F   258 _thread_num	=	0x002f
                           000030   259 _curcar	=	0x0030
                           000031   260 _space	=	0x0031
                           000033   261 _list	=	0x0033
                                    262 ;--------------------------------------------------------
                                    263 ; overlayable items in internal ram 
                                    264 ;--------------------------------------------------------
                                    265 	.area	OSEG    (OVR,DATA)
                           00003A   266 _ThreadCreate_cnt_65537_22	=	0x003a
                           00003B   267 _ThreadCreate_temp_65537_22	=	0x003b
                           00003C   268 _ThreadCreate_tempword_65537_22	=	0x003c
                           00003D   269 _ThreadCreate_ptr_65538_31	=	0x003d
                           00003E   270 _ThreadCreate_ACCnow_65539_32	=	0x003e
                                    271 ;--------------------------------------------------------
                                    272 ; indirectly addressable internal ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area ISEG    (DATA)
                                    275 ;--------------------------------------------------------
                                    276 ; absolute internal ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area IABS    (ABS,DATA)
                                    279 	.area IABS    (ABS,DATA)
                                    280 ;--------------------------------------------------------
                                    281 ; bit data
                                    282 ;--------------------------------------------------------
                                    283 	.area BSEG    (BIT)
                                    284 ;--------------------------------------------------------
                                    285 ; paged external ram data
                                    286 ;--------------------------------------------------------
                                    287 	.area PSEG    (PAG,XDATA)
                                    288 ;--------------------------------------------------------
                                    289 ; external ram data
                                    290 ;--------------------------------------------------------
                                    291 	.area XSEG    (XDATA)
                                    292 ;--------------------------------------------------------
                                    293 ; absolute external ram data
                                    294 ;--------------------------------------------------------
                                    295 	.area XABS    (ABS,XDATA)
                                    296 ;--------------------------------------------------------
                                    297 ; external initialized ram data
                                    298 ;--------------------------------------------------------
                                    299 	.area XISEG   (XDATA)
                                    300 	.area HOME    (CODE)
                                    301 	.area GSINIT0 (CODE)
                                    302 	.area GSINIT1 (CODE)
                                    303 	.area GSINIT2 (CODE)
                                    304 	.area GSINIT3 (CODE)
                                    305 	.area GSINIT4 (CODE)
                                    306 	.area GSINIT5 (CODE)
                                    307 	.area GSINIT  (CODE)
                                    308 	.area GSFINAL (CODE)
                                    309 	.area CSEG    (CODE)
                                    310 ;--------------------------------------------------------
                                    311 ; global & static initialisations
                                    312 ;--------------------------------------------------------
                                    313 	.area HOME    (CODE)
                                    314 	.area GSINIT  (CODE)
                                    315 	.area GSFINAL (CODE)
                                    316 	.area GSINIT  (CODE)
                                    317 ;--------------------------------------------------------
                                    318 ; Home
                                    319 ;--------------------------------------------------------
                                    320 	.area HOME    (CODE)
                                    321 	.area HOME    (CODE)
                                    322 ;--------------------------------------------------------
                                    323 ; code
                                    324 ;--------------------------------------------------------
                                    325 	.area CSEG    (CODE)
                                    326 ;------------------------------------------------------------
                                    327 ;Allocation info for local variables in function 'delay'
                                    328 ;------------------------------------------------------------
                                    329 ;n                         Allocated to registers r7 
                                    330 ;------------------------------------------------------------
                                    331 ;	preemptive.c:18: void delay(unsigned char n){
                                    332 ;	-----------------------------------------
                                    333 ;	 function delay
                                    334 ;	-----------------------------------------
      0001C5                        335 _delay:
                           000007   336 	ar7 = 0x07
                           000006   337 	ar6 = 0x06
                           000005   338 	ar5 = 0x05
                           000004   339 	ar4 = 0x04
                           000003   340 	ar3 = 0x03
                           000002   341 	ar2 = 0x02
                           000001   342 	ar1 = 0x01
                           000000   343 	ar0 = 0x00
      0001C5 AF 82            [24]  344 	mov	r7,dpl
                                    345 ;	preemptive.c:19: EA = 0;
                                    346 ;	assignBit
      0001C7 C2 AF            [12]  347 	clr	_EA
                                    348 ;	preemptive.c:20: if(threadname == 0){
      0001C9 E5 21            [12]  349 	mov	a,_threadname
                                    350 ;	preemptive.c:21: clocka += 1/2 + n/8 ;
      0001CB 70 19            [24]  351 	jnz	00110$
      0001CD 8F 05            [24]  352 	mov	ar5,r7
      0001CF FE               [12]  353 	mov	r6,a
      0001D0 75 08 08         [24]  354 	mov	__divsint_PARM_2,#0x08
                                    355 ;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
      0001D3 8E 09            [24]  356 	mov	(__divsint_PARM_2 + 1),r6
      0001D5 8D 82            [24]  357 	mov	dpl,r5
      0001D7 8E 83            [24]  358 	mov	dph,r6
      0001D9 12 05 87         [24]  359 	lcall	__divsint
      0001DC AD 82            [24]  360 	mov	r5,dpl
      0001DE AE 27            [24]  361 	mov	r6,_clocka
      0001E0 ED               [12]  362 	mov	a,r5
      0001E1 2E               [12]  363 	add	a,r6
      0001E2 F5 27            [12]  364 	mov	_clocka,a
      0001E4 80 59            [24]  365 	sjmp	00111$
      0001E6                        366 00110$:
                                    367 ;	preemptive.c:22: }else if(threadname == 1){
      0001E6 74 01            [12]  368 	mov	a,#0x01
      0001E8 B5 21 1A         [24]  369 	cjne	a,_threadname,00107$
                                    370 ;	preemptive.c:23: clockb += 1/2 + n/8 ;
      0001EB 8F 05            [24]  371 	mov	ar5,r7
      0001ED 7E 00            [12]  372 	mov	r6,#0x00
      0001EF 75 08 08         [24]  373 	mov	__divsint_PARM_2,#0x08
                                    374 ;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
      0001F2 8E 09            [24]  375 	mov	(__divsint_PARM_2 + 1),r6
      0001F4 8D 82            [24]  376 	mov	dpl,r5
      0001F6 8E 83            [24]  377 	mov	dph,r6
      0001F8 12 05 87         [24]  378 	lcall	__divsint
      0001FB AD 82            [24]  379 	mov	r5,dpl
      0001FD AE 28            [24]  380 	mov	r6,_clockb
      0001FF ED               [12]  381 	mov	a,r5
      000200 2E               [12]  382 	add	a,r6
      000201 F5 28            [12]  383 	mov	_clockb,a
      000203 80 3A            [24]  384 	sjmp	00111$
      000205                        385 00107$:
                                    386 ;	preemptive.c:24: }else if(threadname == 2){
      000205 74 02            [12]  387 	mov	a,#0x02
      000207 B5 21 1A         [24]  388 	cjne	a,_threadname,00104$
                                    389 ;	preemptive.c:25: clockc += 1/2 + n/8 ;
      00020A 8F 05            [24]  390 	mov	ar5,r7
      00020C 7E 00            [12]  391 	mov	r6,#0x00
      00020E 75 08 08         [24]  392 	mov	__divsint_PARM_2,#0x08
                                    393 ;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
      000211 8E 09            [24]  394 	mov	(__divsint_PARM_2 + 1),r6
      000213 8D 82            [24]  395 	mov	dpl,r5
      000215 8E 83            [24]  396 	mov	dph,r6
      000217 12 05 87         [24]  397 	lcall	__divsint
      00021A AD 82            [24]  398 	mov	r5,dpl
      00021C AE 29            [24]  399 	mov	r6,_clockc
      00021E ED               [12]  400 	mov	a,r5
      00021F 2E               [12]  401 	add	a,r6
      000220 F5 29            [12]  402 	mov	_clockc,a
      000222 80 1B            [24]  403 	sjmp	00111$
      000224                        404 00104$:
                                    405 ;	preemptive.c:26: }else if(threadname == 3){
      000224 74 03            [12]  406 	mov	a,#0x03
      000226 B5 21 16         [24]  407 	cjne	a,_threadname,00111$
                                    408 ;	preemptive.c:27: clockd += 1/2 + n/8 ;
      000229 7E 00            [12]  409 	mov	r6,#0x00
      00022B 75 08 08         [24]  410 	mov	__divsint_PARM_2,#0x08
                                    411 ;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
      00022E 8E 09            [24]  412 	mov	(__divsint_PARM_2 + 1),r6
      000230 8F 82            [24]  413 	mov	dpl,r7
      000232 8E 83            [24]  414 	mov	dph,r6
      000234 12 05 87         [24]  415 	lcall	__divsint
      000237 AE 82            [24]  416 	mov	r6,dpl
      000239 AF 2A            [24]  417 	mov	r7,_clockd
      00023B EE               [12]  418 	mov	a,r6
      00023C 2F               [12]  419 	add	a,r7
      00023D F5 2A            [12]  420 	mov	_clockd,a
      00023F                        421 00111$:
                                    422 ;	preemptive.c:29: EA = 1;
                                    423 ;	assignBit
      00023F D2 AF            [12]  424 	setb	_EA
                                    425 ;	preemptive.c:30: ThreadYield();
                                    426 ;	preemptive.c:31: }
      000241 02 03 2C         [24]  427 	ljmp	_ThreadYield
                                    428 ;------------------------------------------------------------
                                    429 ;Allocation info for local variables in function 'now'
                                    430 ;------------------------------------------------------------
                                    431 ;	preemptive.c:33: unsigned char now(void){
                                    432 ;	-----------------------------------------
                                    433 ;	 function now
                                    434 ;	-----------------------------------------
      000244                        435 _now:
                                    436 ;	preemptive.c:34: return curTime;
      000244 85 2B 82         [24]  437 	mov	dpl,_curTime
                                    438 ;	preemptive.c:35: }
      000247 22               [24]  439 	ret
                                    440 ;------------------------------------------------------------
                                    441 ;Allocation info for local variables in function 'Bootstrap'
                                    442 ;------------------------------------------------------------
                                    443 ;	preemptive.c:92: void Bootstrap(void){
                                    444 ;	-----------------------------------------
                                    445 ;	 function Bootstrap
                                    446 ;	-----------------------------------------
      000248                        447 _Bootstrap:
                                    448 ;	preemptive.c:94: EA = 0;
                                    449 ;	assignBit
      000248 C2 AF            [12]  450 	clr	_EA
                                    451 ;	preemptive.c:95: masky = 0;//tread pool
      00024A 75 20 00         [24]  452 	mov	_masky,#0x00
                                    453 ;	preemptive.c:96: threadname = 0;//threadNum=0
      00024D 75 21 00         [24]  454 	mov	_threadname,#0x00
                                    455 ;	preemptive.c:97: TMOD = 0; // timer 0 mode 0
      000250 75 89 00         [24]  456 	mov	_TMOD,#0x00
                                    457 ;	preemptive.c:98: IE = 0x82; // enable timer0 interrupt
      000253 75 A8 82         [24]  458 	mov	_IE,#0x82
                                    459 ;	preemptive.c:99: TR0 = 1; // start runningtimer0	
                                    460 ;	assignBit
      000256 D2 8C            [12]  461 	setb	_TR0
                                    462 ;	preemptive.c:101: curTime = 0;//now
      000258 75 2B 00         [24]  463 	mov	_curTime,#0x00
                                    464 ;	preemptive.c:102: clocka = 0;//delay循環
      00025B 75 27 00         [24]  465 	mov	_clocka,#0x00
                                    466 ;	preemptive.c:103: clockb = 0;
      00025E 75 28 00         [24]  467 	mov	_clockb,#0x00
                                    468 ;	preemptive.c:104: clockc = 0;
      000261 75 29 00         [24]  469 	mov	_clockc,#0x00
                                    470 ;	preemptive.c:105: clockd = 0;
      000264 75 2A 00         [24]  471 	mov	_clockd,#0x00
                                    472 ;	preemptive.c:108: SemaphoreCreate(thread_num, 4);//count thread number only 4//有點怪
      000267 75 2F 04         [24]  473 	mov	_thread_num,#0x04
                                    474 ;	preemptive.c:109: SemaphoreCreate(mutex, 1);
      00026A 75 2C 01         [24]  475 	mov	_mutex,#0x01
                                    476 ;	preemptive.c:111: SemaphoreCreate(empty, 2);
      00026D 75 2E 02         [24]  477 	mov	_empty,#0x02
                                    478 ;	preemptive.c:112: EA = 1;
                                    479 ;	assignBit
      000270 D2 AF            [12]  480 	setb	_EA
                                    481 ;	preemptive.c:115: ThreadCreate(main);
      000272 90 01 72         [24]  482 	mov	dptr,#_main
      000275 12 02 8A         [24]  483 	lcall	_ThreadCreate
                                    484 ;	preemptive.c:116: RESTORESTATE;
      000278 E5 21            [12]  485 	mov	a,_threadname
      00027A 24 23            [12]  486 	add	a,#_savedSP
      00027C F9               [12]  487 	mov	r1,a
      00027D 87 81            [24]  488 	mov	_SP,@r1
      00027F D0 D0            [24]  489 	POP PSW 
      000281 D0 83            [24]  490 	POP DPH 
      000283 D0 82            [24]  491 	POP DPL 
      000285 D0 F0            [24]  492 	POP B 
      000287 D0 E0            [24]  493 	POP ACC 
                                    494 ;	preemptive.c:117: }
      000289 22               [24]  495 	ret
                                    496 ;------------------------------------------------------------
                                    497 ;Allocation info for local variables in function 'ThreadCreate'
                                    498 ;------------------------------------------------------------
                                    499 ;fp                        Allocated to registers 
                                    500 ;cnt                       Allocated with name '_ThreadCreate_cnt_65537_22'
                                    501 ;temp                      Allocated with name '_ThreadCreate_temp_65537_22'
                                    502 ;tempword                  Allocated with name '_ThreadCreate_tempword_65537_22'
                                    503 ;ptr                       Allocated with name '_ThreadCreate_ptr_65538_31'
                                    504 ;ACCnow                    Allocated with name '_ThreadCreate_ACCnow_65539_32'
                                    505 ;------------------------------------------------------------
                                    506 ;	preemptive.c:125: ThreadID ThreadCreate(FunctionPtr fp){
                                    507 ;	-----------------------------------------
                                    508 ;	 function ThreadCreate
                                    509 ;	-----------------------------------------
      00028A                        510 _ThreadCreate:
                                    511 ;	preemptive.c:126: SemaphoreWait(thread_num);//if threadnumber<=4 create newthread
      00028A                        512 		0$:
      00028A 85 2F E0         [24]  513 	MOV ACC, _thread_num 
      00028D 60 FB            [24]  514 	JZ 0$ 
      00028F 20 E7 F8         [24]  515 	JB ACC.7, 0$ 
      000292 15 2F            [12]  516 	DEC _thread_num 
                                    517 ;	preemptive.c:127: EA = 0; 
                                    518 ;	assignBit
      000294 C2 AF            [12]  519 	clr	_EA
                                    520 ;	preemptive.c:128: __data __at(0x3A) ThreadID cnt = 0;
                                    521 ;	preemptive.c:129: __data __at(0x3B) char temp = 0;
                                    522 ;	preemptive.c:130: __data __at(0x3C) char tempword = 0;
                                    523 ;	preemptive.c:132: if(!(masky & 0x01)){//no 1
      000296 E4               [12]  524 	clr	a
      000297 F5 3A            [12]  525 	mov	_ThreadCreate_cnt_65537_22,a
      000299 F5 3B            [12]  526 	mov	_ThreadCreate_temp_65537_22,a
      00029B F5 3C            [12]  527 	mov	_ThreadCreate_tempword_65537_22,a
      00029D E5 20            [12]  528 	mov	a,_masky
      00029F 20 E0 08         [24]  529 	jb	acc.0,00110$
                                    530 ;	preemptive.c:133: masky = masky | 0x01;
      0002A2 43 20 01         [24]  531 	orl	_masky,#0x01
                                    532 ;	preemptive.c:134: cnt = 0;//threadid
      0002A5 75 3A 00         [24]  533 	mov	_ThreadCreate_cnt_65537_22,#0x00
      0002A8 80 25            [24]  534 	sjmp	00111$
      0002AA                        535 00110$:
                                    536 ;	preemptive.c:135: }else if(!(masky & 0x02)){
      0002AA E5 20            [12]  537 	mov	a,_masky
      0002AC 20 E1 08         [24]  538 	jb	acc.1,00107$
                                    539 ;	preemptive.c:136: masky = masky | 0x02;
      0002AF 43 20 02         [24]  540 	orl	_masky,#0x02
                                    541 ;	preemptive.c:137: cnt = 1;
      0002B2 75 3A 01         [24]  542 	mov	_ThreadCreate_cnt_65537_22,#0x01
      0002B5 80 18            [24]  543 	sjmp	00111$
      0002B7                        544 00107$:
                                    545 ;	preemptive.c:138: }else if(!(masky & 0x04)){
      0002B7 E5 20            [12]  546 	mov	a,_masky
      0002B9 20 E2 08         [24]  547 	jb	acc.2,00104$
                                    548 ;	preemptive.c:139: masky = masky | 0x04;
      0002BC 43 20 04         [24]  549 	orl	_masky,#0x04
                                    550 ;	preemptive.c:140: cnt = 2;
      0002BF 75 3A 02         [24]  551 	mov	_ThreadCreate_cnt_65537_22,#0x02
      0002C2 80 0B            [24]  552 	sjmp	00111$
      0002C4                        553 00104$:
                                    554 ;	preemptive.c:141: }else if(!(masky & 0x08)){
      0002C4 E5 20            [12]  555 	mov	a,_masky
      0002C6 20 E3 06         [24]  556 	jb	acc.3,00111$
                                    557 ;	preemptive.c:142: masky = masky | 0x08;
      0002C9 43 20 08         [24]  558 	orl	_masky,#0x08
                                    559 ;	preemptive.c:143: cnt=3;
      0002CC 75 3A 03         [24]  560 	mov	_ThreadCreate_cnt_65537_22,#0x03
      0002CF                        561 00111$:
                                    562 ;	preemptive.c:146: if(cnt == 0){
      0002CF E5 3A            [12]  563 	mov	a,_ThreadCreate_cnt_65537_22
                                    564 ;	preemptive.c:147: temp = 0x3F;
                                    565 ;	preemptive.c:148: tempword = 0b00000000;
      0002D1 70 07            [24]  566 	jnz	00121$
      0002D3 75 3B 3F         [24]  567 	mov	_ThreadCreate_temp_65537_22,#0x3f
      0002D6 F5 3C            [12]  568 	mov	_ThreadCreate_tempword_65537_22,a
      0002D8 80 25            [24]  569 	sjmp	00122$
      0002DA                        570 00121$:
                                    571 ;	preemptive.c:149: }else if(cnt == 1){
      0002DA 74 01            [12]  572 	mov	a,#0x01
      0002DC B5 3A 08         [24]  573 	cjne	a,_ThreadCreate_cnt_65537_22,00118$
                                    574 ;	preemptive.c:150: temp = 0x4F;//stack pointer
      0002DF 75 3B 4F         [24]  575 	mov	_ThreadCreate_temp_65537_22,#0x4f
                                    576 ;	preemptive.c:151: tempword = 0b00001000;//state
      0002E2 75 3C 08         [24]  577 	mov	_ThreadCreate_tempword_65537_22,#0x08
      0002E5 80 18            [24]  578 	sjmp	00122$
      0002E7                        579 00118$:
                                    580 ;	preemptive.c:152: }else if(cnt == 2){
      0002E7 74 02            [12]  581 	mov	a,#0x02
      0002E9 B5 3A 08         [24]  582 	cjne	a,_ThreadCreate_cnt_65537_22,00115$
                                    583 ;	preemptive.c:153: temp = 0x5F;
      0002EC 75 3B 5F         [24]  584 	mov	_ThreadCreate_temp_65537_22,#0x5f
                                    585 ;	preemptive.c:154: tempword = 0b00010000;
      0002EF 75 3C 10         [24]  586 	mov	_ThreadCreate_tempword_65537_22,#0x10
      0002F2 80 0B            [24]  587 	sjmp	00122$
      0002F4                        588 00115$:
                                    589 ;	preemptive.c:155: }else if(cnt == 3){
      0002F4 74 03            [12]  590 	mov	a,#0x03
      0002F6 B5 3A 06         [24]  591 	cjne	a,_ThreadCreate_cnt_65537_22,00122$
                                    592 ;	preemptive.c:156: temp = 0x6F;
      0002F9 75 3B 6F         [24]  593 	mov	_ThreadCreate_temp_65537_22,#0x6f
                                    594 ;	preemptive.c:157: tempword = 0b00011000;
      0002FC 75 3C 18         [24]  595 	mov	_ThreadCreate_tempword_65537_22,#0x18
      0002FF                        596 00122$:
                                    597 ;	preemptive.c:160: __data __at(0x3D) char ptr = SP;
      0002FF 85 81 3D         [24]  598 	mov	_ThreadCreate_ptr_65538_31,_SP
                                    599 ;	preemptive.c:161: SP = temp;
      000302 85 3B 81         [24]  600 	mov	_SP,_ThreadCreate_temp_65537_22
                                    601 ;	preemptive.c:169: __endasm;
      000305 C0 82            [24]  602 	PUSH	DPL
      000307 C0 83            [24]  603 	PUSH	DPH
                                    604 ;	preemptive.c:172: __data __at(0x3E) char ACCnow = ACC;
      000309 85 E0 3E         [24]  605 	mov	_ThreadCreate_ACCnow_65539_32,_ACC
                                    606 ;	preemptive.c:173: ACC = 0;
      00030C 75 E0 00         [24]  607 	mov	_ACC,#0x00
                                    608 ;	preemptive.c:180: __endasm;
      00030F C0 E0            [24]  609 	PUSH	ACC
      000311 C0 E0            [24]  610 	PUSH	ACC
      000313 C0 E0            [24]  611 	PUSH	ACC
      000315 C0 E0            [24]  612 	PUSH	ACC
                                    613 ;	preemptive.c:184: __endasm;
      000317 C0 3C            [24]  614 	PUSH	0x3C
                                    615 ;	preemptive.c:187: savedSP[cnt] = SP;//stack pointer
      000319 E5 3A            [12]  616 	mov	a,_ThreadCreate_cnt_65537_22
      00031B 24 23            [12]  617 	add	a,#_savedSP
      00031D F8               [12]  618 	mov	r0,a
      00031E A6 81            [24]  619 	mov	@r0,_SP
                                    620 ;	preemptive.c:188: SP = ptr;//restore back
      000320 85 3D 81         [24]  621 	mov	_SP,_ThreadCreate_ptr_65538_31
                                    622 ;	preemptive.c:189: ACC = ACCnow;
      000323 85 3E E0         [24]  623 	mov	_ACC,_ThreadCreate_ACCnow_65539_32
                                    624 ;	preemptive.c:190: EA = 1;//inside EA=0 and EA=1
                                    625 ;	assignBit
      000326 D2 AF            [12]  626 	setb	_EA
                                    627 ;	preemptive.c:191: return cnt;   
      000328 85 3A 82         [24]  628 	mov	dpl,_ThreadCreate_cnt_65537_22
                                    629 ;	preemptive.c:192: }
      00032B 22               [24]  630 	ret
                                    631 ;------------------------------------------------------------
                                    632 ;Allocation info for local variables in function 'ThreadYield'
                                    633 ;------------------------------------------------------------
                                    634 ;	preemptive.c:201: void ThreadYield(void){
                                    635 ;	-----------------------------------------
                                    636 ;	 function ThreadYield
                                    637 ;	-----------------------------------------
      00032C                        638 _ThreadYield:
                                    639 ;	preemptive.c:202: SAVESTATE;//save original thread
      00032C C0 E0            [24]  640 	PUSH ACC 
      00032E C0 F0            [24]  641 	PUSH B 
      000330 C0 82            [24]  642 	PUSH DPL 
      000332 C0 83            [24]  643 	PUSH DPH 
      000334 C0 D0            [24]  644 	PUSH PSW 
      000336 E5 21            [12]  645 	mov	a,_threadname
      000338 24 23            [12]  646 	add	a,#_savedSP
      00033A F8               [12]  647 	mov	r0,a
      00033B A6 81            [24]  648 	mov	@r0,_SP
                                    649 ;	preemptive.c:203: do{ //find the next thread that can run and set the current thread ID to it,
      00033D                        650 00120$:
                                    651 ;	preemptive.c:204: threadname = (threadname + 1) % 4;
      00033D AE 21            [24]  652 	mov	r6,_threadname
      00033F 7F 00            [12]  653 	mov	r7,#0x00
      000341 8E 82            [24]  654 	mov	dpl,r6
      000343 8F 83            [24]  655 	mov	dph,r7
      000345 A3               [24]  656 	inc	dptr
      000346 75 08 04         [24]  657 	mov	__modsint_PARM_2,#0x04
                                    658 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      000349 8F 09            [24]  659 	mov	(__modsint_PARM_2 + 1),r7
      00034B 12 05 51         [24]  660 	lcall	__modsint
      00034E AE 82            [24]  661 	mov	r6,dpl
      000350 AF 83            [24]  662 	mov	r7,dph
      000352 8E 21            [24]  663 	mov	_threadname,r6
                                    664 ;	preemptive.c:205: if(threadname == 0 && (masky & 0x01) != 0 && clocka == 0){
      000354 E5 21            [12]  665 	mov	a,_threadname
      000356 70 09            [24]  666 	jnz	00116$
      000358 E5 20            [12]  667 	mov	a,_masky
      00035A 30 E0 04         [24]  668 	jnb	acc.0,00116$
      00035D E5 27            [12]  669 	mov	a,_clocka
      00035F 60 2A            [24]  670 	jz	00122$
                                    671 ;	preemptive.c:206: break;
      000361                        672 00116$:
                                    673 ;	preemptive.c:208: else if(threadname == 1 && (masky & 0x02) != 0 && clockb == 0){
      000361 74 01            [12]  674 	mov	a,#0x01
      000363 B5 21 09         [24]  675 	cjne	a,_threadname,00111$
      000366 E5 20            [12]  676 	mov	a,_masky
      000368 30 E1 04         [24]  677 	jnb	acc.1,00111$
      00036B E5 28            [12]  678 	mov	a,_clockb
      00036D 60 1C            [24]  679 	jz	00122$
                                    680 ;	preemptive.c:209: break;
      00036F                        681 00111$:
                                    682 ;	preemptive.c:211: else if(threadname == 2 && (masky & 0x04) != 0 && clockc == 0){
      00036F 74 02            [12]  683 	mov	a,#0x02
      000371 B5 21 09         [24]  684 	cjne	a,_threadname,00106$
      000374 E5 20            [12]  685 	mov	a,_masky
      000376 30 E2 04         [24]  686 	jnb	acc.2,00106$
      000379 E5 29            [12]  687 	mov	a,_clockc
      00037B 60 0E            [24]  688 	jz	00122$
                                    689 ;	preemptive.c:212: break;
      00037D                        690 00106$:
                                    691 ;	preemptive.c:214: else if(threadname == 3 && (masky & 0x08) != 0 && clockd == 0){
      00037D 74 03            [12]  692 	mov	a,#0x03
      00037F B5 21 BB         [24]  693 	cjne	a,_threadname,00120$
      000382 E5 20            [12]  694 	mov	a,_masky
      000384 30 E3 B6         [24]  695 	jnb	acc.3,00120$
      000387 E5 2A            [12]  696 	mov	a,_clockd
      000389 70 B2            [24]  697 	jnz	00120$
                                    698 ;	preemptive.c:217: } while (1);
      00038B                        699 00122$:
                                    700 ;	preemptive.c:218: RESTORESTATE;//restore thread
      00038B E5 21            [12]  701 	mov	a,_threadname
      00038D 24 23            [12]  702 	add	a,#_savedSP
      00038F F9               [12]  703 	mov	r1,a
      000390 87 81            [24]  704 	mov	_SP,@r1
      000392 D0 D0            [24]  705 	POP PSW 
      000394 D0 83            [24]  706 	POP DPH 
      000396 D0 82            [24]  707 	POP DPL 
      000398 D0 F0            [24]  708 	POP B 
      00039A D0 E0            [24]  709 	POP ACC 
                                    710 ;	preemptive.c:219: }
      00039C 22               [24]  711 	ret
                                    712 ;------------------------------------------------------------
                                    713 ;Allocation info for local variables in function 'ThreadExit'
                                    714 ;------------------------------------------------------------
                                    715 ;	preemptive.c:226: void ThreadExit(void){
                                    716 ;	-----------------------------------------
                                    717 ;	 function ThreadExit
                                    718 ;	-----------------------------------------
      00039D                        719 _ThreadExit:
                                    720 ;	preemptive.c:228: EA = 0;
                                    721 ;	assignBit
      00039D C2 AF            [12]  722 	clr	_EA
                                    723 ;	preemptive.c:230: if(threadname == 0){
      00039F E5 21            [12]  724 	mov	a,_threadname
      0003A1 70 06            [24]  725 	jnz	00102$
                                    726 ;	preemptive.c:231: masky = masky &~ (0x01); 
      0003A3 53 20 FE         [24]  727 	anl	_masky,#0xfe
                                    728 ;	preemptive.c:232: clocka=0;
      0003A6 75 27 00         [24]  729 	mov	_clocka,#0x00
      0003A9                        730 00102$:
                                    731 ;	preemptive.c:234: if(threadname == 1){
      0003A9 74 01            [12]  732 	mov	a,#0x01
      0003AB B5 21 06         [24]  733 	cjne	a,_threadname,00104$
                                    734 ;	preemptive.c:235: masky = masky &~ (0x02); 
      0003AE 53 20 FD         [24]  735 	anl	_masky,#0xfd
                                    736 ;	preemptive.c:236: clockb=0;
      0003B1 75 28 00         [24]  737 	mov	_clockb,#0x00
      0003B4                        738 00104$:
                                    739 ;	preemptive.c:238: if(threadname == 2){
      0003B4 74 02            [12]  740 	mov	a,#0x02
      0003B6 B5 21 06         [24]  741 	cjne	a,_threadname,00106$
                                    742 ;	preemptive.c:239: masky = masky &~ (0x04);
      0003B9 53 20 FB         [24]  743 	anl	_masky,#0xfb
                                    744 ;	preemptive.c:240: clockc=0;
      0003BC 75 29 00         [24]  745 	mov	_clockc,#0x00
      0003BF                        746 00106$:
                                    747 ;	preemptive.c:242: if(threadname == 3){
      0003BF 74 03            [12]  748 	mov	a,#0x03
      0003C1 B5 21 06         [24]  749 	cjne	a,_threadname,00108$
                                    750 ;	preemptive.c:243: masky = masky &~ (0x08);
      0003C4 53 20 F7         [24]  751 	anl	_masky,#0xf7
                                    752 ;	preemptive.c:244: clockd=0;
      0003C7 75 2A 00         [24]  753 	mov	_clockd,#0x00
      0003CA                        754 00108$:
                                    755 ;	preemptive.c:246: SemaphoreSignal(thread_num);//thread kill num+1
      0003CA 05 2F            [12]  756 	INC _thread_num 
                                    757 ;	preemptive.c:247: EA = 1;
                                    758 ;	assignBit
      0003CC D2 AF            [12]  759 	setb	_EA
                                    760 ;	preemptive.c:248: do{ // 
      0003CE                        761 00123$:
                                    762 ;	preemptive.c:249: threadname=(threadname + 1) % 4;
      0003CE AE 21            [24]  763 	mov	r6,_threadname
      0003D0 7F 00            [12]  764 	mov	r7,#0x00
      0003D2 8E 82            [24]  765 	mov	dpl,r6
      0003D4 8F 83            [24]  766 	mov	dph,r7
      0003D6 A3               [24]  767 	inc	dptr
      0003D7 75 08 04         [24]  768 	mov	__modsint_PARM_2,#0x04
                                    769 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      0003DA 8F 09            [24]  770 	mov	(__modsint_PARM_2 + 1),r7
      0003DC 12 05 51         [24]  771 	lcall	__modsint
      0003DF AE 82            [24]  772 	mov	r6,dpl
      0003E1 AF 83            [24]  773 	mov	r7,dph
      0003E3 8E 21            [24]  774 	mov	_threadname,r6
                                    775 ;	preemptive.c:250: if((masky >> threadname) & 1){
      0003E5 85 21 F0         [24]  776 	mov	b,_threadname
      0003E8 05 F0            [12]  777 	inc	b
      0003EA E5 20            [12]  778 	mov	a,_masky
      0003EC 80 02            [24]  779 	sjmp	00176$
      0003EE                        780 00175$:
      0003EE C3               [12]  781 	clr	c
      0003EF 13               [12]  782 	rrc	a
      0003F0                        783 00176$:
      0003F0 D5 F0 FB         [24]  784 	djnz	b,00175$
      0003F3 30 E0 D8         [24]  785 	jnb	acc.0,00123$
                                    786 ;	preemptive.c:251: if(threadname == 0 && clocka == 0){
      0003F6 E5 21            [12]  787 	mov	a,_threadname
      0003F8 70 04            [24]  788 	jnz	00110$
      0003FA E5 27            [12]  789 	mov	a,_clocka
      0003FC 60 1B            [24]  790 	jz	00125$
                                    791 ;	preemptive.c:252: break;
      0003FE                        792 00110$:
                                    793 ;	preemptive.c:254: if(threadname == 1 && clockb == 0){
      0003FE 74 01            [12]  794 	mov	a,#0x01
      000400 B5 21 04         [24]  795 	cjne	a,_threadname,00113$
      000403 E5 28            [12]  796 	mov	a,_clockb
      000405 60 12            [24]  797 	jz	00125$
                                    798 ;	preemptive.c:255: break;
      000407                        799 00113$:
                                    800 ;	preemptive.c:257: if(threadname == 2 && clockc == 0){
      000407 74 02            [12]  801 	mov	a,#0x02
      000409 B5 21 04         [24]  802 	cjne	a,_threadname,00116$
      00040C E5 29            [12]  803 	mov	a,_clockc
      00040E 60 09            [24]  804 	jz	00125$
                                    805 ;	preemptive.c:258: break;
      000410                        806 00116$:
                                    807 ;	preemptive.c:260: if(threadname == 3 && clockd == 0){
      000410 74 03            [12]  808 	mov	a,#0x03
      000412 B5 21 B9         [24]  809 	cjne	a,_threadname,00123$
      000415 E5 2A            [12]  810 	mov	a,_clockd
      000417 70 B5            [24]  811 	jnz	00123$
                                    812 ;	preemptive.c:264: }while(1);
      000419                        813 00125$:
                                    814 ;	preemptive.c:265: RESTORESTATE;
      000419 E5 21            [12]  815 	mov	a,_threadname
      00041B 24 23            [12]  816 	add	a,#_savedSP
      00041D F9               [12]  817 	mov	r1,a
      00041E 87 81            [24]  818 	mov	_SP,@r1
      000420 D0 D0            [24]  819 	POP PSW 
      000422 D0 83            [24]  820 	POP DPH 
      000424 D0 82            [24]  821 	POP DPL 
      000426 D0 F0            [24]  822 	POP B 
      000428 D0 E0            [24]  823 	POP ACC 
                                    824 ;	preemptive.c:266: }
      00042A 22               [24]  825 	ret
                                    826 ;------------------------------------------------------------
                                    827 ;Allocation info for local variables in function 'myTimer0Handler'
                                    828 ;------------------------------------------------------------
                                    829 ;	preemptive.c:269: void myTimer0Handler(void){
                                    830 ;	-----------------------------------------
                                    831 ;	 function myTimer0Handler
                                    832 ;	-----------------------------------------
      00042B                        833 _myTimer0Handler:
                                    834 ;	preemptive.c:271: EA = 0;
                                    835 ;	assignBit
      00042B C2 AF            [12]  836 	clr	_EA
                                    837 ;	preemptive.c:272: SAVESTATE; 	
      00042D C0 E0            [24]  838 	PUSH ACC 
      00042F C0 F0            [24]  839 	PUSH B 
      000431 C0 82            [24]  840 	PUSH DPL 
      000433 C0 83            [24]  841 	PUSH DPH 
      000435 C0 D0            [24]  842 	PUSH PSW 
      000437 E5 21            [12]  843 	mov	a,_threadname
      000439 24 23            [12]  844 	add	a,#_savedSP
      00043B F8               [12]  845 	mov	r0,a
      00043C A6 81            [24]  846 	mov	@r0,_SP
                                    847 ;	preemptive.c:280: __endasm;
      00043E 88 E0            [24]  848 	MOV	ACC, R0
      000440 89 F0            [24]  849 	MOV	B, R1
      000442 8A 82            [24]  850 	MOV	DPL,R2
      000444 8B 83            [24]  851 	MOV	DPH, R3
                                    852 ;	preemptive.c:282: curTime = curTime + 1;//current time
      000446 E5 2B            [12]  853 	mov	a,_curTime
      000448 FF               [12]  854 	mov	r7,a
      000449 04               [12]  855 	inc	a
      00044A F5 2B            [12]  856 	mov	_curTime,a
                                    857 ;	preemptive.c:284: if(clocka > 0){ 
      00044C E5 27            [12]  858 	mov	a,_clocka
      00044E 60 05            [24]  859 	jz	00102$
                                    860 ;	preemptive.c:285: clocka --;
      000450 E5 27            [12]  861 	mov	a,_clocka
      000452 14               [12]  862 	dec	a
      000453 F5 27            [12]  863 	mov	_clocka,a
      000455                        864 00102$:
                                    865 ;	preemptive.c:287: if(clockb > 0){ 
      000455 E5 28            [12]  866 	mov	a,_clockb
      000457 60 05            [24]  867 	jz	00104$
                                    868 ;	preemptive.c:288: clockb --;
      000459 E5 28            [12]  869 	mov	a,_clockb
      00045B 14               [12]  870 	dec	a
      00045C F5 28            [12]  871 	mov	_clockb,a
      00045E                        872 00104$:
                                    873 ;	preemptive.c:290: if(clockc > 0){ 
      00045E E5 29            [12]  874 	mov	a,_clockc
      000460 60 05            [24]  875 	jz	00106$
                                    876 ;	preemptive.c:291: clockc--;
      000462 E5 29            [12]  877 	mov	a,_clockc
      000464 14               [12]  878 	dec	a
      000465 F5 29            [12]  879 	mov	_clockc,a
      000467                        880 00106$:
                                    881 ;	preemptive.c:293: if(clockd > 0){ 
      000467 E5 2A            [12]  882 	mov	a,_clockd
      000469 60 05            [24]  883 	jz	00128$
                                    884 ;	preemptive.c:294: clockd --;
      00046B E5 2A            [12]  885 	mov	a,_clockd
      00046D 14               [12]  886 	dec	a
      00046E F5 2A            [12]  887 	mov	_clockd,a
                                    888 ;	preemptive.c:298: do{
      000470                        889 00128$:
                                    890 ;	preemptive.c:299: threadname = (threadname + 1) % 4;//yield to another thread
      000470 AE 21            [24]  891 	mov	r6,_threadname
      000472 7F 00            [12]  892 	mov	r7,#0x00
      000474 8E 82            [24]  893 	mov	dpl,r6
      000476 8F 83            [24]  894 	mov	dph,r7
      000478 A3               [24]  895 	inc	dptr
      000479 75 08 04         [24]  896 	mov	__modsint_PARM_2,#0x04
                                    897 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      00047C 8F 09            [24]  898 	mov	(__modsint_PARM_2 + 1),r7
      00047E 12 05 51         [24]  899 	lcall	__modsint
      000481 AE 82            [24]  900 	mov	r6,dpl
      000483 AF 83            [24]  901 	mov	r7,dph
      000485 8E 21            [24]  902 	mov	_threadname,r6
                                    903 ;	preemptive.c:300: if(clocka == 0 && threadname == 0 && (masky & 0x01) != 0){
      000487 E5 27            [12]  904 	mov	a,_clocka
      000489 70 09            [24]  905 	jnz	00124$
      00048B E5 21            [12]  906 	mov	a,_threadname
      00048D 70 05            [24]  907 	jnz	00124$
      00048F E5 20            [12]  908 	mov	a,_masky
      000491 20 E0 2A         [24]  909 	jb	acc.0,00130$
                                    910 ;	preemptive.c:301: break;
      000494                        911 00124$:
                                    912 ;	preemptive.c:303: else if(clockb == 0 && threadname == 1 && (masky & 0x02) != 0 ){
      000494 E5 28            [12]  913 	mov	a,_clockb
      000496 70 0A            [24]  914 	jnz	00119$
      000498 74 01            [12]  915 	mov	a,#0x01
      00049A B5 21 05         [24]  916 	cjne	a,_threadname,00119$
      00049D E5 20            [12]  917 	mov	a,_masky
      00049F 20 E1 1C         [24]  918 	jb	acc.1,00130$
                                    919 ;	preemptive.c:304: break;
      0004A2                        920 00119$:
                                    921 ;	preemptive.c:306: else if(clockc == 0 && threadname == 2 && (masky & 0x04) != 0 ){
      0004A2 E5 29            [12]  922 	mov	a,_clockc
      0004A4 70 0A            [24]  923 	jnz	00114$
      0004A6 74 02            [12]  924 	mov	a,#0x02
      0004A8 B5 21 05         [24]  925 	cjne	a,_threadname,00114$
      0004AB E5 20            [12]  926 	mov	a,_masky
      0004AD 20 E2 0E         [24]  927 	jb	acc.2,00130$
                                    928 ;	preemptive.c:307: break;
      0004B0                        929 00114$:
                                    930 ;	preemptive.c:309: else if(clockd == 0 && threadname == 3 && (masky & 0x08) != 0 ){
      0004B0 E5 2A            [12]  931 	mov	a,_clockd
      0004B2 70 BC            [24]  932 	jnz	00128$
      0004B4 74 03            [12]  933 	mov	a,#0x03
      0004B6 B5 21 B7         [24]  934 	cjne	a,_threadname,00128$
      0004B9 E5 20            [12]  935 	mov	a,_masky
      0004BB 30 E3 B2         [24]  936 	jnb	acc.3,00128$
                                    937 ;	preemptive.c:312: } while (1);
      0004BE                        938 00130$:
                                    939 ;	preemptive.c:323: __endasm;
      0004BE A8 E0            [24]  940 	MOV	R0, ACC
      0004C0 A9 F0            [24]  941 	MOV	R1, B
      0004C2 AA 82            [24]  942 	MOV	R2, DPL
      0004C4 AB 83            [24]  943 	MOV	R3, DPH
                                    944 ;	preemptive.c:324: RESTORESTATE;
      0004C6 E5 21            [12]  945 	mov	a,_threadname
      0004C8 24 23            [12]  946 	add	a,#_savedSP
      0004CA F9               [12]  947 	mov	r1,a
      0004CB 87 81            [24]  948 	mov	_SP,@r1
      0004CD D0 D0            [24]  949 	POP PSW 
      0004CF D0 83            [24]  950 	POP DPH 
      0004D1 D0 82            [24]  951 	POP DPL 
      0004D3 D0 F0            [24]  952 	POP B 
      0004D5 D0 E0            [24]  953 	POP ACC 
                                    954 ;	preemptive.c:325: EA = 1;
                                    955 ;	assignBit
      0004D7 D2 AF            [12]  956 	setb	_EA
                                    957 ;	preemptive.c:329: __endasm;
      0004D9 32               [24]  958 	RETI
                                    959 ;	preemptive.c:331: }
      0004DA 22               [24]  960 	ret
                                    961 	.area CSEG    (CODE)
                                    962 	.area CONST   (CODE)
                                    963 	.area XINIT   (CODE)
                                    964 	.area CABS    (ABS,CODE)
