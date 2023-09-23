
- Tags: #CC2530 #LED
- Date: 2022-05-07
---

``` c
#include <ioCC2530.h>

typedef unsigned char uchar;
typedef unsigned int uint;

#define LED1 P1_0
#define LED2 P1_1 //定义 P1.1 口为 LED2 控制端 
#define LED3 P1_4 //定义 P1.4 口为 LED3 控制端
void DelayMS(uint msec)
{ 
 uint i,j;
 
 for (i=0; i< msec; i++)
 for (j=0; j< 535; j++);
}

void LedOnOrOff(uchar mode) 
{ 
 LED1 = mode; 
 LED2 = mode; 
 LED3 = mode;//由于 P1.4 与仿真器共用,必须拔掉仿真器的插头才能看到 LED3 的变化 
}
void InitLed(void)
{
 P1DIR |= 0x13; //P1.0 定义为输出口
}
void main(void)
{ 
  uchar i;
 InitLed(); //设置 LED 灯相应的 IO 口
 while(1) //死循环
 {
 LED1 = !LED1; //流水灯，初始化时 LED 为熄灭执行后则点亮
 DelayMS(200); 
 LED2 = !LED2; 
 DelayMS(200); 
 LED3 = !LED3; 
 DelayMS(200); 
 
 for (i=0; i<2; i++) //所有灯闪烁 2 次
 { 
 LedOnOrOff(1); //关闭所有 LED 灯
 DelayMS(200); 
 LedOnOrOff(0); //打开所有 LED 灯
 DelayMS(200); 
 } 
 
 LedOnOrOff(1); //使所有 LED 灯熄灭状态
 DelayMS(500); 
 }
}
```
