/*
* file: preemptive.h
*/
#ifndef __COOPERATIVE_H__
#define __COOPERATIVE_H__

#define MAXTHREADS 4  /* not including the scheduler */
/* the scheduler does not take up a thread of its own */


// create a counting semaphore s that is initialized to n
#define SemaphoreCreate(s, n)\
            s = n\

/*
top of while-loop \
read value of _S into ACC (where S is semaphore) \
conditionally jump(s) back to label if ACC <= 0 \
fall-through to drop out of while-loop
ACC.7 bit (the sign bit) is 1, then the number in the accumulator is negative,
thus, JZ  label + JB ACC.7, label means if ACC <= 0 // busy wait
 */
#define SemaphoreWaitBody(s, label) \
{									\
	__asm 							\
    label: 							\
       MOV ACC, CNAME(s)			\
       JZ  label					\
       JB ACC.7, label				\
       DEC  CNAME(s)				\
    __endasm;						\
}									\

#define SemaphoreWait(s)\
{\
	SemaphoreWaitBody(s, MACRO)\
}\

// signal() semaphore s
#define SemaphoreSignal(s)	\
{							\
	__asm					\
	INC CNAME(s)			\
	__endasm;				\
}							\

//trans to correct sem name
#define CNAME(s) _ ## s

/* give each macro-expanded instance of inlined assembly code a different label, so the
instruction can jump to the proper label

SDCC reserves the labels in the form of 1$, 2$, … up to 100$ for
the user's code without conflict with the assembler’s labels. So we can define
SemaphoreWait to pass a unique label based on __COUNTER__ to SemaphoreWaitBody
each time. Just be sure you concatenate __COUNTER__ with the $ to form the label.
*/

#define MACRO MACRO2(__COUNTER__)
#define MACRO2(s) MACRO3(s)
#define MACRO3(s) s ## $


typedef char ThreadID;
typedef void (*FunctionPtr)(void);
unsigned char now(void);
void delay(unsigned char n);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);


// manually allocated memory in the range 0x20-0x3F

 __data __at (0x20) char masky; // which thread ID is a valid thread
 __data __at (0x21) ThreadID threadname;
 __data __at (0x22) char threadNum;
 __data __at (0x23) char savedSP[4]; // ~26
 
__data __at(0x27) char clocka;
__data __at(0x28) char clockb;
__data __at(0x29) char clockc;
__data __at(0x2A) char clockd;
__data __at(0x2B) unsigned char curTime;

__data __at(0x2C) char mutex;
__data __at(0x2D) char full;
__data __at(0x2E) char empty;
__data __at(0x2F) char thread_num;//for mutex

__data __at(0x30) char curcar;
__data __at(0x31) char space[2];
__data __at(0x33) char list[4];//curID-->carID


#endif // __COOPERATIVE_H__
