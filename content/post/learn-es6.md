---
title: "Es6学习"
author: "Author Name"
tags: ["tagA", "tagB"]
date: 2018-07-13T15:58:28+08:00
draft: true
---

# es6、es7、es8学习（视频学习）

## 简介
es规范 es6版本
对javascript大量改造

## 安装点环境

安装nodejs
安装淘宝 NPM 镜像
```bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

## 第一讲 let-const

```javascript
const PI = 3.14;
PI = 4;
alert(PI);                      //报错，常量不能更改
```
const 的对象里的变量可以更改,允许更改内部
```javascript
const obj = {
    a:3,
    b:4
}
obj.a = 5;
console.log(obj.a);
```

let与作用域
```javascript

for(let i = 0; i < 10; i++){
    console.log(i);
}
console.log(i);             //不能获得i

```

## 模板字符串
模板字符串替代了旧的字符串拼接方法
```javascript
let a = "love";
//i love you
console.log("i " + a + " you")  //es5的字符串拼接
console.log(`i ${a} you `)

```

## 函数的扩展

函数的默认值
```javascript
// function show(a, b = 10){
//     return a+b;
// }
var show = (a,b=10) => a+b;     // 箭头函数写法 函数体只有一行可以不用写大括号
console.log(shwo(1))

```

箭头函数

```javascript

var show = (a,b=10) => a+b;     // 箭头函数写法 函数体只有一行可以不用写大括号
console.log(shwo(1))

```
箭头函数的this指向
```javascript
//箭头函数中的this始终指向函数定义时的this
var a = 10;
var obj = {
    a: 5,
    func:()=>{
        console.log(this.a);    //输出10
    }
    test:function(){
        setTimeout(()=>{
            this.func();        //这个this是函数定义时的this（es6）
        },1)
    }
}

obj.test();
```
## 对象的扩展
es6中对象有简写，可以通过`Object.keys()`获取键值、`Object.assign()`合并对象
```javascript
var a = 5;
var obj = {
    a,
    b(){   //函数简写
        console.log(this.a);
    }
}
console.log(Object.keys(obj));  //对象键值获取
var obj2 = {
    c:10
}
Object.assign(obj2,obj);        //把obj合并到obj2对象中
console.log(obj2);
```


### Object.defineProperty() 用于双向数据绑定
```javascript
var data = {};
Object.defineProperty(data, 'b', {
    // value:5,
    // writeable:true,             //是否可写
    // enumerable:true             //是否可遍历
    set(newValue){
        console.log(newValue)
    }
    get(){
        return 5;
    }
});
data.b = 10;
console.log(data);

```

## es6 class
es6中的类更加类似传统的面向对象的写法
```javascript
class Person{
    constructor(name,sex){
        this.name = name;
        this.sex = sex;
    }
    showName(){
        alert(this.name);
    }
    static getMethod(){            //静态方法只能通过类名调用，且不能被继承
        return "hello";
    }
}

var obj1 = new Person("cbj","男");
console.log(obj1.showName());

class Manager extends Person{
    constructor(name,sex,password){
        super(name,sex);
        this.password = password;
    }
}

var obj2 = new Manager("cbj","男");
console.log(obj2.name);
console.log(obj2.showName());

```

## 解构赋值

### 数组解构

```javascript
let [a,b,c] = [1,2,3];             //批量赋值

let [a,b,[c,d],e] = [1,2,[3,4],5]; //嵌套赋值

```

### 对象解构

```javascript
let obj = {
    name:"cbj",
    sex:"男"
}
let {name:uname, sex:usex} = obj;
let {sex} = obj;                   //取出对象中的性别
console.log(uname+usex);
```

### 字符串的解构

```javascript
let [a,b,c] = "陈彬杰";
```

