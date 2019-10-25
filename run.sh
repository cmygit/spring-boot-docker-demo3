#!/usr/bin/env bash

echo $Registry
echo $NameSpace
echo $ImageName

## 先删除之前的容器
#echo "remobe old container"
#docker ps -a | grep jenkins-demo1 | awk '{print $1}'| xargs docker rm -f
#
## 打包镜像
#echo "build image"
#docker build -t $Registry/$NameSpace/$ImageName .
#
## 查看镜像
#echo "show images"
#docker images
#
## 启动容器
#echo "start container"
#docker run -d -p 8761:8080 --name ci-demo1 registry.cn-hangzhou.aliyuncs.com/cmyiyi11/ci-demo1