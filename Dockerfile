FROM openjdk:8-jre-alpine
ADD https://github.com/alibaba/canal/releases/download/canal-1.1.4/canal.adapter-1.1.4.tar.gz /opt/adapter/
WORKDIR /opt/adapter
ENTRYPOINT [ "sh", "/opt/adapter/bin/startup.sh" ]
