#!/usr/bin/env bash
# 先删除之前的容器
echo "remobe old container"
docker ps -a | grep jenkins-demo1 | awk '{print $1}'| xargs docker rm -f

# 删除之前的镜像
echo "romove old image"
docker rmi registry.cn-hangzhou.aliyuncs.com/yiyi-jenkins/demo1

# 打印当前镜像
echo "current docker images"
docker images | grep registry.cn-hangzhou.aliyuncs.com/yiyi-jenkins/demo1

# 启动容器
echo "start container"
docker run -d -p 8761:8080 --name jenkins-demo1 registry.cn-hangzhou.aliyuncs.com/yiyi-jenkins/demo1

# 打印当前容器
echo "current container"
docker ps -a | grep jenkins-demo1
echo "star service success!"

