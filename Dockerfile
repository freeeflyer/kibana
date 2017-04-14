FROM openjdk:8u111-jre

MAINTAINER Nicolas Zagulajew (freeeflyer) <docker.com@xoop.org>

ENV KIBANA_VERSION 5.3.0
ENV KIBANA_HOME /opt/kibana-$KIBANA_VERSION-linux-x86_64
ENV ES_URL http://es:9200


ADD https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz /tmp/kibana.tgz

RUN tar -C /opt -xzf /tmp/kibana.tgz \
    && rm /tmp/kibana.tgz 
ADD start.sh /start

WORKDIR $KIBANA_HOME

EXPOSE 5601

CMD ["/start"]
