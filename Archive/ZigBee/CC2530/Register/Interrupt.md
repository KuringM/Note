[CC2530的中断系统及外部中断应用_364.99°的博客-CSDN博客_cc2530中断源](https://blog.csdn.net/m0_54355172/article/details/117584811?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1.pc_relevant_default&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1.pc_relevant_default&utm_relevant_index=2)

## 中断的相关概念

1. **内核**与 **外设**之间的主要交互方式: **轮询**、 **中断**
2. 中断
> 程序在执行过程中由于 **外界的原因** 而被中间打断的情况称为中断:  
> 在执行CPU当前程序时,由于系统中出现了某种急需处理的情况, **CPU暂停** 正在执行的程序,转而去执行另一段特殊程序来处理出现的紧急事务 
> 处理结束后 **CPU自动返回** 到原来暂停的程序中去继续执行
3. 两个重要概念
> **中断服务函数:** 内核响应中断后执行的相应 **处理程序**  
> **中断向量:** 中断服务程序的 **入口地址**  
> 每个中断源都对应一个固定的入口地址.当内核响应中断请求时,就会暂停当前的程序执行,然后跳转到该入口地址执行代码

## CC2530中断系统
- 常用中断源
![[Accessory/Interrupt01.png]]

## CC2530中断处理函数编写方法

### Format
``` c
#pragma vertor = <Interrupt vector>
__interrupt void<func name>(void)
{ 
  // programme
}
```
1. `<Interrupt vector>`: 表示接下来要写的中断服务函数是为哪个中断源服务的,由两种写法
	a. 中断向量的入口地址: `#pragma vertor = 0x7B`
	b. 头文件`ioCC2530.h`中的宏定义: `#pragma vector = P1INT_VECTOR`
2. `__interrupt`:表示该函数是一个中断服务函数
	> `<func name>`: 可以自定义,函数体不能带有参数,也不能有返回值

## CC2530外部中断

1. P0、P1和P2端口分别使用P0IF、P1IF和P2IF作为中断标志位，任何一个端口组上的引脚 **产生外部中断时** ，都会将对应端口组的 **中断标志自动置位**

2. **端口状态标志寄存器** P0IFG、P1IFG和P2IFG，分别对应三个端口中各引脚的 **中断触发状态** ，当某引脚发生外部中断触发时，对应的标志位会 **自动置位**

$\textcolor{red}{注}$
1. 外部中断标志必须在中断服务函数中 **手动清除** 
2. 端口状态标志也需要 **手动清除**

## 外部中断初始化函数Init_INTP()

- step1. 配置IENx寄存器, 使能端口组的中断功能

IEN2中断使能寄存器

|  位 | 位名称 | 复位值 | description                                       |
|:---:|:------:|--------|---------------------------------------------------|
| 7-6 |   --   | 00     | 不使用, 默认0                                     |
|  5  |  WDTIE | 0      | 看门狗定时器 中断使能<BR>0:中断禁止<BR>1:中断使能 |
|  4  |  P1IE  | 0      | 端口1 中断使能<BR>0:中断禁止<BR>1:中断使能        |
|  3  | UTX1IE | 0      | USART 1 发送 中断使能<BR>0:中断禁止<BR>1:中断使能 |
|  2  | UTX0IE | 0      | USART 0 发送 中断使能<BR>0:中断禁止<BR>1:中断使能 |
|  1  |  P2IE  | 0      | 端口 2 中断使能<BR>0:中断禁止<BR>1:中断使能       |
|  0  |  RFIE  | 0      | RF 一般 中断使能<BR>0:中断禁止<BR>1:中断使能      |

- step2. 配置PxIEN寄存器，使能具体的外部中断引脚
- step3. 配置PICTL寄存器，设置中断触发方式

|  位 |  位名称 | 复位值 | 操作 | 描述                                                            |
|:---:|:-------:|--------|------|-----------------------------------------------------------------|
|  7  |  PADSC  | 0      | R/W  | 控制I/O引脚输出模式下的驱动能力                                 |
| 6:4 |   ----  | 000    | RO   | no use                                                          |
|  3  |  P2ICON | 0      | R/W  | 端口P2_4到P2_0中断触发方式选择<BR>0:上升沿触发<BR>1:下降沿触发 |
|  2  | P1ICONH | 0      | R/W  | 端口P1_7到P1_4中断触发方式选择<BR>0:上升沿触发<BR>1:下降沿触发 |
|  1  | P1ICONL | 0      | R/W  | 端口P1_3到P1_0中断触发方式选择<BR>0:上升沿触发<BR>1:下降沿触发 |
|  0  |  P0ICON | 0      | R/W  | 端口P1_4到P0_0中断触发方式选择<BR>0:上升沿触发<BR>1:下降沿触发 |

### 举例
``` c
void Init_INTP(){
	// P1_2 connect key
	IEN2 |= 0x10; // Port 1 interrupt enable
	P1IEN |= 0x04 // P1_2 external interrupt enable
	PICTL = 0x02 // P1_3 to P1_0 falling edge trigger
	EA = 1 // Enable total interrupt
}
```

## 涉及外部中断服务函数Int1_Sevice()
> 在编写中断服务函数时，注意书写格式和中断向量要正确  
> 注意： 在函数里面把端口组和引脚的标志为手动清除，否则CPU将反复进入中断，
> 必须先清除引脚标志位`PxIFG`,再清除端口组标志位`PxIF`

### 举例
``` c
#pragma vertor = P1INT_VECTOR
__interrupt void Int1_Sevice(){

	LED = ~LED;
	P1IFG &= ~0x04; // clear P1_2 interrupt flag
	P1IF = 0; // clear P1 interrupt flag
}
```

<++>
