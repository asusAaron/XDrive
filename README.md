﻿# XDrive
一个很酷的网盘

### 开发环境

jdk版本：1.8

maven版本：3.5.4

开发环境：Intellij Idea

项目名称：XDrive

---

### 数据库

mysql数据库版本：8.0.11

数据库名:xdrive

(测试用例使用的表名叫person)

---

### 项目目录

java目录下是源码，同级resource目录是资源文件

记得把resource的数据库配置改成自己的

test目录是测试用的源码和资源文件


---

添加了gitignore
from gyx

---

建表sql语句在main/resources目录下

登录的基本增删改查已添加，请参考注释食用

数据库中file表的f_state字段,默认值设为1

---
###2018/7/30
model部分添加一些工具；

关键字模糊查询（使用map.get方法，后续可能会优化）

按上传时间和按名称排序（后续可能会添加按大小排序，需要修改表）

---

###2018/7/31
新建详细信息表

修改了原有表的一些字段（参照sql文件修改）

---

###2018/8/1
user表u_limit字段添加default值为1

UserSms类添加发送六位验证码功能的方法

Info表的操作

数据库添加了一些索引（由于以后还可能继续加，现在不同步处理）

---

###2018/8/3

基于FastDFS和nginx反向代理实现文件管理系统（1台Tracker+1台Storage）

上传下载/文件详细信息的接口（FileOperations内）
