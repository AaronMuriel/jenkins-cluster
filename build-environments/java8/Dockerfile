FROM ubuntu:xenial
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Install Java 8 JDK Update 101
# Install Maven 3.3.9
# Install Ant 1.9.7
RUN apt-get update && \
    apt-get install -y wget curl net-tools tar unzip build-essential git subversion && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz && \
    tar -zxf jdk-8u101-linux-x64.tar.gz -C /opt && \
    ln -s /opt/jdk1.8.0_101/bin/java /usr/bin/java && \
    ln -s /opt/jdk1.8.0_101/bin/javac /usr/bin/javac && \
    rm -rf jdk-8u101-linux-x64.tar.gz && \
    wget https://services.gradle.org/distributions/gradle-3.1-bin.zip && \
    unzip gradle-3.1-bin.zip -d /opt && \
    ln -s /opt/gradle-3.1/bin/gradle /usr/bin/gradle && \
    rm -rf gradle-3.1-bin.zip && \
    wget http://apache.mirrors.lucidnetworks.net/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar -zxf apache-maven-3.3.9-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-3.3.9/bin/mvn /usr/bin/mvn && \
    rm -rf apache-maven-3.3.9-bin.tar.gz && \
    wget http://mirrors.sonic.net/apache//ant/binaries/apache-ant-1.9.7-bin.tar.gz && \
    tar -zxf apache-ant-1.9.7-bin.tar.gz -C /opt && \
    ln -s /opt/apache-ant-1.9.7/bin/ant /usr/bin/ant && \
    rm -rf apache-ant-1.9.7-bin.tar.gz

ENV JAVA_HOME /opt/jdk1.8.0_101
ENV GRADLE_HOME /opt/gradle-3.1
ENV MAVEN_HOME /opt/apache-maven-3.3.9
ENV ANT_HOME /opt/apache-ant-1.9.7

# Set PATH environment variable adding Java JDK, Maven and Ant
ENV PATH $JAVA_HOME/bin:$GRADLE_HOME/bin:$MAVEN_HOME/bin:$ANT_HOME/bin:$PATH
