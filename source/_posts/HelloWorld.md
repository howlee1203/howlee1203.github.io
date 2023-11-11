---
title: 盘古开天辟地
date: 2023-08-19 15:05:31
tags:
- Hexo
- Fluid
- DNS
categories:
- Web
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

## 关于Github Action

考虑到基于NAS搭建个人博客网站需要做域名备案，且部署涉及到个人IP的安全问题，因此暂不做考虑。这里主要用Github Action来做自动部署。

这里只介绍大体思路，实现细节可以参考`master`分支下的`.github/workflows/deploy.yml`，以及[Github Action官方文档](https://docs.github.com/en/actions)。

- 核心思路：选择两分支分别作为代码分支以及发布页面分支
  - `master`分支：代码分支，文档编辑以及本地发布
  - `release`分支：发布页面分支，这里`/(root)`作为Page页面
  - workflows思路：
    - 环境准备：
      - 切换`master`分支
      - 安装`node`, `hexo`
      - git配置`user.name`, `user.email`, `ssh key`
      - 新建`../public`目录作为暂时页面存放目录
    - 页面生成：
      - 基于`hexo`命令生成页面
      - 转移页面目录到`../public`
    - 环境准备：
      - 切换`release`分支
    - 页面发布：
      - 打时间戳，切临时分支
      - 清空当前目录并复制目录`../public`内容
      - 提交修改，并合入`release`分支

## 关于Google Site

考虑到个人blog的封闭性，有必要让google能够search到相关字段，从而广而告之。
这里我主要参考[这篇博客](https://saowu.top/blog/4tCVcic30/)，主要分三步：
1. 搜索资源提交：下载对应的html文件，上传到`master`分支的public目录下
2. 添加站点地图：下载对应的xml文件，上传到`master`分支的public目录下
3. 在 Google Search console 中添加你的 sitemap URL

然后过一天后再验证google收录情况：`site:https://xxxx.github.io`即可。