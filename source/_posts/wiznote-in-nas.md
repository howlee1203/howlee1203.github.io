---
title: wiznote_in_nas
date: 2023-11-26 20:05:46
tags:
---

# 群辉NAS+为知笔记docker定制私有云笔记
​
前提条件：

群辉NAS支持docker
有公网ipv6或者公网ipv4，或者外网访问NAS网址
实现目标：

为知笔记在群辉NAS上成功运行
外网网页和客户端均可以访问云笔记
为知笔记限制：

官方docker只支持5个用户
不支持网页|微博|邮箱收藏至云笔记
个人需求整理：

私有云笔记保证数据安全（密码本之类的私人数据）
为知笔记满足我对云笔记的需求（随时查阅记录|多端同步|markdown支持）
云笔记只需要家庭使用（小于5人）
收藏功能可以用其他方案替代
基于上述原因所以着手折腾私有云笔记方案，基于官方文档（https://www.wiz.cn/zh-cn/introduction-docker-nas）整理以下流程。

## 群辉docker 下载安装wiz-server

套件中心安装docker
开启群辉ssh功能，设置端口2222（这个端口随意设置成自己喜欢的就行）
打开docker，注册表查找为知官方发布的wiznote/wizserver:latest，点击下载
在docker的目录下新建目录wiz，再在wiz目录下新建data目录，将data目录作为笔记的存储空间

## 启动wiz容器

当前系统从终端ssh进入NAS，需要输入密码
登陆OK后输入如下docker命令
等待5-10分钟，登陆网址http://your_nas_ip:8888 应该可以使用了
ssh your_id@your_nas_ip -p 2222
sudo docker run --name wiz -it -d -v /volume1/docker/wiz/data:/wiz/storage -v /etc/localtime:/etc/localtime -p 8888:80 -e SEARCH=true wiznote/wizserver


## 反向代理https设置

这里主要是为了能够在客户端使用。

控制面板-登陆门户-高级-反向代理服务器
将来源至外网访问的协议+主机名+端口：`https+ip+端口`（这里的主机名可以是NAS的ipv6地址，或者ipv4公网地址，也可以是外网访问NAS的网址）
对应目的地为内部访问的协议+主机名+端口：`http+ip+端口`（这里的主机名是局域网访问NAS的固定网址）
使用https+ip/网址+端口，在外网登陆私有云笔记
​