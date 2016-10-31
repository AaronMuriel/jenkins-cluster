FROM ubuntu:xenial
MAINTAINER Julian Nonino <noninojulian@outlook.com>

ENV PYTHON_VERSION 2.7.12
ENV PYTHON_PIP_VERSION 8.1.2

# Install Python
RUN apt-get update && \
    apt-get install -y sudo wget curl net-tools unzip build-essential git subversion checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev zlib1g-dev && \
    wget -O python.tar.xz "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
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
