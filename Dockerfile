FROM ubuntu:xenial
MAINTAINER Dmitry Erokhin <dim777@ya.ru>

ENV JAVA_PKG=jdk/jdk-8u*-linux-x64.tar.gz

RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir jdk && \
    wget https://yadi.sk/d/T9du1fAX3SAF9W -P jdk/

ADD $JAVA_PKG /opt/jdk/

RUN JAVA_DIR=$(ls -1 -d /opt/jdk/*) && \
    update-alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 && \
    update-alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 && \
    update-alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000