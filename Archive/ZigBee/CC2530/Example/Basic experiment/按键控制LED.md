- Tags: #CC2530 #KEY
- Date: 2022-04-29
---
![[Accessory/02.png]]
s1按下时P0_4被拉低

## source code
```c
#include <ioCC2530.h>
#define uint unsigned int // define alias
#define uchar unsigned char 

#define LED1 P1_0 
#define KEY1 P0_4

// function declaration
void Delayms(uint);
void InitLed(void);
void KeyInit();
uchar KeyScan();

```

### delay function
```c
void Delayms(uint xms) // delay i ms ?_?
{
	uint I,j;
	for(i=xms;i>0;i--)
		for(j=587;j>0;j--);
}
```

### initialization function
```c
void InitLed(void)
{
	P1DIR |= 0x01; 
	LED1 = 1; // LED1 extinguished
}

void InitKey()
{
	P0SEL &= ~0x10; // set P0_4 as I/O
	P0DIR &= ~0x10; // set P0_4 as input port
	P0INP &= ~0x10; // Turn on the pull-up resistor, no effect
}
```

### key scan func
```c
uchar KeyScan(void)
{
	if(KEY1==0) // when press the button, KEY1 = P0_4 = 0 
	{
		Delayms(10);
		if(KEY1==0)
		{
			while(!KEY1); // Hand release detection
			return 1; // meaning someone press the button
		}
	}
	return 0; // no one press the button
}
```

### main func
```c
void main(void)
{
	InitLed();
	InitKey();
	while(1) // Infinite loop
	{
		if(KeyScan())
			LED1 = ~LED1
	}
}
```