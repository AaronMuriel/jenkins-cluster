FROM ubuntu:xenial
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Install Required Tools
# sudo, wget, curl, net-tools, unzip, build-essential, git, subversion and checkinstall
RUN apt-get update && \
    apt-get install -y sudo wget curl net-tools unzip build-essential git subversion checkinstall && \
    rm -rf /var/lib/apt/lists/*
