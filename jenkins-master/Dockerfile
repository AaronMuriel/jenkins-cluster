FROM jenkins:2.7.1

MAINTAINER Julian Nonino <noninojulian@outlook.com>

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
