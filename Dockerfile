FROM openjdk:8-alpine
MAINTAINER lvhifer<lvhifer@163.com>

RUN cd /usr/local \
  && wget -c https://dev.yonyouccs.com/jenkins/jnlpJars/slave.jar

RUN mkdir -p /data/jenkins

WORKDIR /data/jenkins

ENTRYPOINT ["java","-jar","/usr/local/slave.jar"]
