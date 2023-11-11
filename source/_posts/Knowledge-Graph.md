---
title: Knowledge Graph
date: 2023-09-30 17:53:29
tags: Summary
---

- [一个图像算法工程师的知识图谱：持续更新中](#一个图像算法工程师的知识图谱持续更新中)
  - [编程基础](#编程基础)
  - [图像基础](#图像基础)
    - [镜头选型](#镜头选型)
    - [Sensor选型](#sensor选型)
    - [典型 ISP Pipeline](#典型-isp-pipeline)
    - [典型 ISP IP](#典型-isp-ip)
    - [推荐读物](#推荐读物)
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
|  | Android | --- | --- |
|  | IOS | --- | --- |
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
| 编程工具 | VSCode | --- | --- |
|  | OpenCV | [OpenCV教程](#opencv教程) | --- |
|  | ROS | [ROS/Catkin教程](#roscatkin教程) | --- |
|  | V4l2 | --- | --- |
|  | GStream | --- | --- |
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

## 图像基础

| 基本单元 | 子模块/参数 | 学习途径 | 备注 |
| --- | --- | --- | --- |
| 相机模组 | Cover Glass | --- | --- |
|  | Lens | --- | --- |
|  | COMS sensor | --- | --- |
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
| Image Sensor Processing | AEC/AEDC/AWB/AF | --- | --- |
|  | BLC/BPC/FPNC | --- | --- |
|  | Raw NR | --- | Noise Profile |
|  | Lens Shading Correction | --- | --- |
|  | Demosaic | --- | RGGB/RCCB |
|  | CCM | --- | --- |
|  | TMO | --- | alaw|reinhard|fattal |
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

+ RS: rolling shutter imaging on the electric grid from two rolling shutters to one global shutter
+ mipi:mipi-csi-2 spectification
+ 智能CMOS图像传感器与应用
+ image sensor and signal processing for digital still cameras
+ ISO12233
+ EMVA1288
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

---
## 参考链接

<span id="unix教程">Unix教程:</span>

1. [Linux beginner](www.info.ee.surrey.ac.uk/Teaching/Unix/)
2. [菜鸟Linux教程](https://www.runoob.com/linux/linux-tutorial.html)
3. [菜鸟Shell教程](https://www.runoob.com/linux/linux-shell.html)
4. [博客：阮老师的SSH入门](https://www.ruanyifeng.com/blog/2020/12/ssh-tutorial.html)
5. [Github: Learn Vim](https://github.com/iggredible/Learn-Vim)
6. [博客：文本三剑客教程](https://www.cnblogs.com/along21/p/10366886.html)

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
