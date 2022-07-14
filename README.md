# Operating System Preemptive Multitreading Based on Edsim51
## 1.UART output in EDSIM51
* Display the output of log to UART in a human-readable text format.
```
>:park in,~:get out
The total text mean:
1>0 first car go into parking space 0
2>1 second into space 1
1~0) first car get out from parking space 0
2~1) second out space 1
3>0 third into space 0
4>1 fourth into space 1
4~1) fourth out space 1
5>1 fifth into space 1
3~0) third out space 0
5~1) fifth out space 1
```
<div align=center><img src="/img/o1.png" alt="Cover" width="55%"/></div>

## 2.explanation for delay(n), now()
```
I think ‘ms’ is a favorable option of time unit 
because any time unit that is larger than 1 second is not useful.
I try to use n+0.5 time to delay every thread 
but find out that the effect of selecting delay time by my way is better than that the spec provides. 
After trying variable of time unit, I use n/8+0.5 and have UART 
to print the parking-lot result successfully, 
which indicates that four threads will park in and get out then yield if their cycles finish.
I use four value to spawn cycles for each thread because they run them independently.
The now() function display the current time.
```

## 3.explanation for Thread Termination and Creation
* For guard thread creation and termination, I use a semaphore
```
SemaphoreSignal(thread_num)
```
* to allow creation fo thread up to four. 
```
In ThreadExit it indicates that a thread killed 
so there is a spare space for another thread to create.
Thread exit terminate the thread and erase it on mask before it turn to
serve next thread which is available.It will enter an infinite loop when
there is no other thread to run until next thread is created.
```
<div align=center><img src="/img/o2.png" alt="Cover" width="55%"/></div>

## 4.explanation for Parking Lot Example
```
First, 
car which want a parking lot space wait for Semaphore 
empty and compete for the mutex lock.
Upon one of the car obtain the mutex key, 
it can park in the parking lot.
It makes curcar value from 0 to 1, 
which means one car has start it cycle and total for five cars.
For next step,
list the corresponding car id for ‘1’,and check if space[0] or space[1]
are ‘0’(empty).If it is empty, park in and mark the space ‘1’(full).
Put list[carid] in to UART buffer to print out result.
```
<div align=center><img src="/img/o3.png" alt="Cover" width="45%"/></div>


