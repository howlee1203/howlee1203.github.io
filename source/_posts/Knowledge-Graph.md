---
title: Knowledge Graph
date: 2023-09-30 17:53:29
tags: Summary
---

- [一个图像算法工程师的知识图谱：持续更新中](#一个图像算法工程师的知识图谱持续更新中)
  - [编程基础](#编程基础)
  - [编程应用](#编程应用)
  - [图像基础](#图像基础)
    - [镜头选型](#镜头选型)
    - [Sensor选型](#sensor选型)
    - [典型 ISP Pipeline](#典型-isp-pipeline)
    - [典型 ISP IP](#典型-isp-ip)
    - [推荐读物](#推荐读物)
      - [推荐书籍](#推荐书籍)
      - [推荐论文](#推荐论文)
      - [推荐标准](#推荐标准)
    - [推荐图像工具](#推荐图像工具)
  - [相关资料汇总](#相关资料汇总)
    - [精品课程](#精品课程)
    - [个人博客](#个人博客)
    - [开源项目](#开源项目)
    - [商业项目](#商业项目)
  - [职场软技能](#职场软技能)
  - [参考链接](#参考链接)

---

# 一个图像算法工程师的知识图谱：持续更新中

本文旨在对个人过往的工作经验做一个复盘，整理出一份 **图像算法工程师的知识图谱** 。利于后续的温故知新与查漏补缺。同时广而告之，便于和同行间进行交流。

---
## 编程基础

图像算法工程师作为码农的一个分支，对于编程能力也有着相当的要求。而当今不同的岗位需求对于图像算法工程师也有着截然不同的能力要求。基于笔者有限的工作经验，对于移动端的图像算法所需的基础编程能力做简单的的梳理。

| 基础能力 | 基础技能 | 学习途径 | 备注 |
| --- | --- | --- | --- |
| 系统平台 | Unix | [Unix教程](#unix教程) | Ubuntu/WSL2 |
|  | Windows | --- | --- |
|  | Android | [Android教程](#android教程) | --- |
|  | NVIDIA Jetson | [Jetson教程](#jetson) | --- |
| 编程语言 | C/C++ | [C/C++教程](#cc教程) | --- |
|  | Python | [Python教程](#python教程) | --- |
|  | Matlab | [Matlab教程](#matlab教程) | --- |
|  | CUDA | [CUDA教程](#cuda教程) | --- |
|  | CMake | [CMake教程](#cmake教程) | --- |
| 代码管理 | Git | [Git教程](#git教程) | --- |
|  | Repo | --- | --- |
|  | Gerrit | --- | --- |
| 编程文档 | Markdown | --- | --- |
|  | Doxygen | [Doxygen教程](#doxygen教程) | --- |
|  | LaTex | --- | --- |
| 编程思想 | DesignPattern | [设计模式](#设计模式) | --- |
|  | 代码重构 | --- | --- |
| 编程工具 | VSCode | [VSCode教程](#vscode教程) | --- |
|  | OpenCV | [OpenCV教程](#opencv教程) | --- |
|  | ROS | [ROS/Catkin教程](#roscatkin教程) | --- |
|  | V4l2 | [V4l2教程](#v4l2教程) | --- |
|  | GStream | [GStream教程](#gstream教程) | --- |
|  | Docker | [Docker教程](#docker教程) | --- |

基于上述编程基础能力，应该能独自进行图像算法开发，输出满足以下要求的算法代码/功能：
+ 具有一定的兼容能力：
  + 兼容不同操作系统：windows|linux|macOS etc.
  + 兼容不同的指令架构：x86|x64|arm etc.
  + 兼容不同调试版本：release|debug etc.
+ 具有一定的版本管理能力：
  + 版本定位：Change Id|Commit Id|Git Tag|Build Time etc.
  + 版本发布说明：Release Note etc.
  + 使用说明文档：ReadMe.md|`xxx -help` etc.
+ 具有一定的日志能力（LOG系统）：
  + 不同等级Log：Fatal|Error|Warning|Info|Debug etc.
  + 输出不同位置：CMD终端|文本文件|CSV文件 etc.
+ 具有一定的模块化能力：
  + 模块满足： **高内聚低耦合**
  + 注释模块：简单代码自注释，复杂代码有详细流程注释，支持 **Doxygen**
  + 测试模块：具有合格的单元测试能力，以及相应的批处理（shell|python调用）
+ 具有一定的工程应用能力：
  + 算力：常驻，峰值
  + 内存：常驻，峰值
  + 耗时：常驻，峰值
  + 功耗：常驻，峰值
  + 依赖性：依赖库尽量少

---
## 编程应用

如果前述 **编程基础** 是砖头水泥等原材料，那么 **编程应用** 就是使用这些材料建立高楼大厦的技术能力。没有好的原材料，再高的大楼也可能轰然倒塌；同样的，没有好的技术能力，再好的原材料，也难以平地起高楼。虽然作为图像算法，这些应用例子并不一定是必要的，但是足够优秀的应用都是好的老师，能给我们打开一扇门，树一面旗帜。

| 应用方向 | 应用技能 | 学习途径 | 备注 |
| --- | --- | --- | --- |
| 环境搭建 | 科学上网 | [科学上网](#科学上网教程) | VPN |
|  | 玩转C++ | [C++工具](#cpp工具清单) | --- |
|  | 玩转NAS | [玩转NAS](#玩转nas教程) | --- |
|  | 玩转移动机器人 | [玩转移动机器人](#玩转移动机器人教程) | --- |

---
## 图像基础

| 基本单元 | 子模块/参数 | 学习途径 | 备注 |
| --- | --- | --- | --- |
| 相机模组 | Cover Glass | --- | --- |
|  | Lens | --- | --- |
|  | COMS sensor | [CIS](#cis教程) | --- |
|  | ISP/DSP | --- | --- |
|  | FPC | --- | --- |
| Lens | 清晰度MTF | --- | --- |
|  | 光圈 | --- | --- |
|  | 景深 | --- | --- |
|  | 畸变 | --- | --- |
|  | 杂散光 | --- | ghost/flare/射线杂光/ASAP |
| CMOS Sensor | pixel size | --- | --- |
|  | active pixels | --- | --- |
|  | color filter array | --- | --- |
|  | sensitivity | --- | --- |
|  | dynamic range | --- | --- |
|  | SNR | --- | --- |
| Image Sensor Processing | AEC/AEDC/AWB/AF | [3A](#3a教程) | --- |
|  | pipeline | [pipeline](#pipeline教程) | --- |
|  | BLC/BPC/FPNC | --- | --- |
|  | HDR | [HDR](#hdr教程) |  |
|  | NR | [NR](#nr教程) | Noise Profile |
|  | Lens Shading Correction | [LSC](#lsc) | --- |
|  | Demosaic | [DEM](#demosaic教程) | RGGB/RCCB |
|  | DRC | [DRC](#drc教程) | --- |
|  | Gamma | [Gamma](#gamma教程) | --- |
|  | TMO | --- | alaw|reinhard|fattal |
|  | IQA | [IQA](#iqa) | [Imatest文档](./Knowledge-Graph/Imatest-Documentation.pdf) |
| 量产用视觉检测方案 | 清晰度算法方案 | --- | ISO12233 |
|  | 脏污检测方案 | --- | --- |
|  | 高低照度方案 | --- | --- |
|  | Shading标定方案 | --- | --- |
|  | 补光检测方案 | --- | --- |

 
### 镜头选型

+ MIC(Max Image Circle)|FOV|lens架构
+ lens list
+ MIC|EFL|F/#
+ 确认CRA|barrel diameter|景深
+ 样品性能确认，holder确认
+ 杂光确认
+ 轴向视点|FOV确认

### Sensor选型

+ optical format
+ active pixels
+ pixel size
+ color filter array
+ chief ray angle: fill factor|micro-lens
+ FSI|BSI|stacked BSI
+ Conversion gain|full well charge
+ rolling shutter|global shutter
+ responsivity|sensitivity
+ SNR
+ Noise
+ Dynamic Range
+ Black Level

### 典型 ISP Pipeline
slin -> bpc -> blc -> rdns -> rhdr -> lsc -> wbc -> demosaic -> ccm -> gamma -> gtm -> csc(rgb2yuv) -> cfc(yuv444 -> yuv422 -> yuv420)
+ slin: 分段线性化，采用两个gamma（8个点和256个点）串联
+ bpc：坏点校正
+ blc：黑电平校正
+ rdns：raw域降噪
+ rhdr：raw域HDR
+ lsc：lens shading correction
+ wbc：白平衡校正
+ demosaic：去马赛克
+ ccm：颜色校正
+ gamma：亮度域转变
+ gtm：global tone mapping

### 典型 ISP IP
LSC：要考虑效果，算力（定点化，计算量优化）等
  + 求当前pixel距离光心的xy方向偏移量
  + 归一化，1/r = (1+frac) * 1 >> (15-exp)
  + 旋转校正
  + 椭圆伸缩变换校正
  + 求欧式距离平方
  + 33个点插值求gain

### 推荐读物

#### 推荐书籍

+ 《图像处理、分析与机器视觉》 
+ 《CCD、CMOS图像传感器基础与应用》
+ 《图像传感器应用技术 第三版》
+ 《多传感器图像融合技术及应用》
+ 《智能CMOS图像传感器与应用》
+ 《Image Processing for Embedded Devices》
+ 《image sensor and signal processing for digital still cameras》

#### 推荐论文

+ RS: rolling shutter imaging on the electric grid from two rolling shutters to one global shutter
+ exposure fusion:a simple and practical alternative to high dynmaic range photograph

+ NR: drunet|edvr|mctf|vmctf
  + review:a comprehensive comparision of multi-dimensional image denoising methods
  + fastdvd
  + vnlnet
  + edvr
  + a brief review of real world color image denoising
  + benchmarking denoising algorithms with real photographs
  + unprocessing images for learned raw denoising
+ 暗光增强
  + LLE
  + STAR
  + LLIM

#### 推荐标准

+ mipi: [mipi-csi-2 spectification](https://www.synopsys.com/dw/ipdir.php?c=dwc_mipi_csi2_host)
+ ISO12233
+ EMVA1288


### 推荐图像工具

1. [FastStoneImageViewer](https://www.faststone.org/FSIVDownload.htm)
2. [ImageJ](https://imagej.net/downloads)
3. [YUVView](https://github.com/IENT/YUView/releases)
4. [7yuv](https://www.softpedia.com/get/Multimedia/Graphic/Graphic-Others/7yuv.shtml)
5. [irfanview](https://www.irfanview.com/)

---
## 相关资料汇总

### 精品课程

+ [华中科技大学精品课程](http://www.ablesky.com/hust-run)
+ [中国科学技术大学Linux用户协会](https://lug.ustc.edu.cn/wiki/)
+ [深蓝学院](https://www.shenlanxueyuan.com/)
+ [金老师的自学网站](https://jinxuliang.com/home/index)
+ [Qt开源社区](https://www.qter.org/)
+ [DevBean](https://www.devbean.net/)
  + [Qt学习之路](https://www.devbean.net/category/qt-study-road-2/)
+ [ISP](https://isp.uv.es/courses.html)
+ [泰晓科技](https://github.com/tinyclub)
+ [DayDayUp](http://www.day2up.com/mob/bus.do?method=article_show&show_id=6800fcc9db9745159dd4de26a917f2fa)
+ [Blender 2.80 参考手册](https://docs.blender.org/manual/zh-hans/2.80/index.html)

### 个人博客

+ [清新的日子](https://www.qinxing.xyz/)
+ [常丁方的博客](https://changdingfang.com/)
+ [bellard](https://bellard.org/)
+ [Ben](https://tinyprojects.dev/)
+ [image-sensors-world](http://image-sensors-world.blogspot.com/)

### 开源项目

+ [稚晖君](https://github.com/peng-zhihui)
+ [codeviz](https://github.com/petersenna/codeviz)
+ [cpp](https://alandefreitas.github.io/moderncpp/)
+ [gitbook](https://github.com/GitbookIO/gitbook)
+ [cvui](https://fernandobevilacqua.com/cvui/)
+ [CGAL](https://github.com/CGAL/cgal)

### 商业项目

+ [darktable](https://www.darktable.org/news/)
+ [neat image](https://ni.neatvideo.com/download/calibration-target)
+ [aptina](https://aptina.atlassian.net/wiki/spaces/DEVS/overview)

---
## 职场软技能

推荐两篇博文：
1. [5W1H8C1D分析法](http://changdingfang.com/book/promotion_pn/docs/special/w5h1c8d1.html)
2. [3C方案设计法](http://changdingfang.com/book/promotion_pn/docs/do/c3.html)


---
## 参考链接

<span id="unix教程">Unix教程:</span>

1. [Linux beginner](www.info.ee.surrey.ac.uk/Teaching/Unix/)
2. [菜鸟Linux教程](https://www.runoob.com/linux/linux-tutorial.html)
3. [菜鸟Shell教程](https://www.runoob.com/linux/linux-shell.html)
4. [博客：阮老师的SSH入门](https://www.ruanyifeng.com/blog/2020/12/ssh-tutorial.html)
5. [Github: Learn Vim](https://github.com/iggredible/Learn-Vim)
6. [博客：文本三剑客教程](https://www.cnblogs.com/along21/p/10366886.html)
7. [博客：windows上安装WSL2](https://zhuanlan.zhihu.com/p/337104547)

<span id="android教程">Android教程:</span>

1. [《自拍教程45》Python adb实时监控Logcat日志](https://www.cnblogs.com/zipython/p/12520873.html)

<span id="jetson">Jetson教程:</span>

1. [NVIDIA Jetson Linux](https://docs.nvidia.com/jetson/archives/r34.1/DeveloperGuide/index.html)


<span id="cc教程">C/C++教程:</span>

1. [C++ Language(C++ 11)](https://cplusplus.com/doc/tutorial/)
2. [《C++ Primer 中文版（第 5 版）》学习仓库](https://github.com/applenob/Cpp_Primer_Practice)
3. [Google 开源项目风格指南——中文版](https://zh-google-styleguide.readthedocs.io/en/latest/)
4. [Online C++ Compiler](https://www.tutorialspoint.com/compile_cpp_online.php)
5. [GoogleTest Primer](https://google.github.io/googletest/primer.html)

<span id="python教程">Python教程:</span>

1. [菜鸟Python3教程](https://www.runoob.com/python3/python3-tutorial.html)
2. [Python官方入门指南（中文）](http://www.pythondoc.com/pythontutorial3/index.html)
3. [从零开始学习PYTHON3讲义](http://blog.17study.com.cn/2018/12/18/python3-lesson1/)

<span id="cmake教程">CMake教程:</span>

1. [CMake Tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)
2. [An Introduction to Modern CMake](https://cliutils.gitlab.io/modern-cmake/)
3. [博客：CMake编译目标](https://www.cnblogs.com/foohack/p/3939506.html)

<span id="matlab教程">Matlab教程:</span>

1. [菜鸟Matlab教程](https://www.cainiaojc.com/matlab/matlab-tutorial.html)

<span id="cuda教程">CUDA教程:</span>

1. [博客：一文详解OpenCV中的CUDA模块](https://cloud.tencent.com/developer/article/1803649)
2. [博客：CUDA编程入门极简教程](https://zhuanlan.zhihu.com/p/34587739)

<span id="git教程">Git教程:</span>

1. [菜鸟Git教程](https://www.runoob.com/git/git-tutorial.html)
2. [博客：廖雪峰Git教程](https://www.liaoxuefeng.com/wiki/896043488029600)

<span id="doxygen教程">Doxygen教程:</span>

1. [Doxygen Manual](https://www.doxygen.nl/manual/starting.html)

<span id="docker教程">Docker教程:</span>

1. [菜鸟Docker教程](https://www.runoob.com/docker/docker-hello-world.html)
2. [docker安装](https://zhuanlan.zhihu.com/p/86734691)

<span id="opencv教程">OpenCV教程:</span>

1. [OpenCV](https://docs.opencv.org/4.x/)
2. [博客：linux下编译安装](https://blog.csdn.net/s15810751918/article/details/107705387)

<span id="roscatkin教程">ROS/Catkin教程:</span>

1. [ROS教程](https://wiki.ros.org/cn/ROS/Tutorials)
2. [ROS Tutorials](https://wiki.ros.org/ROS/Tutorials)
3. [Catkin Tutorials](https://wiki.ros.org/catkin/Tutorials)
4. [Catkin Command Line Tools](https://catkin-tools.readthedocs.io/en/latest/)
5. [image_view](http://wiki.ros.org/image_view#image_view.2BAC8-diamondback.video_recorder)
6. [Roslaunch在大型项目中的使用技巧](https://wiki.ros.org/cn/roslaunch/Tutorials/Roslaunch%20tips%20for%20larger%20projects)
7. [博客：ROS/C++入门教程](https://www.ncnynl.com/archives/201701/1273.html)
8. [博客：ROS教程](https://songapore.gitbook.io/ros-tutorials/)

<span id="设计模式">设计模式:</span>

1. [菜鸟设计模式教程](https://www.runoob.com/design-pattern/design-pattern-tutorial.html)
2. [博客：Java设计模式](https://c.biancheng.net/design_pattern/)
3. [博客：23种经典设计模式(附c++实现代码)](https://zhulao.gitee.io/blog/2019/03/31/23%E7%A7%8D%E7%BB%8F%E5%85%B8%E8%AE%BE%E8%AE%A1%E6%A8%A1%E5%BC%8F(%E9%99%84c++%E5%AE%9E%E7%8E%B0%E4%BB%A3%E7%A0%81)/index.html)
4. [Github:Cpp-Design-Patterns(liu-jianhao)](https://github.com/liu-jianhao/Cpp-Design-Patterns)
5. [Github:Design Pattern(jaredtao)](https://github.com/jaredtao/DesignPattern)

<span id="#v4l2教程">V4l2教程:</span>

1. [V4l教程](https://www.linuxtv.org/wiki/index.php/V4l-utils)
2. [博客：v4l2l框架分析](https://www.cnblogs.com/LoyenWang/p/15456230.html)
3. [博客：v4l2l之camera](https://www.cnblogs.com/vedic/p/10763838.html)
4. [博客：Camera V4L2 驱动层分析](https://blog.csdn.net/Ciellee/article/details/105483079)
5. [博客：V4L2视频驱动框架---v4l2_device管理模块简述](https://blog.csdn.net/LinuxArmbiggod/article/details/80310445)
6. [博客：Linux下V4L2捕捉画面](https://www.codeleading.com/article/66981572605/)

<span id="#gstream教程">GStream教程:</span>

1. [Tutorials](https://gstreamer.freedesktop.org/documentation/tutorials/index.html?gi-language=c)
2. [GStream中文教程](https://ricardolu.gitbook.io/gstreamer/#xu-ke-xie-yi)

<span id="#vscode教程">VSCode教程:</span>

1. [博客：VSCode+X11](https://blog.csdn.net/Stone_hello/article/details/120041495)
2. [code server](https://coder.com/docs/code-server/latest)

<span id="#科学上网教程">科学上网教程:</span>

1. [vpn工具：clash](https://www.clash.la/about/)
2. [vpn工具：Qv2ray](https://github.com/Shadowsocks-NET/Qv2ray)

<span id="#cpp工具清单">C++清单:</span>

1. C/C++ 入门项目
   1. [新手清单](https://www.cnblogs.com/xueweihan/p/13928719.html)
   2. [推荐工具](https://www.zhihu.com/question/23357089)
   3. [静态检查工具总结](https://blog.guorongfei.com/2018/11/24/static-analizer/)
   4. [ClangFormat](https://clang.llvm.org/docs/ClangFormat.html)
   5. [clang-tidy](https://www.jianshu.com/p/d6e12fc51294)
   6. [UML类图学习](https://zhuanlan.zhihu.com/p/109655171)
2. callgraph:
   1. [callgraph: doxygen](https://www.cnblogs.com/realjimmy/p/12892179.html)
   2. [callgraph: linux tool](https://blog.csdn.net/jinking01/article/details/108881862)
   3. [callgraph: vscode extension](https://github.com/beicause/call-graph)
   4. [callgraph: using LLVM](https://github.com/bernardnongpoh/CallGraph)
3. 

<span id="#玩转nas教程">玩转nas教程:</span>

1. [群辉docker加速](https://blog.csdn.net/everestzhang/article/details/103738469)
2. [大佬的docker镜像](https://odcn.top/2019/02/13/2509/%e6%95%b4%e7%90%86%e6%b1%87%e6%80%bb%e4%b8%80%e4%b8%8b%e6%9c%80%e8%bf%91%e6%9b%b4%e6%96%b0%e7%9a%84%e4%b8%80%e4%ba%9bdocker%e9%95%9c%e5%83%8f/)
3. [群辉VSCodeServer](https://cloud.tencent.com/developer/article/1848297)
4. [bug: Nginx反向代理 VSCode Server](https://blog.csdn.net/lewee0215/article/details/110150986)
5. [安全加密https使用百度云](https://www.gebi1.com/thread-290996-1-1.html?_dsign=48f4c751)
6. [博客1：域名访问NAS](https://www.jianshu.com/p/c7cfa8a1ba0c)
7. [博客2：域名访问NAS](https://zhuanlan.zhihu.com/p/622576945)

<span id="#玩转移动机器人">玩转移动机器人教程:</span>

1. 环境配置
   1. [WSL2配置ROS](https://blog.csdn.net/LaineGates/article/details/120910628)
   2. [WSL2 ROS网络通讯](https://blog.csdn.net/github_39582118/article/details/129291773)
2. turtlebot3
   1. [office](https://emanual.robotis.com/docs/en/platform/turtlebot3/overview/)
   2. [手柄控制](https://www.ncnynl.com/archives/202111/4858.html)
3. 树莓派
   1. [4B安装ROS](https://www.guyuehome.com/5831)
4. 安卓手机
   1. [ROS发布IMU和Video](https://wiki.ros.org/roslibjs/Tutorials/Publishing%20video%20and%20IMU%20data%20with%20roslibjs)
   2. [博客1：安卓平台跑ORB](https://blog.csdn.net/aqwy1996822/article/details/120557948)
   3. [博客2：安卓平台跑ORB](https://codeantenna.com/a/bXY34hOFLr)
   4. [VideoIMUCapture-Android](https://github.com/DavidGillsjo/VideoIMUCapture-Android)
   5. [Phoenix](https://github.com/sucese/phoenix)

<span id="#cis教程">COMS sensor:</span>

1. [非常难得的 CMOS sensor 工作原理的深入技术科普](https://blog.51cto.com/sining/1952197)
2. [Basic principles of image sensors](http://www.optique-ingenieur.org/en/courses/OPI_ang_M05_C06/co/OPI_ang_M05_C06_web.html)
3. [Github:EMVA1288](https://github.com/EMVA1288/emva1288/releases)

<span id="#3a教程">AEC/AEDC/AWB/AF:</span>

1. Auto Exposure Control
   1. [知乎：PID控制算法原理](https://zhuanlan.zhihu.com/p/39573490)
   2. [PID控制算法原理](https://www.woshipm.com/pd/4206858.html)
   3. [PID调试步骤（附口诀）](http://www.pan-globe.net/nd.jsp?id=12)
   4. [Understanding Auto Exposure Control](https://zhuanlan.zhihu.com/p/100369527)
   5. [DXOMARK：如何测试相机的视频影像性能质量](https://rdbuy.com/article/articledetail?article_id=146)
2. Auto White Balance
   1. [Understanding Light and Color](https://zhuanlan.zhihu.com/p/98834353)
   2. [Understanding Color Temperature](https://zhuanlan.zhihu.com/p/98834866)
   3. [Understanding White Balance Control](https://zhuanlan.zhihu.com/p/98835300)
   4. [Color constancy](https://ipg.fer.hr/ipg/resources/color_constancy?#)
   5. [paper: Color Constancy](https://paperswithcode.com/task/color-constancy)
   6. [自动白平衡算法](https://www.jianshu.com/p/9dc449382707)
   7. [自动白平衡算法 AWB](https://zhuanlan.zhihu.com/p/348162070)
   8. [Computation of Color Experiments](https://alumni.media.mit.edu/~wad/color/exp1/index.html)
   9. [灰度世界算法（Gray World Algorithm）和White Patch Retinex算法](https://blog.csdn.net/u012736685/article/details/50730784)
   10. [五种自动白平衡算法](https://blog.csdn.net/qq_36187544/article/details/97657927)
   11. [color_calibration](https://github.com/riskiest/color_calibration/tree/v4)
   12. [Flat-Field and Colour Correction for the Raspberry Pi Camera Module](https://www.researchgate.net/publication/340609170_Flat-Field_and_Colour_Correction_for_the_Raspberry_Pi_Camera_Module)
3. Auto Focus
   1. [Understanding Auto Focus](https://zhuanlan.zhihu.com/p/109000056)


<span id="#pipeline教程">pipeline:</span>

1. [m19404](https://github.com/pi19404/m19404)
2. [色彩科学学习笔记](https://zhuanlan.zhihu.com/c_1129083002797633536)
3. [Color image processing](https://www.zhihu.com/column/ColorImageProcessing)
4. [Open Image Signal Processor](https://github.com/cruxopen/openISP)
5. [camera-pipeline-UI](https://github.com/karaimer/camera-pipeline-UI)
6. [如何深入研究ISP算法？](https://www.zhihu.com/question/61075213)
7. [Understanding Color and the In-Camera Image Processing Pipeline for Computer Vision](https://www.eecs.yorku.ca/~mbrown/ICCV2019_Brown.html)
8. [Understanding ISP Pipeline](https://zhuanlan.zhihu.com/p/98820927)
9. [Process Your Images with Style!](https://pixls.us/blog/2019/09/g-mic-2-7-process-your-images-with-style/)
10. [Digital Image Processing ~ Books and Materials by Wilhelm](https://imagingbook.com/)
11. [无法抗拒的图像技术](https://www.zhihu.com/column/sining)

相关网站：
1. [website: pixls](https://pixls.us/)
2. [website: darktable](https://www.darktable.org/news/)
3. [ISP tuning: DevSuite](https://aptina.atlassian.net/wiki/spaces/DEVS/overview)
4. [Image sensor world](http://image-sensors-world.blogspot.com/)
5. [ISP Image](https://isp.uv.es/index.html)
6. [Calibration Target](https://ni.neatvideo.com/download/calibration-target)


<span id="#hdr教程">HDR/TMO:</span>

1. HDR sensor
   1. [HDR sensor 原理介绍](https://zhuanlan.zhihu.com/p/129229278)
   2. [浅析HDR拍照构想（4）号称永不过曝的完美方案？神奇的余数相机](https://www.bilibili.com/read/cv1543306/)
   3. [再次科普讨论：HDR高动态范围背后的技术](https://baijiahao.baidu.com/s?id=1600810140219075227)
   4. [HDR imaging(3)----split/sub pixel 技术](https://zhuanlan.zhihu.com/p/135258669)
   5. [Quad Bayer sensors](https://www.gsmarena.com/quad_bayer_sensors_explained-news-37459.php)
   6. [Quad-Bayer Camera Sensors For Better Photos](https://www.ubergizmo.com/articles/quad-bayer-camera-sensor/)
   7. [SENSOR HDR技术的发展与思考](https://qinxing.xyz/posts/c3f0ff3b/)
2. HDR algo
   1. [Deep high dynamic range imaging of dynamic scenes](https://blog.csdn.net/qq_25283239/article/details/103853390)
   2. [HDR关键技术：质量评价技术（续）](https://cloud.tencent.com/developer/article/1346171)
   3. [HDR+ Burst Processing Pipeline](https://www.timothybrooks.com/tech/hdr-plus/)
   4. [HDR技术浅析](https://zhuanlan.zhihu.com/p/31768560)
   5. 《Deep HDR Video from Sequences with Alternating Exposures》
   6. [Robust Patch-Based HDR Reconstruction of Dynamic Scenes](https://web.ece.ucsb.edu/~psen/hdrvideo)
   7. [Deep high dynamic range imaging of dynamic scenes](https://dl.acm.org/doi/10.1145/3072959.3073609)
   8. 《高动态范围视频图像质量评价》
3. TMO
   1. [Tone mapping进化论](https://zhuanlan.zhihu.com/p/21983679)
   2. [Understanding ISP Pipeline - Tone Mapping](https://zhuanlan.zhihu.com/p/104430989)
   3. [Tone-Mapped Image Quality Assessment](https://blog.csdn.net/God_68/article/details/81532738)
   4. [HDR中tone mapping operator的设计参考](https://zhuanlan.zhihu.com/p/60228593)
   5. [TMQI: Tone Mapped Image Quality Index](https://ece.uwaterloo.ca/~z70wang/research/tmqi/)
   6. [Gradient Domain High Dynamic Range Compression](https://www.cs.huji.ac.il/~danix/hdr/)
   7. [L1L0_TM-CVPR2018](https://github.com/odiofan/L1L0_TM-CVPR2018)
4. software
   1. [Luminance HDR](https://sourceforge.net/projects/qtpfsgui/)


<span id="#nr教程">NR:</span>

1. [How to create camera noise profiles](https://pixls.us/articles/how-to-create-camera-noise-profiles-for-darktable/)
2. [Image and video denoising by sparse 3D transform-domain collaborative filtering](https://webpages.tuni.fi/foi/GCF-BM3D/)

<span id="#lsc教程">LSC:</span>

1. [Lens shading correction 的四种方法](https://www.cnblogs.com/ybqjymy/p/14435100.html)
2. [图像暗角阴影去除算法](https://blog.csdn.net/piaoxuezhong/article/details/78333838)
3. [Shading_Correction](https://github.com/RayXie29/Shading_Correction)


<span id="#demosaic教程">Demosaic:</span>

1. [Color Filter Array](http://www.wangdali.net/cfa/)
2. [Demosaicing](https://rawpedia.rawtherapee.com/Demosaicing)
3. [github: demosaicing](https://github.com/topics/demosaicing)
4. [ISP算法简述与逻辑实现-demosaic](https://zhuanlan.zhihu.com/p/512357230)

<span id="#drc教程">DRC:</span>

1. [Awesome Low Light Image Enhancement](https://github.com/dawnlh/awesome-low-light-image-enhancement)
2. 《MBLLEN: Low-light Image/Video Enhancement Using CNNs》
3. 《Underexposed Photo Enhancement using Deep Illumination Estimation》
4. [Low-Light Image Enhancement](https://paperswithcode.com/task/low-light-image-enhancement/codeless)
5. [STAR-TIP2020](https://github.com/csjunxu/STAR-TIP2020)
6. [BIMEF](https://github.com/baidut/BIMEF)
7. [Low-light-Image-Enhancement](https://github.com/pvnieo/Low-light-Image-Enhancement/tree/master)
8. [DPIR](https://github.com/cszn/DPIR)
9. [qing zhang](http://zhangqing-home.net/)
10. [低光图像处理方案](https://zhuanlan.zhihu.com/p/140926754)

<span id="#gamma教程">Gamma:</span>

1. [漫谈Gamma（三）：数字魔法](https://zhuanlan.zhihu.com/p/110512557)
2. [Gamma and Knee](https://helpguide.sony.net/di/pp/v1/en/contents/TP0000909107.html)
3. paper: Improved Knee Transfer Function and Gamma Correction Based Method for Contrast and Brightness Enhancement of Satellite Image

<span id="#iqa">IQA:</span>

1. [图像质量评价](https://baike.baidu.com/item/IQA/19453034)
2. [MTF](http://www2.mitre.org/tech/mtf/)
3. [CIE](https://zschuessler.github.io/DeltaE/)
4. [如何定义图像的质量？](https://zhuanlan.zhihu.com/p/100095759)
5. [sharpness](https://www.imatest.com/support/docs/23-2/sharpness/)
6. [imatest](https://pcv.oss-cn-shanghai.aliyuncs.com/wp-content/upload/2019/11/Imatest-Documentation.pdf)