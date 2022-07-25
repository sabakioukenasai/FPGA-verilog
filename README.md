# FPGA-verilog

### 写在前面
本仓库包含了作者就读于哈尔滨工业大学（深圳）时完成的一些硬件实验的vivado项目文件。

作者是20级计科的学生，创建这个仓库一方面是想整理之前写过的代码，另一方面是想传递一下资源，希望学弟学妹们可以少走弯路。

作者在写这些实验时水品也有限，可能难免在个别地方有有疏漏之处。当然，所有工程整体上都是可用的（）。数字逻辑实验作者扣的分也不多；而计算机设计与实践本身就是考查课，作者也做到了流水线CPU的冒险处理，基本上可以满足大部分同学的需要。

所有的工程文件都是使用 **Vivado 2018.2** 的版本创建的，只要你安装了大于等于这个版本的 Vivado 就可以直接打开。（实验室的电脑安装的是**Vivado 2018.3**当然也可以打开这些工程项目）。

---

### 数字逻辑设计

刚刚接触硬件语言，大家肯定会觉得十分不适应，它和我们在大一学习的C语言有许多不同之处，各类bug也是层出不穷，很多概念也是第一次接触——延迟、毛刺、锁存、闭环等等。学长也是这样一路走过来，刚开始的时候很不适应，前几次做实验都是屡屡破防，天天加班。

当然，后面熟悉了verilog语言后，也渐渐得心应手，能够在课上腾出一些时间完成实验报告。个人认为，理论课老师（可能不是所有老师都一样）关于verilog语言的讲解对我们完成实验帮助有限，希望后来者在做实验前可以通过其他途径学习verilog语法和编程知识，这样，有助于大家快速上手硬件实验。

*这里推荐一个网站：* [菜鸟教程 verilog](https://www.runoob.com/w3cnote/verilog-tutorial.html)

如果能提前在这个网站上学习一些关于verilog的知识（不用学很多，学到6.6节对付实验就够了），那么相信各位在上手实验时会感觉轻松很多。下图列出了一些可以略过的部分：

![](README/README1.png)

不同届可能做的实验可能不太一样，我们这一届，数字逻辑课程一共做了下面几个实验

![](README/README0.png)

实验与Vivado项目对应关系如下表所示

|   实验标题				|  对应的项目文件 			|
| ------------ 			| -------------- 			|
| 3-8译码器的实现 		| decoder_38 				|
| 计数器设计(包含两项任务)| flowing_water_lights & holiday_lights |
| 利用IP设计电路 			| memory_w_r 				|
| 数码管控制器设计 		| led_display_ctrl 			|
| 序列检测器设计 			| sequence_detection 		|
| 16进制计算器设计 		| calculator_hex 			|

**温馨提示：不同届即使是同名实验也有可能在细微处有差异，具体标准以教师提供的实验网站为准，请各位学弟学妹在食用时，反复确认本代码符合实验手册要求。**

*附实验网址：* [HITSZ-2021秋季 数字逻辑设计](https://hitsz-cslab.gitee.io/diglogic/)

---

### 计算机设计与实践

这门课开设与夏季小学期，是一门考察课。实验每年变化不大，都是用verilog语言实现CPU。

实验分为两个部分（其实还有一道开胃小菜，这里就不提了）：设计单周期CPU和设计流水线CPU，其中流水线CPU又分为理想流水线CPU和解决冲突冒险的流水线CPU。如果单周期CPU完全正确就能及格，但是为了容错，一般大家都会做一个理想流水线。要求必须实现24条必备指令，有能力的同学可以挑战37条RISC-V指令。(作者只写了24条啦

单周期CPU俺是全部完成的，流水线CPU也是几乎完成的。几乎的意思是，解决了冲突冒险，完成了trace测试（这个你们做到实验了会懂的），但是下板的时候有瑕疵。

#### 令我受益的开发方法

做完实验后觉得，老师当时要求我们填写数据通路表和控制信号表、绘制模块设计图的决定是十分正确的。它们可以帮助你理清CPU每条指令的运行逻辑。**表填好里，图画好了，写代码的时候就有底气、有参照！！！**

#### 好用的资源

绘图使用的软件可以从此处下载，**真的十分好用，墙推！！！** [draw.io](https://github.com/jgraph/drawio-desktop/releases/tag/v15.4.0)

*附实验网站：* [HITSZ-2022夏季 计算机设计与实践](https://hitsz-cslab.gitee.io/cpu/)

#### 一点忠告

所有代码、表格和图片资源都已附上，作者希望这些资源能够成为大家完成实验的助力。因为每个人的设计不同，控制信号表、整体框图都会有所差异，老师在查重方面也是比较严格，大家也要稍微自力更生一下(: 

**如果大家不把内部原理弄清楚，在写代码和验收的时候都会很痛苦。老师会询问你CPU的实现细节，如果代码能过，但是你回答不上老师的问题，就会很尴尬。**