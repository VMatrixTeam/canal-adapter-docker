FROM openjdk:8-jre-alpine AS extract
ADD https://github.com/alibaba/canal/releases/download/canal-1.1.5-alpha-1/canal.adapter-1.1.5-SNAPSHOT.tar.gz /tmp/adapter.tar.gz
RUN mkdir -p /opt/adapter && tar x -z -C /opt/adapter -f /tmp/adapter.tar.gz && rm /tmp/adapter.tar.gz
FROM openjdk:8-jre-alpine
WORKDIR /opt/adapter
COPY --from=extract /opt/adapter /opt/adapter
RUN rm -rf /opt/adapter/conf/es/*
RUN apk update && apk add --no-cache file
CMD [ "sh", "-c", "sh /opt/adapter/bin/startup.sh && tail -F /opt/adapter/logs/adapter/adapter.log" ]
