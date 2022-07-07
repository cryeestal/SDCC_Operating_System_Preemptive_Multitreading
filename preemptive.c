/*
* file: preemptive.c
*/
#include <8051.h>
#include "preemptive.h"

/*
 * @@@ [2 pts] declare the static globals here using
 *        __data __at (address) type name; syntax
 * manually allocate the addresses of these variables, for
 * - saved stack pointers (MAXTHREADS)
 * - current thread ID
 * - a masky for which thread ID is a valid thread;
 *   maybe also a count, but strictly speaking not necessary
 * - plus any temporaries that you need.
 */

void delay(unsigned char n){
	EA = 0;
	if(threadname == 0){
		clocka += 1/2 + n/8 ;
	}else if(threadname == 1){
		clockb += 1/2 + n/8 ;
	}else if(threadname == 2){
		clockc += 1/2 + n/8 ;
	}else if(threadname == 3){
		clockd += 1/2 + n/8 ;
	}
	EA = 1;
	ThreadYield();
}

unsigned char now(void){
	return curTime;
}


/*
 * @@@ [8 pts]
 * define a macro for saving the context of the current thread by
 * 1) push ACC, B register, Data pointer registers (DPL, DPH), PSW
 * 2) save SP into the saved Stack Pointers array
 *   as indexed by the current thread ID.
 * Note that 1) should be written in assembly,
 *     while 2) can be written in either assembly or C
 */
#define SAVESTATE           \
        __asm               \
			PUSH ACC        \
			PUSH B          \
			PUSH DPL        \
			PUSH DPH        \
			PUSH PSW        \
         __endasm;          \
         savedSP[threadname] = SP; \
        
            //mov acc,r0		
          	//push acc			
           //pop acc\ mov r0,acc
/*
 * @@@ [8 pts]
 * define a macro for restoring the context of the current thread by
 * essentially doing the reverse of SAVESTATE:
 * 1) assign SP to the saved SP from the saved stack pointer array
 * 2) pop the registers PSW, data pointer registers, B reg, and ACC
 * Again, popping must be done in assembly but restoring SP can be
 * done in either C or assembly.
 */
#define RESTORESTATE \
         SP = savedSP[threadname];\
    		__asm       \
				POP PSW \
				POP DPH \
				POP DPL \
				POP B   \
				POP ACC \
            __endasm;   \


 /*
  * we declare main() as an extern so we can reference its symbol
  * when creating a thread for it.
  */

extern void main(void);

/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */

void Bootstrap(void){
		
		EA = 0;
        masky = 0;//tread pool
		threadname = 0;//threadNum=0
        TMOD = 0; // timer 0 mode 0
		IE = 0x82; // enable timer0 interrupt
		TR0 = 1; // start runningtimer0	
		
		curTime = 0;//now
		clocka = 0;//delay循環
		clockb = 0;
		clockc = 0;
		clockd = 0;
		
		
		SemaphoreCreate(thread_num, 4);//count thread number only 4//有點怪
		SemaphoreCreate(mutex, 1);
		
		SemaphoreCreate(empty, 2);
		EA = 1;
        
        //2
        ThreadCreate(main);
        RESTORESTATE;
}

/*
 * ThreadCreate() creates a thread data structure so it is ready
 * to be restored (context switched in).
 * The function pointer itself should take no argument and should
 * return no argument.
 */
ThreadID ThreadCreate(FunctionPtr fp){
	SemaphoreWait(thread_num);//if threadnumber<=4 create newthread
    EA = 0; 
    __data __at(0x3A) ThreadID cnt = 0;
	__data __at(0x3B) char temp = 0;
    __data __at(0x3C) char tempword = 0;
    
    if(!(masky & 0x01)){//no 1
		masky = masky | 0x01;
		cnt = 0;//threadid
	}else if(!(masky & 0x02)){
		masky = masky | 0x02;
		cnt = 1;
	}else if(!(masky & 0x04)){
		masky = masky | 0x04;
		cnt = 2;
	}else if(!(masky & 0x08)){
		masky = masky | 0x08;
		cnt=3;
	}
    
	if(cnt == 0){
		temp = 0x3F;
		tempword = 0b00000000;
	}else if(cnt == 1){
		temp = 0x4F;//stack pointer
		tempword = 0b00001000;//state
	}else if(cnt == 2){
		temp = 0x5F;
		tempword = 0b00010000;
	}else if(cnt == 3){
		temp = 0x6F;
		tempword = 0b00011000;
	}

    __data __at(0x3D) char ptr = SP;
    SP = temp;

    //push retaddr
    //DPTR = fp;

    __asm
		PUSH DPL
		PUSH DPH
    __endasm;

    //push ACC B DPTR PSW
    __data __at(0x3E) char ACCnow = ACC;
    ACC = 0;
            
	__asm
		PUSH ACC
		PUSH ACC
		PUSH ACC
		PUSH ACC
    __endasm;
	//push psw
    __asm
    	PUSH 0x3C
    __endasm;
    //g. write the current stack pointer to the saved stack
    //      pointer array for this newly created thread ID
    savedSP[cnt] = SP;//stack pointer
    SP = ptr;//restore back
    ACC = ACCnow;
    EA = 1;//inside EA=0 and EA=1
    return cnt;   
}

/*
 * this is called by a running thread to yield control to another
 * thread.  ThreadYield() saves the context of the current
 * running thread, picks another thread (and set the current thread
 * ID to it), if any, and then restores its state.
 */

void ThreadYield(void){
	SAVESTATE;//save original thread
	do{ //find the next thread that can run and set the current thread ID to it,
		threadname = (threadname + 1) % 4;
		if(threadname == 0 && (masky & 0x01) != 0 && clocka == 0){
			break;
			}
		else if(threadname == 1 && (masky & 0x02) != 0 && clockb == 0){
			break;
			} 
		else if(threadname == 2 && (masky & 0x04) != 0 && clockc == 0){
			break;
			} 
		else if(threadname == 3 && (masky & 0x08) != 0 && clockd == 0){
			break;
			} 
	} while (1);
	RESTORESTATE;//restore thread
}

/*
 * ThreadExit() is called by the thread's own code to termiate
 * itself.  It will never return; instead, it switches context
 * to another thread.
 */
void ThreadExit(void){
        
	EA = 0;
	// clear the bit for the current thread from the masky
	if(threadname == 0){
		masky = masky &~ (0x01); 
		clocka=0;
		}//clear the cycle
	if(threadname == 1){
		masky = masky &~ (0x02); 
		clockb=0;
		}
	if(threadname == 2){
		masky = masky &~ (0x04);
		 clockc=0;
		 }
	if(threadname == 3){
		masky = masky &~ (0x08);
		 clockd=0;
		 } 
	SemaphoreSignal(thread_num);//thread kill num+1
	EA = 1;
	do{ // 
		threadname=(threadname + 1) % 4;
		if((masky >> threadname) & 1){
			if(threadname == 0 && clocka == 0){
				break;
				}
			if(threadname == 1 && clockb == 0){
				break;
				}
			if(threadname == 2 && clockc == 0){
				break;
				}
			if(threadname == 3 && clockd == 0){
				break;
				}
		}
	}while(1);
	RESTORESTATE;
}


void myTimer0Handler(void){
	// don't do __critial
	EA = 0;
	SAVESTATE; 	
	// any code that modifies R0 - R7 will trash them and their values
	// cannot be restored by RESTORESTATE.
	__asm
		MOV ACC, R0
		MOV B, R1
		MOV DPL,R2
		MOV DPH, R3
	__endasm;
	
	curTime = curTime + 1;//current time

	if(clocka > 0){ 
		clocka --;
		}//run cycle
	if(clockb > 0){ 
		clockb --;
		}
	if(clockc > 0){ 
		clockc--;
	}
	if(clockd > 0){ 
		clockd --;
		}
	
	// same as threadyield
	do{
		threadname = (threadname + 1) % 4;//yield to another thread
		if(clocka == 0 && threadname == 0 && (masky & 0x01) != 0){
			break;
			}
		else if(clockb == 0 && threadname == 1 && (masky & 0x02) != 0 ){
			break;
			} 
		else if(clockc == 0 && threadname == 2 && (masky & 0x04) != 0 ){
			break;
			} 
		else if(clockd == 0 && threadname == 3 && (masky & 0x08) != 0 ){
			break;
			} 
	} while (1);

	/*   preserve the value of any such registers by copying
		them to registers that have been saved (e.g., B, DPH, DPL, etc., or your designated memory
		locations) after SAVESTATE, and copy them back to those registers before the
		RESTORESTATE. */
    __asm
		MOV R0, ACC
		MOV R1, B
		MOV R2, DPL
		MOV R3, DPH
	__endasm;
    RESTORESTATE;
	EA = 1;
	
	__asm
		RETI
	__endasm;
	// RETI return from the interrupt
}

