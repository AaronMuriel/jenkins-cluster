FROM ubuntu:xenial
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Install Required Tools
# sudo, wget, curl, net-tools, unzip, build-essential, git, subversion and checkinstall
RUN apt-get update && \
    apt-get install -y sudo wget curl net-tools unzip build-essential git subversion checkinstall && \
    rm -rf /var/lib/apt/lists/*

# Install Java 8 JDK Update 101
RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz && \
    tar -zxf jdk-8u101-linux-x64.tar.gz -C /opt && \
    ln -s /opt/jdk1.8.0_101/bin/java /usr/bin/java && \
    ln -s /opt/jdk1.8.0_101/bin/javac /usr/bin/javac && \
    rm -rf jdk-8u101-linux-x64.tar.gz
ENV JAVA_HOME /opt/jdk1.8.0_101

# Install Maven 3.3.9
RUN wget http://apache.mirrors.lucidnetworks.net/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar -zxf apache-maven-3.3.9-bin.tar.gz -C /opt && \
    ln -s /opt/apache-maven-3.3.9/bin/mvn /usr/bin/mvn && \
    rm -rf apache-maven-3.3.9-bin.tar.gz
ENV MAVEN_HOME /opt/apache-maven-3.3.9

# Install Ant 1.9.7
RUN wget http://mirrors.sonic.net/apache//ant/binaries/apache-ant-1.9.7-bin.tar.gz && \
    tar -zxf apache-ant-1.9.7-bin.tar.gz -C /opt && \
    ln -s /opt/apache-ant-1.9.7/bin/ant /usr/bin/ant && \
    rm -rf apache-ant-1.9.7-bin.tar.gz
ENV ANT_HOME /opt/apache-ant-1.9.7

# Install Python
ENV PYTHON_VERSION 2.7.12
ENV PYTHON_PIP_VERSION 8.1.2
RUN apt-get update && \
    apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev zlib1g-dev && \
    wget -O python.tar.xz "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" && \
    mkdir -p /usr/src/python && \
	tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz && \
	rm python.tar.xz && \
    cd /usr/src/python && \
    ./configure --enable-shared --enable-unicode=ucs4 && \
    make && \
    make install && \
    ldconfig && \
    wget -O /tmp/get-pip.py 'https://bootstrap.pypa.io/get-pip.py' && \
    python2 /tmp/get-pip.py "pip==$PYTHON_PIP_VERSION" && \
    rm //get-pip.py && \
    pip instmptall --no-cache-dir --upgrade --force-reinstall "pip==$PYTHON_PIP_VERSION" && \
    rm -rf /usr/src/python ~/.cache

# Install default Python PIP dependencies
COPY pip_requirements.txt /usr/local/bin/pip_requirements.txt
RUN pip install -r /usr/local/bin/pip_requirements.txt

# Set PATH environment variable adding installed tools
ENV PATH $JAVA_HOME/bin:$MAVEN_HOME/bin:$ANT_HOME/bin:$PATH
