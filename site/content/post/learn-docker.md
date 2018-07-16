---
title: "Learn Docker"
author: "Author Name"
date: 2018-07-13T19:54:34+08:00
---

# docker学习

## Why docker？

- 不是虚拟硬件的虚拟机，高效
- 启动快
- 环境一致性
- 可以定制CI/CD
- 迁移轻松
- 更轻松的维护和扩展

## 基本概念

- 镜像（ Image）
- 容器（ Container）
- 仓库（ Repository）

## Docker 镜像

Docker 镜像是一个特殊的文件系统，除了提供容器运行时所需的程序、库、资源、配置等文
件外，还包含了一些为运行时准备的一些配置参数（ 如匿名卷、环境变量、用户等） 。镜像
不包含任何动态数据，其内容在构建之后也不会被改变。

### 镜像时分层存储的

每一层相当于一个虚拟机的“快照”，


## Docker 容器

镜像（ Image） 和容器（ Container） 的关系，就像是面向对象程序设计中的 类 和 实例 一
样，镜像是静态的定义，容器是镜像运行时的实体。容器可以被创建、启动、停止、删除、
暂停等。

前面讲过镜像使用的是分层存储，容器也是如此。每一个容器运行时，是以镜像为基础层，
在其上创建一个当前容器的存储层

容器不应该向其存储层内写入任何数据，容器存储层要保持无
状态化。所有的文件写入操作，都应该使用 [数据卷（ Volume）](数据卷) 、或者绑定宿主目录，在这些
位置的读写会跳过容器存储层，直接对宿主(或网络存储)发生读写，其性能和稳定性更高。

### 数据卷
数据卷的生存周期独立于容器，容器消亡，数据卷不会消亡。因此，使用数据卷后，容器可
以随意删除、重新 run ，数据却不会丢失。

## 仓库

Docker Registry是一个集中的存储、分发镜像的服务。
一个 Docker Registry 中可以包含多个仓库（ Repository） ；每个仓库可以包含多个标签
（ Tag） ；每个标签对应一个镜像。

以 Ubuntu 镜像 为例， ubuntu 是仓库的名字，其内包含有不同的版本标签，如， 14.04 ,
16.04 。我们可以通过 ubuntu:14.04 ，或者 ubuntu:16.04 来具体指定所需哪个版本的镜
像。如果忽略了标签，比如 ubuntu ，那将视为 ubuntu:latest 。

### docker hub

docker hub是最常使用的 Registry 公开服务是官方的，这也是默认的 Registry，并拥有大量的
高质量的官方镜像。

# 使用汉得docker镜像

## 获取镜像

虽然这两天没有外网，但是我们可以使用汉得内部的镜像，用`docker pull registry.saas.hand-china.com/tools/ubuntu:14.04`可以拉取镜像到本地

## 运行镜像

    docker run -it --rm registry.saas.hand-china.com/tools/ubuntu:14.04 bash

简要的说明
一下上面用到的参数。
- -it ：这是两个参数，一个是 -i ：交互式操作，一个是 -t 终端。我们这里打算进入
bash 执行一些命令并查看返回结果，因此我们需要交互式终端。
- --rm ：这个参数是说容器退出后随之将其删除。默认情况下，为了排障需求，退出的容
器并不会立即删除，除非手动 docker rm 。我们这里只是随便执行个命令，看看结果，
不需要排障和保留结果，因此使用 --rm 可以避免浪费空间。
- registry.saas.hand-china.com/tools/ubuntu:14.04 ：这是指用 registry.saas.hand-china.com/tools/ubuntu:14.04 镜像为基础来启动容器。
- bash ：放在镜像名后的是命令，这里我们希望有个交互式 Shell，因此用的是 bash 。

## 定制一个 Web 服务器
首先用docker启动一个服务器
    docker run --name webserver -d -p 80:80 registry.saas.hand-china.com/tools/nginx
因为我们使用的是Docker Toolbox需要使用虚拟机地址才能访问到服务器
可以使用 http://192.168.99.100/ 打开


我们可以使用
`docker exec` 命令进入容器，修改其内容。

## docker常用命令

列出已经下载下来的镜像

    docker images

查看docker进程 

    docker-machine ls

创建alias

    alias dm=docker-machine

切换到某一个docker-machine

    dm env test

关闭一个dm，不要强制关机

    dm stop

打开一个dm

    dm start


