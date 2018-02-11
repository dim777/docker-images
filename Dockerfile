FROM ubuntu:xenial
MAINTAINER Dmitry Erokhin <dim777@ya.ru>

RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /opt/jdk/ && \
    wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz && \
    tar -xvzf jdk-8u161-linux-x64.tar.gz -C /opt/jdk/

RUN JAVA_DIR=$(ls -1 -d /opt/jdk/*) && \
    update-alternatives --install /usr/bin/java java $JAVA_DIR/bin/java 20000 && \
    update-alternatives --install /usr/bin/javac javac $JAVA_DIR/bin/javac 20000 && \
    update-alternatives --install /usr/bin/jar jar $JAVA_DIR/bin/jar 20000