FROM ubuntu:trusty

MAINTAINER Julian Nonino <noninojulian@outlook.com>

RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/* && \
    wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz && \
    sudo tar -zxf jdk-8u101-linux-x64.tar.gz -C /opt && \
    sudo ln -s /opt/jdk1.8.0_101/bin/java /usr/bin/java && \
    sudo ln -s /opt/jdk1.8.0_101/bin/javac /usr/bin/javac && \
    wget http://apache.mirrors.lucidnetworks.net/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    sudo tar -zxf apache-maven-3.3.9-bin.tar.gz -C /opt && \
    sudo ln -s /opt/apache-maven-3.3.9/bin/mvn /usr/bin/mvn && \
    wget http://mirrors.sonic.net/apache//ant/binaries/apache-ant-1.9.7-bin.tar.gz && \
    sudo tar -zxf apache-ant-1.9.7-bin.tar.gz -C /opt && \
    sudo ln -s /opt/apache-ant-1.9.7/bin/ant /usr/bin/ant && \
    rm -rf jdk-8u101-linux-x64.tar.gz && \
    rm -rf apache-maven-3.3.9-bin.tar.gz && \
    rm -rf apache-ant-1.9.7-bin.tar.gz

ENV JAVA_HOME /opt/jdk1.8.0_101
ENV PATH $JAVA_HOME/bin:$PATH
ENV MAVEN_HOME /opt/apache-maven-3.3.9
ENV PATH $MAVEN_HOME/bin:$PATH
ENV ANT_HOME /opt/apache-ant-1.9.7
ENV PATH $ANT_HOME/bin:$PATH

ENV JENKINS_SWARM_VERSION 2.2
ENV HOME /home/ubuntu-jenkins-slave
RUN useradd -c "Jenkins Slave User" -d $HOME -m ubuntu-jenkins-slave

RUN wget http://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar && \
    mv swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar $HOME/swarm-client-jar-with-dependencies.jar

USER ubuntu-jenkins-slave
VOLUME /home/ubuntu-jenkins-slave

#ENV JENKINS_MASTER -  The complete target Jenkins URL like 'http://server:8080/jenkins/'. If this option is specified, auto-discovery will be skipped
COPY start_slave.sh /usr/local/bin/start_slave.sh

ENTRYPOINT ["/usr/local/bin/start_slave.sh"]
