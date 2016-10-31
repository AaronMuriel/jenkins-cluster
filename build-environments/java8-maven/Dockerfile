FROM jnonino/java8-base
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Install Maven 3.3.9
RUN wget http://apache.mirrors.lucidnetworks.net/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar -zxf apache-maven-3.3.9-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-3.3.9/bin/mvn /usr/bin/mvn && \
    rm -rf apache-maven-3.3.9-bin.tar.gz

ENV MAVEN_HOME /opt/apache-maven-3.3.9

# Set PATH environment variable
ENV PATH $ANT_HOME/bin:$PATH
