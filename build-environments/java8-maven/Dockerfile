FROM jnonino/java8-base
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Install Ant 1.9.7
RUN wget http://mirrors.sonic.net/apache//ant/binaries/apache-ant-1.9.7-bin.tar.gz && \
    tar -zxf apache-ant-1.9.7-bin.tar.gz -C /opt && \
    ln -s /opt/apache-ant-1.9.7/bin/ant /usr/bin/ant && \
    rm -rf apache-ant-1.9.7-bin.tar.gz

ENV ANT_HOME /opt/apache-ant-1.9.7

# Set PATH environment variable
ENV PATH $ANT_HOME/bin:$PATH
