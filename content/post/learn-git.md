---
title: "Learn Git"
date: 2018-07-13T15:11:58+08:00
cover: "/img/cover.jpg"
tag: "学习"
draft: true
---

# day2 git学习
## 私钥生成

    ssh-keygen -t rsa -C "binjie09@gmail.com"

私钥会生成在用户`home`目录下的`.ssh`文件夹内

请藏好私钥不动不复制不泄露，有`.pub`后缀的是公钥到处扔即可。

- github一份 finish
- gitlab一份 finish

## 配置git环境

    #配置用户信息
    git config --global user.name "cbj"
    git config --global user.email "binjie09@gmail.com"

    #配置命令别名
    git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
    git config --global alias.co checkout


## git 常用命令注记

### 简单操作

    git init                   #初始化git仓库
    git status                 #查看仓库当前状态
    git diff readme.txt        #查看修改
    git add                    #添加到暂存
    git commit                 #提交
    git log                    #配置后使用git lg更好的查日志信息
    git reset                  #回退到某版本
### 分支操作
    Git⿎励⼤量使⽤分⽀：

    git branch                 #查看分⽀
    git branch name            #创建分⽀
    git checkout name          #切换分⽀
    git checkout -b name       #创建+切换分⽀
    git merge name             #合并某分⽀到当前分⽀
    git branch -d name         #删除分⽀
### 解决冲突


Git⽤<<<<<<<，=======，>>>>>>>标记出不同分⽀的内容

    git merge

## git常见名词概念
⼯作区（Working Directory）：就是你在电脑⾥能看到的目录
版本库（Repository）：⼯作区有⼀个隐藏目录`.git`，这个不算⼯作区，⽽是Git的版本
库。

## git远程协作
查看远程库信息，使⽤`git remote -v`

1. 本地新建的分⽀如果不推送到远程，对其他⼈就是不可⻅的
2. 从本地推送分⽀，使⽤`git push origin branch-name`，如果推送失败，先⽤`git pull`抓取远程的新提交
3. 在本地创建和远程分⽀对应的分⽀，使⽤`git checkout-branch-name origin/branchname`，本地和远程分⽀的名称最好⼀致
4. 建⽴本地分⽀和远程分⽀的关联，使⽤`git branch--set-upstream branch-nameorigin/branch-name`
5. 从远程抓取分⽀，使⽤`git pull`，如果有冲突，要先处理冲突。

## gitignore
- 忽略某些⽂件时，需要编写`.gitignore`。
- `.gitignore`⽂件本⾝要放到版本库⾥，并且可以对`.gitignore`做版本管理！

示例

    # Windows:
    Thumbs.db
    ehthumbs.db
    Desktop.ini
    # Python:
    *.py[cod]
    *.so
    *.egg
    *.egg-info
    dist
    build
    # My configurations:
    db.ini
    deploy_key_rsa

# git探索

  git可以使用http https ssh三种方式来clone clone时使用什么方式pull和push时也会使用同样的方式`

  Git⽀持多种协议，包括https，但通过ssh⽀持的原⽣git协议速度最快。

--------------------------------------------------------

# 晚上学习

[hugo官网](https://gohugo.io/)

[博客迁移到hugo](https://zhuanlan.zhihu.com/p/31714395)

[实训地址](http://trainning.staging.saas.hand-china.com/)

[markdown中文网站](http://www.markdown.cn/)

## gitlab-ci
持续集成概念（ci）
持续部署

## git 相关

`.gitmodules` 子模块

分支
    git branch              #列出本地的所有分支
    git remote              #远程仓库别名
    git branch -h           # TODO: 自己看看都干啥的
    git status              #提交前先看看暂存区有啥
    git checkout -b branch-name
### gitflow工作流 讲解
