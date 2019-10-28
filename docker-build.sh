#!/bin/bash

IMAGE_FULL_NAME=$REGISTRY/$NAME_SPACE/$IMAGE_NAME

echo "docker build..."
echo "IMAGE_FULL_NAME: $IMAGE_FULL_NAME"

# 先删除之前的容器
echo "remobe old container..."
docker ps -a | grep $IMAGE_NAME | awk '{print $1}'| xargs docker rm -f

# 删除之前的镜像
echo "romove old image..."
docker rmi $IMAGE_FULL_NAME

# 打包镜像
echo "build image..."
docker build -t $IMAGE_FULL_NAME .

# 打印当前镜像
echo "current docker images..."
docker images | grep $IMAGE_FULL_NAME

if [ $RUN_CONTINER == true ]
then
  # 启动容器
  echo "start container..."
  docker run -d -p $HOST_PORT:$CONTAINER_PORT --name $IMAGE_NAME $IMAGE_FULL_NAME

  # 打印当前容器
  echo "current container..."
  docker ps -a | grep $IMAGE_NAME
fi

if [ $PUSH_IMAGE == true ]
then
  # 推送镜像
  echo "push image..."
  printf $DOCKER_USER_PASSWORD | docker login -u $DOCKER_USER_USERNAME --password-stdin $REGISTRY
  docker push $IMAGE_FULL_NAME:latest
fi

