---
title: WSL2 Ubuntu2004 ROS环境配置
date: 2023-09-30 16:54:41
tags: 
- WSL2,ROS
categories:
- env
---

# WSL2 Ubuntu2004环境配置

## WSL2/ubuntu20.04 LTS安装

这个部分网上教程很多，本文不展开介绍。可以参考[这篇文章](https://zhuanlan.zhihu.com/p/337104547)。

## ROS环境搭建

### 换源

1. 保持原始源：`sudo cp /etc/apt/sources.list /etc/apt/sources_origin.list`

2. 填充新源：`sudo vim /etc/apt/sources.list`

``` bash
deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
```

3. 升级&更新：`sudo apt update`, `sudo apt upgrade`

*注：如果在upgrade时遇到 **unmet dependencies** 的问题，可以尝试：`sudo apt remove ubuntu-advantage-tools`*

### ROS安装

1. 添加ROS包的清华镜像源：
``` bash
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
```
2. 设置秘钥: 需要先安装`curl`(`sudo apt install curl`)

``` bash
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
```

或者输入现成的秘钥：
``` bash
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
```

3. 升级&更新：`sudo apt update`, `sudo apt upgrade`

4. 安装ROS: `sudo apt install ros-noetic-desktop-full`

## oh-my-zsh环境配置

1. download oh-my-zsh from github: `git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`

2. copy .zshrc: `cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc`

3. change your shell: `chsh -s /bin/zsh`

4. restart wsl2

5. add plugins zsh-syntax-highlighting

``` bash
git clone https://gitee.com/lightnear/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

6. add plugins zsh-autosuggestions

``` bash
git clone https://gitee.com/kvdesign/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```