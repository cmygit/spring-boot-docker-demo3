# 把docker理解成一个微型的linux系统或者容器

# 表示这个容器包含了jdk
FROM java:8-alpine

# 维护者信息，非必须
MAINTAINER cmy yi177377@163.com

# 把当前目录下的target文件加的jar，复制到docker中，并重命名为app.jar
ADD ./target/*.jar app.jar

# 暴露8080端口
EXPOSE 8080

# docker容器运行时，执行该命令 java -jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]