FROM java:8-alpine

MAINTAINER cmy yi177377@163.com

ADD target/*.jar app.jar

EXPOSE 8761

ENTRYPOINT ["java", "-jar", "/app.jar"]