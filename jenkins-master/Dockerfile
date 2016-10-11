FROM jenkins:2.19.1-alpine
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Install Default Plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

# Configure some stuff by default
COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/

# Disable initial wizard
RUN echo 2.19.1 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state && \
    echo 2.19.1 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
