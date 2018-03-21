FROM openjdk:8-alpine
MAINTAINER lvhifer<lvhifer@163.com>

RUN cd /usr/local \
  && wget -c https://dev.yonyouccs.com/jenkins/jnlpJars/slave.jar \
  && cd /bin \
  && wget -c https://releases.rancher.com/compose/v0.12.5/rancher-compose-linux-amd64-v0.12.5.tar.gz \
  && tar zxf rancher-compose-linux-amd64-v0.12.5.tar.gz \
  && mv rancher-compose-v0.12.5/rancher-compose . \
  && chmod +x rancher-compose \
  && rm -rf rancher-compose-linux-amd64-v0.12.5.tar.gz rancher-compose-v0.12.5

RUN mkdir -p /data/jenkins

WORKDIR /data/jenkins

ENTRYPOINT ["java","-jar","/usr/local/slave.jar"]
