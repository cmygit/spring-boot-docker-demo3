#!/usr/bin/env bash

ImageFullName=$Registry/$NameSpace/$ImageName

echo "docker build..."
ehco "ImageFullName: $ImageFullName"

# 先删除之前的容器
echo "remobe old container"
docker ps -a | grep $ImageName | awk '{print $1}'| xargs docker rm -f

## 删除之前的镜像
#echo "romove old image"
#docker rmi $ImageFullName

# 打包镜像
echo "build image"
docker build -t $ImageFullName .

# 打印当前镜像
echo "current docker images"
docker images | grep $$ImageFullName

# 启动容器
echo "start container"
docker run -d -p 9090:8080 --name $ImageName $Registry/$NameSpace/$ImageName

# 打印当前容器
echo "current container"
docker ps -a | grep $ImageName

echo "star container success!"