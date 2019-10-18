#!/usr/bin/env bash

# 启动容器
echo "start container"
docker run -d -p 8761:8080 --name jenkins-demo1 registry.cn-hangzhou.aliyuncs.com/yiyi-jenkins/demo1

