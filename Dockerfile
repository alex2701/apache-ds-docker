FROM ubuntu:16.04
MAINTAINER alex2701

#Install Open JDK 9 Jre

RUN apt-get update \
&& apt-get -y install openjdk-9-jre \
&& apt-get -y install wget \
&& wget http://www-eu.apache.org/dist//directory/apacheds/dist/2.0.0-M24/apacheds-2.0.0-M24-amd64.deb \
&& dpkg -i apacheds-2.0.0-M24-amd64.deb \
&& rm apacheds-2.0.0-M24-amd64.deb

ENV JAVA_HOME /usr/lib/jvm/java-9-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

EXPOSE 10389 10636

CMD /etc/init.d/apacheds-2.0.0-M24-default start \
&& tail -f /dev/null

#docker run  -p 127.0.0.1:10389:10389 -d -v /Users/alex/apacheds/volume:/var/lib/apacheds-2.0.0-M24/default  bf77e7fe1c6a
