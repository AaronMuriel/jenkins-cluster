FROM ubuntu:xenial
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Install Required Tools
# sudo, wget, curl, net-tools, unzip, build-essential, git, subversion and checkinstall
RUN apt-get update && \
    apt-get install -y sudo wget curl net-tools unzip build-essential git subversion checkinstall libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*
