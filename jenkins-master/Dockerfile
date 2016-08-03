FROM csanchez/jenkins-swarm

MAINTAINER Julian Nonino <noninojulian@outlook.com>

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
