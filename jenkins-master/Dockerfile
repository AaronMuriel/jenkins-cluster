FROM jenkins:2.46.1-alpine
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Install default plugins
RUN /usr/local/bin/install-plugins.sh swarm:3.3 ssh-slaves:1.13 windows-slaves:1.2
RUN /usr/local/bin/install-plugins.sh job-dsl:1.51 jobConfigHistory:2.15
RUN /usr/local/bin/install-plugins.sh ant:1.4 ivy:1.27.1 maven:2.15.1 gradle:1.26
RUN /usr/local/bin/install-plugins.sh git:3.0.5 github:1.26.0 subversion:2.7.1 clone-workspace-scm:0.6 multiple-scms:0.6
RUN /usr/local/bin/install-plugins.sh checkstyle:3.47 pmd:3.46 findbugs:4.69 tasks:4.49
RUN /usr/local/bin/install-plugins.sh jacoco:2.1.0 cobertura:1.9.8 test-results-analyzer:0.3.4 test-stability:1.0
RUN /usr/local/bin/install-plugins.sh radiatorviewplugin:1.26 nested-view:1.14
RUN /usr/local/bin/install-plugins.sh purge-build-queue-plugin:1.0 build-timeout:1.17.1 rebuild:1.25 global-build-stats:1.4 build-failure-analyzer:1.17.1 build-metrics:1.3 ws-cleanup:0.30
RUN /usr/local/bin/install-plugins.sh disk-usage:0.28 claim:2.8 timestamper:1.8.7 uno-choice:1.4
RUN /usr/local/bin/install-plugins.sh greenballs:1.15 ci-game:1.25 emotional-jenkins-plugin:1.2 chucknorris:1.0

# Copy default jobs, please check README.md to know how to add your own jobs
COPY jobs /usr/share/jenkins/ref/jobs

# Configure some stuff by default
COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/

# Disable initial wizard
RUN echo 2.46.1 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state && \
    echo 2.46.1 > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion
