---
title: 盘古开天辟地
date: 2023-08-19 15:05:31
tags:
- hexo,fluid,dns
categories:
- web
---

# Hello, world！

程序员们熟悉的开头，用秦时明月镇楼！

{% asset_img feigong.jpg 荆天明 %}

## 关于本博客

作为前端小白，在基于网上大量google后，选择基于hexo和github page来搭建本博客。

博客是兴趣使然，用来折腾玩的。奈何相关知识储备不够，因此选取可行性高且参考样例多的方案来进行实施。本博客的搭建主要是参考[这篇博文](https://blog.csdn.net/yaorongke/article/details/119089190)，主题采用fluid。系统是Windows10 WSL2，编辑器是VSCode。

这里主要涉及三部分工具：
1. hexo：基于npm的工具包，是整个博客的主体框架
2. fluid：主题方式，主要是用于页面渲染和美化
3. github page：代码管理，静态博客展示

## 关于Hexo

Hexo依赖`npm`和`nvm`，如果没有安装建议自行安装。

Hexo使用主要分以下几步：
``` bash
# 1. Create a new post
$ hexo new "My New Post"
# 2. Run server
$ hexo server
# 3. Generate static files
$ hexo generate
# 4. Deploy to remote sites
$ hexo deploy
```

实际使用过程中，一般使用偷懒命令，现在本地查看效果：
``` bash
# clean
hexo clean
# gen
hexo g -d
# run in localhost
hexo s
```

*注1：有时候新启终端命令`hexo`和`npm`无法识别，可能是`nvm`没有指定版本。需要先查看版本，再指定版本。*
``` bash
# list nvm version
$ nvm ls
# if this version is used
nvm use v18.17.1
```

*注2：更多相关信息参考[官方文档](https://hexo.io/docs/)*

## 关于fluid

主题配置一般按照个性化进行设置，这里不展开。

*注3：[参考博文](https://blog.csdn.net/yaorongke/article/details/119089190)如果要使得统计数生效，需要设置`server_url`*

*注4：更多配置说明参考[官方文档](https://fluid-dev.github.io/hexo-fluid-docs/)*

## 关于Github Page

Githug Page页面相对简单，主要注意两点：
1. Page页面`Deploy from a branch`栏下支持不同分支，但是只支持`/(root)`和`/docs`。
   1. 建议非必要不使用`master`分支，一般考虑使用`release`分支
   2. 使用`/docs`，设置root目录下文件**_config.yml**：`public_dir: docs`
2. `Custom domain`设置（optional）
   1. 个人域名填写
   2. `Enforce HTTPS`使能

*注5：域名需要双向设置，这里仅设置Github Page，还需要在域名解析服务商处进行设置*

## 关于域名

一般登陆相关服务商网站，依次找到：域名管理-域名解析。选择**A记录**或者**CNAME**，这里以**CNAME**为例：

> 记录类型：CNAME
> 主机记录：@
> 记录值：howlee1203.github.io
> TTL: 10分钟

*注6：域名解析设置参考[这篇博文](https://segmentfault.com/a/1190000011203711)*

## 后续计划

+ 基于NAS搭建个人博客网站，域名备案