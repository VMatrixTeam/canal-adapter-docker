FROM openjdk:8-jre-alpine
ADD https://github.com/alibaba/canal/releases/download/canal-1.1.4/canal.adapter-1.1.4.tar.gz /tmp/adapter.tar.gz
WORKDIR /opt/adapter
RUN tar xzf -C /opt/adapter /tmp/adapter.tar.gz && rm /tmp/adapter.tar.gz
ENTRYPOINT [ "sh", "/opt/adapter/bin/startup.sh" ]
