- Tags: #CC2530 #LED
- Date: 2022-04-29
---
![[Accessory/01.png]]
当P1_0输出低电平时LED1被点亮

# Register Review
![[../../Register/IO-related-Registers#PxSEL 端口功能选择寄存器]]
![[../../Register/IO-related-Registers#PxDIR I O设置寄存器]]
## source code
``` c
#include <ioCC2530.h>
#define LED1 P1_0 //define LED1 to control P1_0 

void IO_Init(void)
{
	P1SEL &= ~0x01; // 0000 0001 to clear and set P1_0 as I/O port
	P1DIR |= 0x01; // 0000 0001 to set 1 and set P1_0 as the output transmission direction
}
void main(void)
{
	IO_Init();
	LED1=0; // P1_0 output low level to light up the led
	while(1); // Infinite loop, continue to run the program
}
```