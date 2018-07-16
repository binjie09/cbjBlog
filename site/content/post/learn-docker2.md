---
title: "Learn Docker2"
author: "Author Name"
date: 2018-07-13T19:57:28+08:00
---

# docker学习

比较快的镜像，和官方镜像是一模一样的，改个名就可以和官网下的一样的使用。
[daocloud](https://hub.daocloud.io/)

拉取一个镜像

    docker pull registry.saas.hand-china.com/tools/nginx:latest

首先用docker启动一个服务器

    docker run --name webserver -d -p 8080:80 registry.saas.hand-china.com/tools/nginx


因为我们使用的是Docker Toolbox需要使用虚拟机地址才能访问到服务器
可以使用 http://192.168.99.100/ 打开


进入这个容器
因为我们使用的是windows里的git bash，直接运行提示我们要加winpty，加上即可

    winpty docker exec -it webserver //bin/bash

最常用的docker命令

```
docker pull                    #拉取一个镜像
docker run                     #运行一个镜像
docker exec                    #运行
docker ps                      #列出正在运行的docker进程
docker kill                    #杀死一个docker进程
docker images                  #列出所有镜像
docker push                    #把镜像提交
docker tag                     #给镜像打标签
```
## 使用Dockerfile构建hello docker

首先在一个目录里新建一个`Dockerfile`内容如下

```
FROM nginx
RUN echo '<h1>Hello, Docker!</h1>' > /usr/share/nginx/html/index.html
```
然后执行

    docker build -t nginxtest .

会build一个叫nginxtest的image
可以通过`docker images`查看

然后运行这个镜像

    docker run -d -p 80:80 nginxtest

访问运行docker的docker-machine的80端口就可以看到`Hello, Docker!`



## 启动一个mysql

直接`docker run -it mysql`会输出一个error

    error: database is uninitialized and password option is not specified
    You need to specify one of MYSQL_ROOT_PASSWORD, MYSQL_ALLOW_EMPTY_PASSWORD and MYSQL_RANDOM_ROOT_PASSWORD

所以我们启动一个mysql允许使用空密码

    docker run -d -e MYSQL_ALLOW_EMPTY_PASSWORD=true -p 3306:3306 registry.saas.hand-china.com/tools/mysql:latest

然后就可以使用任何一个mysql工具连接了

## docker compose

### 安装

docker tool box自带有docker compose，直接用就可以了

### docker-compose.yml文件

compose都基于这个文件创建
下面这个yml文件创建了两个nginx服务
```yml

version: "3"
services:
  nginx-0:
    container_name: nginx-0
    image: nginx
    hostname: nginx-0
    ports:
      - "8080:80"
  nginx-1:
    container_name: nginx-1
    image: nginx
    hostname: nginx-1
    ports:
      - "8081:80"

```
使用

    docker-compose up

就可以把这两个nginx都启动起来

## 登陆docker hub

    docker login

## 使用Dockerfile构建hugo部署镜像

[我的dockerhub hugo部署工具镜像地址](https://hub.docker.com/r/binjie09/hugo/)

他的Dockerfile如下

```
FROM debian:jessie
MAINTAINER yigal@publysher.nl
# 从publysher/hugo的Dockerfile修改而来
# 下载和安装hugo 0.35的版本（随便选的theme至少需要这个版本的hugo）
ENV HUGO_VERSION 0.35
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb


ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb \
	&& rm /tmp/hugo.deb

# 创建工作目录
RUN mkdir /usr/share/blog
WORKDIR /usr/share/blog

# 暴露端口
EXPOSE 1313

# FROM这个镜像来build时自动复制
ONBUILD ADD site/ /usr/share/blog
ONBUILD RUN hugo -d /usr/share/nginx/html/

# 启动server绑定所有端口，同时允许草稿文档显示
CMD hugo server --bind=0.0.0.0 -D

```

# 周末作业

[周末作业github链接](https://github.com/binjie09/cbjBlog)

## 作业完成情况

1. 在github上创建一个库 ✔
2. 创建README.md ✔
3. 搭建一个博客，使用hugo ✔
4. Dockerfile 把博客打包成一个镜像 ✔
5. build.sh 根据Dockerfile打包成镜像的shell脚本 ✔
6. run.sh 把项目跑起来的脚本 ✔
7. 周末日报

