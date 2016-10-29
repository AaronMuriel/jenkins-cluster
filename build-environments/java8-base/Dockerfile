FROM jnonino/base-build-environment
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Install Java 8 JDK Update 101
RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz && \
    tar -zxf jdk-8u101-linux-x64.tar.gz -C /opt && \
    ln -s /opt/jdk1.8.0_101/bin/java /usr/bin/java && \
    ln -s /opt/jdk1.8.0_101/bin/javac /usr/bin/javac && \
    rm -rf jdk-8u101-linux-x64.tar.gz
ENV JAVA_HOME /opt/jdk1.8.0_101

# Set PATH environment variable adding Java 8 JDK
ENV PATH $JAVA_HOME/bin:$PATH7
