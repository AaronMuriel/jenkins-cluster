FROM base-environment
MAINTAINER Julian Nonino <noninojulian@outlook.com>

# Add Jenkins Slave user and add it to sudoers and create .m2 folder the user
RUN useradd -c "Jenkins Slave user" -d /home/jenkins-slave -m jenkins-slave && \
    echo "jenkins-slave ALL=NOPASSWD: ALL" >> /etc/sudoers

# Create Maven .m2 folder
RUN	mkdir /home/jenkins-slave/.m2 && \
   	mkdir /home/jenkins-slave/.m2/repository && \
   	chown -R jenkins-slave:jenkins-slave /home/jenkins-slave/.m2

# Copy Start script
COPY start_slave.sh /usr/local/bin/start_slave.sh

# Download Jenkins Swarm and condigure
ENV JENKINS_SWARM_VERSION 2.2
RUN curl --create-dirs -sSLo /usr/share/jenkins/swarm-client-jar-with-dependencies.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar && \
    chmod 755 /usr/share/jenkins && \
    chmod +x /usr/local/bin/start_slave.sh

# Switch to Jenkins Slave user
USER jenkins-slave

# Copying default Maven Settings
COPY settings.xml /home/jenkins-slave/.m2/settings.xml

#Entrypoint
ENTRYPOINT ["/usr/local/bin/start_slave.sh"]
