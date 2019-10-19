#!/usr/bin/env bash

# 打包镜像
docker build -t registry.cn-hangzhou.aliyuncs.com/yiyi-springcloud/eureka .

# 查看镜像
docker images

# 启动容器
echo "start container"
#docker run -d -p 8761:8080 --name jenkins-demo1 registry.cn-hangzhou.aliyuncs.com/yiyi-jenkins/demo1

