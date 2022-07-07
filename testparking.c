/*
* file: testparking.c
*/
#include <8051.h>
#include "preemptive.h"
/*
* @@@ [2pt]
* declare your global variables here, for the shared buffer
* between the producer and consumer.
* Hint: you may want to manually designate the location for the
* variable. you can use
* __data __at (0x30) type var;
* to declare a variable var of the type
*/
void Car(void)
{
	SemaphoreWait(empty);//If a Car sees a parking lot if empty and get a mutex, it can park itself into it.
   	SemaphoreWait(mutex);
   	if(curcar == 0b00000000){//代表哪台車parking
		list[threadname] = '1';
		curcar = 0b00000001;
		if(!space[0]){
			space[0] = '1';
		}else if(!space[1]){
			space[1] = '1';
		}
        
	}
	else if(curcar == 0b00000001){
		list[threadname] = '2';
		curcar = 0b00000011;
		if(!space[0]){
			space[0] = '2';
		}else if(!space[1]){
			space[1] = '2';
		}
	}
	else if(curcar == 0b00000011){
		list[threadname] = '3';
		curcar = 0b00000111;
		if(!space[0]){
			space[0] = '3';
		}else if(!space[1]){
			space[1] = '3';
		}
	}
	else if(curcar == 0b00000111){
		list[threadname] = '4';
		curcar = 0b00001111;
		if(!space[0]){
			space[0] = '4';
		}else if(!space[1]){
			space[1] = '4';
		}
	}
	else if(curcar == 0b0001111)
	{
		list[threadname] = '5';
		curcar = 0b00011111;
		if(!space[0]){
			space[0] = '5';
		}else if(!space[1]){
			space[1] = '5';
		}
	}

	SBUF = list[threadname]; while(!TI){}TI=0;
	SBUF = '>'; while(!TI){}TI = 0;
	if(space[0] == list[threadname]){
		SBUF = '0';
        while(!TI){}TI = 0;
	}else if(space[1] == list[threadname]){
		SBUF = '1';
        while(!TI){}TI = 0;
	}
    
	SemaphoreSignal(mutex);

	delay(10);//thread離開

   	SemaphoreWait(mutex); //拿key開走
    if(list[threadname] == space[0])
    {
    	space[0] = 0;
    	SBUF = list[threadname];//threadname代表現在是誰在操作 哪台車
        while(!TI){}TI = 0;
    	SBUF = '~';
        while(!TI){}TI = 0;
    	SBUF = '0';
        while(!TI){}TI = 0;
        // SBUF = ')';
        // while(!TI){}TI = 0;
	}
	else if(list[threadname] == space[1])
	{
		space[1] = 0;
		SBUF = list[threadname];
        while(!TI){}TI = 0;
    	SBUF = '~';
        while(!TI){}TI = 0;
    	SBUF = '1';
        while(!TI){}TI = 0;
        // SBUF = ')';
        // while(!TI){}TI = 0;
	}
//    SBUF = ')'; while(!TI){}TI = 0;
	SemaphoreSignal(mutex);//車子完成離開
  	SemaphoreSignal(empty);
    
   	ThreadExit();
}


void main(void)
{
    TMOD|=0x20;
    TH1=-6;
    SCON=0x50;
    TR1=1;
	curcar=0;
	space[0]=0;
	space[1]=0;
	list[0]=0;
	list[1]=0;
	list[2]=0;
	list[3]=0;
	ThreadCreate(Car);
    ThreadCreate(Car);
    ThreadCreate(Car);
    ThreadCreate(Car);
    ThreadCreate(Car);
	
	SemaphoreCreate(mutex, 1);
	SemaphoreCreate(full, 0);
	SemaphoreCreate(empty, 2);
    
}

void timer0_ISR(void) __interrupt(1) {
	__asm
	ljmp _myTimer0Handler
	__endasm;
}


void _sdcc_gsinit_startup(void){
    __asm
    ljmp _Bootstrap
    __endasm;
}
void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
